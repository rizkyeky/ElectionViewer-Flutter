part of 'component.dart';

class XDropDown<T> extends StatefulWidget {

  final int length;
  final Widget Function(BuildContext, int) childrenBuilder;
  final void Function(int) onSelected;
  final bool isDisabled;

  const XDropDown({
    this.length,
    this.childrenBuilder,
    this.onSelected,
    this.isDisabled = false
  });

  @override
  _XDropDownState createState() => _XDropDownState();
}

class _XDropDownState extends State<XDropDown> {

  int currValue;

  @override
  void initState() {
    currValue ??= 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (!widget.isDisabled) ? XBox(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: currValue,
          elevation: 0,
          onChanged: (value) {
            setState(() => currValue = value);
            if (widget.onSelected != null) widget.onSelected(value); 
          },
          items: List.generate(widget.length, (index) => DropdownMenuItem<int>(
            value: index,
            child: widget.childrenBuilder(context, index),
          )),
        ),
      ),
    ) : const XBox(borderColor: borderColor, height: 50,);
  }
}