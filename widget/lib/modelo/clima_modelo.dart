

class ClimaModelo{
  final String ciudad;
  final String temperatura;
  final String descripcion;

  ClimaModelo({
    required this.ciudad,
    required this.temperatura,
    required this.descripcion});

  factory ClimaModelo.fromJson(Map<String, dynamic> json){
    return ClimaModelo(
        ciudad: json['name'],
        temperatura: json ['main'][0] ['temp'],
        descripcion: json ['weather'] [0] ['description'],
    );
  }
}