import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  final String name; // Name from DetailBookingPage
  final double totalPrice; // Total price per person

  PaymentMethod({required this.name, required this.totalPrice});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String _selectedPaymentMethod = 'Credit Card'; // Default selected method
  final List<String> _paymentMethods = ['Credit Card', 'PayPal', 'Google Pay', 'Apple Pay'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradient background
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
              // Back Icon
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              // User details: Image, Name, and Total Price inside a Container with shadow and gradient
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(109, 65, 206, 1),
                        Color.fromRGBO(141, 32, 194, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Circle Avatar (Image of person)
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/person.jpg'), // Add image here
                      ),
                      const SizedBox(width: 20.0),
                      // Name and Total Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name, // Dynamic name passed from booking form
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Total: \$${widget.totalPrice.toStringAsFixed(2)} per person',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // Payment Method section
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
                child: ListView(
                  children: _paymentMethods.map((method) => _buildPaymentOption(method)).toList(),
                ),
              ),
              // Show card form if Credit Card is selected
              if (_selectedPaymentMethod == 'Credit Card') _buildCardForm(),
              // Process Payment button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    _showPaymentDialog(context);
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
    );
  }

  // Widget to build each payment option as a Radio button with a border and darker when selected
  Widget _buildPaymentOption(String method) {
    bool isSelected = _selectedPaymentMethod == method;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Colors.purple.shade700 // Darker border when selected
                : Colors.purple.shade300, // Lighter border when not selected
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
          },
        ),
      ),
    );
  }

  // Payment Card Form
  Widget _buildCardForm() {
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
          TextField(
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
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
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
          TextField(
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
        ],
      ),
    );
  }

  // Show confirmation dialog
  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
                    backgroundColor: const Color.fromRGBO(46, 11, 75, 1),
          title: const Text(
            'Payment Confirmation',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Proceed with payment for \$${widget.totalPrice.toStringAsFixed(2)}?',
            style: const TextStyle(color: Colors.white70),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle payment action here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment Successful')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

