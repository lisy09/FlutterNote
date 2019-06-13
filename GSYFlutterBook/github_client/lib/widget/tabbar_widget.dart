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
  final bool resizeToAvoidBottomPadding;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final TarBarWidgetControl tarbarWidgetControl;

  TabBarWidget({
    Key key,
    this.type,
    this.tabItems,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomPadding = true,
    this.tarbarWidgetControl,
  }) : super(key:key)

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState(
    this.type,
    this.tabItems,
    this.floatingActionButton,
    this.tarbarWidgetControl,
  );
}

class _TabBarWidgetState extends State<TabBarWidget> 
with SingleTickerProviderStateMixin {
  final TarBarType _type;
  final List<Widget> _tabView;
  // final Color _indicatorColor;
  final Widget _floatingActionButton;
  final TarBarWidgetControl _tarbarWidgetControl;

  _TabBarWidgetState(
    this._type,
    this._tabView,
    this._floatingActionButton,
    this._tarbarWidgetControl,
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
    if (this._type == TarBarType.Top) {
      return new Scaffold(
        resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
        floatingActionButton: SafeArea(child: _floatingActionButton ?? Container()),
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        persistentFooterButtons: _tarbarWidgetControl == null ? 
          null : _tarbarWidgetControl.footerButton,
        appBar: new AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: ,
        ),
      );
    }
    return Container(
      
    );
  }
}
