import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

enum Direction { up, down, left, right }

class SnakeGameScreen extends StatefulWidget {
  const SnakeGameScreen({super.key});

  @override
  State<SnakeGameScreen> createState() => _SnakeGameScreenState();
}

class _SnakeGameScreenState extends State<SnakeGameScreen> {
  static const int gridColumns = 20;
  static const int gridRows = 20;

  List<Offset> snakePositions = [
    const Offset(5, 5),
    const Offset(4, 5),
    const Offset(3, 5),
  ];
  Offset foodPosition = const Offset(10, 10);
  Direction currentDirection = Direction.right;
  Timer? gameTimer;
  bool isPlaying = false;
  int score = 0;
  int _frameCount = 0;
  static const int _framesPerMove = 6;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) { 
      if (event.logicalKey == LogicalKeyboardKey.arrowUp ||
          event.logicalKey == LogicalKeyboardKey.keyW) {
        if (currentDirection != Direction.down) {
          setState(() {
            currentDirection = Direction.up;
          });
        }
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown ||
          event.logicalKey == LogicalKeyboardKey.keyS) {
        if (currentDirection != Direction.up) {
          setState(() {
            currentDirection = Direction.down;
          });
        }
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
          event.logicalKey == LogicalKeyboardKey.keyA) {
        if (currentDirection != Direction.right) {
          setState(() {
            currentDirection = Direction.left;
          });
        }
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
          event.logicalKey == LogicalKeyboardKey.keyD) {
        if (currentDirection != Direction.left) {
          setState(() {
            currentDirection = Direction.right;
          });
        }
      }
      return KeyEventResult.handled; 
    }
    return KeyEventResult.ignored; 
  }

  void startGame() {
    setState(() {
      snakePositions = [
        const Offset(5, 5),
        const Offset(4, 5),
        const Offset(3, 5),
      ];
      currentDirection = Direction.right;
      score = 0;
      generateNewFood();
      isPlaying = true;
      _frameCount = 0;
    });

    gameTimer?.cancel();
    gameTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (isPlaying) {
        _frameCount++;
        if (_frameCount % _framesPerMove == 0) {
          moveSnake();
          _frameCount = 0;
        }
        setState(() {});
      }
    });
  }

  void generateNewFood() {
    Random random = Random();
    int newFoodX = random.nextInt(gridColumns);
    int newFoodY = random.nextInt(gridRows);
    foodPosition = Offset(newFoodX.toDouble(), newFoodY.toDouble());

    while (snakePositions.contains(foodPosition)) {
      newFoodX = random.nextInt(gridColumns);
      newFoodY = random.nextInt(gridRows);
      foodPosition = Offset(newFoodX.toDouble(), newFoodY.toDouble());
    }
  }

  void moveSnake() {
    Offset newHead;
    switch (currentDirection) {
      case Direction.up:
        newHead = Offset(snakePositions.first.dx, snakePositions.first.dy - 1);
        break;
      case Direction.down:
        newHead = Offset(snakePositions.first.dx, snakePositions.first.dy + 1);
        break;
      case Direction.left:
        newHead = Offset(snakePositions.first.dx - 1, snakePositions.first.dy);
        break;
      case Direction.right:
        newHead = Offset(snakePositions.first.dx + 1, snakePositions.first.dy);
        break;
    }

    newHead = Offset(
      (newHead.dx + gridColumns) % gridColumns,
      (newHead.dy + gridRows) % gridRows,
    );

    bool collidedWithSelf = false;

    for (int i = 0; i < snakePositions.length; i++) {
      if (snakePositions[i] == newHead) {
        collidedWithSelf = true;
        break;
      }
    }

    snakePositions.insert(0, newHead);

    if (collidedWithSelf) {
      if (snakePositions.length > 1) {
        int collisionIndex = snakePositions.indexOf(newHead, 1);
        if (collisionIndex != -1) {
          snakePositions = snakePositions.sublist(0, collisionIndex + 1);
        } else {
          snakePositions = [newHead];
        }
      } else {
        gameOver();
        return;
      }
    } else if (newHead == foodPosition) {
      score++;
      generateNewFood();
    } else {
      snakePositions.removeLast();
    }
  }

  void gameOver() {
    gameTimer?.cancel();
    isPlaying = false;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('O\'yin tugadi!'),
          content: Text('Sizning ochkoyingiz: $score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                startGame();
              },
              child: const Text('Qayta o\'ynash'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double gamePadHeight = 150.0;

    final double appBarHeight = AppBar().preferredSize.height;
    final double availableWidth = size.width;
    final double availableHeight = size.height - appBarHeight - gamePadHeight;

    final double blockWidth = availableWidth / gridColumns;
    final double blockHeight = availableHeight / gridRows;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Focus(
        autofocus: true,
        onKeyEvent: _handleKeyEvent, 
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/grass.jpg'),
                    repeat: ImageRepeat.repeat,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: availableHeight,
              child: Stack(
                children: [
                  Positioned(
                    left: foodPosition.dx * blockWidth,
                    top: foodPosition.dy * blockHeight,
                    child: Image.asset(
                      'assets/images/rabbit.png',
                      fit: BoxFit.contain,
                      width: blockWidth * 1.5,
                      height: blockHeight * 1.5,
                    ),
                  ),
                  ...snakePositions.asMap().entries.map((entry) {
                    int index = entry.key;
                    Offset position = entry.value;

                    double rotationAngle = 0;
                    if (index == 0) {
                      switch (currentDirection) {
                        case Direction.up:
                          rotationAngle = -pi / 2;
                          break;
                        case Direction.down:
                          rotationAngle = pi / 2;
                          break;
                        case Direction.left:
                          rotationAngle = pi;
                          break;
                        case Direction.right:
                          rotationAngle = 0;
                          break;
                      }
                    } else {
                      Offset currentSegment = snakePositions[index];
                      Offset prevSegment = snakePositions[index - 1];

                      if (currentSegment.dx == prevSegment.dx) {
                        rotationAngle = pi / 2;
                      } else if (currentSegment.dy == prevSegment.dy) {
                        rotationAngle = 0;
                      }
                    }

                    return Positioned(
                      left: position.dx * blockWidth,
                      top: position.dy * blockHeight,
                      child: Transform.rotate(
                        angle: rotationAngle,
                        child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(128, 0, 0, 0),
                                blurRadius: 8.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            fit: BoxFit.fill,
                            index == 0
                                ? 'assets/images/snake_head.png'
                                : 'assets/images/snake_body.png',
                            width: blockWidth * 1.3,
                            height: blockHeight * 1.3,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Opacity(
                  opacity: 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (currentDirection != Direction.right) {
                            setState(() {
                              currentDirection = Direction.left;
                            });
                          }
                        },
                        icon: const Icon(Icons.arrow_left,
                            color: Colors.white, size: 60),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (currentDirection != Direction.down) {
                                setState(() {
                                  currentDirection = Direction.up;
                                });
                              }
                            },
                            icon: const Icon(Icons.arrow_drop_up,
                                color: Colors.white, size: 60),
                          ),
                          const SizedBox(height: 70),
                          IconButton(
                            onPressed: () {
                              if (currentDirection != Direction.up) {
                                setState(() {
                                  currentDirection = Direction.down;
                                });
                              }
                            },
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.white, size: 60),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          if (currentDirection != Direction.left) {
                            setState(() {
                              currentDirection = Direction.right;
                            });
                          }
                        },
                        icon: const Icon(Icons.arrow_right,
                            color: Colors.white, size: 60),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: appBarHeight + 10,
              left: 20,
              child: Text(
                'Ball: $score',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}