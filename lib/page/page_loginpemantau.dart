part of 'page.dart';

class LogInPemantauPage extends Page<LogInPemantauBloc> {
  LogInPemantauPage({Key key}) : super(key: key);

  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopLinearProgressIndicator(
        stream: bloc.isLoadingStream,
      ),
      body: Builder(
        builder: (contextScaffold) => SingleChildScrollView(
          padding: paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset('assets/undraw_selected_options.svg',
                height: 200,
              ),
              const SizedBox(height: 30,),
              Text('Masuk', style: blackTitle,),
              Text('Sebagai Pemantau TPS', style: blackSubtitleRegular,),
              const SizedBox(height: 30,),
              XTextField(
                controller: _emailText,
                text: 'Email',
              ),
              const SizedBox(height: 30,),
              XTextField(
                obscureText: true,
                controller: _passwordText,
                text: 'Password',
              ),
              const SizedBox(height: 30,),
              XButton(
                color: mainColor,
                width: 140,
                onTap: () async {

                  // final bool isValidEmail = _emailText.text.contains(
                  //   RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
                  // ); 

                  // final bool isValidPassword = _passwordText.text.length >= 6; 

                  // if (isValidEmail && isValidPassword) {
                  //   await bloc.signIn(
                  //     _emailText.text, _passwordText.text)
                  //     .then((value) {
                  //       if (value == 'User Active') {
                          Navigator.pushReplacementNamed(context, '/pemilihantempat');
                  //       }
                  //       else {
                  //         Scaffold.of(contextScaffold).showSnackBar(snackBar(
                  //           contentText: value,
                  //           labelText: 'DISMISS',
                  //           onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                  //         ));
                  //       }
                  //     }
                  //   );
                  // } else {
                  //   Scaffold.of(contextScaffold).showSnackBar(snackBar(
                  //     contentText: 'Email or password not valid',
                  //     labelText: 'DISMISS',
                  //     onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                  //   ));
                  // }
                },
                child: Text('Masuk', style: whiteSubtitleBold,),
              ),
              const SizedBox(height: 36,),
              GestureDetector(
                onTap: () {},
                child: Text('Terdapat Masalah?',
                  style: blackContentRegular.copyWith(color: greyColor)
                ),
              )
            ],
          ),
        ),
      ) 
    );
  }

}