import 'package:basic_banking_app/constants.dart';
import 'package:flutter/material.dart';
import '../Components/home_screen_main_card.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: kAppThemeBlackColor,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80, bottom: 10.0),
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Welcome User',
                        style: TextStyle(
                          fontFamily: 'OverpassMono',
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: kAppThemeWhiteColor,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: kAppThemeGreenColor,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 37.0, right: 10.0, left: 10.0),
                      child: Text(
                        'BANK OF SEVEN',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 44.0,
                          color: kAppThemeWhiteColor,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 4.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HomeScreenMainCard(cardName: 'Transfer Money', icon: Icons.currency_rupee),
                  // HomeScreenMainCard(cardName: 'Transactions', icon: Icons.account_balance),
                  HomeScreenMainCard(cardName: 'Users', icon: Icons.people),
                  Padding(
                    padding: EdgeInsets.only(top: 140.0),
                    child: SafeArea(
                      child: OutlinedButton(
                        onPressed: () => SystemNavigator.pop(),
                        child: Card(
                          color: kAppThemeBlackColor,
                          elevation: 1.5,
                          shadowColor: kAppThemeBlackColor,
                          child: SizedBox(
                            height: 75,
                            child: Center(
                              child: Text(
                                'EXIT',
                                style: TextStyle(
                                  letterSpacing: 7.0,
                                  color: kAppThemeWhiteColor,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
