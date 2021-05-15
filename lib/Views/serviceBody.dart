import 'package:flutter/material.dart';

class ServiceBody extends StatefulWidget {
  @override
  _ServiceBodyState createState() => _ServiceBodyState();
}

class _ServiceBodyState extends State<ServiceBody> {
  int _amount = 0;
  int _quantity = 0;
  bool _booking = false;
  //List<Map<String, int>> selected = [];

  static Map<String, int> haircuts = {
    'Basic Haircut': 100,
    'Fade Haircut': 140,
    'Beard Trimming': 80,
    'French Beard': 120,
    'Afro Haircut': 300
  };
  List<bool> _check = [for (var i = 0; i < haircuts.length; i += 1) false];

  Widget haircutprice(String name, int price, int index) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    _check[index] = !_check[index];
                    _check[index] ? ++_quantity : --_quantity;
                    for (bool i in _check) {
                      if (i == true) {
                        _booking = true;
                        break;
                      } else {
                        _booking = false;
                        continue;
                      }
                    }
                  });
                },
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: _check[index] ? Colors.blue : Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: !_check[index]
                      ? Icon(
                          Icons.add,
                          size: 26.0,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.clear,
                          size: 26.0,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                '\u20B9 $price',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          for (int i = 0; i < haircuts.length; i++)
            haircutprice(haircuts.keys.toList()[i].toString(),
                haircuts[haircuts.keys.toList()[i].toString()], i),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 65,
            color: Colors.white38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text('$_quantity item selected',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: _booking ? Colors.white : Colors.white54,
                      )),
                ),
                InkWell(
                  onTap: () {
                    if (_booking == true) {
                      for (int i = 0; i < _check.length; i++) {
                        if (_check[i] == true) {
                          _amount = _amount + haircuts[haircuts.keys.toList()[i].toString()];
                        }
                      }
                    }
                    print(_amount);
                    //Navigator.push(context, 'appointmentScreen')
                  },
                  child: Card(
                    color: _booking ? Colors.blue : Colors.grey[850],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(38, 8, 38, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Book',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color:
                                    _booking ? Colors.white : Colors.white54),
                          ),
                          Text(
                            'Now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color:
                                    _booking ? Colors.white : Colors.white54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
