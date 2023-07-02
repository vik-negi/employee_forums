import 'package:employee_forums/home/home.dart';
import 'package:employee_forums/home/home_viewmodel.dart';
import 'package:employee_forums/utils/dialogbox/alertBox.dart';
import 'package:employee_forums/utils/widgets/icon_with_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeVM vm =
        Get.isRegistered<HomeVM>() ? Get.find<HomeVM>() : Get.put(HomeVM());
    return GetBuilder<HomeVM>(builder: (vm) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Items"),
          actions: [
            IconNotification(
              no: vm.cartItemsList.length,
              icon: Icons.shopping_cart,
              onPressed: () {
                // vm.getUserBookmarked();
                Get.to(() => const CartPage());
              },
            ),
          ],
        ),
        body: vm.cartItemsList.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.grey.shade400,
                      size: 75,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("You haven't added any item",
                        style: TextStyle(fontSize: 18))
                  ],
                ),
              )
            : ListView.builder(
                itemCount: vm.cartItemsList.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            vm.cartItemsList[i].fruit.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledTextField(
                                title: "Name",
                                value: vm.cartItemsList[i].fruit.name,
                                isCartPage: true),
                            StyledTextField(
                                title: "Unit",
                                value: vm.cartItemsList[i].fruit.unit,
                                isCartPage: true),
                            StyledTextField(
                                title: "Price",
                                value:
                                    "₹${vm.cartItemsList[i].fruit.price.toStringAsFixed(0)}",
                                isCartPage: true),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                vm.decreaseQuentity(vm.cartItemsList[i]);
                              },
                              icon: Icon(Icons.remove_sharp),
                            ),
                            Text(vm.cartItemsList[i].quantity.toString()),
                            IconButton(
                              onPressed: () {
                                vm.increaseQuentity(vm.cartItemsList[i]);
                              },
                              icon: Icon(Icons.add_sharp),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              showCustomAlertBox(
                                context,
                                "Are you sure?",
                                "Are you sure you want to remove ${vm.cartItemsList[i].fruit.name} from cart?",
                                () {
                                  vm.removeFromCart(vm.cartItemsList[i]);
                                  Get.back();
                                },
                              );
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 75,
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub-Total",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                        "${vm.getTotalPrice.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 48,
                color: Color.fromARGB(255, 253, 215, 54),
                child: const Text(
                  "Proceed to Pay",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
