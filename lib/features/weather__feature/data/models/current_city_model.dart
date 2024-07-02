import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';

/// coord : {"lon":10.99,"lat":44.34}
/// weather : [{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}]
/// base : "stations"
/// main : {"temp":298.48,"feels_like":298.74,"temp_min":297.56,"temp_max":300.05,"pressure":1015,"humidity":64,"sea_level":1015,"grnd_level":933}
/// visibility : 10000
/// wind : {"speed":0.62,"deg":349,"gust":1.18}
/// rain : {"1h":3.16}
/// clouds : {"all":100}
/// dt : 1661870592
/// sys : {"type":2,"id":2075663,"country":"IT","sunrise":1661834187,"sunset":1661882248}
/// timezone : 7200
/// id : 3163858
/// name : "Zocca"
/// cod : 200

class CurrentCityModel extends CurrentCityEntity {
  CurrentCityModel({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) : super(
          coord: coord,
          weather: weather,
          base: base,
          main: main,
          visibility: visibility,
          wind: wind,
          rain: rain,
          clouds: clouds,
          dt: dt,
          sys: sys,
          timezone: timezone,
          id: id,
          name: name,
          cod: cod,
        );

  factory CurrentCityModel.fromJson(dynamic json) {
    List<Weather> weather = [];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    return CurrentCityModel(
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      weather: weather,
      base: json['base'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      visibility: json['visibility'],
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      dt: json['dt'],
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    if (rain != null) {
      map['rain'] = rain?.toJson();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
}

/// type : 2
/// id : 2075663
/// country : "IT"
/// sunrise : 1661834187
/// sunset : 1661882248

class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

/// all : 100

class Clouds {
  Clouds({
    this.all,
  });

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }

  int? all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

/// 1h : 3.16

class Rain {
  Rain({
    this.h,
  });

  Rain.fromJson(dynamic json) {
    h = json['1h'];
  }

  double? h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['1h'] = h;
    return map;
  }
}

/// speed : 0.62
/// deg : 349
/// gust : 1.18

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  double? speed;
  int? deg;
  double? gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    map['gust'] = gust;
    return map;
  }
}

/// temp : 298.48
/// feels_like : 298.74
/// temp_min : 297.56
/// temp_max : 300.05
/// pressure : 1015
/// humidity : 64
/// sea_level : 1015
/// grnd_level : 933

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['sea_level'] = seaLevel;
    map['grnd_level'] = grndLevel;
    return map;
  }
}

/// id : 501
/// main : "Rain"
/// description : "moderate rain"
/// icon : "10d"

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  int? id;
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

/// lon : 10.99
/// lat : 44.34

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  double? lon;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}
