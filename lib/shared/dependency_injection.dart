import 'package:get_it/get_it.dart';
import 'package:stacked_architecture_shopper_test/services/source_local/local_store_impl.dart';
import 'package:stacked_architecture_shopper_test/viewModels/bookList_screen_viewModel.dart';
import 'package:stacked_architecture_shopper_test/viewModels/cart_screen_viewModel.dart';
import '../viewModels/bookDetails_screen_viewModel.dart';
import 'globalState.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<GlobalState>(GlobalState());

  //databaseService
  getIt.registerSingleton<LocalStoreImp>(LocalStoreImp());

  // book_list_viewModel
  getIt.registerFactory<BookListViewModel>(() => BookListViewModel());

  //this registered viewModel will be accessed by 2 widgets;
  //1: a cart widget that represent the cart page which will display what's in the cartViewModel.
  //2: a TextButton widget which is part of the home widget which will be used to add the corresponding book to the cartViewModel
  getIt.registerSingleton<CartViewModel>(CartViewModel());

  // book_list_viewModel
  getIt.registerSingleton<BookDetailsViewModel>(BookDetailsViewModel());
}
