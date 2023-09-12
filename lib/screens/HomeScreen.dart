import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ProductListScreen.dart';
import 'ProfileScreen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State <HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ProfileScreen(),
    ProductListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Task', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.grey[300],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                //Use this to Log Out user
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
              ),
              child: const Text('Sign Out'),
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista de Produtos',
          ),
        ],
      ),
    );
  }
}

