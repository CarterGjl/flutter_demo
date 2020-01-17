class StoryModel{
  final List<String> images;
  final String id;
  final String title;

  StoryModel(this.images, this.id, this.title);

}


class StoryListModel {
  final List<StoryModel> stories;
  StoryListModel(this.stories);
}