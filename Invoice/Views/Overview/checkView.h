//
//  checkView.h
//  Invoice
//
//  Created by zj on 2020/3/31.
//  Copyright © 2020 zj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface checkView : UIView
@property (nonatomic,strong) UILabel *count,*money,*checkType;
@property (nonatomic,strong)NSDictionary *style;
@property (nonatomic,strong)UIImageView  *icon;
@property (nonatomic,strong)NSString *type;


-(instancetype)initwithType:(NSString*) type;

@end

NS_ASSUME_NONNULL_END
