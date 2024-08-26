// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:adminpanelapp/components/button/button.dart';
import 'package:adminpanelapp/components/loginField/loginfield.dart';
import 'package:adminpanelapp/screens/login/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController productDescription = TextEditingController();

  File? imageFile;
  String? imageUrl;

  final storage = FirebaseStorage.instance.ref();
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('products');
  FirebaseAuth auth = FirebaseAuth.instance;

  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Image Added')));

      // Await the sendImageToStorage function
      await sendImageToStorage(imageFile!);
    }
  }

  sendImageToStorage(File uploadFile) async {
    String fileName = "product_${DateTime.now().millisecondsSinceEpoch}.jpg";
    final mountainImageRef = storage.child(fileName);
    await mountainImageRef.putFile(uploadFile);
    imageUrl = await mountainImageRef.getDownloadURL();
  }

  addProducts() async {
    if (imageUrl != null) {
      try {
        await firestore.add({
          'productName': productName.text,
          'productPrice': productPrice.text,
          'productDescription': productDescription.text,
          'productImage': imageUrl,
        });
        productName.clear();
        productPrice.clear();
        productDescription.clear();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product Added Successfully')));
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
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
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
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
                    color: const Color(0xff4157FF),
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
                LoginField(
                  controller: productDescription,
                  title: 'Product Description',
                  fieldName: 'Enter Product Description',
                ),
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
                    color: const Color(0xff4157FF),
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
