part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostModel> postList;

  const PostsLoaded({required this.postList});

  @override
  List<Object> get props => [postList];
}

class PostsError extends PostsState {
  final String postsError;

  const PostsError({required this.postsError});

  @override
  List<Object> get props => [postsError];
}
