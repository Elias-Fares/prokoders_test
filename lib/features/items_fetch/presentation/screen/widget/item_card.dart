part of '../items_screen.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
    required this.id,
    required this.title,
    required this.description,
  });
  final String id;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    Widget doubleWidget(BuildContext context,
        {required String key, required String value}) {
      return Row(
        children: [
          Text(
            "$key : ",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Flexible(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsetsDirectional.only(start: 25),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 3))
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 35, top: 15, bottom: 15, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  doubleWidget(context, key: "Title", value: title),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Description : ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 18,
              bottom: 18,
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "#$id",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
