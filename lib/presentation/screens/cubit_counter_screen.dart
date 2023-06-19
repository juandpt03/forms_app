import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter-cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubicCounterView(),
    );
  }
}

class _CubicCounterView extends StatelessWidget {
  const _CubicCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            icon: const Icon(
              Icons.refresh_rounded,
            ),
          )
        ],
        title: context.select(
            (CounterCubit value) => Text('${value.state.transactionCount}')),
      ),
      body: Center(
        child:
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
          return Text("${state.counter}");
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '3',
            onPressed: () {
              context.read<CounterCubit>().increaseBy(3);
            },
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              context.read<CounterCubit>().increaseBy(2);
            },
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              context.read<CounterCubit>().increaseBy(1);
            },
            child: const Text('+1'),
          )
        ],
      ),
    );
  }
}
