import { BuilderNameConstants, builderRouterModel, RouterNameConstants } from "routermodule";
import {monthCard} from '../view/MonthCard'
import { display } from "@kit.ArkUI";
import { i18n } from '@kit.LocalizationKit';



@Component
export struct listPage {
  @State message: string = '月记';
  @StorageLink('userName') username:string='游客10086'
  @State waterFlowItemWidth:number=0
  @State columnGap:number=10
  @State flowMargin:number=10
  @State year:number=2024
  @State sheets:SheetInfo[]=[]

  getWaterFlow(){
    let windowWidth:number=px2vp(display.getDefaultDisplaySync().width)
    this.waterFlowItemWidth=(windowWidth-this.flowMargin*2-this.columnGap)/2
  }

  aboutToAppear(): void {
    this.getWaterFlow()
    console.log('计算卡片宽度为：'+this.waterFlowItemWidth)
    let calendar: i18n.Calendar = i18n.getCalendar("zh-Hans");
    this.year=calendar.get('year')
    let today_year=calendar.get('year')
    for (let index = 1990; index < today_year+1; index++) {
      let obj:SheetInfo={title:index.toString(),action:()=>{this.year=index}}
      this.sheets.push(obj)
    }
  }

  build() {
    if(this.username=='游客10086'){
      Column(){
        Row(){
          Text(){
            Span('请先')
            Span('登录').fontColor('#007dff').onClick(()=>{
              builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
            })
            Span('，解锁此模块功能！')
          }
        }
        .height('100%')
      }
      .width('100%')
    }
    else {
      Column(){
        Row(){
          Text(`${this.year}年`).fontWeight(700).fontSize(22).margin({left:15})
            .onClick(()=>{
              ActionSheet.show({
                title:'请选择年份',
                message:'',
                sheets:this.sheets
              })
            })
        }
        .width('100%')
        .height(50)
        .backgroundColor(Color.White)

        WaterFlow(){
          ForEach([1,2,3,4,5,6,7,8,9,10,11,12],(value:number)=>{
            FlowItem(){
              Column(){
                monthCard({cardWidth:this.waterFlowItemWidth,monthNum:value})
              }
            }
          })
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(this.columnGap)
        .margin(this.flowMargin)
        .rowsGap(10)
      }
      .backgroundColor('#b3ececec')
    }
  }
}
