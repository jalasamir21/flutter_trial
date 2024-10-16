class HomeState {
  final bool isLoading;
  final List<Map<String, dynamic>> destinations;
  final String? error;

  HomeState({
    this.isLoading = false,
    this.destinations = const [],
    this.error,
  });

  HomeState copyWith({
    bool? isLoading,
    List<Map<String, dynamic>>? destinations,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      destinations: destinations ?? this.destinations,
      error: error ?? this.error,
    );
  }
}
