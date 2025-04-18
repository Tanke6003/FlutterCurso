
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text("My cat 😺"),
      centerTitle: false,
      backgroundColor: colors.primary.withAlpha(220),
      leading: const Padding(
        padding:  EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIZ1vi9U6irZjDr6wKWl7a65cxu6ydPYBIuw&s"),
        ),
      ),
      ),
      body: _ChatView(),
    );
  }
}


class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();





    return SafeArea(
      child: Column(
          children: [
            Expanded(child:
             Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: ListView.builder(
              itemCount:chatProvider.messagesList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messagesList[index];
                // return (index % 2 == 0)?
                // HerMessageBubble(): MyMessageBubble();
                return message.fromWho == FromWho.hers ? HerMessageBubble(message: message,): MyMessageBubble(message: message,);
              },
              controller: chatProvider.chatScrollControler,
        ))),       //Caja de texto 
            MessageFieldBox(onValue:  chatProvider.sendMessage )
          ],
      )
   
    );
  }
}
