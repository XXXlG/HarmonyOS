import router from '@ohos.router';

@Entry
@Component
struct SimpleContacts {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
  })
  build() {
    Column(){
      Text('注册').margin({top:200,bottom:20}).fontSize(50).
      fontWeight(FontWeight.Lighter).fontColor(Color.Gray)
      TextInput({ placeholder: '账号' }).margin({ top: 20 })
        .onSubmit((EnterKeyType)=>{
          console.info(EnterKeyType+'输入法回车键的类型值')
        })
      TextInput({ placeholder: '密码' }).type(InputType.Password).margin({ top: 20 })
        .onSubmit((EnterKeyType)=>{
          console.info(EnterKeyType+'输入法回车键的类型值')
        })
      TextInput({ placeholder: '确认密码' }).type(InputType.Password).margin({ top: 20 })
        .onSubmit((EnterKeyType)=>{
          console.info(EnterKeyType+'输入法回车键的类型值')
        })
      Row(){
        Button('确认').width(150).margin({ top: 20 }).onClick(()=>{
          this.dialogController.open()
          onJumpClick()
        })
        Button('取消').width(150).margin({ top: 20 ,left:20}).onClick(()=>{
          onJumpClick()
        })
      }.margin({bottom:300})
    }.backgroundImage($r('app.media.beijng')).backgroundImageSize(1).padding(20)
  }
}
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({}),
  })

  build() {
    Column() {
      Text('注册成功')
        .fontSize(20)
        .margin({ top: 25, bottom: 10 })
    }.padding(20)
  }
}
function onJumpClick(): void {
  router.pushUrl({
    url: 'pages/Login' // 目标url
  }, router.RouterMode.Standard, (err) => {
    if (err) {
      console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
      return;
    }
    console.info('Invoke pushUrl succeeded.');
  });
}
