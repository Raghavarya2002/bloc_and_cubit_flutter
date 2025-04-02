import 'package:flutter/material.dart';


import 'package:untitled1/post.dart';

class PostDetailsView extends StatelessWidget {
   PostDetailsView({Key? key, required this.post}): super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Text(post.body),
      ),
    );
  }
}
