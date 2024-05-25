import 'package:clean_architecture/core/routes/routes.dart';
import 'package:clean_architecture/core/secrets/app_secrets.dart';
import 'package:clean_architecture/core/theme/theme.dart';
import 'package:clean_architecture/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:clean_architecture/features/auth/data/repository/auth_repository_impl.dart';
import 'package:clean_architecture/features/auth/domain/usecase/user_sign_up.dart';
import 'package:clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              AuthRemoteDateSourceImpl(
                supabase.client,
              ),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: AppTheme.dartThemeMode,
        initialRoute: '/signin',
        onGenerateRoute: (settings) => Routes.generateRout(
              settings,
            ));
  }
}
