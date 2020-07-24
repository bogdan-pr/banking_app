import 'package:banking/dummy_data/accounts_list.dart';
import 'package:banking/widgets/accounts_card.dart';
import 'package:banking/widgets/profile_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalBalance() {
    //todo use for loop to get all accounts' balances.
    var balance = accountsList[0].balance;
    return balance;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: buildAppBar(context),
      floatingActionButton: buildFloatingActionButton(),
      body: Container(
        width: double.infinity,
        height: size.height * 1,
        child: Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              height: size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kStackBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  )),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Text(
                      'Good morning,\n',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white54),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Text(
                      'Khalid',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: 140,
                    right: 0,
                    child: Text(
                      'Total Balance',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white54),
                    ),
                  ),
                  Positioned(
                    top: 155,
                    right: 0,
                    child: Text(
                      '\$28,386.20',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height / 4,
              left: size.width * 0.05,
              width: size.width * 0.9,
              height: size.height * 0.65,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: accountsList.length,
                      itemBuilder: (context, index) {
                        return AccountsCard(
                          index: index,
                          accountType: accountsList[index].accountType,
                          acctNumber: accountsList[index].acctNumber,
                          balance: accountsList[index].balance,
                          onPress: () {
                            print('ACCESSED!!!!!!!');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccountScreen(
                                  index: index,
                                  accountType: accountsList[index].accountType,
                                  acctNumber: accountsList[index].acctNumber,
                                  balance: accountsList[index].balance,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  //todo add contact buttons like chat or phone customer service
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kStackBackgroundColor,
      elevation: 0,
      // todo try without a title
      title: Text(kAppTitle,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white)),
      centerTitle: true,
      leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      actions: [
        ProfileIconButton(),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
        //todo make it disappear when scrolling down and re-appear on up scroll
        backgroundColor: Colors.white,
        child: SvgPicture.asset(
          'assets/icons/contactless.svg',
          color: Colors.black,
          height: 40,
        ),
        onPressed: () {});
  }
}