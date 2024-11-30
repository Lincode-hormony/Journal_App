import { expect } from '@ohos/hypium'
import { router } from '@kit.ArkUI';

@CustomDialog
export struct PrivateDialog{
  controller:CustomDialogController=  new CustomDialogController({'builder': ''});//new 一个控制器并获取
  cansel:Function=()=>{}
  confirm:Function=()=>{}


  build() {
    Column(){
      Text('欢迎来到流年记！')
        .width('93.3%')
        .fontColor('#182431')
        .fontSize(px2vp(fp2px(20)))
        .textAlign(TextAlign.Center)
        .fontWeight(600)
        .margin({
          top: 24,
          bottom: 12
        })
      Text('我们充分尊重用户的隐私权，按照法律要求和行业成熟的安全标准，为您的个人信息提供适当的安全保护措施。')
        .fontSize(px2vp(fp2px(18)))
        .width('90%')
      Text('隐私协议保护声明')
        .width('90%')
        .fontColor('#007dff')
        .fontSize(px2vp(fp2px(18)))
        .onClick(()=>{
          router.pushUrl({
            url:'pages/PrivacyPage'
          })
          this.controller.close()
        })

      Text('（以下简称“本声明”）帮助您了解我们如何收集、使用、披露、保护、存储和传输您的个人数据。请仔细阅读本声明。如果您有任何疑问，请告诉我们。')
        .width('90%')
        .fontColor('#182431')
        .fontSize(px2vp(fp2px(18)))
        .opacity(0.6)
        .margin({ bottom: 24 })
      Row() {
        Text('不同意')
          .fancy()
          .onClick(() => {
            this.cansel()
          })
        Blank()
          .backgroundColor('#F5F5F5')
          .width(1)
          .height(32)
        Text('同意')
          .fancy()
          .onClick(() => {
            this.confirm()
          })
      }
      .margin({ bottom: '3.1%' })
    }
    .width('93.3%')
    .borderRadius(24)
    .backgroundColor(Color.White)
  }
}


// Common text styles.
@Extend(Text) function fancy () {
  .fontColor('#007dff')
  .fontSize(px2vp(fp2px(16)))
  .textAlign(TextAlign.Center)
  .fontWeight(FontWeight.Medium)
  .layoutWeight(1)
}
