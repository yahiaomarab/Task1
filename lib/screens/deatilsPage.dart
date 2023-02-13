import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task1/model/FurnitureModel.dart';
import 'package:task1/arc/component.dart';
import 'package:task1/cubit/cubit.dart';

import '../cubit/states.dart';
import 'home_page.dart';


class deatilsPage extends StatelessWidget
{
  FurnitureModel model;
  deatilsPage({required this.model});
  @override
  Widget build(BuildContext context) {
    dynamic image=model.image;
    int index=-1;
    AppBar appBar=AppBar(
      leading: IconButton(onPressed: (){
        navigateTo(context, HomePage());
      },icon: Icon(Icons.arrow_back),),
      title: Text(
        '${model.name}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
      actions: [
        Container(
          child: Icon(
            Icons.shopping_bag_rounded,
            color: HexColor('4d6d53'),
          ),
          margin: EdgeInsets.only(right: 15),
        ),
      ],
    );
    double deviceWidth=MediaQuery.of(context).size.width;
    double deviceHeight=MediaQuery.of(context).size.height
        -MediaQuery.of(context).padding.top-appBar.preferredSize.height;
    final isLandScpe=MediaQuery.of(context).orientation==Orientation.landscape;
    return BlocProvider(
      create: (context)=>FurnitureAppCubit(),

      child: BlocConsumer<FurnitureAppCubit,FurnitureAppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=FurnitureAppCubit.get(context);
          return Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: deviceHeight/3,
                      width: deviceWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image(
                        image:AssetImage('${cubit.indexCategory==0?'assets/images/index0.jpg':
                        cubit.indexCategory==1?'assets/images/index1.jpg':
                        cubit.indexCategory==2?'assets/images/index2.jpg':
                        cubit.indexCategory==3?'assets/images/index3.jpg':
                        cubit.indexCategory==4?'assets/images/index4.jpg':image}',),
                        width: deviceWidth,
                      ),
                    ),
                    SizedBox(height:isLandScpe?deviceHeight*0.01: deviceHeight*0.02,),
                    Row(
                      children: [
                        Text('${model.name} ',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),),
                        Spacer(),
                        Text('\$ ${model.price}',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                    SizedBox(height:isLandScpe?deviceHeight*0.01: deviceHeight*0.02,),
                    Text(
                      '${model.details}',
                      maxLines:isLandScpe?1: 6,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: isLandScpe?deviceHeight*0.05:deviceHeight*0.04,),
                    Row(
                      children: [
                        Text('Colors',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(width:isLandScpe?deviceWidth*0.08: deviceWidth*0.06,),
                        Expanded(
                          child: Container(
                            height:isLandScpe?deviceHeight*0.08:deviceHeight*0.03,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index)=>circleColor(
                                    color: cubit.colors[index], ontap: (){
                                      cubit.changeImage(index);
                                },
                                ),
                                separatorBuilder:(context,index)=>SizedBox(width: deviceWidth*0.038,),
                                itemCount: cubit.colors.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:isLandScpe?deviceHeight*0.05: deviceHeight*0.04,),
                    Row(
                      children: [
                        Text('Quantity',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(width:isLandScpe?deviceWidth*0.08: deviceWidth*0.1,),
                        Container(
                          padding: EdgeInsets.all( 5),
                          height: isLandScpe?deviceHeight*0.15:deviceHeight*0.05,
                          width:isLandScpe?deviceWidth*0.2: deviceWidth*0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(isLandScpe?22:20),
                            color: HexColor('d7eaff'),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  FurnitureAppCubit.get(context).addCounter();
                                },
                                child: Container(
                                  height:isLandScpe?deviceHeight*0.1: deviceHeight*0.0389,
                                  width: isLandScpe?deviceWidth*0.04:deviceWidth*0.077,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(isLandScpe?18:16),
                                    color:HexColor('4d6d53') ,
                                  ),
                                  child: Icon(Icons.add,color: Colors.white,size: 25,),
                                ),
                              ),
                              SizedBox(width:isLandScpe?deviceWidth*0.05: deviceWidth*0.02,),
                              Text('${FurnitureAppCubit.get(context).counter}',style: TextStyle(fontSize: 25),),
                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  FurnitureAppCubit.get(context).minusCounter();
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      height:  isLandScpe?deviceHeight*0.1: deviceHeight*0.0389,
                                      width:  isLandScpe?deviceWidth*0.04:deviceWidth*0.077,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(isLandScpe?18:16),
                                        color:HexColor('4d6d53') ,
                                      ),

                                    ),
                                    Container(
                                      height: 3,
                                      width: 14,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight*0.04,),
                    longButton(context,
                        label: 'Add to cart', onTap: (){}, buttonColor: HexColor('d7eaff'),textColor: Colors.black),
                    SizedBox(height:isLandScpe?deviceHeight*0.03: deviceHeight*0.02,),
                    longButton(context,
                        label: 'Buy Now', onTap: (){}, buttonColor: HexColor('4d6d53'),textColor: Colors.white),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }

}