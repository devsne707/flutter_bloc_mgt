// import 'package:flutter/material.dart';
// import 'package:flutter_bloc_mgt/Riverpod/logger.dart';
// import 'package:flutter_bloc_mgt/Riverpod/riverpod_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class RiverpodViewScreen extends StatefulWidget {
//   const RiverpodViewScreen({super.key});

//   @override
//   State<RiverpodViewScreen> createState() => _RiverpodViewScreenState();
// }

// class _RiverpodViewScreenState extends State<RiverpodViewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ProviderScope(
//         observers: [Logger()],
//         child: Consumer(
//           builder: (context, watch, child) {
//             final state = watch;

//             return state.m
//         },
//         )
//       ),
//     );
//   }
// }