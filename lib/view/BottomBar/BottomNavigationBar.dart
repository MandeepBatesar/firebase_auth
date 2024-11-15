import 'package:firebase_authntication/constant/AppTextTheme.dart';
import 'package:firebase_authntication/view/Page/ChatView.dart';
import 'package:firebase_authntication/view/Page/LogOutScreen.dart';
import 'package:firebase_authntication/view/Profile/ProfileScreen.dart';
import 'package:flutter/material.dart';

class BottomnavigationbarScreen extends StatefulWidget {
  @override
  _BottomnavigationbarScreenState createState() => _BottomnavigationbarScreenState();
}

class _BottomnavigationbarScreenState extends State<BottomnavigationbarScreen> {
  int _currentIndex = 0;

  // List of widgets for each tab
  final List<Widget> _screens = [ChatView(), LogOutScreen(), ProfileScreen()];
  // This function is called when a tab is tapped
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ChatApp",
          style: AppTextTheme().fs20Medium.copyWith(color: AppColors().white),
        ),
        backgroundColor: AppColors().primary,
        foregroundColor: Colors.transparent,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors().primary,
        selectedItemColor: AppColors().white,
        // unselectedItemColor: AppColors().red,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors().red,
            icon: _currentIndex == 0
                ? Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors().gray.withOpacity(1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.home, color: AppColors().bgclr),
                  )
                : Icon(Icons.home, color: AppColors().bgclr),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors().gray.withOpacity(1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.search, color: AppColors().bgclr),
                  )
                : Icon(Icons.search, color: AppColors().bgclr),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors().gray.withOpacity(1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, color: AppColors().bgclr),
                  )
                : Icon(
                    Icons.person,
                    color: AppColors().bgclr,
                  ),
            label: '',
          ),
        ],
      ),
    );
  }
}
