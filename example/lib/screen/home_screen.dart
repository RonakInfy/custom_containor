import 'package:custom_containor/custom_containor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectItem = 0;

  List<BottomBarItem> itemList = [
    BottomBarItem(name: "Home", icon: Icons.home),
    BottomBarItem(name: "Search", icon: Icons.search),
    BottomBarItem(name: "Add", icon: Icons.add),
    BottomBarItem(name: "Profile", icon: Icons.person),
  ];

  @override
  void initState() {
    selectItem = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Column(
        children: [],
      ),
      bottomNavigationBar: CustomContainer(
        selectItem: selectItem,
        onTap: (val) {
          setState(
            () {
              selectItem = val;
            },
          );
        },
        itemList: itemList,
      ),
    );
  }
}
