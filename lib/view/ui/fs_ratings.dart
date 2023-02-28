import 'package:flutter/material.dart';

class FSRating extends StatelessWidget {
  double rating = 0.0;

  FSRating({
    super.key,
    this.rating = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildStarts(rating);
  }
}

Widget _buildStarts(double rating) {
  List<Widget> _list = [];

  for (double i = 1; i <= 5; i++) {
    if (rating >= i) {
      _list.add(
        const Icon(
          Icons.star_outlined,
        ),
      );
    } else if (rating >= i - 0.1 && rating <= (i + 1) - 0.9) {
      _list.add(
        const Icon(
          Icons.star_half_rounded,
        ),
      );
    } else {
      _list.add(
        const Icon(
          Icons.star_border_rounded,
        ),
      );
    }
  }

  if (_list.isNotEmpty) {
    return Row(children: _list);
  }

  return Row(
    children: const [
      Icon(
        Icons.star_border_rounded,
      ),
      Icon(
        Icons.star_border_rounded,
      ),
      Icon(
        Icons.star_border_rounded,
      ),
      Icon(
        Icons.star_border_rounded,
      ),
      Icon(
        Icons.star_border_rounded,
      ),
    ],
  );
}
