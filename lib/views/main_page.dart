import 'package:aplikasi_resep/views/pages/page4.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import './pages/page1.dart';
import './pages/page2.dart';
import './pages/page3.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 3;

  List currentPage = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*       appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
      ), */
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        backgroundColor: Colors.blueAccent,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.notifications_none_outlined, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: currentPage[_page],
    );
  }
}
