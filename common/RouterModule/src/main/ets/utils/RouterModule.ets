import { RouterModel } from "../model/RouterModel"

export class RouterModule{
  //路由表创建
  static builderMap:Map<string,WrappedBuilder<[object]>>=new Map<string,WrappedBuilder<[object]>>()
  //路由栈的创建
  static routerMap:Map<string,NavPathStack>=new Map<string,NavPathStack>()

  //注册页面名称和页面构建函数
  public static registerBuilder(builderName:string,builder:WrappedBuilder<[object]>){
    RouterModule.builderMap.set(builderName,builder)
  }

  //通过名称获取目标页面
  public static getBuilder(builderName:string):WrappedBuilder<[object]>{
    const builder=RouterModule.builderMap.get(builderName)
    if(!builder){
      console.log('没有找到页面：'+builderName)
    }
    return builder as WrappedBuilder<[object]>
  }

  //注册路由栈
  public static registerRouter(routerName:string,router:NavPathStack){
    RouterModule.routerMap.set(routerName,router)
  }

  //根据名称获取路由栈
  public static getRouter(routerName:string):NavPathStack{
    return RouterModule.routerMap.get(routerName) as NavPathStack
  }

  //跳转到指定页面
  public static async push(router:RouterModel){
    //获取需要跳转的路由页面所在的包名
    const harName=router.builderName.split('_')[0]
    console.log('跳转模块：'+harName)
    //动态导入该页面
    await import(harName).then((ns:ESObject)=>{ns.harInit(router.builderName)})
    RouterModule.getRouter(router.routerName).pushPath({name:router.builderName,onPop:router.onPop,param:router.param})
  }

  //弹出当前页面
  public static pop(routerName: string): void {
    RouterModule.getRouter(routerName).pop();
  }

  //清空当前页面栈
  public static clear(routerName: string): void {
    RouterModule.getRouter(routerName).clear();
  }

  //弹出指定页面
  public static popToName(routerName: string, builderName: string): void {
    RouterModule.getRouter(routerName).popToName(builderName);
  }
}