import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => new _PaymentState();
}

class _PaymentState extends State<Payment> {
  Token _paymentToken;
  PaymentMethod _paymentMethod;
  String _error;
  final String _currentSecret = "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"; //set this yourself, e.g using curl
  PaymentIntentResult _paymentIntent;
  Source _source;

  ScrollController _controller = ScrollController();

  final CreditCard testCard = CreditCard(
    number: '4111111111111111',
    expMonth: 08,
    expYear: 22,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(
        StripeOptions(publishableKey: "pk_live_51IV3qALpruYNOz2g7C3GaI4DC8QcI7E9YG97EDmSqshfHyYtfQxK38L4cKZQgLOtb42CKrGBJbshpCDiG93nlTCA00aDPoSoGf",
            merchantId: "Your_Merchant_id",
            androidPayMode: 'test'));
  }

  void setError(dynamic error) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      _error = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text('Stripe Payment Demo',),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _source = null;
                  _paymentIntent = null;
                  _paymentMethod = null;
                  _paymentToken = null;
                });
              },
            )
          ],
        ),
        body: ListView(
          controller: _controller,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            RaisedButton(
              child: Text("Create Source"),
              onPressed: () {
                StripePayment.createSourceWithParams(SourceParams(
                  type: 'ideal',
                  amount: 2102,
                  currency: 'eur',
                  returnURL: 'example://stripe-redirect',
                )).then((source) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${source.sourceId}')));
                  setState(() {
                    _source = source;
                  });
                }).catchError(setError);
              },
            ),
            Divider(),
            RaisedButton(
              child: Text("Create Token with Card Form"),
              onPressed: () {
                StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest()).then((paymentMethod) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${paymentMethod.id}')));
                  setState(() {
                    _paymentMethod = paymentMethod;
                  });
                }).catchError(setError);
              },
            ),
            RaisedButton(
              child: Text("Create Token with Card"),
              onPressed: () {
                StripePayment.createTokenWithCard(
                  testCard,
                ).then((token) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${token.tokenId}')));
                  setState(() {
                    _paymentToken = token;
                  });
                }).catchError(setError);
              },
            ),
            Divider(),
            RaisedButton(
              child: Text("Create Payment Method with Card"),
              onPressed: () {
                StripePayment.createPaymentMethod(
                  PaymentMethodRequest(
                    card: testCard,
                  ),
                ).then((paymentMethod) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${paymentMethod.id}')));
                  setState(() {
                    _paymentMethod = paymentMethod;
                  });
                }).catchError(setError);
              },
            ),
            RaisedButton(
              child: Text("Create Payment Method with existing token"),
              onPressed: _paymentToken == null
                  ? null
                  : () {
                StripePayment.createPaymentMethod(
                  PaymentMethodRequest(
                    card: CreditCard(
                      token: _paymentToken.tokenId,
                    ),
                  ),
                ).then((paymentMethod) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${paymentMethod.id}')));
                  setState(() {
                    _paymentMethod = paymentMethod;
                  });
                }).catchError(setError);
              },
            ),
            Divider(),
            RaisedButton(
              child: Text("Confirm Payment Intent"),
              onPressed: _paymentMethod == null || _currentSecret == null
                  ? null
                  : () {
                StripePayment.confirmPaymentIntent(
                  PaymentIntent(
                    clientSecret: _currentSecret,
                    paymentMethodId: _paymentMethod.id,
                  ),
                ).then((paymentIntent) {
                  _scaffoldKey.currentState
                      .showSnackBar(SnackBar(content: Text('Received ${paymentIntent.paymentIntentId}')));
                  setState(() {
                    _paymentIntent = paymentIntent;
                  });
                }).catchError(setError);
              },
            ),
            RaisedButton(
              child: Text("Authenticate Payment Intent"),
              onPressed: _currentSecret == null
                  ? null
                  : () {
                StripePayment.authenticatePaymentIntent(clientSecret: _currentSecret).then((paymentIntent) {
                  _scaffoldKey.currentState
                      .showSnackBar(SnackBar(content: Text('Received ${paymentIntent.paymentIntentId}')));
                  setState(() {
                    _paymentIntent = paymentIntent;
                  });
                }).catchError(setError);
              },
            ),
            Divider(),
            RaisedButton(
              child: Text("Native payment"),
              onPressed: () {
                if (Platform.isIOS) {
                  _controller.jumpTo(450);
                }
                StripePayment.paymentRequestWithNativePay(
                  androidPayOptions: AndroidPayPaymentRequest(
                    totalPrice: "2.40",
                    currencyCode: "EUR",
                  ),
                  applePayOptions: ApplePayPaymentOptions(
                    countryCode: 'DE',
                    currencyCode: 'EUR',
                    items: [
                      ApplePayItem(
                        label: 'Test',
                        amount: '27',
                      )
                    ],
                  ),
                ).then((token) {
                  setState(() {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${token.tokenId}')));
                    _paymentToken = token;
                  });
                }).catchError(setError);
              },
            ),
            RaisedButton(
              child: Text("Complete Native Payment"),
              onPressed: () {
                StripePayment.completeNativePayRequest().then((_) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Completed successfully')));
                }).catchError(setError);
              },
            ),
            Divider(),
            Text('Current source:'),
            Text(
              JsonEncoder.withIndent('  ').convert(_source?.toJson() ?? {}),
              style: TextStyle(fontFamily: "Monospace"),
            ),
            Divider(),
            Text('Current token:'),
            Text(
              JsonEncoder.withIndent('  ').convert(_paymentToken?.toJson() ?? {}),
              style: TextStyle(fontFamily: "Monospace"),
            ),
            Divider(),
            Text('Current payment method:'),
            Text(
              JsonEncoder.withIndent('  ').convert(_paymentMethod?.toJson() ?? {}),
              style: TextStyle(fontFamily: "Monospace"),
            ),
            Divider(),
            Text('Current payment intent:'),
            Text(
              JsonEncoder.withIndent('  ').convert(_paymentIntent?.toJson() ?? {}),
              style: TextStyle(fontFamily: "Monospace"),
            ),
            Divider(),
            Text('Current error: $_error'),
          ],
        ),
    );
  }
}