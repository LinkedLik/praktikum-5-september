import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hello World!',
          style: GoogleFonts.arima(fontSize: 30),
        ),
        Text(
          'My Name is RIO',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
        ),
      ],
    );
  }
}
