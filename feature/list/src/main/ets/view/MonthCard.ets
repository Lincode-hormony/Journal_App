@Component
export struct monthCard{
  @Prop cardWidth:number
  @Prop monthNum:number
  build() {
    Column(){
      Row(){
        Text(`${this.monthNum}月`).fontWeight(700).fontSize(20)
      }
      .margin({top:8,left:8})
      .width('100%')
    }
    .backgroundColor(Color.White)
    .width(this.cardWidth)
    .height(this.cardWidth)
    .borderRadius(10)
  }
}