import 'package:ashour/Shared/component/component.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item Product Name AR',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 15,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 250,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            "https://www.incimages.com/uploaded_files/image/1920x1080/getty_80116649_344560.jpg",
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: 3,
                        pagination: const SwiperPagination(),
                        control: const SwiperControl(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'In / out Stoke',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.teal,
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            '200',
                            style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            'EGP',
                            style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Quantity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(child: CustomButton(onPressed: (){}, child: Icon(Icons.minimize)),),
                          Card(child: Container(alignment: Alignment.center,width: 50.0, height: 45.0,child: Text('0')),),
                          Card(child: CustomButton(onPressed: (){}, child: Icon(Icons.add)),),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('descriptionAr'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: CustomButton(
                    backgroundColor: Colors.teal,
                    height: 40,
                    onPressed: () {},
                    child: Text('Add to cart'),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomButton(
                  backgroundColor: Colors.white,
                  height: 40,
                  onPressed: () {},
                  child: Icon(IconBroken.heart),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    // const Center(child: Text('Home'));
  }
}
