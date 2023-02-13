import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task1/cubit/states.dart';

import '../model/FurnitureModel.dart';
import '../arc/component.dart';

class FurnitureAppCubit extends Cubit<FurnitureAppStates>
{
  FurnitureAppCubit():super(IntialAppState());
  static FurnitureAppCubit get(context)=>BlocProvider.of(context);
  List<FurnitureModel>banners=[
    FurnitureModel(
      image: 'assets/images/soffi.jpg',
      status: 'New',
      name: 'Niche',
      price: '700',
      evaluation: 4.4,
      details: ' There is a modern niche that is one shovel and is equipped with a number of shelves to put antiques and antiques on it, and this gives a wonderful appearance, and gives you the opportunity to put valuable and precious things and arrange them to suit the taste'
          'There are other designs of modern niche that take into account the spaces due to the lack of space in some places, and they are two separate shades, and each shovel is considered a stand-alone unit, and on this you can put the two pieces in one place or separate them',
    ),
    FurnitureModel(
      image: 'assets/images/OIP.jpg',
        status: 'Used',
        name: 'Chair',
        price: '100',
        evaluation: 2.4,
        details:'A chair is a type of seat, typically designed for one person and consisting of one or more legs, a flat or slightly angled seat and a back-rest. They may be made of wood, metal, or synthetic materials, and may be padded or upholstered in various colors and fabrics. Chairs vary in design. ',
    ),
    FurnitureModel(
      image: 'assets/images/table1.jpeg',
        status: 'New',
        name: 'table',
        price: '400',
        evaluation: 4.1,
        details:'Secure Lock - Keeps table closed when transporting'
            'Comfort Handle - Comfortable to carry when folded and locked. Locking mechanism: Yes'
            'All Season Table Top - Indoor and Outdoor Use',
    ),
  ];
  List<FurnitureModel>products=[
    FurnitureModel(
      status: 'New',
      name: 'ice Chair',
      image: 'assets/images/OIP (3).jpg',
      price: '45',
      evaluation: 4.4,
      details: 'Generously padded with high-density foam, the comfy chair for desk is comfortable and practical as well. Featuring a low backrest, soft seat cushion and no armrests, you’ll experience ergonomic support throughout all day. The textural twill upholstery of this office accent chair is durable and long-lasting, making it ideal for everyday use.'
    ),
    FurnitureModel(
      status: 'Used',
      name: 'green Chair',
      image: 'assets/images/My project.png',
      price: '60',
      evaluation: 3.4,
      details: 'Generously padded with high-density foam, the comfy chair for desk is comfortable and practical as well. Featuring a low backrest, soft seat cushion and no armrests, you’ll experience ergonomic support throughout all day. The textural twill upholstery of this office accent chair is durable and long-lasting, making it ideal for everyday use.',
    ),
  ];
  int counter=0;
  void addCounter()
  {
    counter++;
    emit(CounterPlusedSuccessfully());
  }
  void minusCounter()
  {
    counter--;
    emit(CounterMinusedSuccessfully());
  }
  int indexCategory = -1;
  List indexList = [0, 1, 2];
  String category = '';

  List categories = [
      "chairs",
      "sofi",
      "tabels",
    ];
void chageButtonSelected(index)
{
  indexCategory = indexList[index];
  category = categories[index];
  emit(ChangingButtonThemeState());
}
List numberImages=[0,1,2,3,4];
Color choosen=Colors.white;
List colors=[
  Colors.blue,
  Colors.blueGrey,
  Colors.black,
  Colors.grey,
  Colors.yellow
];
void changeImage(index)
{
  indexCategory=numberImages[index];
  choosen=colors[index];
  emit(ChangingImageSuccessfully());
}
}