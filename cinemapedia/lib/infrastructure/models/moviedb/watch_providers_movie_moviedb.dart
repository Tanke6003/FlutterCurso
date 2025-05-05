

class WatchProvidersResponse {
    final int id;
    final Map<String, Result> results;

    WatchProvidersResponse({
        required this.id,
        required this.results,
    });

    factory WatchProvidersResponse.fromJson(Map<String, dynamic> json) => WatchProvidersResponse(
        id: json["id"],
        results: Map.from(json["results"]).map((k, v) => MapEntry<String, Result>(k, Result.fromJson(v))),
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "results": Map.from(results).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    // };
}

class Result {
    final String link;
    final List<Flatrate> flatrate;

    Result({
        required this.link,
        required this.flatrate,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        link: json["link"],
        flatrate: List<Flatrate>.from(json["flatrate"].map((x) => Flatrate.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "link": link,
    //     "flatrate": List<dynamic>.from(flatrate.map((x) => x.toJson())),
    // };
}

class Flatrate {
    final String logoPath;
    final int providerId;
    final String providerName;
    final int displayPriority;

    Flatrate({
        required this.logoPath,
        required this.providerId,
        required this.providerName,
        required this.displayPriority,
    });

    factory Flatrate.fromJson(Map<String, dynamic> json) => Flatrate(
        logoPath: json["logo_path"]!,
        providerId: json["provider_id"],
        providerName: json["provider_name"]!,
        displayPriority: json["display_priority"],
    );

    // Map<String, dynamic> toJson() => {
    //     "logo_path": logoPathValues.reverse[logoPath],
    //     "provider_id": providerId,
    //     "provider_name": providerNameValues.reverse[providerName],
    //     "display_priority": displayPriority,
    // };
}
