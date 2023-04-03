class Words {
  final String title;
  bool favorite;

  Words(this.title, this.favorite);

  void toggleFavorite(){
    favorite = !favorite;
  }
}