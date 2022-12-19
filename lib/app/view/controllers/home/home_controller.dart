import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/author/author_repository.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/author/author_search.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/book/book_repository.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/book/book_search.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/genre/genre_repository.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/genre/genre_search.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/publisher/publisher_repository.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/publisher/publisher_search.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/shape/shape_repository.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/shape/shape_search.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/loader_mixin.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/utils/message_mixin.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/list/list_page.dart';

class HomeController extends GetxController with LoaderMixin, MessageMixin {
  HomeController();

  final _loading = false.obs;
  set loading(bool value) => _loading(value);
  final _message = Rxn<MessageModel>();

  @override
  void onInit() async {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  genreRepository() {
    GenreRepository genreRepository = GenreRepository();
    // genreRepository.addAll();
    // genreRepository.add();
    // genreRepository.update();
    // genreRepository.unset('3xILA8Wjyp', 'typeString');
    // genreRepository.delete('iBX9aQtUTv');
    // genreRepository.removeAll();
    // genreRepository.typeNumberIncrement('3xILA8Wjyp', 2.0);
    // genreRepository.typeNumberDecrement('3xILA8Wjyp', 3.0);
    // genreRepository.typeArraySetAdd('3xILA8Wjyp', 'd');
    // genreRepository.typeArraySetAddUnique('3xILA8Wjyp', 'd');
    // genreRepository.typeArraySetAddAll('3xILA8Wjyp', ['e', 'f']);
    // genreRepository.typeArraySetAddAllUnique('3xILA8Wjyp', ['e', 'f']);
    // genreRepository.typeArraySetRemove('3PplSH1UZd', 'a');
    // genreRepository.typeArraySetRemoveAll('3PplSH1UZd', ['aa', 'd', 'g']);
  }

  genreSearch() async {
    GenreSearch genreSearch = GenreSearch();
    var dataList = <String>[];

    // dataList = await genreSearch.getObject('3xILA8Wjyp');
    dataList = await genreSearch.getAll();
    // dataList = await genreSearch.queryBuilderCount();
    // dataList = await genreSearch.queryBuilder();
    // dataList = await genreSearch.queryBuilderOrderByAscending('typeString');
    // dataList = await genreSearch.queryBuilderOrderByDescending('typeString');
    // dataList = await genreSearch.queryBuilderExcludeKeys(['typeString']);
    // dataList = await genreSearch.queryBuilderKeysToReturn(['typeString']);
    // dataList = await genreSearch.queryBuilderPagination(1, 2);
    // dataList = await genreSearch.queryBuilderPagination(2, 2);
    // dataList = await genreSearch.queryBuilderWhereEqualToSimpleColumn(
    //     'typeBoolean', false);
    // dataList = await genreSearch.queryBuilderWhereEqualToSimpleColumn(
    //     'typeString', 'Genre01');
    // dataList =
    //     await genreSearch.queryBuilderWhereEqualToSimpleColumn('typeNumber', 3);
    // dataList = await genreSearch.queryBuilderWhereEqualToSimpleColumn(
    //     'typeDate', DateTime(2022, 11, 26, 10));
    // dataList = await genreSearch.queryBuilderWhereNotEqualToSimpleColumn(
    //     'typeBoolean', true);
    // dataList = await genreSearch.queryBuilderWhereNotEqualToSimpleColumn(
    //     'typeString', 'Genre02');
    // dataList = await genreSearch.queryBuilderWhereNotEqualToSimpleColumn(
    //     'typeNumber', 3);
    // dataList = await genreSearch.queryBuilderWhereEqualToSimpleColumn(
    //     'typeDateTime', DateTime(2022, 12, 02, 16, 42, 36));
    // dataList =
    //     await genreSearch.queryBuilderWhereGreaterThan('typeBoolean', false);
    // dataList =
    //     await genreSearch.queryBuilderWhereGreaterThan('typeString', 'Genre02');
    // dataList = await genreSearch.queryBuilderWhereGreaterThan('typeNumber', 3);
    // dataList = await genreSearch.queryBuilderWhereGreaterThan(
    //     'typeDate', DateTime(2022, 11, 25, 10));
    // dataList = await genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
    //     'typeBoolean', true);
    // dataList = await genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
    //     'typeString', 'Genre02');
    // dataList = await genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
    //     'typeNumber', 3);
    // dataList = await genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
    //     'typeDate', DateTime(2022, 11, 25, 10));
    // dataList = await genreSearch.queryBuilderWhereLessThan('typeBoolean', true);
    // dataList =
    //     await genreSearch.queryBuilderWhereLessThan('typeString', 'Genre02');
    // dataList = await genreSearch.queryBuilderWhereLessThan('typeNumber', 3);
    // dataList = await genreSearch.queryBuilderWhereLessThan(
    //     'typeDate', DateTime(2022, 11, 25, 10));
    // dataList = await genreSearch.queryBuilderWhereLessThanOrEqualTo(
    //     'typeBoolean', true);
    // dataList = await genreSearch.queryBuilderWhereLessThanOrEqualTo(
    //     'typeString', 'Genre02');
    // dataList =
    //     await genreSearch.queryBuilderWhereLessThanOrEqualTo('typeNumber', 3);
    // dataList = await genreSearch.queryBuilderWhereLessThanOrEqualTo(
    //     'typeDate', DateTime(2022, 11, 25, 10));
    // dataList =
    //     await genreSearch.queryBuilderWhereValueExists('typeString', false);
    // dataList = await genreSearch.queryBuilderWhereStartsWith('typeString', 'g');
    // dataList = await genreSearch.queryBuilderWhereEndsWith('typeString', '2');
    // dataList = await genreSearch.queryBuilderWhereContains('typeString', '0');
    // dataList =
    //     await genreSearch.queryBuilderWhereContainedIn('typeArray', ['a', '3']);
    // dataList = await genreSearch
    //     .queryBuilderWhereArrayContainsAll('typeArray', ['a', '1']);
    // dataList = await genreSearch.queryBuilderOr();
    // dataList = await genreSearch.queryBuilderCustom();

    // dataList = await genreSearch.queryBuilderCount();
    Get.to(() => ListPage(
          table: 'Genre',
          dataList: dataList,
        ));
  }

  authorRepository() {
    AuthorRepository authorRepository = AuthorRepository();
    authorRepository.addAll();
    // authorRepository.addPointer();
    // authorRepository.add();
    // authorRepository.update();
    // authorRepository.unset('I9npZLFtqI', 'typeString');
    // authorRepository.delete('I9npZLFtqI');
    // authorRepository.removeAll();
  }

  authorSearch() async {
    AuthorSearch authorSearch = AuthorSearch();
    var dataList = <String>[];
    dataList =
        await authorSearch.queryBuilderIncludeObject(['typePointerGenre']);
    // dataList = await authorSearch.queryBuilderWhereEqualToPointer(
    //     'typePointerGenre', 'Genre', 'mrsMiyXeuP');
    // dataList = await authorSearch.queryBuilderWhereMatchesQuery();
    // dataList = await authorSearch.queryBuilderWhereDoesNotMatchQuery();
    // dataList = await authorSearch.queryBuilderWhereMatchesKeyInQuery();
    // dataList = await authorSearch.queryBuilderWhereDoesNotMatchKeyInQuery();
    Get.to(() => ListPage(
          table: 'Author',
          dataList: dataList,
        ));
  }

  shapeRepository() {
    ShapeRepository shapeRepository = ShapeRepository();
    shapeRepository.addAll();
    // shapeRepository.addFile('readmes/files/uml.jpg', '5iLu1JOO9x');
    // shapeRepository.add();
    // shapeRepository.update();
    // shapeRepository.unset('I9npZLFtqI', 'typeString');
    // shapeRepository.delete('I9npZLFtqI');
    // shapeRepository.removeAll();
  }

  shapeSearch() async {
    ShapeSearch shapeSearch = ShapeSearch();

    var dataList = <String>[];
    // dataList = await shapeSearch.getObject('5iLu1JOO9x');
    dataList = await shapeSearch.getAll();
    Get.to(() => ListPage(
          table: 'Shape',
          dataList: dataList,
        ));
  }

  publisherRepository() {
    PublisherRepository publisherRepository = PublisherRepository();
    publisherRepository.addAll();
    // publisherRepository.addPointer();
    // publisherRepository.add();
    // publisherRepository.update();
    // publisherRepository.unset('I9npZLFtqI', 'typeString');
    // publisherRepository.delete('I9npZLFtqI');
    // publisherRepository.removeAll();
  }

  publisherSearch() async {
    PublisherSearch publisherSearch = PublisherSearch();
    var dataList = <String>[];

    dataList = await publisherSearch.getAll();

    Get.to(() => ListPage(
          table: 'Publisher',
          dataList: dataList,
        ));
  }

  bookRepository() {
    BookRepository bookRepository = BookRepository();
    bookRepository.addAll();
    // bookRepository.addRelations();
    // bookRepository.removeRelations();
    // bookRepository.addPointer();
    // bookRepository.add();
    // bookRepository.update();
    // bookRepository.unset('I9npZLFtqI', 'typeString');
    // bookRepository.delete('I9npZLFtqI');
    // bookRepository.removeAll();
  }

  bookSearch() async {
    BookSearch bookSearch = BookSearch();
    var dataList = <String>[];

    // dataList = await bookSearch.queryBuilderIncludeObject(
    // ['typePointerPublisher', 'typePointerPublisher.typePointerShape'])
    // dataList = await bookSearch.queryBuilderWhereEqualToRelation('Author', 'VUDROrC3iK');
    // dataList = await bookSearch.queryBuilderWhereMatchesQuery();
    // dataList = await bookSearch.queryBuilderWhereDoesNotMatchQuery();

    Get.to(() => ListPage(
          table: 'Book',
          dataList: dataList,
        ));
  }
}
