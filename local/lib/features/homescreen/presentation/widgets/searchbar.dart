import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';

class Sbar extends StatefulWidget {
  const Sbar({super.key});

  @override
  State<Sbar> createState() => _SbarState();
}

class _SbarState extends State<Sbar> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  TextEditingController controller = TextEditingController();
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    initializeSpeech();
  }

  void initializeSpeech() async {
    bool available = await _speech.initialize();
    if (!available) {
      if (kDebugMode) {
        print('The user denied access to the microphone');
      }
    }
  }

  void startRecording() async {
    if (_speech.isListening) {
      setState(() {
        controller.text = ''; // Reset text field if already recording
      });
      return;
    }

    setState(() {
      isRecording = true;
    });

    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(
        onResult: (result) {
          setState(() {
            controller.text = result.recognizedWords;
          });
        },
        onSoundLevelChange: (level) {},
        listenOptions: SpeechListenOptions(cancelOnError: true),
      );
    }
  }

  void stopRecording() {
    if (_speech.isListening) {
      _speech.stop();
    }
    setState(() {
      isRecording = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _speech.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.07,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Color(0xFFFE3044))),
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.white,
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 6,
              ),
              child: VerticalDivider(color: Colors.white)),
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: IconButton(
                onPressed: isRecording ? stopRecording : startRecording,
                icon: Icon(isRecording ? Icons.mic_none : Icons.mic,
                    color: const Color(0xFFFE3044))),
          ),
        ],
      ),
    );
  }
}
