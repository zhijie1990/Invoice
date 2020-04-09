//
//  AppDelegate.m
//  Invoice
//
//  Created by zj on 2020/3/25.
//  Copyright © 2020 zj. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:[[MainTabBarController alloc] init]];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[MainTabBarController alloc] init]];
     [self setUpNavigationBarAppearance];
    
    
    return YES;
}

/**
 *  设置navigationBar样式
 */
- (void)setUpNavigationBarAppearance {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    UIColor *backgroundColor = [UIColor whiteColor];
    NSDictionary *textAttributes = nil;
    UIColor *labelColor =   [UIColor blackColor];

    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        textAttributes = @{
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName : labelColor,
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        textAttributes = @{
                           UITextAttributeFont : [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor : labelColor,
                           UITextAttributeTextShadowColor : [UIColor clearColor],
                           UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    [navigationBarAppearance setTintColor:[UIColor colorWithHexString:kMainColor]];
    [navigationBarAppearance setShadowImage:[[UIImage alloc] init]]; //hiddenNavigationBottomLine
//    [navigationBarAppearance setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"ffffff"]] forBarMetrics:UIBarMetricsDefault];
    //设置全局状态栏字体颜色为黑色
    if (@available(iOS 13.0, *)) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;//文字是黑色
    } else {

            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//文字黑色
    }
    
    [navigationBarAppearance setBarTintColor:backgroundColor];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    if (@available(iOS 11.0, *)) {UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;}
}




@end
