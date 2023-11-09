import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mgt/Provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserProviderViewScreen extends StatefulWidget {
  const UserProviderViewScreen({super.key});

  @override
  State<UserProviderViewScreen> createState() => _UserProviderViewScreenState();
}

class _UserProviderViewScreenState extends State<UserProviderViewScreen> {

  @override
  void initState() {
    Provider.of<UserProvider>(context,listen: false).getUserAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  var providerData = context.watch<UserProvider>();
    return Scaffold(
      body: ListView.builder(
//        physics: NeverScrollableScrollPhysics(),
        itemCount: providerData.getUserList.length,
        itemBuilder: (_, index) {
          var itemData = providerData.getUserList[index];
          debugPrint("userList :: $itemData");
          
          return Padding(
            padding:const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Card(
                color: Theme.of(context).primaryColor,
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
        }),
    );
  }
}