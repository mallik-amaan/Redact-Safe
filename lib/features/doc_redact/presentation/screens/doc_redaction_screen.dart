import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redact_safe/features/doc_redact/presentation/providers/doc_redaction_cubit.dart';
import 'package:redact_safe/features/doc_redact/presentation/providers/doc_redaction_state.dart';

class DocRedactionScreen extends StatelessWidget {
  const DocRedactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DocRedactionCubit, DocRedactionState>(
        builder: (context, state) {
          if (state is DocRedactionInit) {
            BlocProvider.of<DocRedactionCubit>(context).redactDocument();
          } else if (state is DocRedactionLoading) {
            Center(child: CircularProgressIndicator());
          } else if (state is DocRedactionError) {
            Center(child: Text(state.message));
          } else if (state is DocRedactionSuccess) {
            Center(
              child: Column(
                children: [
                  Text("Redaction Completed"),
                  TextButton(
                    onPressed: () {},
                    child: Text("Get Redacted Document"),
                  ),
                ],
              ),
            );
          }

          return Container();
        },
        listener: (context, state) {},
      ),
    );
  }
}
