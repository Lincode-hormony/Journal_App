import { BuilderNameConstants, builderRouterModel, RouterModule, RouterNameConstants} from 'routermodule'

@Builder
export function editPageBuilder(value:object){
  NavDestination(){
    Column(){
      Row(){
        Text('<-')
          .onClick(()=>{
            RouterModule.getRouter(RouterNameConstants.ENTRY_HAP).pop()
          })
        Text(){
          Span(JSON.stringify(value).substring(1,5)+'年')
          Span(JSON.stringify(value).substring(6,8)+'月')
          Span(JSON.stringify(value).substring(9,11)+'日')
        }
        Image($r('app.media.xinjian1')).width(20)
          .onClick(()=>{
            AlertDialog.show({
              message:'保存成功!'
            })
            RouterModule.getRouter(RouterNameConstants.ENTRY_HAP).pop()
          })

      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

      TextArea()
        .fontSize(20)
        .lineHeight(40)
        .letterSpacing(5)

    }
  }
  .hideTitleBar(true)
}


const builderName=BuilderNameConstants.HOME_EDITPAGE
if(!RouterModule.getBuilder(builderName)){
  let builder:WrappedBuilder<[object]>=wrapBuilder(editPageBuilder)
  RouterModule.registerBuilder(builderName,builder)
  console.log('注册页面成功：'+builderName)
}