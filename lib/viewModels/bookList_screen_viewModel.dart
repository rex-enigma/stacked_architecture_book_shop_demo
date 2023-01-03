import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_shopper_test/dataModels/book_model.dart';
import 'package:stacked_architecture_shopper_test/services/source_local/local_store_impl.dart';
import 'package:stacked_architecture_shopper_test/shared/dependency_injection.dart';

import '../shared/globalState.dart';

class BookListViewModel extends ReactiveViewModel {
  // inject localStore service
  final LocalStoreImp localStoreService = getIt<LocalStoreImp>();

  // currently holding the app light and dark mode theme
  final GlobalState _globalState = getIt<GlobalState>();

  final List<Book> _booksState = [];

  List<Book> get bookList => _booksState;

  void loadBooks() {
    List<Book> books = localStoreService.getBooks();
    _booksState.addAll(books);
    notifyListeners();
  }

  // got implemented only on this viewModel
  void toggleThemeMode() {
    _globalState.toggleThemeMode();
  }

  Color getPrimaryColor() {
    return _globalState.getPrimaryColor();
  }

  Color getSecondaryColor() {
    return _globalState.getSecondaryColor();
  }

  ThemeMode getCurrentThemeMode() {
    return _globalState.currentThemeMode;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_globalState];
}
