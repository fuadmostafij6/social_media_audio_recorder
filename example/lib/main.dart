import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_media_audio_recorder/social_media_audio_recorder.dart';
import 'package:voice_message_package/voice_message_package.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SocialMediaFilePath.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool play = false;
  String filepath = "";

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            filepath != ""
                ? Expanded(
                  child: Column(
                    children: [
                      VoiceMessage(
                        audioSrc: filepath,
                        me: true,
                      ),
                    ],
                  ),
                )
                :
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                RecordButton(
                  color: Colors.white,
                  controller: controller!,
                  onRecordEnd: (String value) {
                    setState(() {

                      filepath = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
