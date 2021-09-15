//
//  KDTwoViewController.m
//  UIViewControllerFrameDemo
//
//  Created by marsxinwang on 2021/9/15.
//

#import "KDTwoViewController.h"

@interface KDTwoViewController ()

@end

@implementation KDTwoViewController

#warning mark - 修改edgesForExtendedLayout及translucent属性后，需要在viewDidAppear:方法中获取正确的frame

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 只会影响TwoViewController对应的导航栏是不透明的，其他导航栏依旧正常显示，self.view会处于导航栏之下，tabbar之上
    self.navigationController.navigationBar.translucent = NO;
    // tabbarController修改之后，会影响其他的控制器，导致其他view的显示出现问题：在导航栏top开始，在tabbar的top截止
    self.tabBarController.tabBar.translucent = NO;
    // 获取的frame有问题
    NSLog(@"KDBaseViewController.frame viewWillAppear = %@", [NSValue valueWithCGRect:self.view.frame]);
    // defalut YES 不透明的
    // self.navigationController.navigationBar.opaque = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"KDBaseViewController.frame viewDidAppear = %@", [NSValue valueWithCGRect:self.view.frame]);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    // 还原之后，保证tabbar其他子控制器的view在tabbar的底部截止
    self.tabBarController.tabBar.translucent = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"KDBaseViewController.frame viewDidLoad = %@", [NSValue valueWithCGRect:self.view.frame]);
    self.edgesForExtendedLayout = UIRectEdgeAll;
}

@end
