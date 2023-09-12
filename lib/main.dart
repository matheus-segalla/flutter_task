// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app_task/screens/HomeScreen.dart';
// import 'package:flutter_app_task/screens/ProductListScreen.dart';
// import 'package:flutter_app_task/screens/ProfileScreen.dart';
// import 'package:flutter_app_task/screens/RegisterScreen.dart';
//
// import 'services/auth.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Firebase Auth',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return HomeScreen();
//           } else {
//             return const AuthScreen();
//           }
//         },
//       ),
//     );
//   }
// }
//
// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});
//
//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }
//
// class _AuthScreenState extends State<AuthScreen> {
//
//
//   final bool _isLogin = false;
//   bool _loading = false;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   handleSubmit() async {
//     if (!_formKey.currentState!.validate()) return;
//     final email = _emailController.value.text;
//     final password = _passwordController.value.text;
//
//     setState(() => _loading = true);
//
//     //Check if is login or register
//     if (_isLogin) {
//       await Auth().signInWithEmailAndPassword(email, password);
//     } else {
//       await Auth().registerWithEmailAndPassword(email, password);
//     }
//
//     setState(() => _loading = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             //Add form to key to the Form Widget
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Entrar",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   //Assign controller
//                   controller: _emailController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Coloque um email válido';
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Email',
//                     focusColor: Colors.black,
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   //Assign controller
//                   controller: _passwordController,
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Password',
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                   ),
//                   onPressed: () => handleSubmit(),
//                   child: _loading
//                       ? const SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                       strokeWidth: 2,
//                     ),
//                   )
//                       : Text(_isLogin ? 'Login' : 'Entrar'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navegar para a Tela2 quando o botão é pressionado
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => RegisterScreen()),
//                     );
//                   },
//                   child: Text('Registrar'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:flutter_app_task/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'FirebaseOptions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}