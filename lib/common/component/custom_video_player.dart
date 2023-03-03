import 'dart:async';

import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPalyer extends StatefulWidget {
  VideoPlayerController controller;

  CustomVideoPalyer({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPalyer> createState() => _CustomVideoPalyerState();
}

class _CustomVideoPalyerState extends State<CustomVideoPalyer>{
  late Future<void> _initializeVideoPlayerFuture;
  late Duration currentPosition;
  bool isFullScreen = false;
  bool controllerVisible = false;
  late Timer _timer = Timer(const Duration(seconds: 3), () {
    controllerVisible = false;
  });

  @override
  void initState() {
    _initializeVideoPlayerFuture = widget.controller.initialize();
    widget.controller.setLooping(true);

    currentPosition = const Duration();
    widget.controller!.addListener(() {
      final currentPosition = widget.controller!.value.position;

      setState(() {
        this.currentPosition = currentPosition;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        autoVideoPlay();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // VideoPlayerController가 초기화를 진행하는 동안 로딩 스피너를 보여주기 위해
      // FutureBuilder를 사용합니다.
      body: Container(
        color: GRAY090,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // 만약 VideoPlayerController 초기화가 끝나면, 제공된 데이터를 사용하여
              // VideoPlayer의 종횡비를 제한하세요.
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      controllerVisible = !controllerVisible;
                      if (controllerVisible) onTapTimer();
                    },
                  );
                },
                child: Stack(
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: widget.controller.value.aspectRatio,
                        // 영상을 보여주기 위해 VideoPlayer 위젯을 사용합니다.
                        child: VideoPlayer(widget.controller),
                      ),
                    ),
                    if (controllerVisible) playButtons(),
                    if (controllerVisible)
                    Positioned(
                      bottom: MediaQuery.of(context).orientation == Orientation.portrait ? 20.0 : 30.0,
                      right: 10.0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FullScreen(),
                      ),
                    ),
                    if (controllerVisible)
                      Positioned(
                        bottom: MediaQuery.of(context).orientation == Orientation.portrait ? 0 : 10.0,
                        child: BottomSlider(),
                      ),
                  ],
                ),
              );
            } else {
              // 만약 VideoPlayerController가 여전히 초기화 중이라면,
              // 로딩 스피너를 보여줍니다.
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void autoVideoPlay() {
    widget.controller.play();
  }

  void onTapTimer() {
    _timer.cancel();

    if (controllerVisible) {
      _timer = Timer(const Duration(seconds: 3), () {
        controllerVisible = false;
      });
    }
  }

  Container playButtons() {
    return Container(
      height: 203 * getScaleWidth_Max(context),
      color: OP50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(
                () {
                  final currentPosition = widget.controller!.value.position;

                  Duration position = const Duration();

                  if (currentPosition.inSeconds > 10) {
                    position = currentPosition - const Duration(seconds: 10);
                  }
                  widget.controller!.seekTo(position);

                  onTapTimer();
                },
              );
            },
            child: Icon(
              Icons.replay_10,
              color: WHITE,
              size: 40.0 * getScaleWidth(context),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  // 영상이 재생 중이라면, 일시 중지 시킵니다.
                  if (widget.controller.value.isPlaying) {
                    widget.controller.pause();
                  } else {
                    // 만약 영상이 일시 중지 상태였다면, 재생합니다.
                    widget.controller.play();
                  }
                  onTapTimer();
                },
              );
            },
            child: Icon(
              widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: WHITE,
              size: 50.0 * getScaleWidth(context),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  final maxPosition = widget.controller!.value.duration;
                  final currentPosition = widget.controller!.value.position;

                  Duration position = maxPosition;

                  if ((maxPosition - const Duration(seconds: 10)).inSeconds >
                      currentPosition.inSeconds) {
                    position = currentPosition + const Duration(seconds: 10);
                  }
                  widget.controller!.seekTo(position);
                  onTapTimer();
                },
              );
            },
            child: Icon(
              Icons.forward_10,
              color: WHITE,
              size: 40.0 * getScaleWidth(context),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox BottomSlider() {
    return SizedBox(
      height: 4.0,
      child: Row(
        children: [
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 5.0,
              valueIndicatorColor: MAIN_COLOR_IMPACT,
              valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
              overlayShape: SliderComponentShape.noThumb,
              trackShape: CustomTrackShape(),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5.5),
              thumbColor: MAIN_COLOR_IMPACT,
              activeTrackColor: MAIN_COLOR,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Slider(
                //activeColor: MAIN_COLOR,
                inactiveColor: WHITE.withOpacity(0.5),
                max: widget.controller!.value.duration.inSeconds.toDouble(),
                min: 0,
                divisions: widget.controller!.value.duration.inSeconds.toInt(),
                value: currentPosition.inSeconds.toDouble(),
                label:
                    '${currentPosition.inMinutes.toString().padLeft(2, '0')} : ${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                onChanged: (double value) {
                  currentPosition = Duration(seconds: value.toInt());
                  widget.controller!.seekTo(
                    Duration(
                      seconds: value.toInt(),
                    ),
                  );
                  onTapTimer();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector FullScreen(){
    return GestureDetector(
      onTap: () {
        isFullScreen = !isFullScreen;
        if (isFullScreen) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight
          ]);
          SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.immersiveSticky);
        } else {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitDown,
            DeviceOrientation.portraitUp
          ]);

          SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.edgeToEdge);
        }
      },
      child: SizedBox(
        height: 15.0,
        child: Icon(
          isFullScreen
              ? Icons.fullscreen_exit
              : Icons.fullscreen,
          color: WHITE,
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
