import 'package:chapasdk/chapasdk.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Redirect extends StatefulWidget {
  final String amounttopay;
  final String chapaurl;
  final String myid;
  const Redirect(
      {super.key,
      required this.amounttopay,
      required this.chapaurl,
      required this.myid});

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  @override
  void initState() {
    var uuid = Uuid();
    var amount = widget.amounttopay;
    var chapa = widget.chapaurl;
    var myid = widget.myid;

    Chapa.paymentParameters(
      context: context, // context
      publicKey: chapa,
      currency: 'ETB',
      amount: amount.toString(),
      email: 'xyz@gmail.com',
      firstName: 'fullName',
      lastName: 'lastName',
      txRef: uuid.v1(),
      title: 'title',
      desc: 'desc',
      idofadd: myid,
      namedRouteFallBack: '/checker', // fall back route name
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redirecting'.tr()),
      ),
      body: Center(
        child: Column(children: [
          Text(
            'paymenttobemade'.tr(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.amounttopay + ' ' + 'birr'.tr(),
            style:
                TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Redirecting'.tr(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator()
        ]),
      ),
    );
  }
}
