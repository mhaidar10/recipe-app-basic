import 'package:aplikasi_resep/datas/favorites.dart';
import 'package:aplikasi_resep/datas/makanan_indonesia.dart';
import 'package:aplikasi_resep/models/recipe.dart';
import 'package:flutter/material.dart';

import '../../datas/makanan.dart';

import '../widgets/recipe_details.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    List category = [
      'Indonesia',
      'Italy',
      'Japan',
    ];
    var snackBar = const SnackBar(
      content: Text('Data ditambah ke favorite'),
      duration: Duration(seconds: 1),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          //row judul
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'RECHEF',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 239, 238, 238),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //category
          Container(
            height: 30,
            width: 500,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 40,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 239, 238, 238),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Center(child: Text(category[index])),
                  ),
                );
              },
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //list recipe
          Column(
            children: [
              SizedBox(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 40,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: dataMakananIndonesia.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RecipeDetails(
                                  name: dataMakananIndonesia[index].namaMakanan,
                                  imagePhoto: dataMakananIndonesia[index]
                                      .gambarMakanan),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 500,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 175, 132, 76)),
                              child: Image.asset(
                                  dataMakananIndonesia[index].gambarMakanan,
                                  fit: BoxFit.cover),
                            ),
                            IconButton(
                                onPressed: () {
                                  dataFavorite.add(
                                    Recipe(
                                        namaMakanan: dataMakananIndonesia[index]
                                            .namaMakanan,
                                        gambarMakanan:
                                            dataMakananIndonesia[index]
                                                .gambarMakanan),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
