//
//  BaseViewController.m
//  Togethers
//
//  Created by zj on 15/12/17.
//  Copyright © 2015年 zj. All rights reserved.
//

#import "BaseViewController.h"
#import "Overview_RootViewController.h"
#import "Document_RootViewController.h"
#import "Report_RootViewController.h"
#import "Info_RootViewController.h"


@interface BaseViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UIButton *backButton;

@end

@implementation BaseViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    self.navigationController.navigationBar.translucent = NO;
    
    //控制navigationController返回键
    if ([self isKindOfClass:[Overview_RootViewController class]] || [self isKindOfClass:[Document_RootViewController class]] || [self isKindOfClass:[Report_RootViewController class]] || [self isKindOfClass:[Info_RootViewController class]]) {
        
    }else{
        [self isCustomBackBarItem];
    }
    
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    panGesture.delegate = self; // 设置手势代理，拦截手势触发
    [self.view addGestureRecognizer:panGesture];
    
    // 一定要禁止系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self setUpForDismissKeyboard];
    
    
    
}



#pragma mark - private Method
#pragma mark  键盘隐藏
- (void)setUpForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
}


// 显示隐藏navigationController控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    if ([self isKindOfClass:[Overview_RootViewController class]] || [self isKindOfClass:[Document_RootViewController class]] || [self isKindOfClass:[Report_RootViewController class]] || [self isKindOfClass:[Info_RootViewController class]]) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else{
       [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
   
    
}


// 什么时候调用，每次触发手势之前都会询问下代理方法，是否触发
// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 当当前控制器是根控制器时，不可以侧滑返回，所以不能使其触发手势
    if(self.navigationController.childViewControllers.count == 1)
    {
        return NO;
    }
    
    return YES;
}

- (void)isCustomBackBarItem{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backButton];
//    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)showLeftMenuPressed:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark getter

- (UIButton *)backButton{
    
    if (!_backButton) {
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 36)];
        [_backButton setImage:[UIImage imageNamed:@"custom_back_btn_icon"] forState:UIControlStateNormal];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
//        [_backButton setTitle:@"按钮" forState:UIControlStateNormal];
//        [_backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(showLeftMenuPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

#pragma mark - event Response
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}


@end
