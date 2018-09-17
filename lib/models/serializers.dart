import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'reddit.dart';

part 'serializers.g.dart';

/*
Since Reddit is on top of all other classes
Therefore we jsut need to serialize it
and rest of the others will happen so by themselves.
 */
@SerializersFor(const [
  Reddit,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
