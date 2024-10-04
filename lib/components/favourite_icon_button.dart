import 'package:flutter/material.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({Key? key}) : super(key: key);

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {return IconButton(
    icon: Icon(
      _isFavorited ? Icons.favorite : Icons.favorite_outline_outlined,

      color: _isFavorited ? Colors.purple : null,
    ),
    onPressed: () {
      setState(() {
        _isFavorited = !_isFavorited;
      });
    },
  );
  }
}