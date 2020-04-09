//
//  RootTobView.m
//  Invoice
//
//  Created by zj on 2020/3/29.
//  Copyright © 2020 zj. All rights reserved.
//

#import "RootTobView.h"

@implementation RootTobView

#pragma mark - Cycle life
- (instancetype)init{
    
    self = [super init];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
        
        _style = @{
                    @"common":@[[UIFont boldSystemFontOfSize:22],
                                [UIColor colorWithHexString:@"2272FF"]]
        };
        [self setupVerUI];
    }
    return self;
}


#pragma mark - Getter and setter

-(UILabel*)MyBusiness{
    if (!_MyBusiness) {
        _MyBusiness = [[UILabel alloc]init];
        _MyBusiness.backgroundColor = [UIColor colorWithHexString:@"E6EFFF"];
        _MyBusiness.textAlignment = NSTextAlignmentLeft;
        _MyBusiness.numberOfLines = 0;
        _MyBusiness.text = NSLocalizedString(@"MyBusiness", nil);
        _MyBusiness.font = [UIFont systemFontOfSize:22 weight:0.5];
        _MyBusiness.textColor = [UIColor colorWithHexString:@"2272FF"];
        PCBViewBorderRadius(_MyBusiness,22.5,0,[UIColor whiteColor]);
        
        _MyBusiness.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick:)];
        _MyBusiness.tag = 1001;
        [_MyBusiness addGestureRecognizer:tapGesture];
    }
    return _MyBusiness;
}

- (UIImageView *)change{
    if (!_change){
        _change = [[UIImageView alloc]init];
        _change.image = [UIImage imageNamed:@"information"];
    }
    return _change;
}

- (UIImageView *)information{
    if (!_information){
        _information = [[UIImageView alloc]init];
        _information.image = [UIImage imageNamed:@"information"];
    }
    return _information;
}


#pragma mark - Delegate



#pragma mark - Net request



#pragma mark - Event method
-(void)onclick:(UITapGestureRecognizer*)recognizer{
    int tag = (int)recognizer.view.tag;
    [self.delegate MyBusinessShow];
    DebugLog(@"ddd");
}


#pragma mark - Pravit method

-(void)setupVerUI{
    WS(ws)
    
    [self addSubview:self.MyBusiness];
    [self addSubview:self.information];
    
    [_MyBusiness mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(5);
        make.left.equalTo(ws.mas_left).offset(Margin_horizontal-2);
        make.width.offset(kScreen_Width/2);
        make.height.offset(45);
    }];
    
    [_information mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(0);
        make.right.equalTo(ws.mas_right).offset(-(Margin_horizontal-15));
        make.width.offset(55);
        make.height.offset(55);
    }];
    
    
}







@end
