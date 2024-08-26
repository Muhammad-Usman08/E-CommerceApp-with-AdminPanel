import 'package:adminpanelapp/components/button/button.dart';
import 'package:adminpanelapp/screens/home/home.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff012269),
      appBar: AppBar(
        backgroundColor: const Color(0xff012269),
        automaticallyImplyLeading: false,
        title: const Text(
          'Check Out',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context)
            .size
            .height, // Ensure the full height is used
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Thanks!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50,
                        child: Icon(
                          Icons.check,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 20),
                        child: const Text(
                          'Thank you for purchasing.',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Text('Your order is confirmed!'),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Button(
                            height: 45,
                            width: 180,
                            color: Colors.blue,
                            onpressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeView(),
                                  ));
                            },
                            buttonText: const Text(
                              'Continue Shopping',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
