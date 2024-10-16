import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/bloc/payment_event.dart';
import 'package:trial/bloc/payment_state.dart';
import 'package:trial/components/user_info.dart';
import 'package:trial/components/payment_options.dart';
import 'package:trial/components/card_form.dart';
import '../bloc/payment_bloc.dart';

class PaymentMethod extends StatelessWidget {
  final String name;
  final double totalPrice;

  PaymentMethod({required this.name, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PaymentBloc(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(25, 14, 67, 1),
                Color.fromRGBO(46, 11, 75, 1),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 20.0),
                UserInfo(name: name, totalPrice: totalPrice),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Select Payment Method',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: PaymentOptions(),
                ),
                BlocBuilder<PaymentBloc, PaymentState>(
                  builder: (context, state) {
                    if (state is PaymentProcessing) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return CardForm();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<PaymentBloc>(context).add(ProcessPayment(totalPrice));
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(109, 65, 206, 1),
                            Color.fromRGBO(141, 32, 194, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Process Payment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
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
