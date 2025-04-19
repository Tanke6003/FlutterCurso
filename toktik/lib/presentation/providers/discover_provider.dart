
import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';
class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoRepository;
  List<VideoPost> listVideosPost = [];
  bool initialLoading = true;

  DiscoverProvider({
    required this.videoRepository
  });


  Future<void> loadNextPag() async{

    final newVideos = await videoRepository.getTrendingVideosByPage(1);
    listVideosPost.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

  }