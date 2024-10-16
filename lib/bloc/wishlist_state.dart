// wishlist_state.dart

class WishlistState {
  final List<Map<String, String>> favoritePlaces;
  final bool isLoading;
  final String? error;

  WishlistState({
    this.favoritePlaces = const [],
    this.isLoading = false,
    this.error,
  });
}
