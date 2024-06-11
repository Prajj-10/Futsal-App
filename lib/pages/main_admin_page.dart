import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/page_cubit.dart';
import 'package:demo_futsalapp/pages/favorite_page.dart';
import 'package:demo_futsalapp/pages/home_page.dart';
import 'package:demo_futsalapp/pages/setting_page.dart';
import 'package:demo_futsalapp/pages/transaction_page.dart';
import 'package:demo_futsalapp/widgets/navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAdminPage extends StatelessWidget {
  const MainAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return TransactionPage();
        case 1:
          return SettingPage();
        default:
          return TransactionPage();
      }
    }

    Widget myBottomNavbar() {
      return Container(
        width: 150,
        height: 45,
        margin: EdgeInsets.all(defaultMargin),
        padding: EdgeInsets.only(left: 28, right: 28, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 50,
              color: Colors.black.withOpacity(0.15),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavbarItem(
              imageUrl: "assets/icon_document.png",
              index: 0,
            ),
            NavbarItem(
              imageUrl: "assets/icon_setting.png",
              index: 1,
            ),
          ],
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                buildContent(currentIndex),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: myBottomNavbar(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
