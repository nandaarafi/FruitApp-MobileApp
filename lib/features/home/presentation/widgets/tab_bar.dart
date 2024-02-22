import 'package:flutter/material.dart';

class FTabBar extends StatefulWidget {
  @override
  _FTabBar createState() => _FTabBar();
}

class _FTabBar extends State<FTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('TabBar Example'),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController, // Provide the TabController
          tabs: [
            Tab(child: Text("Sports"),),
            Tab(child: Text("Vegetables"),),
            Tab(child: Text("Sports"),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text('Sports Content'),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text('Vegetables Content'),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text('More Sports Content'),
          ),
        ],
      ),
    );
  }
}