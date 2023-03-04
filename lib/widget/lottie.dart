



import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LottieAnimation extends StatefulWidget {
  const LottieAnimation({Key? key}) : super(key: key);

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.network(
        'https://raw.githubusercontent.com/fuadmostafij6/social_media_audio_recorder/main/assets/dustbin_grey.json',
        controller: controller,
        onLoaded: (composition) {
          controller!
            ..duration = composition.duration
            ..forward();
          debugPrint("Lottie Duration: ${composition.duration}");
        },
        height: 40,
        width: 40,
      ),
    );
  }
}