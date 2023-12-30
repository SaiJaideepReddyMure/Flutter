import 'package:hive_flutter/hive_flutter.dart';

class ToDodatbase
{
  List todolistitems = [];
  final _mybox = Hive.box('Mybox');
  void createIntialData()
  {
    todolistitems = [
      ["Do Flutter",true],["Upload in Github",false]
    ];
  }
  void loadData()
  {
 todolistitems = _mybox.get("TODOLIST");
  }
  void updatdata()
  {
_mybox.put("TODOLIST",todolistitems );
  }

}