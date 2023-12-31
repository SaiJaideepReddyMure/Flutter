import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final void Function()? onTap;
  const PostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Icon(Icons.done, size: 46,
      color: Theme.of(context).colorScheme.background
      ),
      ),
      
    );
  }
}