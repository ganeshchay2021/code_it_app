class TermsAndConditionModel {
    TermsAndConditionModel({
        required this.data,
    });

    final Data? data;

    factory TermsAndConditionModel.fromJson(Map<String, dynamic> json){ 
        return TermsAndConditionModel(
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.id,
        required this.title,
        required this.description,
    });

    final int? id;
    final String? title;
    final String? description;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            id: json["id"],
            title: json["title"],
            description: json["description"],
        );
    }

}
