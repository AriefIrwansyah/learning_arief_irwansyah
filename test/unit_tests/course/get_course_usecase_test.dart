import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/repository/course_repository_impl.dart';
import 'package:learning/src/domain/entity/course_list_response_entity.dart';
import 'package:learning/src/domain/usecase/courses/get_courses_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_course_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CourseRepositoryImpl>()])
void main() {
  late GetCoursesUsecase usecase;
  late MockCourseRepositoryImpl courseRepository;

  setUp(() {
    courseRepository = MockCourseRepositoryImpl();
    usecase = GetCoursesUsecase(repository: courseRepository);
  });

  final List<CourseDataEntity> dummyCourseResult = dummyCoursesJson.map((e) => CourseDataEntity.fromMap(e)).toList();

  test(
    'Get Courses Usecase',
    () async {
      // arrange
      when((courseRepository.getCourses(any))).thenAnswer((_) async => dummyCourseResult);
      // act
      final result = await usecase('IPS');
      // assert
      expect(result, dummyCourseResult);
      verify(await courseRepository.getCourses('IPS'));
      verifyNoMoreInteractions(courseRepository);
    },
  );
}

const dummyCoursesJson = [
  {
    "course_id": "131",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "PU",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4441794d6a67794e44513d_file_cover1640228244.png",
    "jumlah_materi": 11,
    "jumlah_done": 0,
    "progress": 0
  },
  {
    "course_id": "134",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "PK",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4441794d6a677a4e44633d_file_cover1640228347.png",
    "jumlah_materi": 15,
    "jumlah_done": 0,
    "progress": 0
  },
  {
    "course_id": "132",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "PBM",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4441794d6a677a4d54493d_file_cover1640228312.png",
    "jumlah_materi": 4,
    "jumlah_done": 0,
    "progress": 0
  },
  {
    "course_id": "135",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "Bahasa Inggris",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4441794d6a677a4e6a553d_file_cover1640228365.png",
    "jumlah_materi": 10,
    "jumlah_done": 0,
    "progress": 0
  },
  {
    "course_id": "136",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "Matematika Saintek",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4449324e7a4d7a4d7a453d_file_cover1642673331.png",
    "jumlah_materi": 12,
    "jumlah_done": 0,
    "progress": 0
  },
  {
    "course_id": "137",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "Fisika",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4441794d6a67304d44633d_file_cover1640228407.png",
    "jumlah_materi": 4,
    "jumlah_done": 0,
    "progress": 0
  },
  {
    "course_id": "139",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "Kimia",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4441794d6a67304e44633d_file_cover1640228447.png",
    "jumlah_materi": 4,
    "jumlah_done": 0,
    "progress": 0
  },
  {
    "course_id": "148",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "Biologi",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4441794d7a41324d54553d_file_cover1640230615.png",
    "jumlah_materi": 11,
    "jumlah_done": 0,
    "progress": 0
  },
  {
    "course_id": "133",
    "major_name": "IPA",
    "course_category": "latihan_soal",
    "course_name": "PPU",
    "url_cover":
        "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4449324e7a4d314d6a493d_file_cover1642673522.png",
    "jumlah_materi": 5,
    "jumlah_done": 0,
    "progress": 0
  }
];
