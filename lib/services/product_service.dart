import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../config/config.dart';

class ProductService {
  //récupérer tous les produits
  //Future équivalent à une Promesse en JS
  Future getAllProducts() async {
    Uri uri = Uri.parse('${Config.API_URL}/products');
    http.Response response = await http.get(uri);

    //récupérer la réponse
    if(response.statusCode == 200){
      //Conversion des données en JSON
      List data = jsonDecode(response.body);
      inspect(data);
    } else {
      throw Error();
    }

  }



}