import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task1/model/FurnitureModel.dart';
import 'package:task1/cubit/cubit.dart';
import 'package:task1/cubit/states.dart';
import '../arc/component.dart';
import 'deatilsPage.dart';

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    final isLandScpe=MediaQuery.of(context).orientation==Orientation.landscape;
    double deviceWidth=MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => FurnitureAppCubit(),
      child: BlocConsumer<FurnitureAppCubit, FurnitureAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          FurnitureAppCubit cubit=FurnitureAppCubit.get(context);
          return Scaffold(
            body:SingleChildScrollView(
              child: Container(
                height: deviceHeight,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(
                       height: isLandScpe?deviceHeight:deviceHeight*0.7,
                       child: Column(
                         children: [
                           Stack(
                             children: [
                               Container(
                                 height: isLandScpe?0.4 * (deviceHeight - MediaQuery
                                     .of(context)
                                     .padding
                                     .top)
                                     :0.5 * (deviceHeight - MediaQuery
                                     .of(context)
                                     .padding
                                     .top),
                                 decoration: BoxDecoration(
                                   color: HexColor('4d6d68'),
                                   borderRadius: BorderRadius.only(
                                     bottomLeft: Radius.circular(70),
                                     bottomRight: Radius.circular(70),
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding:  EdgeInsets.only(top:isLandScpe?10:deviceHeight*0.05, right: 15,),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       children: [
                                         IconButton(
                                           onPressed: () {},
                                           icon: Icon(
                                             Icons.list_outlined,
                                             size: 25,
                                             color: Colors.white,
                                           ),
                                         ),
                                         Spacer(),
                                         IconButton(
                                           onPressed: () {},
                                           icon: Icon(
                                             Icons.search,
                                             size: 25,
                                             color: Colors.white,
                                           ),
                                         ),
                                         Container(
                                           height: 35,
                                           width: 35,
                                           child: Image(
                                             image: AssetImage(
                                                 'assets/images/profile.jpg'),
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: isLandScpe?5:deviceHeight*0.05,
                                     ),
                                     Container(
                                       padding: EdgeInsets.only(left: deviceWidth*0.08),
                                       child: Text(
                                         'Explore',
                                         textAlign: TextAlign.center,
                                         style: TextStyle(
                                           fontSize: 40,
                                           color: Colors.white,
                                           fontWeight: FontWeight.w500,
                                         ),),
                                     ),
                                     SizedBox(
                                       height: isLandScpe?5:deviceHeight*0.07,
                                     ),
                                     Container(
                                       padding: EdgeInsets.only(left: deviceWidth*0.09),
                                       child: CarouselSlider(
                                         items: cubit
                                             .banners
                                             .map((e) =>
                                             GestureDetector(
                                               onTap: ()
                                               {
                                                 navigateTo(context, deatilsPage(model: e,));
                                               },
                                               child: Container(
                                                   clipBehavior: Clip.antiAliasWithSaveLayer,
                                                   // height: isLandScpe?deviceHeight*0.2:270,
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(20),

                                                   ),
                                                   child: Image(
                                                       image: AssetImage('${e.image}'))),
                                             ),
                                         ).toList(),
                                         options: CarouselOptions(
                                           height: isLandScpe?deviceHeight*0.4:deviceHeight*0.3,
                                           initialPage: 0,
                                           reverse: false,
                                           autoPlay: false,
                                           viewportFraction:isLandScpe?0.4:0.6,
                                           enableInfiniteScroll: false,
                                           scrollDirection: Axis.horizontal,
                                           aspectRatio: 16 / 9,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(height: isLandScpe?deviceHeight*0.04:deviceHeight*0.03,),
                           Container(
                             height: deviceHeight*0.09,
                             margin: EdgeInsets.symmetric(horizontal:isLandScpe?0.22*deviceWidth: 0 ),
                             padding:  EdgeInsets.symmetric(horizontal:isLandScpe?deviceWidth*0.078: deviceWidth*0.07),
                             child: ListView.separated(
                               scrollDirection: Axis.horizontal,
                               itemBuilder: (context,index)=>Button(
                                 label:cubit.categories[index],
                                 onTap: (){
                                   cubit.chageButtonSelected(index);
                                 },
                                 color: cubit.indexCategory == cubit.indexList[index]?HexColor('4d6d68'):Colors.white,
                                 textColor: cubit.indexCategory == cubit.indexList[index]?Colors.white:Colors.black,
                               ),
                               separatorBuilder: (context,index)=>SizedBox(width: 30,),
                               itemCount:cubit.categories.length,
                             ),
                           ),
                         ],
                       ),
                     ),
                      SizedBox(height: deviceHeight*0.01,),
                      Container(
                        height: isLandScpe?deviceHeight*0.78:deviceHeight*0.3,
                        child: GridView.count(

                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1 / 1.43,
                          children:
                          List.generate(
                            cubit
                                .products
                                .length,
                                (index) =>
                                buildProduct(context,cubit
                                    .products[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
  Widget buildProduct(context, FurnitureModel model) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    final isLandScpe=MediaQuery.of(context).orientation==Orientation.landscape;


    return GestureDetector(
      onTap: ()
      {
        navigateTo(context,deatilsPage(model: model,));
      },
      child: Container(
        width: (deviceWidth / 2),
        height: deviceHeight*0.3,
        padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.07),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              height:isLandScpe?300: 200,
              decoration: BoxDecoration(
                color: HexColor('d7eaff'),
                borderRadius: BorderRadius.circular(20),
              ),

            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: deviceWidth*0.05),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      width:isLandScpe?deviceWidth*0.1: deviceWidth*0.09,
                      height:isLandScpe?deviceHeight*0.05: deviceHeight*0.02,
                      decoration: BoxDecoration(
                        color: HexColor('4d6d53'),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${model.status}', textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height:isLandScpe?deviceHeight*0.04: deviceHeight*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${model.name}', style: Theme
                          .of(context)
                          .textTheme
                          .headline1,),
                      SizedBox(height: deviceHeight*0.005,),
                      Row(
                        children: [
                          Text('\$ ${model.price} ', style: Theme
                              .of(context)
                              .textTheme
                              .headline1,),
                          Spacer(),
                          Row(
                            children: [
                              Icon(Icons.star, size: 15, color: HexColor(
                                  '4d6d53'),),
                              SizedBox(width: 5,),
                              Text('${model.evaluation}', style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline1,),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height:isLandScpe?deviceHeight*0.04: deviceHeight*0.02,),
                      Image(image: AssetImage('${model.image}')),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
