// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/movie_carousel.dart';
import 'profile_screen.dart';
import 'movie_search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('MOVIEEE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple)),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.purple),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: _selectedIndex == 0 ? appBar : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.purple),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.purple),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.purple),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreenContent(), 
    SearchScreen(), 
    ProfileScreen(),
  ];
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        MovieCarousel(category: 'Popular'),
        MovieCarousel(category: 'Now Showing'),
        MovieCarousel(category: 'Coming Soon'),
      ],
    );
  }
}
