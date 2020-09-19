part of 'component.dart';

class XDropDown<T> extends StatefulWidget {

  final int length;
  final Widget Function(BuildContext, int) childBuilder;

  const XDropDown({
    this.length,
    this.childBuilder,
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
    return XBox(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: currValue,
          elevation: 0,
          onChanged: (value) => setState(() => currValue = value),
          items: List.generate(widget.length, (index) => DropdownMenuItem<int>(
            value: index,
            child: widget.childBuilder(context, index),
          )),
        ),
      ),
    );
  }
}