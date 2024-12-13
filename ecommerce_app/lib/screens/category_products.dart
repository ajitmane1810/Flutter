import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/model.dart';
import 'package:ecommerce_app/models/subcategory.dart';
import 'package:ecommerce_app/screens/productdetails.dart';
import 'package:ecommerce_app/utlis/colors.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  final String category;
  final List<AppModel> categoryProducts;
  const CategoryProducts(
      {super.key, required this.category, required this.categoryProducts});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            hintText: "$category's Fashion",
                            hintStyle: const TextStyle(color: Colors.black38),
                            filled: true,
                            fillColor: fbackgroundColor2,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            suffixIcon: const Icon(Icons.search_rounded,
                                color: Colors.black38),
                                 border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          ),
                        )))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(filterCategory.length, (index)=>Padding(padding: const EdgeInsets.only(
                right: 5
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12)
                ),
                child: Row(
                  children: [
                    Text(filterCategory[index]),
                    const SizedBox(width: 5,),
                    index == 0?const Icon(Icons.filter_list,size: 15,):const Icon(Icons.keyboard_arrow_down,size: 15,)
                  ],
                ),
              ),
              )),
            ),
          ),),
          const SizedBox(height: 20,),
           SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  subcategory.length,
                  (index) => InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: fbackgroundColor1,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(subcategory[index].image),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(subcategory[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 20,),
           Expanded(
              child: categoryProducts.isEmpty
                  ? const Center(
                      child: Text(
                        "No items available in this category.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: categoryProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        final item = categoryProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductDetails(
                                  eCommerceApp: item,
                                ),
                              ),
                            );
                          },
                          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: item.image,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: fbackgroundColor2,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(item.image),
                ),
              ),
              height: size.height * 0.25,
              width: size.width * 0.5,
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black26,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Text(
              'H&M',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black26),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 17,
            ),
            Text(item.rating.toString()),
            Text(
              '(${item.review})',
              style: const TextStyle(color: Colors.black26),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.5,
          child: Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.2,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "\$${item.price.toString()}.00",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.pink,
                height: 1.2,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
             if (item.isCheck == true)
              Text(
                "\$${item.price + 255}.00",
                style: const TextStyle(
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black26,
                ),
              ),
          ],
        ),
      ],
    )
                        );
                      },
                    ),
                 )
      ],
      )),
    );
  }
}
