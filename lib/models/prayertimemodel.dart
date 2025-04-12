class PrayertimeModel
{
  Map<String, dynamic> timings;
  PrayertimeModel({required this.timings});
  factory PrayertimeModel.fromjson(Map<String, dynamic> json)
  {
    return PrayertimeModel(
        timings: json["data"]["timings"]
    );
  }
}