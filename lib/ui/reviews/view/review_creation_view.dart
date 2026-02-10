import 'package:cinetrace/ui/core/connection_error.dart';
import 'package:cinetrace/ui/movie/view_model/movie_view_model.dart';
import 'package:cinetrace/ui/reviews/view_model/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReviewCreationView extends ConsumerStatefulWidget {
  const ReviewCreationView({super.key, required this.movieId});
  final String? movieId;

  @override
  ConsumerState<ReviewCreationView> createState() => _ReviewCreationViewState();
}

class _ReviewCreationViewState extends ConsumerState<ReviewCreationView> {
  final _formKey = GlobalKey<FormState>();
  final _reviewTextController = TextEditingController();
  int _rating = 5;

  @override
  Widget build(BuildContext context) {
    final movieId = int.parse(widget.movieId!);
    final movie = ref.watch(movieViewModelProvider(movieId));

    return Scaffold(
      appBar: AppBar(
        title: Text("Write your review"),
        leading: IconButton(
          onPressed: () => goBack(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: movie.when(
          data: (data) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Your review',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextFormField(
                      maxLines: 8,
                      maxLength: 500,
                      controller: _reviewTextController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return ref.read(reviewViewModelProvider(movieId).notifier)
                          .validateReview(value, 'Minimum of 10 characters.');
                      }
                    ),
                    Text(
                      'Give your rating',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return IconButton(
                          onPressed: () => {
                            setState(() {
                              _rating = index + 1;
                            }),
                          }, 
                          icon: _rating >= (index + 1) ? Icon(Icons.star) : Icon(Icons.star_border)
                        );
                      }),
                    ),
                    SizedBox(height: 20,),
                    Text('You\'re creating a review for the movie ${data.title}. Your review is public and can be viewed by anyone.'),
                  ],
                ),
              ),
            );
          }, 
          error: (error, stack) => ConnectionError(errorMessage: error.toString()), 
          loading: () => Center(child: CircularProgressIndicator(),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(!_formKey.currentState!.validate()) return;
        },
        child: Icon(Icons.create),
      ),
    );
  }

  void goBack(BuildContext context) {
    if(context.canPop()) {
      return context.pop();
    }

    context.go('/');
  }
}