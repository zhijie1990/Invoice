//
//  checkView.m
//  Invoice
//
//  Created by zj on 2020/3/31.
//  Copyright © 2020 zj. All rights reserved.
//

#import "checkView.h"

@implementation checkView

#pragma mark - Cycle life
-(instancetype)init{
    self = [super init];
    
    if (self) {
        _type = @"unpaid";
            _style = @{
                        @"common1":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:38.0],
                                    [UIColor colorWithHexString:@"000000"]],
                        @"common2":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:38.0],
                                    [UIColor colorWithHexString:@"E94845"]],
            };

         [self setupVerUI];
        }
    return self;
}

#pragma mark - Getter and setter
-(UILabel*)count{
    if (!_count) {
        _count = [[UILabel alloc]init];
        _count.textAlignment = NSTextAlignmentCenter;
        _count.numberOfLines = 0;
        _count.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:38.0];
        _count.textColor = [UIColor colorWithHexString:@"000000"];
        _count.backgroundColor = [UIColor colorWithHexString:@"F0F1F2"];
    
        PCBViewBorderRadius(_count,8,0,[UIColor whiteColor]);
        
    }
    return _count;
}

-(UILabel*)money{
    if (!_money){
        _money = [[UILabel alloc]init];
        _money.textAlignment = NSTextAlignmentLeft;
        _money.numberOfLines = 0;
        _money.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
        _money.textColor = [UIColor colorWithHexString:@"000000"];
    }
    return _money;
}

-(UILabel*)checkType{
    if (!_checkType) {
        _checkType = [[UILabel alloc]init];
        _checkType.textAlignment = NSTextAlignmentLeft;
        _checkType.numberOfLines = 0;
        _checkType.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
        _checkType.textColor = [UIColor colorWithHexString:@"000000"];

    }
    return _checkType;
}

- (UIImageView *)icon{
    if (!_icon){
        _icon = [[UIImageView alloc]init];
        _icon.image = [UIImage imageNamed:@"arrow"];
    }
    return _icon;
}




#pragma mark - Delegate



#pragma mark - Net request



#pragma mark - Event method



#pragma mark - Pravit method

-(void)setupVerUI{
    
    [self addSubview:self.count];
     WS(ws)
    [_count mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(ws.mas_top).offset(8);
           make.left.equalTo(ws.mas_left).offset(0);
           make.width.offset(60);
           make.height.offset(60);
       }];
    
    [self addSubview:self.money];
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_count.mas_top).offset(7);
        make.left.equalTo(_count.mas_right).offset(20);
        make.width.offset(kScreen_Width/2);
        make.height.offset(20);
    }];

    [self addSubview:self.checkType];
    [_checkType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_money.mas_bottom).offset(6);
        make.left.equalTo(_count.mas_right).offset(20);
        make.width.offset(kScreen_Width/2);
        make.height.offset(20);
    }];

    [self addSubview:self.icon];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_count.mas_top).offset(20);
        make.right.equalTo(ws.mas_right).offset(0);
        make.width.offset(20);
        make.height.offset(20);
    }];

    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor colorWithHexString:@"F7F8F8"];
    [self addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(0);
        make.right.equalTo(ws.mas_right).offset(0);
        make.height.offset(1);
        make.top.equalTo(_count.mas_bottom).offset(8);
    }];
    
}



@end
