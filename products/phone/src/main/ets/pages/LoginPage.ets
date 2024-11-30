import { router } from '@kit.ArkUI';

@Entry
@Component
struct LoginPage {
  @State message: string = 'Login Page';
  @StorageLink('userName') username:string='游客10086'


  build() {
    Column({space:20}){
      Image($r('app.media.app_icon')).width(70).margin({top:50}).borderRadius(35)
      Text('用户名:').width('100%').textAlign(TextAlign.Start).margin({left:90})
      TextInput().width('80%').margin({left:30})
        .onChange((value)=>{
          this.username=value
        })
      Text('应用密码锁:').width('100%').textAlign(TextAlign.Start).margin({left:70})
      TextInput().type(InputType.Password).width('80%').margin({left:30})
      Button('确认')
        .margin({top:20,left:15})
        .width('70%')
        .onClick(()=>{
          router.pushUrl({url:'pages/Index'})
        })
      Text('跳过，先体验')
        .fontColor('#007dff')
        .onClick(()=>{
          this.username='游客10086'
          router.pushUrl({url:'pages/Index'})
        })
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.Image'))
    .backgroundImagePosition(Alignment.Center)
    .backgroundImageSize(ImageSize.Cover)
  }
}