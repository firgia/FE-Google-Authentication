part of login_view;

class _LoginButton extends GetView<LoginController> {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton.icon(
        onPressed: controller.isLoading.value ? null : () => controller.login(),
        icon: Icon(FontAwesomeIcons.google),
        label: controller.isLoading.value
            ? SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              )
            : Text("Login With Google"),
      ),
    );
  }
}
