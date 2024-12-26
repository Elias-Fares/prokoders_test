part of '../login_screen.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading,
    this.width,
    this.color,
    this.borderRaduis,
    this.border,
    this.textStyle,
  });
  final String title;
  final void Function()? onTap;
  final bool? isLoading;
  final double? width;
  final Color? color;
  final BorderRadius? borderRaduis;
  final Border? border;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).primaryColor,
      borderRadius: borderRaduis ?? BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: !(isLoading ?? false) ? onTap : () {},
        child: Container(
          height: 55,
          width: width ?? MediaQuery.of(context).size.width * 0.75,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: border,
              borderRadius: borderRaduis ?? BorderRadius.circular(50)),
          child: !(isLoading ?? false)
              ? Text(
                  title,
                  style: textStyle ??
                      const TextStyle(color: Colors.white, fontSize: 18),
                )
              : const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                    strokeCap: StrokeCap.round,
                  ),
                ),
        ),
      ),
    );
  }
}
