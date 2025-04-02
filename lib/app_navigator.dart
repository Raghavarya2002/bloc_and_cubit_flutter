import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/nav_cubit.dart';
import 'package:untitled1/post.dart';
import 'package:untitled1/post_details_view.dart';
import 'package:untitled1/posts_view.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(
      builder: (context, post) {
        // Initial state handling: Prevent first blinking issue
        if (post == null) {
          return Navigator(
            pages: [
              MaterialPage(child: PostView()), // Default page is the PostView
            ],
            onPopPage: (route, result) {
              BlocProvider.of<NavCubit>(context).popToPosts();
              return route.didPop(result);
            },
          );
        }

        return Navigator(
          pages: [
            MaterialPage(child: PostView()), // Default page is the PostView
            MaterialPage(child: PostDetailsView(post: post)), // Show details when post is selected
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavCubit>(context).popToPosts();
            return route.didPop(result);
          },
        );
      },
    );
  }
}


