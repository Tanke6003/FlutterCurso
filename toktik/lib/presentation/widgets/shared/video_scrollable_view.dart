
import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_player.dart';


class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> listVideos;
  const VideoScrollableView({super.key, required this.listVideos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: listVideos.length,
      itemBuilder: (context, index) {
        final videoPost = listVideos[index];
        // Replace this with your widget for each video
        return Stack(
          children: [
            //video player + gradiant
          SizedBox.expand(
            child:FullScreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
            )
          ),
          //buttons
          Positioned(
          bottom: 40,
          right: 20,
            
            
          child: VideoButtons(video: videoPost)
           )
          
          ] 

        );
      },
    );
  }
}

