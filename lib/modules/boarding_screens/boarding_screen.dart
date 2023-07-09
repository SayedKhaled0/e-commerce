import 'package:chat/models/boarding_model.dart';
import 'package:chat/modules/auth_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/style/colors.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final pageController = PageController();
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,toolbarHeight: 30,),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Expanded(
              child: Container(
                // color: Colors.grey,
                margin: const EdgeInsets.symmetric(vertical: 12.5),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: boardingItems.length,
                  onPageChanged: (index){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                      [
                        Image.asset(boardingItems[index].image,fit: BoxFit.fill,height: 400,),
                        Text(boardingItems[index].title,style: const TextStyle(color: mainColor,fontWeight: FontWeight.bold,fontSize: 19),),

                        Center(
                          child:Text(boardingItems[index].description,style: const TextStyle(color: Colors.grey)),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count:  3,
              axisDirection: Axis.horizontal,
              effect: const SlideEffect(
                  spacing:  8.0,
                  radius:  10.0,
                  dotWidth:  15.0,
                  dotHeight:  15.0,
                  paintStyle:  PaintingStyle.stroke,
                  strokeWidth:  1.5,
                  dotColor:  Colors.grey,
                  activeDotColor: Colors.green
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                       if( currentIndex < 2 )
                       {
                         pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeIn);
                       }
                       else
                       {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                       }
                     },
                child: Container(
                  height:40 ,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor
                  ),
                  child: const Center(
                    child: Text("NEXT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white
                    ),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("SKIP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: mainColor
                      ),),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}