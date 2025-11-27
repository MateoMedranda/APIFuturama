import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';
import '../datasources/base_datasource.dart';

class FuturamaDataSource extends BaseDataSource<CharacterModel> {
  final String URL = "https://futuramaapi.com/api/characters";

  //Hacer un GET
  Future<List<CharacterModel>> fetchData() async{
    final uri = Uri.parse(URL);
    final resp = await http.get(uri);
    //Hacer una Validación
    if(resp.statusCode != 200){
      throw Exception("Error de conexión API");
    }

    //Decodificar un JSON (jsonDecode)
    final data = jsonDecode(resp.body);
    final List results = data["items"];

    //Resultados (lista)
    return results.map((json) => CharacterModel.fromJson(json)).toList();
  }
}