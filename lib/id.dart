import 'package:uuid/uuid.dart';

class Id {
  var uuid = Uuid();

  Id() {
    uuid.v1(); // <not initialized>
  }
}
