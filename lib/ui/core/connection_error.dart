import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.error, size: 64,),
        Text('An error occurred!', style: TextStyle(fontSize: 32),),
        Text(errorMessage, textAlign: TextAlign.center, style: TextStyle(),),
      ],
    );
  }
}