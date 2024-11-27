import { BuilderNameConstants } from 'routermodule';

export { homePage} from './src/main/ets/View/home'

export function harInit(builderName:string):void{
  switch (builderName){
    case BuilderNameConstants.HOME_HOME:
      import('./src/main/ets/View/home')
      break;
    case BuilderNameConstants.HOME_EDITPAGE:
      import('./src/main/ets/View/editPage')
      break;
      default :
        break;
  }
}