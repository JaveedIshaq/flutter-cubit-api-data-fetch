import 'package:apiwithcubit/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try {
      final Response? response = await _dio.get('$baseUrl$posts');
      return response;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
