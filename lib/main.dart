import 'package:cookieapp/Pages/menuPage.dart';
import 'package:cookieapp/Pages/offerspage.dart';
import 'package:cookieapp/Pages/orderPage.dart';
import 'package:cookieapp/datamanager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  // state
  var name = '';

  @override
  Widget build(BuildContext context) {
    var greetStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );
    return Column(
      children: [
        Row(
          children: [
            Text('Welcome, $name ', style: greetStyle),
            const Text('!!'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: TextField(
            onChanged: (value) => setState(() {
              name = value;
            }),
          ),
        ),
      ],
    );
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(' HELLO, DICKSON');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.brown),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  final DataManager dataManager = DataManager();
  @override
  Widget build(BuildContext context) {
    Widget currentPage = const Text('Dickson');
 
    switch (selectedIndex) {
      case 0:
        currentPage = MenuPage(dataManager: dataManager,);
        break;

      case 1:
        currentPage = OffersPage();
        break;

      case 2:
        currentPage = OrderPage(dataManager: dataManager,);
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Image.asset('images/logo.png', height: 50),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.brown.shade50,
        selectedItemColor: Colors.yellow.shade400,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_outlined),
            label: 'Order',
          ),
        ],
      ),
      body: currentPage,
    );
  }
}
