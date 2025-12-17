import 'package:dio/dio.dart';
import 'package:lap/bai6/sp.dart';

class Api {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var url = "https://fakestoreapi.com/products";
    var respone = await dio.request(url);
    List<Product> ls = [];
    if (respone.statusCode == 200) {
      List data = respone.data;
      ls = data.map((json) => Product.fromJson(json)).toList();
    } else {
      print('Loi cai chi do roi');
    }
    return ls;
  }
}

var testApi = Api();