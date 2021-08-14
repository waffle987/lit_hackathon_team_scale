import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart' as constants;

class ExpansionList<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final Function(dynamic) onItemSelected;
  final bool smallVersion;
  ExpansionList({
    required this.items,
    required this.title,
    required this.onItemSelected,
    this.smallVersion = false,
  });

  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  final double startingHeight = constants.fieldHeight;
  late double expandedHeight;
  bool expanded = false;
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.title;
    _calculateExpandedHeight();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: constants.fieldPadding,
      duration: const Duration(milliseconds: 180),
      height: expanded
          ? expandedHeight
          : widget.smallVersion
              ? constants.smallFieldHeight
              : startingHeight,
      decoration: constants.fieldDecoration.copyWith(
        boxShadow: expanded
            ? [BoxShadow(blurRadius: 10, color: Colors.grey[300]!)]
            : null,
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          ExpansionListItem(
            title: selectedValue,
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            showArrow: true,
            smallVersion: widget.smallVersion,
          ),
          Container(
            height: 2,
            color: Colors.grey[300],
          ),
          ..._getDropdownListItems()
        ],
      ),
    );
  }

  List<Widget> _getDropdownListItems() {
    return widget.items
        .map((item) => ExpansionListItem(
            showArrow: false,
            smallVersion: widget.smallVersion,
            title: item.toString(),
            onTap: () {
              setState(() {
                expanded = !expanded;
                selectedValue = item.toString();
              });

              widget.onItemSelected(item);
            }))
        .toList();
  }

  void _calculateExpandedHeight() {
    expandedHeight = 2 +
        (widget.smallVersion
            ? constants.smallFieldHeight
            : constants.fieldHeight) +
        (widget.items.length *
            (widget.smallVersion
                ? constants.smallFieldHeight
                : constants.fieldHeight));
  }
}

class ExpansionListItem extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final bool showArrow;
  final bool smallVersion;
  const ExpansionListItem({
    required this.onTap,
    required this.title,
    required this.showArrow,
    required this.smallVersion,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height:
            smallVersion ? constants.smallFieldHeight : constants.fieldHeight,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: smallVersion ? 12 : 15),
              ),
            ),
            showArrow
                ? Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[700],
                    size: 20,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
