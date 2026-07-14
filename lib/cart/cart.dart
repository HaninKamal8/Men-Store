import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project3/core/homeNav/BottomNavBar/NavBar.dart';
import 'package:project3/home/view.dart';


import 'cart_cubit.dart';
import 'cart_state.dart';
import 'counter.dart';

class CartScreen extends StatelessWidget {
const CartScreen({super.key});

@override
Widget build(BuildContext context) {
return BlocProvider(
create: (_) => CartCubit()..getCart(),
child: Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(
backgroundColor: Colors.white,
elevation: 0,
centerTitle: true,
leading: IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CustomBottomNavBar(),
      ),
    );
  },
icon: const Icon(
Icons.arrow_back,
color: Colors.black,
),
),
title: const Text(
"My Cart",
style: TextStyle(
color: Colors.black,
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
),
body: BlocBuilder<CartCubit, CartState>(
builder: (context, state) {
if (state is CartLoading) {
return const Center(
child: CircularProgressIndicator(),
);
}

if (state is CartFailure) {
return Center(
child: Text(state.msg),
);
}

if (state is CartSuccess) {
final cart = state.cart;

return Padding(
padding: const EdgeInsets.all(20),
child: Column(
children: [
Expanded(
child: ListView.separated(
itemCount: cart.products.length,
separatorBuilder: (_, __) =>
const SizedBox(height: 18),
itemBuilder: (context, index) {
final product =
cart.products[index];

return Container(
padding: const EdgeInsets.all(14),
decoration: BoxDecoration(
color: Colors.white,
borderRadius:
BorderRadius.circular(18),
boxShadow: [
BoxShadow(
color: Colors.grey
.withOpacity(.15),
blurRadius: 10,
offset:
const Offset(0, 3),
),
],
),
child: Row(
children: [
Container(
width: 90,
height: 90,
decoration: BoxDecoration(
color: const Color(
0xffF5F6FA),
borderRadius:
BorderRadius.circular(
14),
),
child: ClipRRect(
borderRadius:
BorderRadius.circular(
14),
child: Image.network(
product.thumbnail,
fit: BoxFit.contain,
),
),
),

const SizedBox(width: 15),

Expanded(
child: Column(
crossAxisAlignment:
CrossAxisAlignment
.start,
children: [
Text(
product.title,
maxLines: 2,
overflow:
TextOverflow
.ellipsis,
style:
const TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 17,
),
),

const SizedBox(
height: 6),

Text(
"\$${product.price}",
style:
const TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 18,
),
),

const SizedBox(
height: 10),

Row(
children: [
Counter(
quantity:
product.quantity,
),

const Spacer(),

IconButton(
onPressed: () {},
icon:
const Icon(
Icons
.delete_outline,
color: Colors.red,
),
),
],
),
],
),
),
],
),
);
},
),
),

const Divider(),

const SizedBox(height: 15),                    _buildRow(
    "Sub-total",
    "\$${cart.total.toStringAsFixed(2)}",
  ),

  const SizedBox(height: 12),

  _buildRow(
    "Discount",
    "\$${(cart.total - cart.discountedTotal).toStringAsFixed(2)}",
  ),

  const SizedBox(height: 12),

  _buildRow(
    "Items",
    "${cart.totalProducts}",
  ),

  const SizedBox(height: 12),

  _buildRow(
    "Quantity",
    "${cart.totalQuantity}",
  ),

  const Divider(height: 35),

  _buildRow(
    "Total",
    "\$${cart.discountedTotal.toStringAsFixed(2)}",
    isBold: true,
  ),

  const SizedBox(height: 25),

  SizedBox(
    width: double.infinity,
    height: 55,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff3D6DCC),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(12),
        ),
      ),
      child: const Row(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Text(
            "Go To Checkout",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    ),
  ),
],
),
);
}

return const SizedBox();
},
),
),
);
}

Widget _buildRow(
    String title,
    String value, {
      bool isBold = false,
    }) {
  return Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
          fontWeight: isBold
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 17,
          fontWeight: isBold
              ? FontWeight.bold
              : FontWeight.w600,
        ),
      ),
    ],
  );
}
}