part of '../items_screen.dart';

class ChangeStateWidget extends StatelessWidget {
  final ItemsState itemsState;
  final Widget onSuccessWidget;
  final Widget onLoadingWidget;
  final Widget onErrorWidget;

  const ChangeStateWidget(
      {super.key,
      required this.itemsState,
      required this.onSuccessWidget,
      required this.onLoadingWidget,
      required this.onErrorWidget});

  @override
  Widget build(BuildContext context) {
    if (itemsState.isLoading) {
      return onLoadingWidget;
    }
    if (itemsState.error?.isNotEmpty ?? false) {
      return onErrorWidget;
    }
    if (itemsState.items != null) {
      return onSuccessWidget;
    }

    return const SizedBox.shrink();
  }
}






















//       //  else {
//         // SchedulerBinding.instance.addPostFrameCallback((timeStamp) =>
//         //     showSnackBarMessage(context,
//         //         message: dataState
//         //             .exceptionResponse?.exceptionMessages.firstOrNull));
//       //   return const Center(
//       //     child: Text("Error Ocuured"),
//       //   );
//       // }