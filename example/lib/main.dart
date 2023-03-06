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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

  String filepath = "";
  bool readOnly = false;
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
                : Expanded(child: Container()),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          readOnly: readOnly,
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
                  color: Colors.black,
                  allTextColor: Colors.white,
                  controller: controller!,
                  arrowColor: Colors.white,
                  onRecordEnd: (String value) {
                    setState(() {
                      filepath = value;
                      readOnly = false;
                    });
                  },
                  onRecordStart: () {
                    setState(() {
                      readOnly = true;
                    });
                  },
                  onCancelRecord: () {
                    setState(() {
                      readOnly = false;
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
