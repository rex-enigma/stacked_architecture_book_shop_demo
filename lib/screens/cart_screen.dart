import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_shopper_test/shared/dependency_injection.dart';
import 'package:stacked_architecture_shopper_test/viewModels/cart_screen_viewModel.dart';
import '../shared/constants/icons.dart';

class BookCartScreen extends StatelessWidget {
  const BookCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => getIt<CartViewModel>(),
      disposeViewModel: false,
      builder: (ctx, cartViewModel, _) => Scaffold(
        backgroundColor: cartViewModel.getPrimaryColor(),
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: cartViewModel.cartBookList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Empty Cart',
                      style: TextStyle(
                        fontSize: 28.0,
                        color: cartViewModel.getSecondaryColor(),
                      ),
                    ),
                    Icon(
                      ShoppingCartIcon.bookIcon,
                      size: ShoppingCartIcon.iconSize,
                      color: cartViewModel.getSecondaryColor(),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: cartViewModel.cartBookList.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: Icon(
                      BookIcon.bookIcon,
                      color: cartViewModel.cartBookList[index].coverColor,
                      size: BookIcon.iconSize,
                    ),
                    title: Text(
                      cartViewModel.cartBookList[index].title,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: cartViewModel.getSecondaryColor(),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
