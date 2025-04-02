import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/data_service.dart';
import 'package:untitled1/post.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]); // for initializing empty array of posts

  void getPosts() async => emit(
    await _dataService.getPosts(),
  ); // we'll wait for response and we're going to emit that to our state
}

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

class LoadingPostsState extends PostsState {}

class LoadedPostState extends PostsState {
  List<Post> posts;

  LoadedPostState({required this.posts});
}

class FailedToLoadPostsState extends PostsState {
  String  error;

  FailedToLoadPostsState({required this.error});
}

abstract class PostsState {}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingPostsState()) {
    on<LoadPostsEvent>(_onLoadPostsEvent);
    on<PullToRefreshEvent>(_onLoadPostsEvent);
  }

  // Define the event handler
  Future<void> _onLoadPostsEvent(
      PostsEvent event,
      Emitter<PostsState> emit,
      ) async {
    emit(LoadingPostsState());
    try {
      final posts = await _dataService.getPosts();
      emit(LoadedPostState(posts: posts));
    } catch (e) {
      emit(FailedToLoadPostsState(error: e.toString()));
    }
  }
}

