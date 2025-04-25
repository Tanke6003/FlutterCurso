import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls screen')),
      body: _UIControlsView(),
    );
  }
}

enum Trasportation { car, bus, bike, train }

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

bool isDeveloperMode = false;
bool wantsToBeNotified = false;
bool wantsToSeeAds = false;
bool wantsToSeeFeedback = false;

Trasportation selectedTrasportation = Trasportation.car;

class _UIControlsViewState extends State<_UIControlsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Show the developer menu'),
          value: isDeveloperMode,
          onChanged:
              (value) => setState(() {
                isDeveloperMode = value;
              }),
        ),
        ExpansionTile(
          title: Text('Select your trasportation mode'),
          subtitle: Text(
            'Select your trasportation mode $selectedTrasportation',
          ),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text(
                'Select this option if you are going by car',
              ),
              value: Trasportation.car,
              groupValue: selectedTrasportation,
              onChanged:
                  (value) => setState(() {
                    selectedTrasportation = Trasportation.car;
                  }),
            ),
            RadioListTile(
              title: const Text('Bus'),
              subtitle: const Text(
                'Select this option if you are going by bus',
              ),
              value: Trasportation.bus,
              groupValue: selectedTrasportation,
              onChanged:
                  (value) => setState(() {
                    selectedTrasportation = Trasportation.bus;
                  }),
            ),
            RadioListTile(
              title: const Text('Bike'),
              subtitle: const Text(
                'Select this option if you are going by bike',
              ),
              value: Trasportation.bike,
              groupValue: selectedTrasportation,
              onChanged:
                  (value) => setState(() {
                    selectedTrasportation = Trasportation.bike;
                  }),
            ),
            RadioListTile(
              title: const Text('Train'),
              subtitle: const Text(
                'Select this option if you are going by train',
              ),
              value: Trasportation.train,
              groupValue: selectedTrasportation,
              onChanged:
                  (value) => setState(() {
                    selectedTrasportation = Trasportation.train;
                  }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Wants to be notified'),
          subtitle: const Text('Wants to be notified'),
          value: wantsToBeNotified,
          onChanged:
              (value) => setState(() {
                wantsToBeNotified = value!;
              }),
        ),
        CheckboxListTile(
          title: const Text('Wants to see ads'),
          subtitle: const Text('Wants to see ads'),
          value: wantsToSeeAds,
          onChanged:
              (value) => setState(() {
                wantsToSeeAds = value!;
              }),
        ),
        CheckboxListTile(
          title: const Text('Wants to see feedback'),
          subtitle: const Text('Wants to see feedback'),
          value: wantsToSeeFeedback,
          onChanged:
              (value) => setState(() {
                wantsToSeeFeedback = value!;
              }),
        ),
      ],
    );
  }
}
