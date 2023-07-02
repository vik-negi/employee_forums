import 'package:employee_forums/cart/cart.dart';
import 'package:employee_forums/home/home_viewmodel.dart';
import 'package:employee_forums/utils/widgets/icon_with_notification.dart';
import 'package:employee_forums/utils/widgets/show_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeVM vm = Get.put(HomeVM());
    return GetBuilder<HomeVM>(
      builder: (vm) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Shopping Items"),
            actions: [
              IconNotification(
                no: vm.cartItemsList.length,
                icon: Icons.shopping_cart,
                onPressed: () {
                  Get.to(() => const CartPage());
                },
              ),
            ],
          ),
          body: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final fruit = vm.fruitList.removeAt(oldIndex);
              vm.fruitList.insert(newIndex, fruit);
            },
            itemCount: vm.fruitList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(vm.fruitList[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  vm.fruitList.remove(vm.fruitList[index]);
                  vm.update();
                },
                background: Container(
                  color: Colors.red.shade300,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => ShowImage(
                              tag: index.toString(),
                              fruitName: vm.fruitList[index].name,
                              file: vm.fruitList[index].image,
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            vm.fruitList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StyledTextField(
                              title: "Name",
                              value: vm.fruitList[index].name,
                              isCartPage: false),
                          StyledTextField(
                              title: "Unit",
                              value: vm.fruitList[index].unit.toString(),
                              isCartPage: false),
                          StyledTextField(
                              title: "Price",
                              isCartPage: false,
                              value:
                                  "₹${vm.fruitList[index].price.toStringAsFixed(0)}"),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          vm.addToCart(vm.fruitList[index]);
                        },
                        style: vm.isFruitInBookmark(vm.fruitList[index])
                            ? ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade300,
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                ),
                              )
                            : ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).shadowColor,
                                ),
                              ),
                        child: Text(
                          vm.isFruitInBookmark(vm.fruitList[index])
                              ? "Added to cart"
                              : "Add to Cart",
                          style: TextStyle(
                            fontSize: 12,
                            color: vm.isFruitInBookmark(vm.fruitList[index])
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class StyledTextField extends StatelessWidget {
  final String title;
  final String value;
  final bool isCartPage;

  const StyledTextField({
    required this.title,
    required this.isCartPage,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: isCartPage ? width - 300 : width - 275,
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "$title: $value",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
