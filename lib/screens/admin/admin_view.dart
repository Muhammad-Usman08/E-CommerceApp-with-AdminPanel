import 'dart:io';

import 'package:adminpanelapp/components/button/button.dart';
import 'package:adminpanelapp/components/loginField/loginfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  //controllers
  TextEditingController productName = TextEditingController();

  TextEditingController productPrice = TextEditingController();

  File? imageFile;

  String? imageUrl;

  final storage = FirebaseStorage.instance.ref();

  CollectionReference firestore =
      FirebaseFirestore.instance.collection('products');

  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Image Added')));
    }
    sendImageToStorage(imageFile!);
  }

  sendImageToStorage(File uploadFile) async {
    String fileName = "product_${DateTime.now().millisecondsSinceEpoch}.jpg";
    final mountainImageRef = storage.child(fileName);
    await mountainImageRef.putFile(uploadFile);
    imageUrl = await mountainImageRef.getDownloadURL();
  }

  addProducts() async {
    if (imageUrl != null) {
      await firestore.add(
        {
          'productName': productName.text,
          'productPrice': productPrice.text,
          'productImage': imageUrl,
        },
      );
      productName.clear();
      productPrice.clear();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product Added Successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Select Image')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text(
          'Admin Panel',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 80),
                  child: Button(
                    onpressed: () {
                      selectImage();
                    },
                    buttonText: const Text(
                      'Select Product Image',
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 40,
                    width: 220,
                    color: const Color(0xffAA14F0),
                  ),
                ),
                LoginField(
                    controller: productName,
                    title: 'Product Name',
                    fieldName: 'Enter Product Name'),
                LoginField(
                    controller: productPrice,
                    title: 'Product Price',
                    fieldName: 'Enter Product Price'),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Button(
                    onpressed: () {
                      addProducts();
                    },
                    buttonText: const Text(
                      'Add Product',
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 40,
                    width: 130,
                    color: const Color(0xffAA14F0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
