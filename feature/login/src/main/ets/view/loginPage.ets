import { BuilderNameConstants, builderRouterModel, RouterModule, RouterNameConstants } from "routermodule"

// @Builder
// export function loginPageBuilder(){
//   loginPage()
// }
//
// @Component
// export struct loginPage{
//   @StorageLink('userName') userName:string='游客10086'
//
//   build() {
//     NavDestination(){
//       Column(){
//         Row({space:10}){
//           Image($r('app.media.my_icon')).width(60).height(60).borderRadius(30).backgroundColor('#ffef9393').margin({left:30})
//             .onClick(()=>{
//               builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
//             })
//           if(this.userName=='游客10086'){
//             Column({space:10}){
//               Text(`你好，${this.userName}`).fontSize(20)
//               Text('点击登录').fontSize(20)
//             }
//             .onClick(()=>{
//               builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
//             })
//           }else {
//             Column({space:10}){
//               Text(`你好，${this.userName}`).fontSize(20)
//               Text('欢迎来到流年记！').fontSize(20)
//             }
//             .onClick(()=>{
//               builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
//             })
//           }
//
//         }
//         .width('100%')
//         .margin({top:40})
//
//       }
//     }
//     .hideTitleBar(true)
//   }
//
//
// }
//
// const builderName = BuilderNameConstants.LOGIN_LOGINPAGE;
// if (!RouterModule.getBuilder(builderName)) {
//   const builder: WrappedBuilder<[object]> = wrapBuilder(loginPageBuilder);
//   RouterModule.registerBuilder(builderName, builder);
//   console.log('注册页面成功：'+builderName)
// }

@Builder
export function loginPageBuilder(){
  loginPage()
}

@Component
export struct loginPage {
    @StorageLink('userName') userName:string='游客10086'

    build() {
      NavDestination(){
        Column(){
          Row({space:10}){
            Image($r('app.media.my_icon')).width(60).height(60).borderRadius(30).backgroundColor('#ffef9393').margin({left:30})
              .onClick(()=>{
                builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
              })
            if(this.userName=='游客10086'){
              Column({space:10}){
                Text(`你好，${this.userName}`).fontSize(20)
                Text('点击登录').fontSize(20)
              }
              .onClick(()=>{
                if(this.userName=='游客10086')
                builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
              })
            }else {
              Column({space:10}){
                Text(`你好，${this.userName}`).fontSize(20)
                Text('欢迎来到流年记！').fontSize(20)
              }
              .onClick(()=>{
                if(this.userName=='游客10086')
                builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
              })
            }

          }
          .width('100%')
          .margin({top:40})

        }
      }
      .hideTitleBar(true)
    }
}

const builderName = BuilderNameConstants.LOGIN_LOGINPAGE;
if (!RouterModule.getBuilder(builderName)) {
  const builder: WrappedBuilder<[object]> = wrapBuilder(loginPageBuilder);
  RouterModule.registerBuilder(builderName, builder);
  console.log('注册页面成功：'+builderName)
}