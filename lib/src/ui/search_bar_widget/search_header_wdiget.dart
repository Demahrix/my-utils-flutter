import 'package:flutter/material.dart';
import 'search_bar_widget.dart';

/// Bar de recherche pour le haut des pages:
/// - title le trite de la page
/// - actions les differents icon d'actions changer de theme
class SearchHeaderWidget extends StatelessWidget {

  final String title;
  final Widget? actions;

  final String searchBarLabel;
  final ValueChanged<String> onChanged;
  final Widget? searchBarFilterWidget;
  final bool? searchBarHasDivider;

  const SearchHeaderWidget({
    Key? key, 
    required this.title,
    this.actions,
    required this.searchBarLabel,
    this.searchBarFilterWidget,
    this.searchBarHasDivider,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  ),
                ),

                if (actions != null)
                  actions!

              ],
            )
          ),

          SearchBarWidget(
            label: searchBarLabel,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            filterWidget: searchBarFilterWidget,
            onChanged: onChanged
            // onChanged: _onSearch,
            // filterWidget: PopupMenuButton<String>(
            //   onSelected: _onOfficeChange,
            //   child: Text(
            //     offices[_bloc.currentOffice] ?? "Tous"
            //   ),
            //   tooltip: "Liste des bureaux",
            //   itemBuilder: (_) {
            //     final List<String> keys = offices.keys.toList(growable: false);
            //     return List.generate(keys.length + 1, (index) {
            //       if (index == 0)
            //         return PopupMenuItem(child: Text("Tous"), value: "");
            //       String key = keys[index - 1];
            //       return PopupMenuItem(child: Text(offices[key]), value: key);
            //     });
            //   }
            // ),
          ),
        ],
      )
    );
  }
}
