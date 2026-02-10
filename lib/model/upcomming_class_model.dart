class UpCommingClassModel {
    UpCommingClassModel({
        required this.total,
        required this.upcomingClasses,
    });

    final int? total;
    final List<UpcomingClass> upcomingClasses;

    factory UpCommingClassModel.fromJson(Map<String, dynamic> json){ 
        return UpCommingClassModel(
            total: json["total"],
            upcomingClasses: json["upcoming_classes"] == null ? [] : List<UpcomingClass>.from(json["upcoming_classes"]!.map((x) => UpcomingClass.fromJson(x))),
        );
    }

}

class UpcomingClass {
    UpcomingClass({
        required this.id,
        required this.courseName,
        required this.courseSlug,
        required this.costPrice,
        required this.price,
        required this.physicalPrice,
        required this.image,
        required this.classType,
        required this.duration,
        required this.date,
        required this.times,
        required this.classGroups,
    });

    final int? id;
    final String? courseName;
    final String? courseSlug;
    final String? costPrice;
    final String? price;
    final String? physicalPrice;
    final String? image;
    final String? classType;
    final String? duration;
    final String? date;
    final List<ClassGroup> times;
    final List<ClassGroup> classGroups;

    factory UpcomingClass.fromJson(Map<String, dynamic> json){ 
        return UpcomingClass(
            id: json["id"],
            courseName: json["course_name"],
            courseSlug: json["course_slug"],
            costPrice: json["cost_price"],
            price: json["price"],
            physicalPrice: json["physical_price"],
            image: json["image"],
            classType: json["class_type"],
            duration: json["duration"],
            date: json["date"],
            times: json["times"] == null ? [] : List<ClassGroup>.from(json["times"]!.map((x) => ClassGroup.fromJson(x))),
            classGroups: json["class_groups"] == null ? [] : List<ClassGroup>.from(json["class_groups"]!.map((x) => ClassGroup.fromJson(x))),
        );
    }

}

class ClassGroup {
    ClassGroup({
        required this.id,
        required this.time,
    });

    final int? id;
    final String? time;

    factory ClassGroup.fromJson(Map<String, dynamic> json){ 
        return ClassGroup(
            id: json["id"],
            time: json["time"],
        );
    }

}
