import 'package:cinetrace/domain/entities/review_entity.dart';
import 'package:flutter/material.dart';

class ReviewTileView extends StatelessWidget {
  const ReviewTileView({
    super.key,
    required this.reviewEntity,
  });

  final ReviewEntity reviewEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(reviewEntity.author),
      subtitle: Text(reviewEntity.content),
    );
  }
}