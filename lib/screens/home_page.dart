import 'package:apiwithcubit/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Api Fetch with Cubit'),
        ),
        body: Center(
          child: BlocBuilder<PostsCubit, PostsState>(
            builder: (context, state) {
              if (state is PostsLoading) {
                return const CircularProgressIndicator();
              } else if (state is PostsError) {
                return Text(state.postsError);
              } else if (state is PostsLoaded) {
                return state.postList.isEmpty
                    ? const Text('No any Post')
                    : ListView.builder(
                        itemCount: state.postList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text('${state.postList[index].id}'),
                            ),
                            title: Text('${state.postList[index].title}'),
                            subtitle: Text('${state.postList[index].body}'),
                          );
                        });
              }
              return const SizedBox.shrink();
            },
          ),
        ));
  }
}
