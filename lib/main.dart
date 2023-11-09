import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mgt/GET/api_controller.dart';
import 'package:flutter_bloc_mgt/Provider/user_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

import 'GET/get_view.screen.dart';
import 'Provider/provider_view.dart';
import 'dahboard.dart';
bool? isChange; // null => bloc // true => Provider // false => Riverpod  
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const CustomFirstWidget(),
    );
  }
}

class CustomFirstWidget extends StatefulWidget {
  const CustomFirstWidget({super.key});

  @override
  State<CustomFirstWidget> createState() => _CustomFirstWidgetState();
}

class _CustomFirstWidgetState extends State<CustomFirstWidget> {
  @override
  Widget build(BuildContext context) {
     if (isChange == null) {
       return const HomePage();
     } else if (isChange == true) {
       return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> UserProvider())
        ],
        child: const UserProviderViewScreen());
     } else {
        return const GetxViewScreen();
     }
  }
}

