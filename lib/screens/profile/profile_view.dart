import 'package:adminpanelapp/screens/profile/widget/profileoptions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //profile Section
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 30),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 16),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/logo.jpeg'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Muhammad Usman',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700]),
                      ),
                      Text(
                        'Welcome to  Quick Medical Store',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //profile Options
            Container(
                child: profileOptions(
                    'Edit Profile',
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.blue[800],
                      size: 26,
                    ))),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Container(
                child: profileOptions(
                    'My Orders',
                    Icon(
                      Icons.assignment,
                      color: Colors.blue[800],
                      size: 26,
                    ))),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Container(
                child: profileOptions(
                    'Billing',
                    Icon(
                      Icons.query_builder,
                      size: 26,
                      color: Colors.blue[800],
                    ))),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Container(
                child: profileOptions(
                    'FAQ',
                    Icon(
                      Icons.question_mark,
                      color: Colors.blue[800],
                      size: 26,
                    ))),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
