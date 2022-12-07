import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero1',
      child: InkWell(
      onTap: () => GoRouter.of(context).push('/2'),
      child: SvgPicture.asset('assets/images/undraw_note_list_re_r4u9.svg')
      ),
    );
  }
}
