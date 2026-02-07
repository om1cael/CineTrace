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
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      isThreeLine: true,
      title: Text(reviewEntity.author),
      subtitle: Column(
        children: [
          Text(reviewEntity.content),
          SizedBox(height: 4,),
          Row(
            children: List.generate(5, (index) {
              return reviewEntity.stars > index ? Icon(Icons.star) : Icon(Icons.star_border);
            }),
          )
        ],
      )
    );
  }
}