import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
    required this.name,
    required this.imagePhoto,
  });
  final String name;
  final String imagePhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('details'),
      ),
      body: Column(
        children: [
          Text(name),
          Image.network(imagePhoto),
        ],
      ),
    );
  }
}
