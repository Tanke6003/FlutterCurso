
import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class LocalVideoPostDatasource implements VideoPostsDatasource{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int userID) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed( Duration(seconds: 2));
   List<VideoPost> newVideos = videoPosts.map((video)=> LocalVideoModel.fromJsonMap(video).toVideoPostEntity()).toList();
   return newVideos;
  }
  
}