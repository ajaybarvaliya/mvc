import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/post_controller.dart';

class PostAPiHomeScreen extends StatefulWidget {
  const PostAPiHomeScreen({super.key});

  @override
  State<PostAPiHomeScreen> createState() => _PostAPiHomeScreenState();
}

class _PostAPiHomeScreenState extends State<PostAPiHomeScreen> {
  TextEditingController addcontroller = TextEditingController();

  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PostController>(
        builder: (controller) {
          return postController.hasherror
              ? Text("Error")
              : postController.Loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          TextField(
                            controller: addcontroller,
                            decoration: InputDecoration(
                              labelText: "Title add",
                              constraints: BoxConstraints(maxWidth: 300),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                postController.login(addcontroller.text);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("success"),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              color: Colors.brown,
                              child: Center(
                                child: Text("Add",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
