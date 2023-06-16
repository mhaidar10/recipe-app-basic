class Recipe {
  Recipe({
    required this.namaMakanan,
    required this.gambarMakanan,
    this.isFavorite = false,
  });

  final String namaMakanan;
  final String gambarMakanan;
  final bool isFavorite;
}
