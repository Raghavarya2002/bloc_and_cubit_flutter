import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/post.dart';

class NavCubit extends Cubit<Post?> {
  NavCubit() : super(null);

  showPostDetails(Post post) {
    if (state != post) {
      emit(post); // Only emit when the post is different
    }
  }

  popToPosts() {
    emit(null); // Going back to the posts list
  }
}

