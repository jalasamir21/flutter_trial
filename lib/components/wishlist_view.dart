// wishlist_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/bloc/wishlist_state.dart';
import '../bloc/wishlist_bloc.dart'; // Import the WishlistBloc
import 'place_card.dart'; // Import PlaceCard

class WishlistView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text(state.error!));
        } else {
          return ListView.builder(
            itemCount: (state.favoritePlaces.length / 2).ceil(),
            itemBuilder: (context, rowIndex) {
              return _buildRow(state.favoritePlaces, rowIndex);
            },
          );
        }
      },
    );
  }

  Widget _buildRow(List<Map<String, String>> favoritePlaces, int rowIndex) {
    int firstIndex = rowIndex * 2;
    int secondIndex = firstIndex + 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: PlaceCard(place: favoritePlaces[firstIndex])),
        if (secondIndex < favoritePlaces.length)
          Expanded(child: PlaceCard(place: favoritePlaces[secondIndex])),
      ],
    );
  }
}
