import 'package:AcPoliticos/src/controller/items_list_bloc.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatefulWidget {
  final List<Map> items;
  final String filter;
  final ItemsListBloc itemsListBloc;

  const ItemsList({
    Key key,
    this.items,
    this.filter,
    this.itemsListBloc,
  }) : super(key: key);

  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    // Item default
    if (widget.items.isEmpty) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(title: Text('Nenhum item para exibir ainda')),
        ],
      );
    }

    List<Map> filteredList = List<Map>();

    // There is some filter?
    if (widget.filter.isNotEmpty) {
      for (dynamic item in widget.items) {
        String name = item['nome'].toString().toLowerCase();
        if (name.contains(widget.filter.toLowerCase())) {
          filteredList.add(item);
        }
      }
    } else {
      filteredList.addAll(widget.items);
    }

    // Empty after filters
    if (filteredList.isEmpty) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(title: Text('Nenhum item encontrado...')),
        ],
      );
    }

    // Instancia model

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredList.length,
      itemBuilder: (BuildContext context, int i) {
        Map item = filteredList[i];
        return ListTile(
            title: Text(item['nome']),
            onTap: () {
              // itemBo.getItem(item['pk_item']).then((Map i) {
              // Adiciona dados do item a pagina
            });
      },
    );
  }
}
