class Product {
  /*
    {} : paramètre nommé
    this : paramètre promu
    required : paramètre obligatoire
  */
  int id;
  String title, description, category, image;
  num price;
  Map rating;
  int quantityInCart;

  // constructeur
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.quantityInCart=0
  });
}
