import 'package:apiwithcubit/cubit/posts_cubit.dart';
import 'package:apiwithcubit/repository/api_repository.dart';
import 'package:apiwithcubit/screens/home_page.dart';
import 'package:apiwithcubit/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsCubit>(
          create: (cotext) => PostsCubit(
            apiRepository: ApiRepository(apiService: apiService),
          )..fetchPostsList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
