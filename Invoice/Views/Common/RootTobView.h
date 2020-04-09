//
//  RootTobView.h
//  Invoice
//
//  Created by zj on 2020/3/29.
//  Copyright © 2020 zj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RootTobDelegate <NSObject>

@optional

-(void)MyBusinessShow;
-(void)information;


@end

@interface RootTobView : UIView
@property (nonatomic,strong) UILabel *MyBusiness;
@property (nonatomic,strong)NSDictionary *style;
@property (nonatomic,strong)UIImageView  *information,*change;
@property (nonatomic,weak) id<RootTobDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
