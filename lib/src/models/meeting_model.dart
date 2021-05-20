import 'dart:convert';

String MeetingModelToJson(MeetingModel data) => json.encode(data.toJson());

MeetingModel MeetingModelFromJson(String str) =>
    MeetingModel.fromJson(json.decode(str));

class MeetingModel {
  MeetingModel({
    this.id,
    this.tiporeunion,
    this.fecha,
    this.hora,
    this.multa,
    this.temareunion,
  });

  String id;
  String tiporeunion;
  String fecha;
  String hora;
  String multa;
  String temareunion;

  factory MeetingModel.fromJson(Map<String, dynamic> json) => MeetingModel(
        id: json["_id"],
        tiporeunion: json["tipo_reun"],
        fecha: json["fec_reu"],
        hora: json["hor_reu"],
        multa: json["mul_reu"],
        temareunion: json["tema_reun"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "tipo_reun": tiporeunion,
        "fec_reu": fecha,
        "hor_reu": hora,
        "mul_reu": multa,
        "tema_reun": temareunion,
      };
}
