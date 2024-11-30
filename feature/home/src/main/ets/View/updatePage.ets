import { BuilderNameConstants, builderRouterModel, RouterModule, RouterNameConstants} from 'routermodule'
import {data1} from 'rdb'
import dataModel from 'rdb'

let userData:data1=new data1()

@Builder
export function updatePageBuilder(value:object){
  NavDestination(){
    Column(){
      Row(){
        Image($r('app.media.back')).width(15)
          .onClick(()=>{
            RouterModule.getRouter(RouterNameConstants.ENTRY_HAP).clear()
          })
        Text(){
          Span(userData.date.substring(0,4)+'年')
          Span(userData.date.substring(5,7)+'月')
          Span(userData.date.substring(8,10)+'日')
        }
        Image($r('app.media.xinjian1')).width(20)
          .onClick(()=>{
            //userData.date=JSON.stringify(value).substring(1,11)
            //dataModel.addData(userData)
            //dataModel.updateData(userData)
            // AlertDialog.show({
            //   message:'保存成功!'
            // })
            RouterModule.getRouter(RouterNameConstants.ENTRY_HAP).pop(userData)
          })

      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

      TextArea({placeholder:'开始记录生活...',text:userData.text})
        .fontSize(20)
        .lineHeight(40)
        .letterSpacing(5)
        .backgroundColor(Color.White)
        .onChange((value)=>{
          userData.text=value
        })

    }
  }
  .hideTitleBar(true)
  .onReady(()=>{
    userData=value as data1
  })
}


const builderName=BuilderNameConstants.HOME_UPDATEPAGE
if(!RouterModule.getBuilder(builderName)){
  let builder:WrappedBuilder<[object]>=wrapBuilder(updatePageBuilder)
  RouterModule.registerBuilder(builderName,builder)
  console.log('注册页面成功：'+builderName)
}