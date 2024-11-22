part of 'loading_handler.dart';

class LoadingIndicator extends StatelessWidget {
  static void  show({required BuildContext context, }) {
    _loaderRoute = DialogRoute(
      context: context,
      builder: (context) {
        return const Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: LoadingIndicator(

            ));
      },
    );

    if (_loaderRoute !=null) {
      context.navigator.push(_loaderRoute!);
    }
  }



  const LoadingIndicator({super.key, });

  @override
  Widget build(BuildContext context) {
    double padding = 12;
    return Center(
      child: PopScope(
        canPop: false,
        child: Container(
            height:  40 + padding,
            width:  40 + padding,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(12)),
            child: const CircularProgressIndicator(
              strokeWidth: 3,
            )),
      ),
    );
  }
}
