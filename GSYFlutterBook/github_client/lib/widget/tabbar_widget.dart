import 'package:flutter/material.dart';

enum TarBarType {
  Bottom,
  Top,
}

class TarBarWidgetControl {
  List<Widget> footerButton = [];
}

class TabBarWidget extends StatefulWidget {
  final TarBarType type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final Color indicatorColor;
  final bool resizeToAvoidBottomPadding;
  final Widget title;
  final Widget drawer;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final TarBarWidgetControl tarbarWidgetControl;
  final ValueChanged<int> onPageChaned;

  TabBarWidget({
    Key key,
    this.type,
    this.tabItems,
    this.tabViews,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomPadding = true,
    this.tarbarWidgetControl,
    this.onPageChaned,
  }) : super(key:key)

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState(
    this.type,
    this.tabViews,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.tarbarWidgetControl,
    this.onPageChaned,
  );
}

class _TabBarWidgetState extends State<TabBarWidget> 
with SingleTickerProviderStateMixin {
  final TarBarType _type;
  final List<Widget> _tabViews;
  final Color _indicatorColor;
  final Widget _title;
  final Widget _drawer;
  final Widget _floatingActionButton;
  final TarBarWidgetControl _tarbarWidgetControl;

  final PageController _pageController = PageController();
  final ValueChanged<int> _onPageChaned;

  _TabBarWidgetState(
    this._type,
    this._tabViews,
    this._indicatorColor,
    this._title,
    this._drawer,
    this._floatingActionButton,
    this._tarbarWidgetControl,
    this._onPageChaned,
  ) : super();

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    // create controller when init
    // implement animation by `with SingleTickerProviderStateMixin`
    _tabController = new TabController(length: widget.tabItems.length, vsync: this);
  }

  // dispose controller when page dispose
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // if (this._type == TarBarType.Top) {
    //   return new Scaffold(

    //     resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
    //     floatingActionButton: SafeArea(child: _floatingActionButton ?? Container()),
    //     floatingActionButtonLocation: widget.floatingActionButtonLocation,
    //     persistentFooterButtons: _tarbarWidgetControl == null ? 
    //       null : _tarbarWidgetControl.footerButton,
    //     appBar: new AppBar(
    //       backgroundColor: Theme.of(context).primaryColor,
    //       title: ,
    //     ),
    //   );
    // }
    
    // bottom tab
    return new Scaffold(
      // set drawer for side swipe
      drawer: _drawer,
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _title,
      ),
      // PageView for tabs
      body: new PageView(
        // controller synced with tabBar's controller
        controller: _pageController,
        children: _tabViews,
        onPageChanged: (index) {
          _tabController.animateTo(index);
        },
      ),
      bottomNavigationBar: new Material(
        color: Theme.of(context).primaryColor,
        child: new TabBar(
          controller: _tabController,
          tabs: widget.tabItems,
          indicatorColor: _indicatorColor,
        ),
      ),
    );
  }
}
