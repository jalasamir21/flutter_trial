// payment_event.dart

import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectPaymentMethod extends PaymentEvent {
  final String method;

  SelectPaymentMethod(this.method);

  @override
  List<Object?> get props => [method];
}

class ProcessPayment extends PaymentEvent {
  final double amount;

  ProcessPayment(this.amount);

  @override
  List<Object?> get props => [amount];
}
