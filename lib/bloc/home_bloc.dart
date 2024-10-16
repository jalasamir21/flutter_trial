import 'dart:convert'; // Import for JSON encoding and decoding
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'home_event.dart'; // Import HomeEvent
import 'home_state.dart';  // Import HomeState

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadDestinationsEvent) {
      yield state.copyWith(isLoading: true); // Start loading
      try {
        final destinations = await _fetchDestinations(); // Fetching destinations from an API
        yield state.copyWith(destinations: destinations, isLoading: false); // Update state with destinations
      } catch (e) {
        yield state.copyWith(error: 'Failed to load destinations', isLoading: false); // Update state with error
      }
    }
  }

  Future<List<Map<String, dynamic>>> _fetchDestinations() async {
    final response = await http.get(Uri.parse(
      'https://api.unsplash.com/search/photos?query=travel&client_id=YOUR_UNSPLASH_ACCESS_KEY',
    )); // Replace with your Unsplash access key

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Map<String, dynamic>> destinations = [];

      for (var result in data['results']) {
        destinations.add({
          'name': result['description'] ?? result['alt_description'] ?? 'No description',
          'image': result['urls']['regular'],
          'rating': (result['user']['total_likes'] / 100).toDouble(), // Sample rating logic
          'reviewCount': result['user']['total_photos'] ?? 0 // Sample review count logic
        });
      }
      return destinations;
    } else {
      throw Exception('Failed to load destinations');
    }
  }
}
