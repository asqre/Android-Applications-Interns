import "package:flutter/foundation.dart";

//changenotifier work as a SetState , iske pass sare widget ka context hota h
class CountProvider with ChangeNotifier{
  int _count=50;
  int get count=>_count; //get method is used to fetch the private variable
  // to access private variable we use getter(get)
  void SetCount(){
    _count++;
    notifyListeners(); //it notify when the setcount is called.and increase the value if count
  }

}