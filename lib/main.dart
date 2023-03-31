import 'package:empat_task6/pages/account.dart';
import 'package:empat_task6/pages/main_page.dart';
import 'package:empat_task6/pages/photos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/post_state_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var pages = [
    const MainPage(),
    const PhotoPage(),
    const AccountPage(),
  ];

  var navElements = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_camera),
      label: 'Photo',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Account',
    ),
  ];

  var drawerElements = List<Widget>.generate(
    5,
    (index) => Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            size: 10,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Option $index',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    ),
  );

  int pageNum = 0;

  late TabController _tabPageController;

  @override
  void initState() {
    _tabPageController = TabController(
      length: pages.length,
      vsync: this,
    );
    _tabPageController.addListener(() {
      setState(() {
        pageNum = _tabPageController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F8),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF715AFF),
        unselectedItemColor: const Color(0xFFA682FF),
        showUnselectedLabels: false,
        onTap: (index) {
          if (index != pageNum) {
            setState(() {
              pageNum = index;
            });
            _tabPageController.animateTo(pageNum,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          }
        },
        currentIndex: pageNum,
        items: navElements,
      ),
      body: SafeArea(
          child: TabBarView(
        controller: _tabPageController,
        children: pages,
      )),
    );
  }

  @override
  void dispose() {
    _tabPageController.dispose();
    super.dispose();
  }
}
