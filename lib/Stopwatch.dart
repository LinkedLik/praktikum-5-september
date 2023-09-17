import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget{
  final String name;
  final String email;
  const StopWatch({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class StopWatchState extends State<StopWatch> {
  bool isTicking = true;
  int seconds = 0;
  int miliseconds = 100;
  late Timer timer;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  /* void initState(){
    super.initState();
    isTicking = true;
    seconds = 0;
    timer = Timer.periodic(
        Duration(seconds: 1),
            _onTick
    );
  }
*/

  void _onTick(Timer time){
    setState(() {
      miliseconds += 100;
    });
  }

  // String _secondsString() => seconds == 1 ? 'second' : 'seconds';
  String _secondsString(int milliseconds) {
    final seconds = milliseconds/1000;
    return '$seconds seconds';
    }

  void dispose(){
    timer.cancel();
    super.dispose();
  }



  void _startTimer(){
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer(){
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _resetTimer(){
    //timer.cancel();
    setState(() {
      miliseconds = 0;
    });
  }

  void _lap(){
    setState(() {
      laps.add(miliseconds);
      _resetTimer();
    });

    scrollController.animateTo(
        itemHeight * laps.length,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn);
  }



  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: buildCounter(context)),
          Expanded(child: _buildLapDisplay())
        ],
      ),
    );
  }

  Widget buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lap ${laps.length + 1}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color : Colors.white)
          ),
          Text(
            _secondsString(miliseconds),
            style: Theme.of(context).textTheme.titleMedium,
          ),


          buildControls(),
        ]
      ),
    );
  }

  Widget buildControls() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                ),
                onPressed: () => _startTimer(),
                child: Text('Start'),
              ),
              SizedBox(width: 20),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                  ),
                  onPressed: () => _stopTimer(),
                  child: Text('Stop')
              ),
              SizedBox(width: 20),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                  ),
                  onPressed: isTicking ? _lap : null,
                  child: Text('Lap'))
            ]
        );
  }

  Widget _buildLapDisplay(){
    return Scrollbar(
        child: ListView.builder(
          controller: scrollController,
          itemCount: laps.length,
          itemBuilder: (context, index){
        final milliseconds = laps[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 50),
          title: Text('Lap ${index + 1}'),
          trailing: Text(_secondsString(milliseconds)),
          );
        },
      ),
    );
  }
}