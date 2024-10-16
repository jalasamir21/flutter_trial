// wishlist_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState());

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is LoadWishlistEvent) {
      yield WishlistState(isLoading: true);
      try {
        final places = await _fetchFavoritePlaces(); // Fetching places from an API
        yield WishlistState(favoritePlaces: places);
      } catch (e) {
        yield WishlistState(error: 'Failed to load wishlist');
      }
    }
  }

  Future<List<Map<String, String>>> _fetchFavoritePlaces() async {
    // Simulating API call (replace with a real API call)
    await Future.delayed(const Duration(seconds: 2));
    return [
      {
        'name': 'Paris',
        'description': 'The city of light with Eiffel Tower and rich culture.',
        'image': 'assets/images/paris.jpg',
      },
      {
        'name': 'Bali',
        'description': 'A beautiful island in Indonesia known for its temples and beaches.',
        'image': 'assets/images/bali.jpg',
      },
      {
        'name': 'Tokyo',
        'description': 'A vibrant city blending modern and traditional Japan.',
        'image': 'assets/images/tokyo.jpg',
      },
      {
        'name': 'New York',
        'description': 'The city that never sleeps, filled with iconic landmarks.',
        'image': 'assets/images/new_york.jpg',
      },
    ];
  }
}
