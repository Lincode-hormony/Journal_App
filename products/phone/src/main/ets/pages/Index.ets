import { RouterModule, RouterNameConstants } from 'routermodule'
import {homePage} from 'home'
import {listPage} from 'list'
import {loginPage} from  'login'

// AppStorage.setOrCreate('userName','游客10086')
PersistentStorage.persistProp('userName', '游客10086');


@Entry
@Component
struct Index {

  @State appRouter:NavPathStack=new NavPathStack()

  aboutToAppear(): void {
    if(!this.appRouter){
      this.appRouter=new NavPathStack()
    }
    RouterModule.registerRouter(RouterNameConstants.ENTRY_HAP,this.appRouter)
  }

  @Builder
  routerMap(builderName:string,param:object){
    RouterModule.getBuilder(builderName).builder(param)
  }

  build() {

    Navigation(this.appRouter){
      Tabs({barPosition:BarPosition.End}){
        TabContent(){
          homePage()
        }.tabBar('日记')
        TabContent(){
          listPage()
        }.tabBar('月记')
        TabContent(){
          loginPage()
        }.tabBar('我的')
      }
      .scrollable(false)
    }
     .hideTitleBar(true)
     .navDestination(this.routerMap)
  }
}