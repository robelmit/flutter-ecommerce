import 'package:app/screens/postad.dart';
import 'package:flutter/material.dart';

import '../services/api.dart';

class Checker extends StatefulWidget {
  static final routeName = 'checker';
  final Map<String, dynamic> argument;
  const Checker({super.key, required this.argument});

  @override
  State<Checker> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  @override
  void initState() {
    var api = Api();
    print('widget.argument.toString()');
    print('widget.argument.toString()');
    print(widget.argument.toString());
    if (widget.argument['message'] == 'paymentSuccessful') {
      Future.delayed(const Duration(seconds: 10), () {
        //paidAmount
        api.sendpayment(widget.argument['message']).then((value) =>
            {Navigator.pushReplacementNamed(context, MyNewApp.routeName)});

        // print('One second has passed.'); // Prints after 1 second.
      });
    } else {
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
        title: Text('Payment Processed'),
        centerTitle: true,
      ),
      body: Column(children: [
        Builder(builder: (context) {
          if (widget.argument['message'] == 'Connectivity Issue') {
            return Text('Connectivity Issue');
          } else if (widget.argument['message'] == 'paymentCancelled') {
            return Text('paymentCancelled');
          } else if (widget.argument['message'] == 'paymentSuccessful') {
            return Text('paymentSuccessful');
          } else if (widget.argument['message'] == ' b') {
            return Text('CancelbuttonClicked');
          }

          return SizedBox();
          // return Text('amount paid ${widget.argument['paidAmount']}');
        }),
        Text(widget.argument.toString()),

        // Text('Payment status ${widget.argument['message']}'),
        Image.asset(
          'assets/images/splash_1.png',
          width: MediaQuery.of(context).size.width / 2,
        ),
        Center(
          child: CircularProgressIndicator(),
        )
      ]),
    );
  }
}
