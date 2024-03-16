import 'package:flutter/material.dart';

class StackTransitionHero extends StatefulWidget {
  const StackTransitionHero({super.key});

  @override
  _StackTransitionHeroState createState() => _StackTransitionHeroState();
}

class _StackTransitionHeroState extends State<StackTransitionHero> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Stack2()));
      },
      child: Center(
        child: _buildStack1(),
      ),
    );
  }

  Widget _buildStack1() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Hero(
          tag: 'yellowBox',
          child: Container(
            color: Colors.yellow,
            width: 200,
            height: 200,
            child: Center(
              child: Text(
                'Shape 1',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Hero(
            tag: 'redBox',
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 50,
          child: Hero(
            tag: 'blueBox',
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ],
    );
  }
}

class Stack2 extends StatelessWidget {
  const Stack2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => StackTransitionHero()));
      },
      child: Center(
        child: _buildStack2(),
      ),
    );
  }

  Widget _buildStack2() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Hero(
          tag: 'yellowBox',
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
            width: 200,
            height: 200,
            child: Center(
              child: Text(
                'Shape 2',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 100,
          child: Hero(
            tag: 'redBox',
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.red,
              ),
              width: 100,
              height: 100,
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          right: 100,
          child: Hero(
            tag: 'blueBox',
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              width: 100,
              height: 100,
            ),
          ),
        ),
      ],
    );
  }
}
