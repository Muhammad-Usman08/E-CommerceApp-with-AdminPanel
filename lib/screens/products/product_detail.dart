import 'package:adminpanelapp/components/button/button.dart';
import 'package:adminpanelapp/components/heading/heading.dart';
import 'package:adminpanelapp/list.dart';
import 'package:adminpanelapp/screens/cart/cart_view.dart';
import 'package:adminpanelapp/screens/products/widgets/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final int index;
  const ProductDetail({super.key, required this.index});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

//Firestore Instance
CollectionReference firestore =
    FirebaseFirestore.instance.collection('products');

class _ProductDetailState extends State<ProductDetail> {
  addItems() {
    selectedItems.add({
      'productName': '${items[widget.index]['productName']}',
      'productImage': '${items[widget.index]['productImage']}',
      'productPrice': '${items[widget.index]['productPrice']}',
      'productDescription': '${items[widget.index]['productDescription']}',
      'quantity': 1,
    });
    print(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                size: 26,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[widget.index]['productName'],
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  child:
                      myText('${items[widget.index]['productDescription']}')),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.95,
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xfff7f7f7)),
                child: Image.network('${items[widget.index]['productImage']}'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs.${items[widget.index]['productPrice']}',
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {
                          addItems();
                        },
                        child: const Text(
                          '+ Add to cart',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff4157FF),
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),

              SizedBox(
                height: 30,
                child: Text(
                  '${items[widget.index]['productDescription']}',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              //Content
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Heading(heading: 'Product Details')),
              myText(
                  'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.'),
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Heading(heading: 'Ingredients')),
              myText(
                  'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.'),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const Heading(heading: 'Expiry Date'),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: myText('25/12/2023')),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 25),
                child: Row(
                  children: [
                    const Heading(heading: 'Brand Name'),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: myText('Something')),
                  ],
                ),
              ), //Content end
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[600],
                      ),
                      const Text('4.2')
                    ],
                  ),
                  const Text(
                    '5-Oct-2024',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Heading(heading: 'Erric Hoffman')),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 35),
                child: myText(
                    'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas '),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: Center(
                  child: Button(
                    height: 40,
                    width: 300,
                    buttonText: const Text(
                      'Go To Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xff4157FF),
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
