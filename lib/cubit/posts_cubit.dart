import 'package:apiwithcubit/models/post_model.dart';
import 'package:apiwithcubit/repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required this.apiRepository}) : super(PostsInitial());

  final ApiRepository apiRepository;

  Future<void> fetchPostsList() async {
    emit(PostsLoading());

    try {
      final List<PostModel>? postList = await apiRepository.getPostList();

      emit(PostsLoaded(postList: postList ?? []));
    } on Exception catch (e) {
      emit(PostsError(postsError: e.toString()));
    }
  }
}
