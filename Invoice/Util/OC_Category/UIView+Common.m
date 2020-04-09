//
//  UIView+Common.m
//  Invoice
//
//  Created by zj on 2020/3/29.
//  Copyright © 2020 zj. All rights reserved.
//

#import "UIView+Common.h"


@implementation UIView (Common)


+ (CGRect)frameWithOutNavTabSta{
    CGRect frame = kScreen_Bounds;
    frame.size.height -= GLOBAL_SYS_OHTER_HEIGHT_WITH_TABBAR;//减去状态栏、导航栏、Tab栏的高度
    return frame;
}

+ (CGRect)frameWithOutNavSta{
    CGRect frame = kScreen_Bounds;
    frame.size.height -= GLOBAL_SYS_TOP_HEIGHT;//减去状态栏、导航栏的高度
    return frame;
}

+ (CGRect)frameWithOutTabSta{
    CGRect frame = kScreen_Bounds;
    frame.origin.y = GLOBAL_SYS_STATUS_HEIGHT;
    frame.size.height -= (GLOBAL_SYS_STATUS_HEIGHT+GLOBAL_SYS_TABBAR_HEIGHT);//减去状态栏、Tab栏的高度
    return frame;
}



@end
