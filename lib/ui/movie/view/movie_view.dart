import 'package:cinetrace/ui/core/connection_error.dart';
import 'package:cinetrace/ui/movie/view_model/movie_view_model.dart';
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
            return Center(
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