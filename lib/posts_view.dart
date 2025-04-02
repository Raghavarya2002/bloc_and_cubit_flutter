import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/nav_cubit.dart';
import 'package:untitled1/post.dart';
import 'package:untitled1/posts_cubit.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<PostsBloc>().add(LoadPostsEvent()); // Ensure posts are loaded first

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedPostState) {
            return RefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<PostsBloc>(context).add(PullToRefreshEvent()),
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.posts[index].title),
                      onTap: () {
                        // Trigger post details view
                        BlocProvider.of<NavCubit>(context).showPostDetails(state.posts[index]);
                      },
                    ),
                  );
                },
              ),
            );
          } else if (state is FailedToLoadPostsState) {
            return Center(child: Text('Error occurred: ${state.error}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

