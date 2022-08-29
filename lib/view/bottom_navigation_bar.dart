import 'package:flutter/material.dart';
import 'package:otp_provider/main.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/view/about.dart';
import 'package:otp_provider/view/drawer.dart';
import 'package:otp_provider/view/home_page.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
    AppBar appBar = AppBar(
      title: Text('Flutter'),
      leading: Builder(
        builder: (BuildContext appBarContext) {
          return IconButton(
              onPressed: () {
                AppDrawer.of(appBarContext)!.toggle();
              },
              icon: Icon(Icons.menu)
          );
        },
      ),
    );
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
   AppDrawer(child:HomePage( ) ,) ,

   AppDrawer(child: AboutPage(),),
    Text(
      'All Sheets Here',
      style: optionStyle,
    ),
   
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: theme.primaryColor,
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashbord',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'About',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.grid_view),
            //   label: 'Grid',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.favorite),
            //   label: 'Favorite',
            // ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:theme.primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          // backgroundColor: Colors.purpleAccent,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.storage_rounded),
        backgroundColor: theme.primaryColor.withOpacity(.8),
        onPressed: () {}),
    );
  }
}
