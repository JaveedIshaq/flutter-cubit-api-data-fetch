import 'package:apiwithcubit/models/post_model.dart';
import 'package:apiwithcubit/service/api_service.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository({required this.apiService});

  Future<List<PostModel>?> getPostList() async {
    final response = await apiService.getPostData();

    if (response != null) {
      final data = response.data as List<dynamic>;

      return data.map((singlePost) => PostModel.fromMap(singlePost)).toList();
    }
  }
}
