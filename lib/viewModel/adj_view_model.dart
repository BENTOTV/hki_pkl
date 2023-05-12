import 'package:flutter/material.dart';
import 'package:hki_app/model/modelAdj.dart';


class AdjLogic with ChangeNotifier{
  List<Adj> _dataAjd =[];
  List<Adj> get adj =>_dataAjd;

  void add(Adj contact){
    _dataAjd.add(contact);
    notifyListeners();
  }
  void delete(int i){
    _dataAjd.removeAt(i);
    notifyListeners();
  }
}