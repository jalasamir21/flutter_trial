import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Enter your card details',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10.0),
          // Card Number Field
          TextField(
            controller: cardNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Card Number',
              labelStyle: const TextStyle(color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade700),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10.0),
          // Expiry Date and CVV Fields
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: expiryDateController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'MM/YY',
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple.shade700),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: TextField(
                  controller: cvvController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple.shade700),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          // Card Holder Name Field
          TextField(
            controller: cardHolderNameController,
            decoration: InputDecoration(
              labelText: 'Card Holder Name',
              labelStyle: const TextStyle(color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade700),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20.0),
          // Button to submit card details
          ElevatedButton(
            onPressed: () {
              // Here you can add functionality to validate and process the input
              final cardNumber = cardNumberController.text;
              final expiryDate = expiryDateController.text;
              final cvv = cvvController.text;
              final cardHolderName = cardHolderNameController.text;

              // Example validation check (you can improve this)
              if (cardNumber.isEmpty ||
                  expiryDate.isEmpty ||
                  cvv.isEmpty ||
                  cardHolderName.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill in all fields')),
                );
              } else {
                // Here you can call the payment processing function
                print('Card Number: $cardNumber');
                print('Expiry Date: $expiryDate');
                print('CVV: $cvv');
                print('Card Holder Name: $cardHolderName');

                // Add your payment processing logic here
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text('Submit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
