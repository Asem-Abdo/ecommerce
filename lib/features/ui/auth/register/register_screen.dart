import 'package:ecommerce/config/di/di.dart';
import 'package:ecommerce/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:ecommerce/features/ui/auth/states/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validators.dart';
import '../../../widgets/custom_elevated_botton.dart';
import '../../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, AuthStates>(
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
            message: 'Register Success',
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
                  top: 85.h,
                  bottom: 47.h,
                  left: 97.w,
                  right: 96.w,
                ),
                child: Image.asset(AppAssets.appBarLeading),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Full Name', style: AppStyles.medium18White),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            isPassword: false,
                            keyboardType: TextInputType.text,
                            isObscureText: false,
                            hintText: 'Enter your full name',
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _usernameController,
                            validator: Validators.validateUserName,
                          ),
                          SizedBox(height: 32.h),
                          Text('Mobile Number', style: AppStyles.medium18White),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            isObscureText: true,
                            hintText: 'Enter your mobile number',
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _phoneNumberController,
                            validator: Validators.validatePhoneNumber,
                          ),
                          SizedBox(height: 32.h),
                          Text(
                            'E-mail address',
                            style: AppStyles.medium18White,
                          ),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            isObscureText: true,
                            hintText: 'enter your email address',
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _emailController,
                            validator: Validators.validateEmail,
                          ),
                          SizedBox(height: 32.h),
                          Text('Password', style: AppStyles.medium18White),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            isObscureText: true,
                            hintText: 'enter your password',
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _passwordController,
                            validator: Validators.validatePassword,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.visibility_off),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Text('RePassword', style: AppStyles.medium18White),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            isObscureText: true,
                            hintText: 'enter your rePassword',
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            controller: _rePasswordController,
                            validator: Validators.validatePassword,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.visibility_off),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 56.h, bottom: 30.h),
                            child: CustomElevatedBotton(
                              text: 'Sign up',
                              backGroundColor: AppColors.whiteColor,
                              textStyle: AppStyles.semi20Primary,
                              onPressed: () {
                                viewModel.register(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  phone: _phoneNumberController.text,
                                  name: _usernameController.text,
                                  rePassword: _rePasswordController.text,
                                );
                              },
                            ),
                          ),
                        ],
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
