import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 110,
      child: Card(
        margin: const EdgeInsets.all(2),
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
            // side: BorderSide(color: Color(0xFFDADADA), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        color: const Color(0xFFE5F8FF),
        child: Container(
          margin: const EdgeInsets.all(17),
          child: Row(
            children: [
              SvgPicture.asset('assets/icon_friends.svg'),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Invite your friends!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF262626)),
                      ),
                      Text(
                        'To earn extra cashback when they spend at Redim merchant locations',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF5B5B5B)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 44,
                width: 44,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF25BAFB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      'assets/right_arrow.svg',
                      color: Colors.white,
                      semanticsLabel: 'Invite Friends',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
