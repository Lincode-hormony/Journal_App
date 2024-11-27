import { BuilderNameConstants, builderRouterModel, RouterModule, RouterNameConstants } from 'routermodule'

@Builder
export function loginFeatureBuilder(){
  loginFeature()
}

@Component
export struct loginFeature{
  @StorageLink('userName') userName:string='游客10086'

  build() {
    NavDestination(){
      Column({space:15}){
        Text('欢迎来到流年记！').margin({top:40})
        Text('登录后，享有更多功能体验!')
        Row(){
          Text('昵称：')
          TextInput({placeholder:'请输入昵称'}).width('80%')
            .onChange((value)=>{
              this.userName=value
            })
        }
        .margin({top:10})
        Row(){
          Text('应用密码：').fontSize(12)
          TextInput().type(InputType.Password).width('78%')
        }
        .margin({top:20})

        Button('确定')
          .onClick(()=>{
            RouterModule.getRouter(RouterNameConstants.ENTRY_HAP).clear()
          })
      }
    }
    .hideTitleBar(true)
  }

}

const builderName=BuilderNameConstants.LOGIN_LOGINFEATURE
if(!RouterModule.getBuilder(builderName)){
  const builder:WrappedBuilder<[object]>=wrapBuilder(loginFeatureBuilder)
  RouterModule.registerBuilder(builderName,builder)
}