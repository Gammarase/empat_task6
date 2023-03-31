import 'package:flutter/cupertino.dart';

class PostModel extends ChangeNotifier {
  final List<int> likedId = [];
  final List<int> selectedId = [];

  addLike(int id) {
    likedId.add(id);
    notifyListeners();
  }

  removeLike(int id) {
    likedId.remove(id);
    notifyListeners();
  }

  addSelection(int id) {
    selectedId.add(id);
    notifyListeners();
  }

  removeSelection(int id) {
    selectedId.remove(id);
    notifyListeners();
  }
}
