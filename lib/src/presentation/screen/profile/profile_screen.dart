import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/domain/entity/user_response_entity.dart';
import 'package:learning/src/presentation/dialogs/sign_out_confirmation_dialog.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../router/routes.dart';
import 'widgets/profile_row_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AuthBloc>().add(GetUserProfileEvent());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessSignOutState) {
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
        }
      },
      builder: (context, state) {
        UserDataEntity? user;
        if (state is SuccessGetUserProfileState) {
          user = state.userDataEntity;
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Akun Saya'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.editProfile,
                      arguments: user);
                },
                child: const Text('Edit'),
              ),
            ],
          ),
          body: ListView(
            children: [
              ProfileRowWidget(
                title: 'Nama Lengkap',
                value: user?.userName ?? 'Arief Irwansyah',
              ),
              ProfileRowWidget(
                title: 'Email',
                value: user?.userEmail ?? 'ariefirwansyah@gmail.com',
              ),
              const ProfileRowWidget(
                title: 'Jenis Kelamin',
                value: 'Laki - laki',
              ),
              const ProfileRowWidget(
                title: 'Kelas',
                value: 'XII - IPA',
              ),
              const ProfileRowWidget(
                title: 'Sekolah',
                value: 'SMAN 5 Surabaya',
              ),
              ElevatedButton(
                onPressed: () {
                  // BottomSheet
                  // SignOutConfirmationBottomSheet.show(context);

                  // Dialog
                  SignOutConfirmationDialog.show(context);
                },
                child: const Text('Keluar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
