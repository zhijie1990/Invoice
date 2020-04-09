//
//  ClientListViewController.h
//  Invoice
//
//  Created by zj on 2020/3/31.
//  Copyright © 2020 zj. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

//typedef NS_ENUM(NSInteger, DocumentType)
//{
////    Clients,
////    Items,
//    Invoices,
//    Estimates,
//    PurchaseOrders,
//    CreditMemos,
//    Expenses,
//    TimeTracking,
//    Trash
//};

@interface InvoiceListViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UILabel* titleLable;
@property(nonatomic,strong) NSString *segmentType;
//@property(nonatomic,assign) DocumentType documentTpye;
@property NSArray *segmentArr;
@property(nonatomic,strong)UISegmentedControl *segment;

@end

NS_ASSUME_NONNULL_END
