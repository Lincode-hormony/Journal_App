import { BuilderNameConstants } from 'routermodule';

export { loginPage } from './src/main/ets/view/loginPage'

export function harInit(builderName:string){
  switch (builderName){
    case BuilderNameConstants.LOGIN_LOGINPAGE:
      import('./src//main/ets/view/loginPage')
    break;
      case BuilderNameConstants.LOGIN_LOGINFEATURE:
        import('./src/main/ets/view/LoginFeature')
    break;
      default :
        break;
  }
}