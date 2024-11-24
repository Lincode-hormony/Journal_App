import { BuilderNameConstants, builderRouterModel, RouterModule, RouterNameConstants } from "routermodule"

@Builder
export function loginPage(){
  NavDestination(){
    Column(){
      Text('登录功能')
        .onClick(() => {
          builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
        })
    }
  }
  .hideTitleBar(true)
}

const builderName = BuilderNameConstants.LOGIN_LOGINPAGE;
if (!RouterModule.getBuilder(builderName)) {
  const builder: WrappedBuilder<[object]> = wrapBuilder(loginPage);
  RouterModule.registerBuilder(builderName, builder);
  console.log('注册页面成功：'+builderName)
}
