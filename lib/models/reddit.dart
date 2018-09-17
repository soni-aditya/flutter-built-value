import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reddit.g.dart';
//part annotation allows this file to connect to the mentioned file ie. reddit.g.dart

abstract class Reddit implements Built<Reddit, RedditBuilder> {
  Children get data;

  Reddit._();

  factory Reddit([updates(RedditBuilder b)]) = _$Reddit;

  static Serializer<Reddit> get serializer => _$redditSerializer;
}

abstract class Children implements Built<Children, ChildrenBuilder> {
  BuiltList<Data> get children;

  Children._();

  //create static serializer getter
  //So that we can easily traverse through the json response
  factory Children([updates(ChildrenBuilder b)]) = _$Children;

  static Serializer<Children> get serializer => _$childrenSerializer;
}

abstract class Data implements Built<Data, DataBuilder> {
  Post get data;

  Data._();

  factory Data([updates(DataBuilder b)]) = _$Data;

  static Serializer<Data> get serializer => _$dataSerializer;
}

//In here, we define all the fields which we want from actual json
abstract class Post implements Built<Post, PostBuilder> {
  String get author;

  String get url;

  String get title;

  String get thumbnail;

  String get subreddit;

  int get ups;

  Post._();

  factory Post([updates(PostBuilder b)]) = _$Post;

  static Serializer<Post> get serializer => _$postSerializer;
}

/*
https://www.reddit.com/r/popular/new.json?count=25

flutter packages pub run build_runner build
flutter packages pub run build_runner watch


 */
