import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // navegation gorouter
  static const String name = 'home_screen';

  @override
  HomeScreenState createState() => HomeScreenState();
}

// variables to be used later
class HomeScreenState extends State<HomeScreen> {
  late String _productId;
  late String _productName;
  late String _productImage;

// state variables
  @override
  void initState() {
    super.initState();
    _productId = '';
    _productName = '';
    _productImage = '';
  }

  // interface user
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        // AppBar with a title 'Product Search'.
        backgroundColor: Colors.grey[300],
        title: const Text('Product Search'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                // textField where the user can enter the product ID
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
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _productId = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              // elevatedButton 'eearch' that calls _fetchProductDetails() when pressed.
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              onPressed: () => _fetchProductDetails(),
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            if (_productName.isNotEmpty)
              Column(
                children: [
                  Text(
                    // Shows the product name and product image if available
                    'Product Name: $_productName',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_productImage.isNotEmpty)
                    Image.network(_productImage)
                  else
                    const SizedBox(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // method that makes an HTTP request to the API
  Future<void> _fetchProductDetails() async {
    if (_productId.isEmpty) {
      // checks if the product ID is empty and shows an error dialog if so
      _showErrorDialog('Please enter ID');
      return;
    }

    try {
      final response = await http.get(Uri.parse(
          'https://api.spoonacular.com/food/products/$_productId?apiKey=c2586dd5afe747eda9f45412406ef8bc'));

      if (response.statusCode == 200) {
        // If the request is successful, update the state variables
        final Map<String, dynamic> productDetails = jsonDecode(response.body);
        setState(() {
          // state variables update
          _productName = productDetails['title'];
          _productImage = productDetails['image'];
        });
        // If the request fails, show an error dialog
      } else {
        _resetProductDetails();
        throw Exception('Failed to load product');
      }
    } catch (e) {
      _resetProductDetails();
      _showErrorDialog('Failed to load product');
    }
  }

  // method resets the _productName and _productImage state variables to empty values.
  void _resetProductDetails() {
    setState(() {
      _productName = '';
      _productImage = '';
    });
  }

  // this method show error dialog (widget AlertDialog)
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
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
  }
}
