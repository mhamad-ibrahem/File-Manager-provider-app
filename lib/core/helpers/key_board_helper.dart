
import 'package:flutter/material.dart';

class  KeyBoardHelper {
 static closeKeyBoard(){
     FocusManager.instance.primaryFocus?.unfocus();
  }
}