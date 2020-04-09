//
//  NSObject+common.m
//  Invoice
//
//  Created by zj on 2020/4/1.
//  Copyright © 2020 zj. All rights reserved.
//

#import "NSObject+common.h"
#import "MBProgressHUD.h"


@implementation NSObject (common)

- (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = tipStr;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.0];
    }
}

@end
