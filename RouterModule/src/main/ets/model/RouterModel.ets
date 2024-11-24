import { RouterModule } from "../../../../Index"

//路由基本信息
export class RouterModel{
  //需要跳转的页面名称
  builderName:string=''
  //需要操作的页面栈
  routerName:string=''
  //需要传递的信息
  param?:object=new Object
}

//通过获取路由基本信息进行页面的跳转
export function builderRouterModel(routerName:string,builderName:string,param?:object){
  let router:RouterModel=new RouterModel()
  router.builderName=builderName
  router.routerName=routerName
  router.param=param
  RouterModule.push(router)
}