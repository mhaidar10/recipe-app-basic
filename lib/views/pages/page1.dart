import 'package:aplikasi_resep/datas/favorites.dart';

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          dataFavorite.isEmpty
              ? const Center(child: Text('Favorites have not been addedd'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataFavorite.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey(dataFavorite[index]),
                      onDismissed: (direction) => dataFavorite.removeAt(index),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 200,
                              width: 500,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 239, 238, 238),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                '${dataFavorite[index].gambarMakanan}',
                                color: Colors.black45,
                                colorBlendMode: BlendMode.darken,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 150,
                            left: 40,
                            child: Text(
                              dataFavorite[index].namaMakanan,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
