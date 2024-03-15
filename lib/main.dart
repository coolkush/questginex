import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/auth/design/welcomscreen.dart';
import 'package:questginix/firebase_options.dart';

import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginCubit())],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            builder: (context, child) {
              return MediaQuery(
                child: child!,
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(0.80)),
              );
            },
            title: 'Questginix',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const WelcomScreen(),
          );
        },
      ),
    ); /*  MaterialApp(
      title: 'Questginix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomScreen(),
    ); */
  }
}
