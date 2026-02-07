import 'package:cinetrace/ui/core/connection_error.dart';
import 'package:cinetrace/ui/movie/view_model/movie_view_model.dart';
import 'package:cinetrace/ui/reviews/view/review_tile_view.dart';
import 'package:cinetrace/ui/reviews/view_model/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MovieView extends ConsumerWidget {
  const MovieView({
    super.key,
    required this.movieId,
  });

  final String? movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(movieViewModelProvider(int.parse(movieId!)));
    final reviews = ref.watch(reviewViewModelProvider(int.parse(movieId!)));

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie'),
        leading: IconButton(
          onPressed: () => context.go('/'), 
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: movie.when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(data.title, style: TextStyle(fontSize: 24, fontWeight: .bold),),
                  Text(data.overview, textAlign: .center,),
                  SizedBox(height: 16.0,),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text('Released ${data.releaseDate.toString()}')
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Column(
                    children: [
                      reviews.when(
                        data: (data) {
                          if(data.isEmpty) {
                            return Column(
                              children: [
                                SizedBox(height: 32,),
                                Text(
                                  'No reviews yet :(\nTap the plus icon to write the first one!',
                                  textAlign: .center,
                                ),
                              ],
                            );
                          }

                          return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, id) {
                              final review = data[id];

                              return ReviewTileView(reviewEntity: review);
                            }, 
                            separatorBuilder: (_, _) => Divider(), 
                            itemCount: data.length
                          );
                        }, 
                        error: (error, stack) => ConnectionError(errorMessage: error.toString()), 
                        loading: () => Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          error: (error, stack) => Column(
            children: [
              ConnectionError(errorMessage: error.toString()),
            ],
          ),
          loading: () => Center(child: CircularProgressIndicator()),
        )
      )
    );
  }
}