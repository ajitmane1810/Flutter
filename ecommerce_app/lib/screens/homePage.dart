import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/model.dart';
import 'package:ecommerce_app/utlis/colors.dart';
import 'package:ecommerce_app/widgets/banner.dart';
import 'package:ecommerce_app/widgets/curated_items.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // for appbar part
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/logo (1).png",
                    height: 40,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        size: 28,
                      ),
                      Positioned(
                          right: -3,
                          top: -5,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: const Center(
                                child: Text(
                              "3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // banner
            const MyBanner(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Category",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 0, color: Colors.black45),
                  )
                ],
              ),
            ),
            // for category
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      category.length,
                      (index) => InkWell(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: fbackgroundColor1,
                                    backgroundImage:
                                        AssetImage(category[index].image),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(category[index].name)
                              ],
                            ),
                          ))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Curated For You",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 0, color: Colors.black45),
                  )
                ],
              ),
            ),
            // for Curated  Items
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(fashionEcommerceApp.length, (index) {
                  final eCommerceItems = fashionEcommerceApp[index];
                  return Padding(
                      padding: index == 0
                          ? EdgeInsets.symmetric(horizontal: 20)
                          : EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {},
                            child:CuratedItems(eCommerceItems: eCommerceItems, size: size) ,
                          ),
                          );
                }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
