import { BuilderNameConstants } from 'routermodule';

export { homePage} from './src/main/ets/View/home'

export function harInit(builderName:string):void{
  switch (builderName){
    case BuilderNameConstants.HOME_HOME:
      import('./src/main/ets/View/home')
      console.log('找到该页面'+BuilderNameConstants.HOME_HOME)
      break;
      default :
        break;
  }
}