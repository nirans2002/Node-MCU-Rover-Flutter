import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incepto_rover/controls.dart';
import 'package:holding_gesture/holding_gesture.dart';

class Forward_button extends StatelessWidget {
  Forward_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      holdTimeout: Duration(milliseconds: 50),
      enableHapticFeedback: true,
      onCancel: () {
        stop_motors(context);
        print("cancelled");
      },
      onHold: () {
        forward(context);
      },
      child: SizedBox(
        height: 80,
        width: 150,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(color: Colors.cyan, width: 2),
          ),
          onPressed: () {
            forward(context);
            HapticFeedback.lightImpact();
          },
          onLongPress: () {
            forward(context);
            HapticFeedback.lightImpact();
          },
          child: Text(
            'Forward',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Backward_button extends StatelessWidget {
  Backward_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      holdTimeout: Duration(milliseconds: 50),
      enableHapticFeedback: true,
      onCancel: () {
        stop_motors(context);
        // print\("cancelled"\);
      },
      onHold: () {
        backward(context);
      },
      child: SizedBox(
        height: 80,
        width: 150,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(color: Colors.cyan, width: 2),
          ),
          onPressed: () {
            backward(context);
            HapticFeedback.lightImpact();
          },
          onLongPress: () {
            backward(context);
            HapticFeedback.lightImpact();
          },
          child: Text(
            'Backward',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Right_button extends StatelessWidget {
  const Right_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      holdTimeout: Duration(milliseconds: 50),
      enableHapticFeedback: true,
      onCancel: () {
        stop_motors(context);
        // print\("cancelled"\);
      },
      onHold: () {
        right(context);
      },
      child: SizedBox(
        height: 80,
        width: 150,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(color: Colors.cyan, width: 2),
          ),
          onPressed: () {
            right(context);
            HapticFeedback.lightImpact();
          },
          onLongPress: () {
            right(context);
            HapticFeedback.lightImpact();
          },
          child: Text(
            'Right',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Left_button extends StatelessWidget {
  const Left_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      holdTimeout: Duration(milliseconds: 50),
      enableHapticFeedback: true,
      onCancel: () {
        stop_motors(context);
        // print\("cancelled"\);
      },
      onHold: () {
        left(context);
      },
      child: SizedBox(
        height: 80,
        width: 150,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(color: Colors.cyan, width: 2),
          ),
          onPressed: () {
            left(context);
            HapticFeedback.lightImpact();
          },
          onLongPress: () {
            HapticFeedback.lightImpact();
          },
          child: Text(
            'Left',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Twist_Left_button extends StatelessWidget {
  const Twist_Left_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      holdTimeout: Duration(milliseconds: 50),
      enableHapticFeedback: true,
      onCancel: () {
        stop_motors(context);
        // print\("cancelled"\);
      },
      onHold: () {
        twist_left(context);
      },
      child: SizedBox(
        height: 80,
        width: 100,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(color: Colors.orangeAccent, width: 2),
          ),
          onPressed: () {
            twist_left(context);
            HapticFeedback.lightImpact();
          },
          onLongPress: () {
            HapticFeedback.lightImpact();
          },
          child: Icon(
            Icons.rotate_left_rounded,
            size: 40,
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }
}

class Twist_Right_button extends StatelessWidget {
  const Twist_Right_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      holdTimeout: Duration(milliseconds: 50),
      enableHapticFeedback: true,
      onCancel: () {
        stop_motors(context);
        // print\("cancelled"\);
      },
      onHold: () {
        twist_right(context);
      },
      child: SizedBox(
        height: 80,
        width: 100,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(color: Colors.orangeAccent, width: 2),
          ),
          onPressed: () {
            twist_right(context);
            HapticFeedback.lightImpact();
          },
          onLongPress: () {
            HapticFeedback.lightImpact();
          },
          child: Icon(
            Icons.rotate_right_rounded,
            size: 40,
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }
}

class Stop_button extends StatelessWidget {
  const Stop_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      holdTimeout: Duration(milliseconds: 50),
      enableHapticFeedback: true,
      onCancel: () {
        stop_motors(context);
        //// print\("cancelled"\);
      },
      onHold: () {
        stop_motors(context);
      },
      child: SizedBox(
        height: 80,
        width: 150,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(color: Colors.red, width: 2),
          ),
          onPressed: () {
            stop_motors(context);
            HapticFeedback.lightImpact();
          },
          onLongPress: () {
            HapticFeedback.lightImpact();
          },
          child: Text(
            'Stop',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
