//
//  BaseViewController.h
//  Togethers
//
//  Created by zj on 15/12/17.
//  Copyright © 2015年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DocumentType)
{
    Clients,
    Items,
    Invoices,
    Estimates,
    PurchaseOrders,
    CreditMemos,
    Expenses,
    TimeTracking,
    Trash
};

@interface BaseViewController : UIViewController
@property(nonatomic,assign) DocumentType documentTpye;

@end
