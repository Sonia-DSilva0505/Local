import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  TextEditingController controller = TextEditingController();
  bool isRecording = false;
  List<ChatUser> typing = [];
  ChatUser myself = ChatUser(id: "1", firstName: "Aryan");
  ChatUser bot = ChatUser(id: "2", firstName: "Lia");

  final url ="";

  final header = {
    'Content-Type': 'application/json',
  };

  List<ChatMessage> allMessages = [];

  @override
  void initState() {
    super.initState();
    initializeSpeech();
    _initializeChat();
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

  void _initializeChat() {
    // Initial message 2
    ChatMessage initialMessage2 = ChatMessage(
      text: "Hi Mike, I'm Lia, Local’s Interactive Assistant. ",
      user: bot,
      createdAt: DateTime.now(),
    );

    // Initial message 1
    ChatMessage initialMessage1 = ChatMessage(
      text: "What can I plan for you today?",
      user: bot,
      createdAt: DateTime.now(),
    );

    // Add initial messages to the chat
    allMessages.insert(0, initialMessage2);
    allMessages.insert(0, initialMessage1);
  }

  getData(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };
    await http
        .post(Uri.parse(url), headers: header, body: jsonEncode(data))
        .then(
      (value) {
        if (value.statusCode == 200) {
          var result = jsonDecode(value.body);
          if (kDebugMode) {
            print(result["candidates"][0]["content"]["parts"][0]["text"]);
          }

          ChatMessage m1 = ChatMessage(
            text: result["candidates"][0]["content"]["parts"][0]["text"],
            user: bot,
            createdAt: DateTime.now(),
          );
          allMessages.insert(0, m1);
        } else {
          if (kDebugMode) {
            print("Error Occurred");
          }
        }
      },
    ).catchError((e) {});

    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DashChat(
      typingUsers: typing,
      currentUser: myself,
      onSend: (ChatMessage m) {
        getData(m);
      },
      messageOptions: const MessageOptions(
        currentUserContainerColor: Color(0xFFFE3044),
        containerColor: Color(0xFF999999),
        showOtherUsersAvatar: false,
      ),
      messages: allMessages,
      inputOptions: InputOptions(
          alwaysShowSend: true,
          textController: controller,
          sendOnEnter: true,
          inputTextStyle: const TextStyle(
            color: Colors.white,
          ),
          cursorStyle: const CursorStyle(color: Colors.white),
          inputToolbarStyle: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: const Border(
              top: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
              right: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white),
            ),
            backgroundBlendMode: BlendMode.color,
            color: Colors.white.withOpacity(0.0),
          ),
          inputToolbarMargin: const EdgeInsets.all(13),
          inputDecoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(
                isRecording ? Icons.mic_none : Icons.mic,
                color: const Color(0xFFFE3044),
              ),
              onPressed: isRecording ? stopRecording : startRecording,
            ),
            hintText: "Message Lia",
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
          )),
    );
  }
}
