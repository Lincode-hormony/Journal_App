import { BuilderNameConstants, builderRouterModel, RouterModule, RouterNameConstants} from 'routermodule'
import {data1} from 'rdb'
import dataModel from 'rdb'
import { display } from '@kit.ArkUI'

@Builder
export function homePageBuilder(){
  homePage()
}



@Component
export struct homePage{
  @StorageLink('userName') userName:string='游客10086'
  private selectedDate: Date = new Date()
  @State userData:data1[]=[]
  @State listHeight:number=10

 aboutToAppear(): void {
    this.getListHeight()
 }

  @Builder
  delButton(date:string) {
    Button('×')
      .fontSize(20)
      .type(ButtonType.Circle)
      .align(Alignment.Center)
      .margin({ right: 20 ,left:10})
      .backgroundColor(Color.Red)
      .onClick(() => {
        console.log('点击了删除按钮')
        dataModel.deleteData(date)
        this.userData=dataModel.getAllData()
      })
  }

startEdit(){
  CalendarPickerDialog.show({
    selected:this.selectedDate,
    onAccept:(value:Date)=>{
      builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.HOME_HOME)
      builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.HOME_EDITPAGE,value,(popInfo)=>{
        dataModel.addData(popInfo.result as data1)
        this.userData=dataModel.getAllData()
        RouterModule.getRouter(RouterNameConstants.ENTRY_HAP).pop()
      })
    }
  })
}

getListHeight(){
    let windowHeight:number=px2vp(display.getDefaultDisplaySync().height)
  this.listHeight=windowHeight-48-50-48-20
}

  build() {
    NavDestination(){
      Stack({alignContent:Alignment.Top}){
        Row(){
          Text(`${this.userName}的日记`).margin({left:20}).letterSpacing(3)
          Image($r('app.media.xinjian1')).width(30).margin({right:30})
            .onClick(()=>{
                 this.startEdit()
            })
        }
        .width('100%')
        .height(50)
        .backgroundColor(Color.White)
        .justifyContent(FlexAlign.SpaceBetween)

        if(this.userData.length==0){
          Column(){
            Column({space:20}){
              Text('暂无日记')
              Row(){
                Image($r('app.media.bianji1')).width(16)
                Text('点我开始记录吧！')
                  .fontColor('#007dff')
                  .fontSize(22)
                  .onClick(()=>{
                    this.startEdit()
                  })
              }

            }
            .margin({top:250})
          }
          .height(this.listHeight)
          .margin({top:50})
        }else{
          List(){
            ForEach(this.userData,(item:data1,index:number)=>{
              ListItem(){
                Column(){
                  Row(){
                    Text(){
                      Span(JSON.stringify(item.date).substring(1,5)+'年')
                      Span(JSON.stringify(item.date).substring(6,8)+'月')
                      Span(JSON.stringify(item.date).substring(9,11)+'日')
                    }
                  }
                  .width('100%')
                  .margin(10)

                  Text(item.text).layoutWeight(1).width('100%').align(Alignment.TopStart)
                    .fontSize(20)
                    .textOverflow({overflow:TextOverflow.None})
                    .maxLines(2)
                    .lineHeight(40)
                    .letterSpacing(4)
                    .margin({top:4})
                    //.backgroundColor(Color.Pink)

                }
                .padding(10)
                .width('95%')
                .height(140)
                .borderRadius(10)
                .margin({left:10,top:18})
                .backgroundColor(Color.White)
              }
              // .swipeAction({end:this.delButton(item.date)})
              .gesture(
                LongPressGesture()
                  .onActionEnd(()=>{
                    console.log('点击了删除按钮')
                    dataModel.deleteData(item.date)
                    this.userData=dataModel.getAllData()
                  })
              )
              .onClick(()=>{
                console.log('点击了不是删除按钮')
                console.log('查看数据:'+item.date)
                builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.HOME_HOME)
                builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.HOME_UPDATEPAGE,item,(onPop)=>{
                  dataModel.updateData(onPop.result as data1)
                  this.userData=dataModel.getAllData()
                  RouterModule.getRouter(RouterNameConstants.ENTRY_HAP).pop()
                })
              })
            })
          }
          .margin({top:50,bottom:10})
          .width('100%')
          .height(this.listHeight)
          .scrollBar(BarState.Off)
        }

      }
      .backgroundColor('#b3ececec')
    }
    .hideTitleBar(true)
    .onReady(()=>{
      this.userData=dataModel.getAllData()
    })
  }

}

const builderName=BuilderNameConstants.HOME_HOME
if(!RouterModule.getBuilder(builderName)){
  let builder:WrappedBuilder<[object]>=wrapBuilder(homePageBuilder)
  RouterModule.registerBuilder(builderName,builder)
  console.log('注册页面成功：'+builderName)
}