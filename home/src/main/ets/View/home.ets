import { BuilderNameConstants, builderRouterModel, RouterModule, RouterNameConstants} from 'routermodule'

@Builder
export function homePage(){
  NavDestination(){
    Column(){
      Button('跳转登录按钮')
        .onClick(()=>{
          builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
        })
    }
  }
  .hideTitleBar(true)
}

const builderName=BuilderNameConstants.HOME_HOME
if(!RouterModule.getBuilder(builderName)){
  let builder:WrappedBuilder<[object]>=wrapBuilder(homePage)
  RouterModule.registerBuilder(builderName,builder)
  console.log('注册页面成功：'+builderName)
}