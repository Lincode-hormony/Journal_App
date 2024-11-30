import { router } from '@kit.ArkUI';

@Entry
@Component
struct PrivacyPage {
  @State message: string = 'Privacy Page';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('PrivacyPageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(()=>{
          router.back()
        })
    }
    .height('100%')
    .width('100%')
  }
}