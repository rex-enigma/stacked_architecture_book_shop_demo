import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_shopper_test/services/source_local/local_store_impl.dart';
import 'package:stacked_architecture_shopper_test/shared/globalState.dart';
import '../dataModels/book_model.dart';
import '../shared/dependency_injection.dart';

class BookDetailsViewModel extends ReactiveViewModel {
  // inject localSore service
  final LocalStoreImp _localStoreService = getIt<LocalStoreImp>();

  // currently holding the app light and dark mode theme
  final GlobalState _globalState = getIt<GlobalState>();

  late Book _bookState;

  Book get book => _bookState;

  // get the book with the given bookId from the database and set it to get displayed.
  void loadBook(int bookId) {
    _bookState = _localStoreService.getBook(bookId);
    notifyListeners();
  }

  Color getPrimaryColor() {
    return _globalState.getPrimaryColor();
  }

  Color getSecondaryColor() {
    return _globalState.getSecondaryColor();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_globalState];
}
