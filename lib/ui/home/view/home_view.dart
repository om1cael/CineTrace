import 'package:cinetrace/ui/core/connection_error.dart';
import 'package:cinetrace/ui/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CineTrace'),),
      body: SafeArea(
        minimum: EdgeInsets.all(12.0),
        child: Consumer(
          builder: (context, ref, _) {
            final movieState = ref.watch(homeViewModelAsyncProvider);
        
            return movieState.when(
              data: (movies) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                itemCount: movies.length,
                itemBuilder: (_, id) {
                  final movie = movies[id];
        
                  return InkWell(
                    onTap: () => context.go('/movies/${movie.id}'),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              movie.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: Text(
                                movie.overview,
                                maxLines: 4,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              movie.releaseDate.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
              error: (error, stack) => Column(
                mainAxisAlignment: .center,
                children: [
                  ConnectionError(
                    errorMessage: error.toString(),
                  ),
                ],
              ),
              loading: () => Center(child: CircularProgressIndicator()),
            );
          }
        ),
      ),
    );
  }
}