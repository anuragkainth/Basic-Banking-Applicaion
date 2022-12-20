import 'package:flutter/material.dart';
import 'package:basic_banking_app/constants.dart';
import '../Screens/users_screen.dart';

class HomeScreenMainCard extends StatelessWidget {
  HomeScreenMainCard({this.cardName = 'Transfer Money', this.icon = Icons.currency_rupee});

  final String cardName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
          EdgeInsets.only(left: 15.0, top: 42.0),
          child: Card(
            color: kAppThemeGreenColor,
            elevation: 1.5,
            shadowColor: kAppThemeBlackColor,
            child: SizedBox(
              height: 75,
              width: 75,
              child: Center(
                child: Icon(
                  icon,
                  size: 30,
                  color: kAppThemeWhiteColor,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(top: 40.0),
          child: OutlinedButton(
            style: ButtonStyle(

            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UsersScreen()
                ),
              );
            },
            child: Card(
              color: kAppThemeGreyColor,
              elevation: 1.5,
              shadowColor: kAppThemeBlackColor,
              child: SizedBox(
                height: 75,
                width: 292,
                child: Center(
                  child: Text(
                    cardName,
                    style: TextStyle(
                      color: kAppThemeBlackColor,
                      fontFamily: 'OverpassMono',
                      fontWeight: FontWeight.normal,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}