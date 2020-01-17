import 'dart:async';

import 'package:flutter_demo/mvvm/story_model.dart';

class StoryListViewModel {
  var _storyListController = StreamController<StoryListModel>.broadcast();
  List<StoryModel> storyList = List();
  var offset = 0;

  Sink get inStoryListController => _storyListController;

  Stream<List<StoryModel>> get outStoryList =>
      _storyListController.stream.map((stories) {
        storyList.addAll(stories.stories);
        return storyList;
      });

  refreshStoryList() async{
    offset =0;
    storyList.clear();
    inStoryListController.add(null);
  }

  dipose(){
    _storyListController.close();
  }
}
