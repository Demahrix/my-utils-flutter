import 'package:flutter/material.dart';

class MyToggleButton extends StatefulWidget {

  final int initialValue;
  final List<Widget> children;
  final ValueChanged<int> onChanged;
  final double height;

  const MyToggleButton({
    Key? key,
    this.initialValue = 0,
    required this.children,
    required this.onChanged,
    this.height = 36.0,
  }): super(key: key);

  @override
  _MyToggleButtonState createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {

  late List<Widget> _children; 
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _children = widget.children;
    _currentValue = widget.initialValue;
  }

  void _onChanged(int index) {
    if (index != _currentValue) {
      setState(() { _currentValue = index; });
      widget.onChanged(index);
    }
  }

  @override
  Widget build(BuildContext context) {

    final int length = _children.length;

    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(6.0)
      ),
      child: LayoutBuilder(
        builder: (context, snapshot) {

          final double width = snapshot.maxWidth / _children.length;

          return Stack(
            children: [

              AnimatedPositioned(
                left: _currentValue * width,
                width: width,
                height: snapshot.maxHeight,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOut,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0)
                  ),
                ),
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => _onChanged(index),
                      child: Center(child: _children[index]),
                    )
                  );
                }),
              )

            ],
          );
        }
      ),
    );
  }
}
