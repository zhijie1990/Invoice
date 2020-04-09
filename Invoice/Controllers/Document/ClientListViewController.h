//
//  ClientListViewController.h
//  Invoice
//
//  Created by zj on 2020/3/31.
//  Copyright © 2020 zj. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClientListViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UILabel* titleLable;
@property(nonatomic,strong) NSString *segmentType;
@property NSArray *segmentArr;
@property(nonatomic,strong)UISegmentedControl *segment;

@end

NS_ASSUME_NONNULL_END
