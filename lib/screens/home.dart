import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat/utils/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> userList = [
    {'name': 'My Status', 'photo': 'assets/images/profile.png'},
    {'name': 'Adil', 'photo': 'assets/images/profile1.png'},
    {'name': 'Marina', 'photo': 'assets/images/profile2.png'},
    {'name': 'Dean', 'photo': 'assets/images/profile3.png'},
    {'name': 'Max', 'photo': 'assets/images/profile4.png'},
    {'name': 'My Status', 'photo': 'assets/images/profile.png'},
    {'name': 'Adil', 'photo': 'assets/images/profile1.png'},
    {'name': 'Marina', 'photo': 'assets/images/profile2.png'},
    {'name': 'Dean', 'photo': 'assets/images/profile3.png'},
    {'name': 'Max', 'photo': 'assets/images/profile4.png'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 24, left: 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/onboarding');
                  },
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 44.0,
                    height: 44.0,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/profile.png',
                    width: 44,
                    height: 44,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(userList[index]['photo']),
                        radius: 30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        userList[index]['name'],
                        style: TextStyle(
                          color: white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
 
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 330,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [Text('data')],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 24.0, top: 18),
        decoration: BoxDecoration(
          color: bottomNavigationBar,
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Message.svg',
                        width: 26.0,
                        height: 26.0,
                        color: _selectedIndex == 0 ? primary : fontPlaceholder,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Message',
                        style: TextStyle(
                            color:
                                _selectedIndex == 0 ? primary : fontPlaceholder,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Call.svg',
                        width: 26.0,
                        height: 26.0,
                        color: _selectedIndex == 1 ? primary : fontPlaceholder,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Calls',
                        style: TextStyle(
                            color:
                                _selectedIndex == 1 ? primary : fontPlaceholder,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/user.svg',
                        width: 26.0,
                        height: 26.0,
                        color: _selectedIndex == 2 ? primary : fontPlaceholder,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Contacts',
                        style: TextStyle(
                            color:
                                _selectedIndex == 2 ? primary : fontPlaceholder,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/settings.svg',
                        width: 26.0,
                        height: 26.0,
                        color: _selectedIndex == 3 ? primary : fontPlaceholder,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            color:
                                _selectedIndex == 3 ? primary : fontPlaceholder,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
