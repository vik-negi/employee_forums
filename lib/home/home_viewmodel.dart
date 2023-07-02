import 'dart:async';

import 'package:employee_forums/models/cart_model.dart';
import 'package:employee_forums/models/fruits_model.dart';
import 'package:employee_forums/utils/snackbar.dart';
import 'package:get/get.dart';

class HomeVM extends GetxController {
  List<Fruit> fruitList = [
    Fruit(
        name: 'Apple',
        image: 'assets/images/fruits/apple.png',
        price: 200.0,
        unit: 'kg'),
    Fruit(
        name: 'Banana',
        image: 'assets/images/fruits/bananas.png',
        price: 400.0,
        unit: 'kg'),
    Fruit(
        name: 'Grapes',
        image: 'assets/images/fruits/grapes.png',
        price: 350.0,
        unit: 'kg'),
    Fruit(
        name: 'Black Grapes',
        image: 'assets/images/fruits/black_grapes.png',
        price: 500.0,
        unit: 'kg'),
    Fruit(
        name: 'Lemon',
        image: 'assets/images/fruits/lemon.png',
        price: 300.0,
        unit: 'kg'),
    Fruit(
        name: 'Cherry',
        image: 'assets/images/fruits/cherry.png',
        price: 400.0,
        unit: 'kg'),
    Fruit(
        name: 'Orange',
        image: 'assets/images/fruits/orange.png',
        price: 250.0,
        unit: 'kg'),
    Fruit(
        name: 'Pineapple',
        image: 'assets/images/fruits/pineapple.png',
        price: 320.0,
        unit: 'kg'),
    Fruit(
        name: 'Strawberry',
        image: 'assets/images/fruits/strawberry.png',
        price: 300.0,
        unit: 'kg'),
    Fruit(
        name: 'Pomegrana',
        image: 'assets/images/fruits/pomegranate.png',
        price: 170.0,
        unit: 'kg'),
  ];

  List<CartModel> cartItemsList = [];

  double _totalPrice = 0.0;

  get getTotalPrice => _totalPrice;

  void addToCart(Fruit fruit) {
    if (isFruitInBookmark(fruit)) {
      showSnackBar(Get.context!, "Already added to cart", true);
      return;
    }
    cartItemsList.add(CartModel(fruit: fruit, quantity: 1));
    _totalPrice += fruit.price;
    update();
  }

  void increaseQuentity(CartModel cartItem) {
    cartItem.quantity++;
    _totalPrice += cartItem.fruit.price;
    update();
  }

  bool isFruitInBookmark(Fruit fruit) {
    return cartItemsList.any((e) => e.fruit == fruit);
  }

  void decreaseQuentity(CartModel cartItem) {
    cartItem.quantity--;
    _totalPrice -= cartItem.fruit.price;
    if (cartItem.quantity <= 0) {
      cartItemsList.remove(cartItem);
    }
    update();
  }

  void removeFromCart(CartModel cartItem) {
    cartItemsList.remove(cartItem);
    _totalPrice -= cartItem.fruit.price * cartItem.quantity;
    update();
  }
}
