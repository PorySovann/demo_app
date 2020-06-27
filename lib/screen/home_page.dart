import 'package:demoapp/const/app_colors.dart';
import 'package:demoapp/const/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  Widget backgroundWidget() {
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
            color: AppColors.primary,
          ),
          flex: 2,
        ),
        Flexible(
          child: Container(
            color: AppColors.background,
          ),
          flex: 4,
        )
      ],
    );
  }

  Widget foregroundWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Hi Ella Frances", style: headerTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "Sep 20, 2019",
              style: secondaryTextStyle,
            ),
          ),
          menuCard,
        ],
      ),
    );
  }

  Widget menuItem(icon, title) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(color: Color(0x335E7BA0)),
                bottom: BorderSide(color: Color(0x335E7BA0)))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                icon,
                width: 80,
                height: 80,
                color: AppColors.primary,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$title",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 18,
                ),
              ),
            ]),
      ),
    );
  }

  get menuCard {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 40),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  menuItem(SvgIconConst.iconAccount, "Account"),
                  menuItem(SvgIconConst.iconTransfer, "Transfer"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  menuItem(SvgIconConst.iconDeposit, "Deposit"),
                  menuItem(SvgIconConst.iconLoan, "Loan"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  menuItem(SvgIconConst.iconExchangeRate, "Exchange"),
                  menuItem(SvgIconConst.iconCalculator, "Calculator"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  get _body {
    return Stack(
      children: <Widget>[
        backgroundWidget(),
        foregroundWidget(),
      ],
    );
  }

  get _appBar {
    return AppBar(
      title: Icon(Icons.dashboard),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.chat_bubble_outline),
        )
      ],
      elevation: 0,
      backgroundColor: AppColors.primary,
    );
  }

  get headerTextStyle {
    return TextStyle(color: AppColors.primaryTextColor, fontSize: 30);
  }

  get secondaryTextStyle {
    return TextStyle(color: AppColors.secondaryTextColor, fontSize: 20);
  }
}
