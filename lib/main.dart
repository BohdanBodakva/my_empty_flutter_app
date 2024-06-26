import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flashlight_plugin/my_flashlight_plugin.dart';
import 'package:some_app/bloc/flash_bloc/flash_cubit.dart';
import 'package:some_app/bloc/flash_bloc/flash_state.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => FlashCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<FlashCubit, FlashState>(
              builder: (context, state) {
                void turnFlashlight(){
                  if(state.isFlashTurnedOn){
                    MyFlashlightPlugin.turnFlashlightOff();
                  } else {
                    MyFlashlightPlugin.turnFlashlightOn();
                  }
                  context.read<FlashCubit>().changeFlashState();
                }

                return  FloatingActionButton(
                  onPressed: turnFlashlight,
                  child: state.isFlashTurnedOn ? 
                    const Icon(Icons.flash_on) : 
                    const Icon(Icons.flash_off),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Flashlight',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
