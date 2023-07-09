
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/layout_cubit/layout_cubit.dart';
import '../../models/category_model.dart';
import '../../shared/style/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel>categories=BlocProvider.of<LayoutCubit>(context).categoriesData;
    return  Scaffold(
        appBar: AppBar(title: const Text("Categories"),elevation:0,backgroundColor: thirdColor,foregroundColor: mainColor,),
      body: Padding(padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
      child: GridView.builder(
        itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15),
          itemBuilder:(context,index){
          return Container(
            child: Column(
              children: [
                Expanded(
                    child: Image.network(categories[index].image!,fit: BoxFit.fill)),
                const SizedBox(height: 10,),
                Text(categories[index].title!)
              ],
            ),
          );
          }


      )

        ,)

    );
  }
}