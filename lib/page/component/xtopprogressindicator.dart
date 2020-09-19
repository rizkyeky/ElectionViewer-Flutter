part of 'component.dart';


class XTopLinearProgressIndicator extends StatelessWidget
    implements PreferredSizeWidget {

  final double value;
  final Color backgroundColor;
  final Color valueColor;
  final bool isShow;
  final Stream<bool> stream;
  
  @override
  Size get preferredSize => const Size.fromHeight(6);
  
  const XTopLinearProgressIndicator({
    Key key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.stream,
    this.isShow = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<bool>(
        initialData: false,
        stream: stream,
        builder: (context, snapshot) => (snapshot.data) ? LinearProgressIndicator(
          value: value,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        )
        : const SizedBox(height: 6,)
      ),
    );
  }
}