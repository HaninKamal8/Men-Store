import 'package:flutter/material.dart';
import 'package:project3/core/homeNav/BottomNavBar/NavBar.dart';

import '../Auth/SignIn/SignIn.dart';
import '../core/helpers/logoutDialog.dart';
import '../home/view.dart';
import 'accountTile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CustomBottomNavBar(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 48),
                ],
              ),
            ),

            Divider(
              color: Colors.grey.shade300,
              height: 1,
            ),

            const SizedBox(height: 10),

            AccountTile(
              icon: Icons.inventory_2_outlined,
              title: "My Orders",
              onTap: () {},
            ),

            Divider(color: Colors.grey.shade300),

            AccountTile(
              icon: Icons.person_outline,
              title: "My Details",
              onTap: () {},
            ),

            Divider(color: Colors.grey.shade300),

            AccountTile(
              icon: Icons.home_outlined,
              title: "Address Book",
              onTap: () {},
            ),

            Divider(color: Colors.grey.shade300),

            AccountTile(
              icon: Icons.help_outline,
              title: "FAQs",
              onTap: () {},
            ),

            Divider(color: Colors.grey.shade300),

            AccountTile(
              icon: Icons.headset_mic_outlined,
              title: "Help Center",
              onTap: () {},
            ),

            Divider(color: Colors.grey.shade300),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                bottom: 35,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    LogoutDialog.show(
                      context,
                      onLogout: () {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      },
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
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

