//
//  TarBarViewController.m
//  SideAndTarbar
//
//  Created by tongle on 2016/10/31.
//  Copyright © 2016年 tongle. All rights reserved.
//

#import "TarBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface TarBarViewController ()

@end

@implementation TarBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNewBar];
    // Do any additional setup after loading the view.
}
-(void)setNewBar{
    OneViewController * one = [[OneViewController alloc]init];
    [self addChildViewController:one title:@"MainOne" image:[UIImage imageNamed:@"icon_home_normal"] selecteImage:[UIImage imageNamed:@"icon_home_selected"]];
    TwoViewController * two = [[TwoViewController alloc]init];
    [self addChildViewController:two title:@"MainTwo" image:[UIImage imageNamed:@"icon_door_normal"] selecteImage:[UIImage imageNamed:@"icon_door_selected"]];
}
-(void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(UIImage *)image selecteImage:(UIImage *)selectedImage{
    UINavigationController * controller = [[UINavigationController alloc]initWithRootViewController:childController];
    childController.view.backgroundColor = [UIColor whiteColor];
    childController.navigationItem.title = title;
    // 去除tarbar分割线
    [[UITabBar appearance] setShadowImage:[UIImage new]]; [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    //UITableBar自定义选中图片默认为蓝色bug
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBar.tintColor = [UIColor greenColor];
    
    controller.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:image selectedImage:selectedImage];
    [self addChildViewController:controller];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
