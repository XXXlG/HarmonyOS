import router from '@ohos.router';

import util from '@ohos.util';
@Entry
@Component
struct Index {
  @State res: Array<string>=['洗衣服','LoL','学习1','学习2','学习3','学习4','学习5','学习6','学习7','学习8','学习9','学习10']
  @State add_res:string=''
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
  })
  dialogController_2: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample_2(),
  })
  build() {
      List() {
        ListItem() {
          Row() {
            Button('注销').width(150).margin({ top: 20 }).onClick(() => {
              onJumpClick()
            })
            Button('保存').width(150).margin({ top: 20, left: 10 }).onClick(() => {
              this.dialogController_2.open()
            })
          }
        }
        ForEach(this.res, (item: string) => {
          ListItem() {
            Row() {
              if(item!='') {
                Text(item)
                  .width(240)
                  .height(40)
                  .backgroundColor(0xF1F3F5)
                  .margin({ right: 20, left: 10 })
                  .borderRadius(10)
                  .padding({ left: 10 })
                Button('X', { type: ButtonType.Normal, stateEffect: true })
                  .onClick(() => {
                    this.res[0] = '';
                  })
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width(40)
                  .height(40)
                  .fontSize(19)
                  .padding(0)
              }
            }
            .margin({ top: 20 })
            .justifyContent(FlexAlign.Start)
          }
        }, (item: string) => item)
        ListItem() {
          Row() {
            TextInput({text: this.add_res,placeholder: '添加事件' })
              .width(245)
              .height(40)
              .backgroundColor(0xF1F3F5)
              .margin({ right: 20, top: 20 })
              .borderRadius(20)
              .onChange((value: string) => {
                this.add_res = value
              })

            Button('+', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width(40)
              .height(40)
              .fontSize(30)
              .padding(0)
              .margin({ top: 20 })
              .onClick(() => {
                if (this.add_res != '')
                  this.res.push(this.add_res)
                else
                  this.dialogController.open()
                this.add_res=''
              })

          }.margin({left:5})
        }
      }.scrollBar(BarState.Auto).padding(20)
      .backgroundImage($r('app.media.beijng')).backgroundImageSize(1).padding(20)
  }
}
//弹窗
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({}),
  })

  build() {
    Column() {
      Text('不可添加空事件!')
        .fontSize(20)
        .margin({ top: 25, bottom: 10 })
    }
  }
}
@CustomDialog
struct CustomDialogExample_2 {
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({}),
  })

  build() {
    Column() {
      Text('保存成功')
        .fontSize(20)
        .margin({ top: 25, bottom: 10 })
    }
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
