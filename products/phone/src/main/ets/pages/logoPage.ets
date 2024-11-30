import {PrivateDialog} from '../component/CustomDialog'
import { common } from '@kit.AbilityKit'
import { router } from '@kit.ArkUI'
import { PreferencesUtil } from '@pura/harmony-utils'

PersistentStorage.persistProp('userName', '游客10086');

@Entry
@Component
struct LogoPage {
  onPageShow(): void {
    this.context=getContext(this) as common.UIAbilityContext
    this.isJump=PreferencesUtil.getBooleanSync('isJump')
    if(!this.isJump){
      this.dialogController.open()
    }else{
      if(this.username=='游客10086'){
        this.jumpToLoginPage()
      }
      else{
        this.jumpToIndex()
      }
    }
  }

  private context?:common.UIAbilityContext
  dialogController:CustomDialogController=new CustomDialogController({builder:PrivateDialog({
    cansel:()=>{
      this.cansel()
    },
    confirm:()=>{
      this.jumpToLoginPage()
      PreferencesUtil.putSync('isJump',true)
      this.dialogController.close()
    }
  }),
  alignment:DialogAlignment.Bottom,
    offset:{dx:0,dy:-24},
    customStyle:true,
    autoCancel:false
  })

  cansel(){
    this.context?.terminateSelf((error)=>{
    })
  }

  jumpToLoginPage(){
    setTimeout(()=>{
      router.pushUrl({
        url:'pages/LoginPage'
      })
      console.log('点击同意')
    },2000)
  }

  jumpToIndex(){
    setTimeout(()=>{
      router.pushUrl({
        url:'pages/Index'
      })
      console.log('点击同意')
    },2000)
  }

  @State isJump:boolean=false
  @StorageLink('userName') username:string='游客10086'
  build() {
    Column(){
      Image($r('app.media.loginImage'))
        .width('100%')
        .height('100%')
    }
  }
}

