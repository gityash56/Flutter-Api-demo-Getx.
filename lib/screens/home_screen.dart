import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/post_controller.dart';

class HomeScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX API Integration'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: postController.postList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  postController.postList[index].id.toString(),
                ),
                title: Text(
                  postController.postList[index].title,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(postController.postList[index].body),
                trailing: Icon(Icons.delete),
                // leading: Icon(Icons.person),
              );
            },
          );
        }
      }),
    );
  }
}
