import router from '@ohos.router';
@Entry
@Component
struct Login {

  build() {
    Column() {
      Image($r('app.media.Login_top')).height(300).margin({top:100})

      TextInput({ placeholder: '账号' }).margin({ top: 20 })
        .onSubmit((EnterKeyType) => {
          console.info(EnterKeyType + '输入法回车键的类型值')
        })
      TextInput({ placeholder: '密码' }).type(InputType.Password).margin({ top: 20 })
        .onSubmit((EnterKeyType) => {
          console.info(EnterKeyType + '输入法回车键的类型值')
        })
      Row() {
        Button('登录').width(150).margin({ top: 20 }).onClick(() => {
          onJumpClick()
        })
        Button('注册').width(150).margin({ top: 20, left: 20 }).onClick(() => {
          onJumpClick_2()
        })
      }.margin({bottom:160})
    }.padding(20)
    .backgroundImage($r('app.media.beijng')).backgroundImageSize(1).padding(20)
  }

}

function onJumpClick(): void {
  router.pushUrl({
    url: 'pages/Index' // 目标url
  }, router.RouterMode.Standard, (err) => {
    if (err) {
      console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
      return;
    }
    console.info('Invoke pushUrl succeeded.');
  });
}
function onJumpClick_2(): void {
  router.pushUrl({
    url: 'pages/test' // 目标url
  }, router.RouterMode.Standard, (err) => {
    if (err) {
      console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
      return;
    }
    console.info('Invoke pushUrl succeeded.');
  });
}