import 'package:flutter/material.dart';
import 'package:new_design_advaya/views/settings/setting_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              spreadRadius: 0,
              offset: Offset(0, 0),
              color: Color.fromRGBO(179, 32, 115, 0.18),
            )
          ]),
          child: AppBar(
            title: const Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingScreen(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
