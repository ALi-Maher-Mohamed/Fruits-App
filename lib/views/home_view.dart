import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/models/category_model.dart';
import 'package:fruits_app/models/item_model.dart';
import 'package:fruits_app/utils/custom_colors.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<String> bannersImage = [
    'assets/images/banners/Slider_1.png',
    'assets/images/banners/Slider_2.png',
    'assets/images/banners/Slider_3.png',
  ];

  List<CategoryModel> category = [
    CategoryModel(
      name: 'Fruits',
      image: 'assets/images/category/fruits_baskits.png',
    ),
    CategoryModel(
      name: 'Milk & egg',
      image: 'assets/images/category/milk_eggs.png',
    ),
    CategoryModel(
      name: 'Beverages',
      image: 'assets/images/category/bavergas.png',
    ),
    CategoryModel(
      name: 'laundary',
      image: 'assets/images/category/laundary.png',
    ),
    CategoryModel(
      name: 'Vegetables',
      image: 'assets/images/category/vegetables.png',
    ),
  ];
  final List<ItemModel> items = [
    ItemModel(
      numberOfRatings: 207,
      name: 'Banana',
      image: 'assets/images/fruits/banana.png',
      rating: 4.5,
      price: 20,
    ),
    ItemModel(
      numberOfRatings: 207,
      name: 'pappers',
      image: 'assets/images/fruits/pappers.png',
      rating: 4.5,
      price: 20,
    ),
    ItemModel(
      numberOfRatings: 207,
      name: 'Oranges',
      image: 'assets/images/fruits/oranges.png',
      rating: 4.5,
      price: 20,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            bannerCarasoul(),
            SizedBox(height: 17),
            categoryListView(),
            SizedBox(height: 25),
            fruitsAndSeeAll(),
            SizedBox(height: 25),
            productsListView(),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Expanded productsListView() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 147,
                decoration: BoxDecoration(
                  color: CustomColors.neutralColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 7,
                      ),
                      child: Image.asset(items[index].image),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(Icons.add, size: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                items[index].name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    '${items[index].rating} (${items[index].numberOfRatings})',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "\$ ${items[index].price}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }

  Row fruitsAndSeeAll() {
    return Row(
      children: [
        Text(
          'Fruits',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          'See All',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: CustomColors.primaryColor,
          ),
        ),
      ],
    );
  }

  CarouselSlider bannerCarasoul() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 222,
        viewportFraction: 1,
        padEnds: false,

        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: bannersImage.length,
      itemBuilder:
          (BuildContext context, int itemIndex, int pageViewIndex) =>
              Image.asset(bannersImage[itemIndex]),
    );
  }

  SizedBox categoryListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        separatorBuilder: (context, index) => SizedBox(width: 20),

        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: CustomColors.neutralColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  category[index].image,
                  height: 43,
                  width: 43,
                ),
              ),

              Text(category[index].name, style: TextStyle(fontSize: 15)),
            ],
          );
        },
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/images/icons/bike_Icons.png',
            height: 20,
            width: 20,
          ),
          SizedBox(width: 10),
          const Text('61 Hopper street..', style: TextStyle(fontSize: 18)),
          SizedBox(width: 10),
          Image.asset('assets/images/icons/arrow.png'),
          Spacer(),
          Image.asset('assets/images/icons/basket.png'),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
