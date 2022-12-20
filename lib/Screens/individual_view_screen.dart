import 'package:basic_banking_app/data.dart';
import 'package:flutter/material.dart';
import 'package:basic_banking_app/constants.dart';
import 'package:basic_banking_app/Components/individual_screen_card.dart';
import 'package:get_storage/get_storage.dart';

class IndividualViewScreen extends StatefulWidget {
  const IndividualViewScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<IndividualViewScreen> createState() => _IndividualViewScreenState();
}

class _IndividualViewScreenState extends State<IndividualViewScreen> {

  GetStorage store = GetStorage('bank');
  late BankData clientData;
  num transferAmount = 0;
  TextEditingController transferAmountController = TextEditingController();

  late List<BankData> allUser;

  @override
  void initState(){

    Iterable keys = store.getKeys();
    allUser = keys.map((k) => BankData.fromString(store.read(k))).toList();

    clientData = allUser[widget.index];

    transferAmountController.text = "0";

    print(clientData);
    super.initState();
  }
  Future<int?> showBottomSheet() async{

    int selectedPerson = 0;
    bool? workSucessful = false;
    workSucessful = await showModalBottomSheet<bool>(
      context: context,
      isDismissible: false,
      builder: (context) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: allUser.length,
              itemBuilder: (context, index){

                if(index == widget.index){
                  return const SizedBox();
                }
                return ListTile(
                  enabled: index != widget.index,
                  onTap: (){
                    selectedPerson = index;
                    Navigator.pop(context,true);
                  },
                  title: Text(allUser[index].name),
                  dense: true,
                );
              },
            ),
            IconButton(
              splashRadius: 18,
              iconSize: 32,
              padding: EdgeInsets.all(0),
              onPressed: (){
                Navigator.pop(context, false);
              },
              icon: Icon(
                Icons.cancel_outlined,
              )
            )
          ],
        );
      },
    );
    return workSucessful == null || !workSucessful ? null : selectedPerson;
  }

  void performTransfer() async{

    print("T = $transferAmount");
    int? receiver = await showBottomSheet();
    if(receiver == null) return;

    allUser[receiver].balance += transferAmount;
    store.write('c$receiver', allUser[receiver].toString());
    allUser[widget.index].balance -= transferAmount;
    store.write('c${widget.index}', allUser[widget.index].toString());

    setState((){});
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context){
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: kAppThemeWhiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 300,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Transfer Sucessful",
                      style: TextStyle(
                        fontSize: 20,
                        color: kAppThemeGreenColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "From ${clientData.name.split(" ")[0]}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            decoration: TextDecoration.none
                          ),
                        ),
                        const Icon(Icons.arrow_right_alt),
                        Text(
                          "To ${allUser[receiver].name.split(" ")[0]}",
                          style: TextStyle(
                              fontSize: 12,
                              color: kAppThemeGreenColor,
                              decoration: TextDecoration.none
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
        },
    );
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    Navigator.pop(context);
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
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Icon(
                  Icons.account_circle,
                  size: 330,
                  color: kAppThemeBlackColor,
                ),
                SizedBox(
                  height: 20.0,
                  width: 190.0,
                  child: Divider(
                    thickness: 0.6,
                    color: kAppThemeBlackColor,
                  ),
                ),
                IndividualScreenCard(clientName: clientData.name, accNo: clientData.accNo, balance: clientData.balance,),
                Padding(
                  padding: EdgeInsets.only(top: 60.0, left: 15.0, right: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: transferAmountController,
                    onChanged: (value){
                      if(value.isEmpty){
                        setState(() {
                          transferAmount = 0;
                        });
                        return;
                      }
                      num amnt = num.parse(value);
                      if(amnt <= clientData.balance) {
                        setState(() {
                          transferAmount = amnt;
                        });
                      }
                        else{
                          transferAmountController.text = clientData.balance.toString();
                          setState(() {
                            transferAmount = clientData.balance;
                          });
                      }
                    },
                    style: TextStyle(
                      color: kAppThemeBlackColor,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kAppThemeWhiteColor,
                      icon: Icon(
                        Icons.currency_rupee,
                        color: kAppThemeBlackColor,
                        size: 30,
                      ),
                      hintText: 'Enter Amount to Transfer',
                      hintStyle: TextStyle(
                        color: kAppThemeGreyColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 40.0, right: 15.0),
                  child: SafeArea(
                    child: OutlinedButton(
                      onPressed: performTransfer,
                      child: Card(
                        color: kAppThemeBlackColor,
                        elevation: 1.5,
                        shadowColor: kAppThemeBlackColor,
                        child: SizedBox(
                          height: 75,
                          child: Center(
                            child: Text(
                              'TRANSFER MONEY',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                wordSpacing: 7.0,
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
      ),
    );
  }
}
