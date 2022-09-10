import 'package:uuid/uuid.dart';

class Id {
  

  Id() {
    var uuid = Uuid();
    uuid.v1();
  }
}
