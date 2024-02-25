import 'package:flutter/material.dart';

progressIndicator(BuildContext? context) {
  showDialog(
      barrierDismissible: false,
      context: context!,
      builder: (context) => Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 1),
        child: Center(
          child: Stack(
            children: [
              const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(width: 50, height: 50,
                        child: Icon(Icons.check_circle_outline)
                    ),),
                ],),
              ),
              Center(
                child: Container(height: 75, width: 75, color: Colors.transparent,
                  child: const CircularProgressIndicator(strokeWidth: 1.5, color: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));

}
