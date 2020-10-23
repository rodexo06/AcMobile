import 'dart:async';

import 'package:AcPoliticos/src/model/Deputado.dart';

class ItemsListBloc {
  ItemsListBloc() {
    getList();
  }

  Deputado itemBo = Deputado();

  final _controller = StreamController<List<Map>>.broadcast();
  final _controller2 = StreamController<List<String>>.broadcast();

  get lists => _controller.stream;
  get lists2 => _controller2.stream;

  ItemsListOrderBy orderBy = ItemsListOrderBy.alphaASC;

  ItemsListFilterBy filterBy = ItemsListFilterBy.all;

  reorder() {
    orderBy = (orderBy == ItemsListOrderBy.alphaASC)
        ? ItemsListOrderBy.alphaDESC
        : ItemsListOrderBy.alphaASC;
    getList();
  }

  toggleFilter(ItemsListFilterBy newVal) {
    filterBy = (filterBy == newVal) ? ItemsListFilterBy.all : newVal;
    getList();
  }

  getList() async {
    _controller.sink.add(await itemBo.itemsByList(2020, 10, orderBy, filterBy));
  }

  getList2() async {
    _controller2.sink
        .add(await itemBo.itemsByList2(2020, 10, orderBy, filterBy));
  }

  dispose() {
    _controller.close();
    _controller2.close();
  }
}
