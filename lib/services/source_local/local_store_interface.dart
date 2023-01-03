import '../../dataModels/book_model.dart';

abstract class LocalStoreInterface {
  List getBooks();

  Book getBook(int bookId);
}
