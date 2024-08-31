import 'package:get/get.dart';

import '../models/post.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  RxBool isLoading = true.obs;
  var postList = <Post>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchPosts();
      if (posts != null) {
        postList.assignAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
}
