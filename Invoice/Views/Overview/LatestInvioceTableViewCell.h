//
//  LatestInvioceTableViewCell.h
//  Invoice
//
//  Created by zj on 2020/4/2.
//  Copyright © 2020 zj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LatestInvioceTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *clientName,*money,*date,*type,*dateDetail;

@property (nonatomic,strong) NSDictionary *style;

@property (nonatomic,strong) NSDictionary *order;

@end

NS_ASSUME_NONNULL_END
