import { RouterModule, RouterNameConstants } from 'routermodule'
import {homePage} from 'home'
import {listPage} from 'list'
import {loginPage} from 'login'


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
        }.tabBar('日记本')
        TabContent(){
          listPage()
        }.tabBar('日记历程')
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