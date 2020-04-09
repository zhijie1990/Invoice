//
//  MainTabBarController.m
//  Invoice
//
//  Created by zj on 2020/3/28.
//  Copyright © 2020 zj. All rights reserved.
//

#import "MainTabBarController.h"
#import "Overview_RootViewController.h"
#import "Document_RootViewController.h"
#import "Report_RootViewController.h"
#import "Info_RootViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController


#pragma mark - Cycle life

- (instancetype)init {
   if (!(self = [super init])) {
       return nil;
   }
   /**
    * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
    * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
    * 更推荐后一种做法。
    */
   UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
   UIOffset titlePositionAdjustment = UIOffsetMake(0, -3.5);
   CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                        imageInsets:imageInsets
                                                                            titlePositionAdjustment:titlePositionAdjustment
                                                                                            context:nil];
    [self customizeTabBarAppearance];
   self.navigationController.navigationBar.hidden = YES;
   return (self = (MainTabBarController *)tabBarController);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Getter and setter



#pragma mark - Delegate



#pragma mark - Net request



#pragma mark - Event method



#pragma mark - Pravit method
- (NSArray *)viewControllers {
    Overview_RootViewController *firstViewController = [[Overview_RootViewController alloc] init];
    UIViewController *firstNavigationController = [[CYLBaseNavigationController alloc]
                                                  initWithRootViewController:firstViewController];
    [firstViewController cyl_setHideNavigationBarSeparator:YES];

    Document_RootViewController *secondViewController = [[Document_RootViewController alloc] init];
    UIViewController *secondNavigationController = [[CYLBaseNavigationController alloc]
                                                   initWithRootViewController:secondViewController];
    [secondViewController cyl_setHideNavigationBarSeparator:YES];

    Report_RootViewController *thirdViewController = [[Report_RootViewController alloc] init];
    UIViewController *thirdNavigationController = [[CYLBaseNavigationController alloc]
                                                    initWithRootViewController:thirdViewController];
    [secondViewController cyl_setHideNavigationBarSeparator:YES];

    Info_RootViewController *fouthViewController = [[Info_RootViewController alloc] init];
    UIViewController *fouthNavigationController = [[CYLBaseNavigationController alloc]
                                                    initWithRootViewController:fouthViewController];
    [secondViewController cyl_setHideNavigationBarSeparator:YES];

    NSArray *viewControllers = @[
                                firstNavigationController,
                                secondNavigationController,
                                thirdNavigationController,
                                fouthNavigationController
                                ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
NSDictionary *firstTabBarItemsAttributes = @{
                                            CYLTabBarItemTitle : @"Overview",
                                            CYLTabBarItemImage : @"tabar_Overview",
                                            CYLTabBarItemSelectedImage : @"tabar_Overview_selected",
                                            CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 1.5)],
                                            };
NSDictionary *secondTabBarItemsAttributes = @{
                                             CYLTabBarItemTitle : @"Document",
                                             CYLTabBarItemImage : @"tabar_Document",
                                             CYLTabBarItemSelectedImage : @"tabar_Document_selected",
                                             CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 1.5)],
                                             };
NSDictionary *thirdTabBarItemsAttributes = @{
                                             CYLTabBarItemTitle : @"Report",
                                             CYLTabBarItemImage : @"tabar_Report",
                                             CYLTabBarItemSelectedImage : @"tabar_Report_selected",
                                             CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 1.5)],
                                             };
NSDictionary *fouthTabBarItemsAttributes = @{
                                             CYLTabBarItemTitle : @"info",
                                             CYLTabBarItemImage : @"tabar_info",
                                             CYLTabBarItemSelectedImage : @"tabar_info_selected",
                                             CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 1.5)],
                                             };



   

   NSArray *tabBarItemsAttributes = @[
                                      firstTabBarItemsAttributes,
                                      secondTabBarItemsAttributes,
                                      thirdTabBarItemsAttributes,
                                      fouthTabBarItemsAttributes
                                      ];
   return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    // tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 40;
    
    [self rootWindow].backgroundColor = [UIColor cyl_systemBackgroundColor];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#828B95"];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:kMainColor];
    
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
//     [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set background color
    // 设置 TabBar 背景
    // 半透明
//    [UITabBar appearance].translucent = YES;
    // [UITabBar appearance].barTintColor = [UIColor cyl_systemBackgroundColor];
    // [[UITabBar appearance] setBackgroundColor:[UIColor cyl_systemBackgroundColor]];
    
    
    //     [[UITabBar appearance] setBackgroundImage:[[self class] imageWithColor:[UIColor whiteColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, tabBarController.tabBarHeight ?: (CYL_IS_IPHONE_X ? 65 : 40))]];
    //    [[UITabBar appearance] setUnselectedItemTintColor:[UIColor systemGrayColor]];
    
    //Three way to deal with shadow 三种阴影处理方式：
    // NO.3, without shadow : use -[[CYLTabBarController hideTabBarShadowImageView] in CYLMainRootViewController.m
    // NO.2，using Image
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
//    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"TabBar_Bg_Shadow"]];
    // NO.1，using layer to add shadow. note:recommended. 推荐该方式，可以给PlusButton突出的部分也添加上阴影
//    tabBarController.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
//    tabBarController.tabBar.layer.shadowRadius = 15.0;
//    tabBarController.tabBar.layer.shadowOpacity = 0.2;
//    tabBarController.tabBar.layer.shadowOffset = CGSizeMake(0, 3);
//    tabBarController.tabBar.layer.masksToBounds = NO;
//    tabBarController.tabBar.clipsToBounds = NO;
}

@end
