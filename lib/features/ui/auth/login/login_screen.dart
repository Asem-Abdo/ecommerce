import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/config/di/di.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/dialog_utils.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:ecommerce/features/ui/auth/register/register_screen.dart';
import 'package:ecommerce/features/ui/auth/states/auth_states.dart';
import 'package:ecommerce/features/widgets/custom_elevated_botton.dart';
import 'package:ecommerce/features/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController(
    text: 'asem123@gmail.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'Asem@123',
  );

  bool isPasswordHidden = true;

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Waiting...');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            posActionName: 'Ok',
            title: 'Error',
          );
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: 'Login Success',
            title: 'Success',
            posActionName: 'Ok',
          );
        }
      },

      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 91.h,
                  bottom: 87.h,
                  left: 97.w,
                  right: 97.w,
                ),
                child: Image.asset(AppAssets.appBarLeading),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AutoSizeText(
                      'Welcome Back',
                      style: AppStyles.semi24White,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      'Please sign in with your mail',
                      style: AppStyles.light16White,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Email', style: AppStyles.medium18White),
                            SizedBox(height: 24.h),
                            CustomTextFormField(
                              isPassword: false,
                              keyboardType: TextInputType.text,
                              isObscureText: false,
                              hintText: 'Enter your Email',
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: _emailController,
                              validator: Validators.validateEmail,
                            ),
                            SizedBox(height: 32.h),
                            Text('Password', style: AppStyles.medium18White),
                            SizedBox(height: 24.h),
                            CustomTextFormField(
                              isPassword: isPasswordHidden,
                              keyboardType: TextInputType.visiblePassword,
                              isObscureText: true,
                              hintText: 'Enter your password',
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              controller: _passwordController,
                              validator: Validators.validatePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordHidden = !isPasswordHidden;
                                  });
                                },
                                icon: isPasswordHidden
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: AppStyles.regular18White,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35.h),
                              child: CustomElevatedBotton(
                                text: 'Login',
                                backGroundColor: AppColors.whiteColor,
                                textStyle: AppStyles.semi20Primary,
                                onPressed: () {
                                  viewModel.login(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t have an account? ',
                                    style: AppStyles.medium18White,
                                    textAlign: TextAlign.center,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Create Account',
                                      style: AppStyles.medium18White,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
