import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // navegation gorouter
  static const String name = 'home_screen';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String _productId = '';
  String _productName = '';
  String _productImage = '';

  // interface product search y column
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Search'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: 'Enter ID',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    labelText: 'Product ID',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    )),
                onChanged: (value) {
                  setState(() {
                    _productId = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: _fetchProductDetails,
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            // NOT EMPTY
            _productName.isNotEmpty
                ? Column(
                    children: [
                      Text(
                        'Product Name: $_productName',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _productImage.isNotEmpty
                          ? Image.network(_productImage)
                          : const SizedBox(),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchProductDetails() async {
    // Verificar si _productId is empty or show showdialog
    if (_productId.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter ID'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
    // API spoonacular
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/food/products/$_productId?apiKey=c2586dd5afe747eda9f45412406ef8bc'));
    // status code error
    if (response.statusCode == 200) {
      // status successful
      // get product details
      final Map<String, dynamic> productDetails =
          jsonDecode(response.body); //decode to json
      // status is updated
      setState(() {
        _productName = productDetails['title'];
        _productImage = productDetails['image'];
      });
      // if it no update it shows an exception
    } else {
      setState(() {
        _productName = '';
        _productImage = '';
      });
      throw Exception('Failed to load product');
    }
  }
}
