import 'package:flutter/material.dart';

import 'package:task1/model/store.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreCard extends StatelessWidget {
  const StoreCard(this.store, {super.key});
  final Store store;

  Widget storeLogo() {
    FadeInImage logo = FadeInImage.memoryNetwork(
        placeholder: kTransparentImage, image: store.logo);
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          child: logo,
        ),
      ),
    );
  }

  Widget storeInfo(context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              store.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, letterSpacing: -0.3),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  size: 14,
                  color: Color(0xFFFF9900),
                ),
                Text(
                  store.rating.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF979797),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // up to ##%
                Text(
                  "Up to ${store.percent_now}%",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600),
                ),
                const Padding(padding: EdgeInsets.only(left: 5)),
                // was ##%
                Text(
                    store.percent_old.isNotEmpty
                        ? "was ${store.percent_old}%"
                        : '',
                    style: const TextStyle(
                        color: Color(0xFF979797),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 170,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFDADADA), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(store.url));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              storeLogo(),
              const Padding(padding: EdgeInsets.only(top: 9)),
              storeInfo(context),
            ],
          ),
        ),
      ),
    );
  }
}
