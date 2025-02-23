import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrash_threads/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:thrash_threads/utils/sizeconfig.dart';


class SplashPageWrapper extends StatelessWidget {
  const SplashPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>AuthBloc()..add(CheckLoginStatusEvent()),
      child: SplashPage(),
    );
  }
}


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,AuthState>(listener: (context,state)
    {

      if(state is Authenticated){
        Navigator.pushReplacementNamed(context, '/home');
      }
      else if(state is UnAuthenticated){
        Navigator.pushReplacementNamed(context,'/login');
      }

    },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset("assets/images/Vector Smart Object 1.png")),
            ],
          ),
        ),
      ),
    );



  }
}
