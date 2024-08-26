import 'package:adminpanelapp/components/button/button.dart';
import 'package:adminpanelapp/components/heading/heading.dart';
import 'package:adminpanelapp/list.dart';
import 'package:adminpanelapp/screens/cart/widgets/charges.dart';
import 'package:adminpanelapp/screens/checkout/checkout_view.dart';
import 'package:adminpanelapp/screens/home/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //total
  calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in selectedItems) {
      int price = int.parse(item['productPrice']);
      int quantity = item['quantity'];
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  //subtotal
  subTotal() {
    int totalPrice = calculateTotalPrice();
    if (totalPrice != 0) {
      return totalPrice - 20;
    } else {
      return totalPrice;
    }
  }

  // Increase quantity of item
  addItems(index) {
    setState(() {
      selectedItems[index]['quantity']++;
    });
  }

  // decrease quantity of item
  removeItems(index) {
    setState(() {
      if (selectedItems[index]['quantity'] != 0) {
        selectedItems[index]['quantity']--;
      } else if (selectedItems[index]['quantity'] == 0) {
        selectedItems.removeAt(index);
      }
    });
  }

  //delete Item
  deleteItem(index) {
    setState(() {
      selectedItems.removeAt(index);
    });
  }

  //deleteAll Items
  deleteAll() {
    selectedItems.clear();
    setState(() {});
  }

  //add items to firestore database
  addItemsToDatabase(total) {
    CollectionReference itemsCollection =
        FirebaseFirestore.instance.collection('orders');

    List allItems = [];

    for (var item in selectedItems) {
      allItems.add({
        'itemName': item['productName'],
        'quantity': item['quantity'],
        'total': item['productPrice'] * item['quantity'],
      });
    }

    itemsCollection
        .add({
          'items': allItems,
          'total': total,
        })
        .then((value) => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CheckOutScreen())))
        .catchError((error) {
          // ignore: avoid_print
          print(error);
        });
  }

  @override
  Widget build(BuildContext context) {
    var totalPrice = calculateTotalPrice();
    var total = subTotal();
    return Scaffold(
      appBar: AppBar(
        title: const Heading(heading: 'Your Cart'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: Text(
                '+ Add more',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.blue[800]),
              ))
        ],
      ),
      // Body
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${selectedItems.length} Items in your cart',
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      deleteAll();
                    },
                    child: const Text(
                      'Delete All',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff4157FF),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            // Items
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 20, top: 5, right: 20, bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 235, 235),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xfff7f7f7),
                              ),
                              child: Image.network(
                                  '${selectedItems[index]['productImage']}'),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${selectedItems[index]['productName']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Rs.${selectedItems[index]['productPrice']}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    deleteItem(index);
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          addItems(index);
                                        },
                                        child: const Text(
                                          '+',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 13),
                                          child: Text(
                                            selectedItems[index]['quantity']
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          removeItems(index);
                                        },
                                        child: const Text(
                                          '-',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Heading(heading: 'Payment Summary')),
            paymentSummary('Rs. ${totalPrice.toString()}', "Order Total"),
            paymentSummary('-10', "Items Discount"),
            paymentSummary('-10', "Coupon Discount"),
            paymentSummary('Free', "Shipping"),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Heading(heading: 'Total'),
                Text(
                  'Rs.${total.toString()}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Center(
                child: Button(
                  height: 45,
                  color: const Color(0xff4157FF),
                  width: 300,
                  onpressed: () {
                    addItemsToDatabase(total);
                  },
                  buttonText: const Text(
                    'Place Order',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
