import { BuilderNameConstants, RouterModule, RouterNameConstants } from 'routermodule'

@Builder
export function loginFeature(){
  NavDestination(){
    Column(){
      Text('这是登录注册功能')
      Button('返回首页')
        .onClick(()=>{
          RouterModule.getRouter(RouterNameConstants.ENTRY_HAP).clear()
        })
    }
  }
  .hideTitleBar(true)
}

const builderName=BuilderNameConstants.LOGIN_LOGINFEATURE
if(!RouterModule.getBuilder(builderName)){
  const builder:WrappedBuilder<[object]>=wrapBuilder(loginFeature)
  RouterModule.registerBuilder(builderName,builder)
}