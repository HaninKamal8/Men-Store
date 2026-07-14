import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'location_cubit.dart';
import 'location_state.dart';



class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationCubit()..getLocations(),
      child: const AddressView(),
    );
  }
}

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, AddressState>(
      listener: (context, state) {},

      builder: (context, state) {
        //======loading================
        if (state is AddressLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
//========================failure=======================
        if (state is AddressFailure) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(state.msg),
            ),
          );
        }
//=================success========================
        if (state is AddressSuccess) {
          return Scaffold(
            backgroundColor: Colors.white,

            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //============header==================
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),

                        const Expanded(
                          child: Center(
                            child: Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 48),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Divider(color: Colors.grey.shade300),

                    const SizedBox(height: 20),

                    const Text(
                      "Saved Address",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Expanded(
                      child: ListView.separated(
                        itemCount: state.Address.length,
                        separatorBuilder: (_, __) =>
                        const SizedBox(height: 15),

                        itemBuilder: (context, index) {
                          final location = state.Address[index];

                          return Container(
                            padding: const EdgeInsets.all(18),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),

                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),

                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey.shade500,
                                  size: 28,
                                ),

                                const SizedBox(width: 15),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            location.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),

                                          if (index == 0) ...[
                                            const SizedBox(width: 8),

                                            Container(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 2,
                                              ),

                                              decoration: BoxDecoration(
                                                color:
                                                Colors.grey.shade200,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                              ),

                                              child: const Text(
                                                "Default",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ]
                                        ],
                                      ),

                                      const SizedBox(height: 5),

                                      Text(
                                        location.description,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color:
                                          Colors.grey.shade600,
                                          fontSize: 14,
                                        ),
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
                  ],
                ),
              ),
            ),
          );
        }

        return const Scaffold(
          body: SizedBox(),
        );
      },
    );
  }
}