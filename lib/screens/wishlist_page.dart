import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/bloc/wishlist_event.dart';
import 'package:trial/components/wishlist_view.dart';
import '../components/bottom_nav_bar.dart'; // Import BottomNavBar
import '../bloc/wishlist_bloc.dart'; // Import WishlistBloc
import '../components/gradient_color.dart'; // Import GradientColor

class WishlistPage extends GradientColor { 
  //  WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistBloc()..add(LoadWishlistEvent()), // Load wishlist when page is built
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
          backgroundColor: const Color.fromRGBO(109, 65, 206, 1),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: WishlistView(), // Use WishlistView
        ),
        bottomNavigationBar: const BottomNavBar(name: 'Aya', email: 'asdad@dssd', phone: 'xssd'),
      ),
    );
  }
}
