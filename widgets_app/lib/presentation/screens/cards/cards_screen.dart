import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0.0'},
  {'elevation': 1.0, 'label': 'Elevation 1.0'},
  {'elevation': 2.0, 'label': 'Elevation 2.0'},
  {'elevation': 3.0, 'label': 'Elevation 3.0'},
  {'elevation': 4.0, 'label': 'Elevation 4.0'},
  {'elevation': 5.0, 'label': 'Elevation 5.0'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) =>
                _CardType1(label: card['label'], elevation: card['elevation']),
          ),
           ...cards.map(
            (card) =>
                _CardType2(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) =>
                _CardType3(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) =>
                _CardType4(label: card['label'], elevation: card['elevation']),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.white,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}



class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;
  
  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colors.primary,
          //width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(elevation*2.5)),
      ),
      //color: Colors.white,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}



class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceVariant,
      //color: Colors.white,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ),
            Align(
              alignment: Alignment.bottomLeft,
               child: Text('$label - filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      //color: Colors.white,
      elevation: elevation,
      child: Stack(
        children: [
      
          Image.network('https://picsum.photos/id/${elevation.toInt()}/600/250',
            height:350,
            fit: BoxFit.cover,
            // fit: BoxFit.cover,
            // width: double.infinity,
            // height: 200,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              
              ),
              child: IconButton(icon: Icon(Icons.more_vert), onPressed: () {})),
          ),
          
        ],
      ),
    );
  }
}