import 'package:flutter/material.dart';
import 'package:basic_banking_app/constants.dart';

class UserScreenCard extends StatelessWidget {
  const UserScreenCard(
      {Key? key,
      required this.name,
      required this.accNo,
      required this.balance})
      : super(key: key);

  final String name, accNo;
  final num balance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, left: 7.0, right: 7.0),
        child: Card(
          color: kAppThemeGrey2Color,
          elevation: 1.7,
          shadowColor: kAppThemeBlackColor,
          child: SizedBox(
            height: 130.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.person,
                  color: kAppThemeWhiteColor,
                  size: 120.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, right: 12.0),
                      child: Text(
                        name,
                        style: TextStyle(
                          letterSpacing: 2.0,
                          color: kAppThemeWhiteColor,
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 21.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0, bottom: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            color: kAppThemeWhiteColor,
                            size: 27,
                          ),
                          Text(
                            balance.toString(),
                            style: TextStyle(
                              color: kAppThemeWhiteColor,
                              // fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
