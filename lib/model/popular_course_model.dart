class PopularCourseModel {
    PopularCourseModel({
        required this.data,
    });

    final List<PopularCourse> data;

    factory PopularCourseModel.fromJson(Map<String, dynamic> json){ 
        return PopularCourseModel(
            data: json["data"] == null ? [] : List<PopularCourse>.from(json["data"]!.map((x) => PopularCourse.fromJson(x))),
        );
    }

}

class PopularCourse {
    PopularCourse({
        required this.id,
        required this.categoryName,
        required this.courseName,
        required this.courseSlug,
        required this.duration,
        required this.rating,
        required this.enrolledStudents,
        required this.costPrice,
        required this.price,
        required this.physicalPrice,
        required this.description,
        required this.difficultyLevel,
        required this.whatYouWillLearn,
        required this.materialIncluded,
        required this.requirements,
        required this.video,
        required this.featured,
        required this.onlineClass,
        required this.physicalClass,
        required this.courseBuilds,
        required this.similar,
        required this.classGroups,
    });

    final int? id;
    final String? categoryName;
    final String? courseName;
    final String? courseSlug;
    final String? duration;
    final String? rating;
    final dynamic enrolledStudents;
    final String? costPrice;
    final String? price;
    final String? physicalPrice;
    final String? description;
    final String? difficultyLevel;
    final String? whatYouWillLearn;
    final String? materialIncluded;
    final String? requirements;
    final String? video;
    final String? featured;
    final OnlineClass? onlineClass;
    final dynamic physicalClass;
    final List<CourseBuild> courseBuilds;
    final List<Similar> similar;
    final List<ClassGroup> classGroups;

    factory PopularCourse.fromJson(Map<String, dynamic> json){ 
        return PopularCourse(
            id: json["id"],
            categoryName: json["category_name"],
            courseName: json["course_name"],
            courseSlug: json["course_slug"],
            duration: json["duration"],
            rating: json["rating"],
            enrolledStudents: json["enrolled_students"],
            costPrice: json["cost_price"],
            price: json["price"],
            physicalPrice: json["physical_price"],
            description: json["description"],
            difficultyLevel: json["difficulty_level"],
            whatYouWillLearn: json["what_you_will_learn"],
            materialIncluded: json["material_included"],
            requirements: json["requirements"],
            video: json["video"],
            featured: json["featured"],
            onlineClass: json["online_class"] == null ? null : OnlineClass.fromJson(json["online_class"]),
            physicalClass: json["physical_class"],
            courseBuilds: json["course_builds"] == null ? [] : List<CourseBuild>.from(json["course_builds"]!.map((x) => CourseBuild.fromJson(x))),
            similar: json["similar"] == null ? [] : List<Similar>.from(json["similar"]!.map((x) => Similar.fromJson(x))),
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

class CourseBuild {
    CourseBuild({
        required this.id,
        required this.topic,
        required this.courseLessons,
    });

    final int? id;
    final String? topic;
    final List<CourseLesson> courseLessons;

    factory CourseBuild.fromJson(Map<String, dynamic> json){ 
        return CourseBuild(
            id: json["id"],
            topic: json["topic"],
            courseLessons: json["course_lessons"] == null ? [] : List<CourseLesson>.from(json["course_lessons"]!.map((x) => CourseLesson.fromJson(x))),
        );
    }

}

class CourseLesson {
    CourseLesson({
        required this.id,
        required this.lesson,
    });

    final int? id;
    final String? lesson;

    factory CourseLesson.fromJson(Map<String, dynamic> json){ 
        return CourseLesson(
            id: json["id"],
            lesson: json["lesson"],
        );
    }

}

class OnlineClass {
    OnlineClass({
        required this.id,
        required this.duration,
        required this.date,
        required this.times,
        required this.location,
    });

    final int? id;
    final String? duration;
    final String? date;
    final List<ClassGroup> times;
    final String? location;

    factory OnlineClass.fromJson(Map<String, dynamic> json){ 
        return OnlineClass(
            id: json["id"],
            duration: json["duration"],
            date: json["date"],
            times: json["times"] == null ? [] : List<ClassGroup>.from(json["times"]!.map((x) => ClassGroup.fromJson(x))),
            location: json["location"],
        );
    }

}

class Similar {
    Similar({
        required this.id,
        required this.courseName,
        required this.courseSlug,
        required this.featured,
    });

    final int? id;
    final String? courseName;
    final String? courseSlug;
    final String? featured;

    factory Similar.fromJson(Map<String, dynamic> json){ 
        return Similar(
            id: json["id"],
            courseName: json["course_name"],
            courseSlug: json["course_slug"],
            featured: json["featured"],
        );
    }

}
