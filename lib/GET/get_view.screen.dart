import 'package:flutter/material.dart';
import 'package:flutter_bloc_mgt/GET/api_controller.dart';
import 'package:get/get.dart';

class GetxViewScreen extends StatefulWidget {
  const GetxViewScreen({super.key});

  @override
  State<GetxViewScreen> createState() => _GetxViewScreenState();
}

class _GetxViewScreenState extends State<GetxViewScreen> {
  final controller = Get.put(APIController());

  @override
  void initState() {
    super.initState();

    controller.getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<APIController>(
        init: Get.put(APIController(),),
        builder: (context) {
          return Obx(() => controller.isLoading.value == true ? const Center(child: CircularProgressIndicator()) : 
          ListView.builder(
//        physics: NeverScrollableScrollPhysics(),
            itemCount: controller.getUser.value.length,
            itemBuilder: (_, index) {
              var itemData = controller.getUser.value[index];
              debugPrint("userList :: $itemData");
              
              return Padding(
                padding:const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Card(
                    color: Colors.blueGrey.shade300,
                    child: ListTile(
                        title: Text(
                          '${itemData['first_name']}  ${itemData['last_name']}',
                          style: const TextStyle(color: Colors.white),
                        ),

                        subtitle: Text(
                          '${itemData["email"]}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              itemData['avatar'].toString()),
                        ))),
              );
            }));
        }
      ),
    );
  }
}