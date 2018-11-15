class PostComment {
  int id;
  int creatorId;
  DateTime created;
  String text;

  PostComment({this.id, this.created, this.text, this.creatorId});

  factory PostComment.fromJson(Map<String, dynamic> parsedJson) {
    DateTime created = DateTime.parse(parsedJson['created']).toLocal();

    return PostComment(
        id: parsedJson['id'],
        creatorId: parsedJson['creator_id'],
        created: created,
        text: parsedJson['text']);
  }
}
