# REsideAndTarbar

##在有pod的情况下（没有请配置pod环境）

1、cd到当前文件夹 vim Podfile 

1.1、配置podfile：

platform :ios,'8.0'

target 'SideAndTarbar' do

pod 'RESideMenu', '~> 4.0.7'

end

->esc->shift+q->wq:退出编辑状态

2、——> pod install (关闭当前Xcode)

##在ApplicationDelegate

1、侧边栏控制器: viewController

2、自定义tarbar: barViewController

3、加入到RESideMenu方法中

   RESideMenu * sideMenu = [[RESideMenu alloc]initWithContentViewController:barViewController 

   leftMenuViewController:viewController rightMenuViewController:nil];
   
   self.window.rootViewController = sideMenu;
   
##编写tarbar代码

1、子控制器

    -(void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(UIImage *)image      selecteImage:(UIImage *)selectedImage{
    
    UINavigationController * controller = [[UINavigationController alloc]initWithRootViewController:childController];
    childController.view.backgroundColor = [UIColor whiteColor];
    childController.navigationItem.title = title;
    // 去除tarbar分割线
    [[UITabBar appearance] setShadowImage:[UIImage new]]; [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    //UITableBar自定义选中图片默认为蓝色bug
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    controller.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:image selectedImage:selectedImage];
    [self addChildViewController:controller];
    }
  
2、在自控制器中添加左侧跳转图标按钮，要导入头文件 #import RESideMenu/RESideMenu.h

     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_sidebar"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];

##侧边栏

1、我当时用的tableViewController，当然viewController都可以，所以要register一个cell，不然会报错

     [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
2、我仅仅懒加载放了一个数组显示而已，和所有tableViewController一样操作

-(NSArray *)array

{

      if (!_array)  
      
    {
    
        _array = [[NSArray alloc]init];
    
    }
    
      return _array;
}


