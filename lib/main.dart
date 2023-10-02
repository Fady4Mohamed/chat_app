import 'package:chat/authCubit/auth_cubit_cubit.dart';
import 'package:chat/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(chatapp());
}

class chatapp extends StatelessWidget {
  chatapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => loginCubitCubit(),
        ),
      ],
      child: MaterialApp(home: loginpage()),
    );
  }
}
