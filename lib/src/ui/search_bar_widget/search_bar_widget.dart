import 'package:flutter/material.dart';

/// Une simple bar de recherche
class SearchBarWidget extends StatelessWidget {

  final String label;
  final EdgeInsets? margin;
  final ValueChanged<String> onChanged;
  final Widget? filterWidget;
  final bool hasDivider;

  /// Le diviser ne peut pas s'afficher si `filterWidget` est égal à `null`
  SearchBarWidget({
    required this.label,
    this.margin,
    this.filterWidget,
    required this.onChanged,
    bool hasDivider = true
  }): hasDivider = filterWidget == null ? false : hasDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: margin,
      decoration: BoxDecoration(
        color: Color(0x0d000000), // black with opacity 0.05
        borderRadius: BorderRadius.circular(6.0)
      ),
      child: Row(
        children: [

          const Icon(Icons.search, color: Colors.black54),

          const SizedBox(width: 10.0),

          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: label,
                border: InputBorder.none
              ),
            ),
          ),

          const SizedBox(width: 10.0),

          if (hasDivider)
            VerticalDivider(width: 1.0, indent: 5.0, endIndent: 5.0,),

          const SizedBox(width: 10.0),

          if (filterWidget != null)
            filterWidget!

        ],
      ),
    );
  }
}
