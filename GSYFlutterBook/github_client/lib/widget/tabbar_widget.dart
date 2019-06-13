import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> 
with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();

    // create controller when init
    // implement animation by `with SingleTickerProviderStateMixin`
    _tabController = new TabController(vsync:this, length: _tabItems.length)
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
