import 'package:flutter/material.dart';
import 'package:basic_banking_app/constants.dart';

class IndividualScreenCard extends StatelessWidget {
  const IndividualScreenCard(
      {Key? key,
      required this.clientName,
      required this.accNo,
      required this.balance}) : super(key: key);

  final String clientName;
  final String accNo;
  final num balance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  'ACCOUNT HOLDER:',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: kAppThemeBlackColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0, top: 20),
                child: Text(
                  clientName,
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: kAppThemeBlackColor,
                    fontFamily: 'OverpassMono',
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  'ACCOUNT NUMBER:',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: kAppThemeBlackColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0, top: 20),
                child: Text(
                  accNo.toString(),
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: kAppThemeBlackColor,
                    fontFamily: 'OverpassMono',
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  'CURRENT BALANCE:',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: kAppThemeBlackColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0, top: 20),
                child: Text(
                  balance.toString(),
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: kAppThemeBlackColor,
                    fontFamily: 'OverpassMono',
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
