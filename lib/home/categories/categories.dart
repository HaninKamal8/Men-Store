import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bloc.dart';
import 'categories_cubit.dart';
import 'categories_state.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const SizedBox(
            height: 40,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CategoriesFailure) {
          return SizedBox(
            height: 40,
            child: Center(
              child: Text(state.msg),
            ),
          );
        }

        if (state is CategoriesSuccess) {
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });

                    if (category.name == "All") {
                      context.read<HomeCubit>().getProducts();
                    } else {
                      context.read<HomeCubit>().filterProducts(
                        category: category.name,
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? const Color(0xff3D6DCC)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      category.name,
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}