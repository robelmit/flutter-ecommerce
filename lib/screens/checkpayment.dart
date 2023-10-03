import 'package:app/screens/postad.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/api.dart';

class Checker extends StatefulWidget {
  static final routeName = 'checker';
  final Map<String, dynamic> argument;
  const Checker({super.key, required this.argument});

  @override
  State<Checker> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  bool isactivated = false;
  @override
  void initState() {
    var api = Api();
    print('widget.argument.toString()');
    print('widget.argument.toString()');
    print(widget.argument.toString());
    print('id of the add');
    print('id of the add');
    print(widget.argument['idofadd']);
    if (widget.argument['message'] == 'paymentSuccessful') {
      //paidAmount
      api
          .sendpayment(
              widget.argument['paidAmount'], widget.argument['idofadd'])
          .then((value) {
        isactivated = true;
        setState(() {});
        Fluttertoast.showToast(
            msg: "addppostedsuccessfully".tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil<void>(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => TabScreen(
                      tab: '0',
                    )),
            ModalRoute.withName('/post screen'),
          );
        });
      });

      // {Navigator.pushReplacementNamed(context, MyNewApp.routeName)});

      // print('One second has passed.'); // Prints after 1 second.
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => TabScreen(
              tab: '3',
            ),
          ),
        );
      });

      Fluttertoast.showToast(
          msg: "payment failed please retry again".tr(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      print('what the hell');
    }

    print('this is checking screen');

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        title: Text('Payment Processed'.tr()),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Builder(builder: (context) {
          if (widget.argument['message'] == 'Connectivity Issue') {
            return Text('Connectivity Issue'.tr(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
          } else if (widget.argument['message'] == 'paymentCancelled') {
            return Text('paymentCancelled'.tr(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
          } else if (widget.argument['message'] == 'paymentSuccessful') {
            return Text('paymentSuccessful'.tr(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
          } else if (widget.argument['message'] == ' b') {
            return Text('CancelbuttonClicked'.tr(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
          }

          return SizedBox();
          // return Text('amount paid ${widget.argument['paidAmount']}');
        }),
        SizedBox(height: 15),
        // Text(widget.argument.toString()),

        // Text('Payment status ${widget.argument['message']}'),
        Image.asset(
          'assets/images/splash_1.png',
          width: MediaQuery.of(context).size.width / 2,
        ),
        SizedBox(height: 20),

        Center(
          child: isactivated
              ? Column(
                  children: [
                    Text(
                      'Congrats'.tr(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Advertisement is now live '.tr(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      'Activating your advertisement '.tr(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
        )
      ]),
    );
  }
}
