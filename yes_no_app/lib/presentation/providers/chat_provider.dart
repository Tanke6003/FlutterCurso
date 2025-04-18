

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

    final ScrollController chatScrollControler = ScrollController();
    final GetYesNoAnswer getYerNoAnswer = GetYesNoAnswer();
    List<Message> messagesList = [
      Message(text: 'Hola kitty 😊', fromWho: FromWho.me),
      Message(text: 'Aun hay croquetas?', fromWho: FromWho.me)
    ];

    Future<void> sendMessage(String text) async {
      if(text.isEmpty) return;
      final newMessage = Message(text: text, fromWho: FromWho.me);
      messagesList.add(newMessage);
     
      notifyListeners();
      moveScrollToBottom();
       if(text.endsWith('?'))
      {
        herReplay();
      }

    }

    Future<void> herReplay() async{
      final herMessage = await getYerNoAnswer.getAnswer();
      messagesList.add(herMessage);
      notifyListeners();
      moveScrollToBottom();
    }



    Future<void> moveScrollToBottom() async {

      await Future.delayed(Duration(microseconds: 100));
      chatScrollControler.animateTo(
        chatScrollControler.position.maxScrollExtent,
       duration:Duration( milliseconds: 100),
        curve: Curves.easeOut
        );
    }






}