import { BuilderNameConstants, builderRouterModel, RouterModule, RouterNameConstants} from 'routermodule'

@Builder
export function homePageBuilder(){
  homePage()
}

@Component
export struct homePage{
  @StorageLink('userName') userName:string='游客10086'
  private selectedDate: Date = new Date()

  build() {
    NavDestination(){
      Stack({alignContent:Alignment.Top}){
        Row(){
          Text(`${this.userName}的日记`).margin({left:20})
          Image($r('app.media.xinjian1')).width(30).margin({right:30})
            .onClick(()=>{
               if(this.userName=='游客10086'){
                 builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.LOGIN_LOGINFEATURE)
               }else{
                //日历弹窗
                CalendarPickerDialog.show({
                  selected:this.selectedDate,
                  onAccept:(value:Date)=>{
                    builderRouterModel(RouterNameConstants.ENTRY_HAP,BuilderNameConstants.HOME_EDITPAGE,value)
                    console.log('数据'+value)
                  }
                })
               }
            })
        }
        .width('100%')
        .height(50)
        .backgroundColor(Color.Pink)
        .justifyContent(FlexAlign.SpaceBetween)
      }
    }
    .hideTitleBar(true)
  }

}

const builderName=BuilderNameConstants.HOME_HOME
if(!RouterModule.getBuilder(builderName)){
  let builder:WrappedBuilder<[object]>=wrapBuilder(homePageBuilder)
  RouterModule.registerBuilder(builderName,builder)
  console.log('注册页面成功：'+builderName)
}