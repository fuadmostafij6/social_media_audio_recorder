



https://user-images.githubusercontent.com/75131816/222947676-e48a8e88-4b5f-4847-ae65-3ca40145b53c.mp4



<details>
<summary>Android && Ios</summary>



1. For Permission Handle:
  
  <a href="https://pub.dev/packages/permission_handler" target="_blank">Follow this</a>
  
  

2. For Record Permission:
  
  <a href="https://pub.dev/packages/record" target="_blank">Follow this</a>
  
  
3. For Vibrate Permission:
  
  <a href="https://pub.dev/packages/flutter_vibrate" target="_blank">Follow this</a>


</details>

## Usage

### For init path

```dart
import 'package:social_media_audio_recorder/social_media_audio_recorder.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SocialMediaFilePath.init();

  runApp(const MyApp());
}

```

### User RecordButton


```dart
import 'package:social_media_audio_recorder/social_media_audio_recorder.dart';


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

```


