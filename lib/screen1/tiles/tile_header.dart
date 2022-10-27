import 'package:flutter/material.dart';

class TileHeader extends StatefulWidget {
  const TileHeader({Key? key, required this.title, this.seeMore})
      : super(key: key);
  final String title;
  final VoidCallback? seeMore; // Good

  @override
  State<TileHeader> createState() => _TileHeaderState();
}

class _TileHeaderState extends State<TileHeader> {
  late Future<List<Widget>> listViewItems;

  _TileHeaderState();

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 24,
      // ),
      padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(
                  color: Color(0xFF262626),
                  fontStyle: FontStyle.normal,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3),
            ),
          ),
          InkWell(
            onTap: widget.seeMore ?? () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'See All',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF25BAFB),
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: Color(0xFF25BAFB),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
