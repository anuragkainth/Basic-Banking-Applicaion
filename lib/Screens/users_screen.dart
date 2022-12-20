import 'package:flutter/material.dart';
import 'package:basic_banking_app/constants.dart';
import 'package:basic_banking_app/Components/user_screen_card.dart';
import 'package:get_storage/get_storage.dart';
import '../data.dart';
import 'individual_view_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  final GetStorage store = GetStorage('bank');
  late List<BankData> objList;

  @override
  void initState() {
    objList = getDataAndStore();
    print(objList);

    super.initState();
  }

  List<BankData> getDataAndStore(){

    Iterable keys = store.getKeys();
    return keys.map((e) => BankData.fromString(store.read(e))).toList();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USERS', style: TextStyle(color: kAppThemeBlackColor, fontSize: 18),),
        elevation: 0,
        backgroundColor: kAppThemeWhiteColor,
        iconTheme: IconThemeData(
          color: kAppThemeBlackColor,
          size: 30.0,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical  ,
          itemCount: objList.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => IndividualViewScreen(
                      index: index,
                    )),
                );
                setState(() {
                  objList = getDataAndStore();
                });
              },
              child: UserScreenCard(
                name: objList[index].name,
                accNo: objList[index].accNo,
                balance:  objList[index].balance,
              ),
            );
          },
        ),
      ),
    );
  }
}

