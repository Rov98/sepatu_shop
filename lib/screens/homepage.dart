import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepatu_shop/misc/misc.dart';
import 'package:sepatu_shop/screens/pages/categoriesPages/categoriesItems.dart';
import 'package:sepatu_shop/screens/pages/homeItem/homeItem.dart';
import 'package:sepatu_shop/screens/userInfopage.dart';
import 'package:sepatu_shop/widgets/appbarCustom.dart';
import 'package:sepatu_shop/widgets/searchWidget/searchWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedInx = 0; //default indx
  final List<Widget> _pages = [const HomeItem(), const categoriesItems()];

  User getUser() {
    final currUser = FirebaseAuth.instance.currentUser!;
    return currUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom('Shop', actionList: <Widget>[
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: SearchWidget(),
            );
          },
          icon: const Icon(Icons.search_rounded),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserInfoPage(user: getUser()),
              ),
            );
          },
          icon: const Icon(Icons.badge_rounded),
        )
      ]),
      backgroundColor: pitchBlack,
      body: _pages.elementAt(_selectedInx),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              )),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedInx,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                    size: 30,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list_alt_rounded,
                    size: 30,
                  ),
                  label: 'Categories')
            ],
            onTap: (value) {
              setState(() {
                _selectedInx = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
