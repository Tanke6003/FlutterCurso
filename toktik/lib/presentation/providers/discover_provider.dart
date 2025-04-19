
import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO: Repository, Datasource




  List<VideoPost> listVideosPost = [];
  bool initialLoading = true;

  Future<void> loadNextPag() async{

    //await Future.delayed( Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((video)=> LocalVideoModel.fromJsonMap(video).toVideoPostEntity()).toList();
    listVideosPost.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

  }