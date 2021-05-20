import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.password,
    this.nombre,
    this.apellido,
    this.tlfm,
    this.tlfc,
    this.email,
    this.hectareas,
    this.sector,
    this.barrio,
    this.parroquia,
    this.estado,
    this.role,
  });

  String id;
  String password;
  String nombre;
  String apellido;
  String tlfm;
  String tlfc;
  String email;
  int hectareas;
  String barrio;
  String sector;
  String parroquia;
  bool estado;
  String role;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        password: json["password"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        tlfm: json["tlfm"],
        tlfc: json["tlfc"],
        email: json["email"],
        hectareas: json["hectareas"],
        parroquia: json["parroquia"],
        barrio: json["barrio"],
        sector: json["sector"],
        estado: json["estado"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "password": password,
        "nombre": nombre,
        "apellido": apellido,
        "tlfm": tlfm,
        "tlfc": tlfc,
        "email": email,
        "hectareas": hectareas,
        "barrio": barrio,
        "parroquia": parroquia,
        "sector": sector,
        "estado": estado,
        "role": role,
      };
}
