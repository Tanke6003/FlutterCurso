import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_Scrollable_view.dart';


class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final DiscoverProvider discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
      body: discoverProvider.initialLoading ? 
      Center( child: CircularProgressIndicator( strokeWidth: 2  ))
      :VideoScrollableView(listVideos: discoverProvider.listVideosPost)
    
    );  
  }
}