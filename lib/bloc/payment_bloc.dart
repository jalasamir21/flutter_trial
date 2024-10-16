// payment_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_event.dart';
import 'payment_state.dart';
import 'package:trial/services/api_service.dart'; // Assuming you have an API service to handle payments

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is SelectPaymentMethod) {
      // Handle selection of payment method if needed
      // This can be extended to save the selected method
    } else if (event is ProcessPayment) {
      yield PaymentProcessing(); // Emit processing state

      try {
        // Call your API service here
        await ApiService.processPayment(event.amount);
        yield PaymentSuccess(); // Emit success state
      } catch (e) {
        yield PaymentFailure(e.toString()); // Emit failure state
      }
    }
  }
}
