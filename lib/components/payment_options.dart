import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/bloc/payment_event.dart';
import '../bloc/payment_bloc.dart';

class PaymentOptions extends StatefulWidget {
  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  String _selectedPaymentMethod = 'Credit Card';
  final List<String> _paymentMethods = ['Credit Card', 'PayPal', 'Google Pay', 'Apple Pay'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _paymentMethods.map((method) => _buildPaymentOption(method)).toList(),
    );
  }

  Widget _buildPaymentOption(String method) {
    bool isSelected = _selectedPaymentMethod == method;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.purple.shade700 : Colors.purple.shade300,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: RadioListTile<String>(
          activeColor: Colors.purple.shade700,
          title: Text(
            method,
            style: const TextStyle(color: Colors.white),
          ),
          value: method,
          groupValue: _selectedPaymentMethod,
          onChanged: (String? value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
            // Update the selected method in BLoC
            BlocProvider.of<PaymentBloc>(context).add(SelectPaymentMethod(value!));
          },
        ),
      ),
    );
  }
}
