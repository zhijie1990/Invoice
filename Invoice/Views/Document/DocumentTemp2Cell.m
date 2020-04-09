//
//  DocumentTemp1Cell.m
//  Invoice
//
//  Created by zj on 2020/4/2.
//  Copyright © 2020 zj. All rights reserved.
//

#import "DocumentTemp2Cell.h"

@implementation DocumentTemp2Cell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        _style = @{
                   @"lable1":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:18],
                              [UIColor colorWithHexString:@"000000"]],
                   @"lable2":@[[UIFont fontWithName:@"HelveticaNeue" size:14],
                               [UIColor colorWithHexString:@"000000"]],
                   @"lable3":@[[UIFont fontWithName:@"HelveticaNeue" size:18],
                   [UIColor colorWithHexString:@"000000"]],
                   };
        
       
        
        [self setupUI];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupUI{
    [self addSubview:self.lable1];
    [self addSubview:self.lable2];
    [self addSubview:self.lable3];
    [self addSubview:self.lable4];
    
    WS(ws)
    [_lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(15);
        make.left.equalTo(ws.mas_left).offset(Margin_horizontal);
        make.width.offset(kScreen_Width-2*Margin_horizontal);
        make.height.offset(28);
    }];
    
    [_lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lable1.mas_bottom).offset(0);
        make.left.equalTo(ws.mas_left).offset(Margin_horizontal);
        make.width.offset(kScreen_Width-2*Margin_horizontal);
        make.height.offset(22);
    }];
    
    [_lable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(15);
        make.right.equalTo(ws.mas_right).offset(-Margin_horizontal);
        make.width.offset(kScreen_Width-2*Margin_horizontal);
        make.height.offset(28);
    }];
    
    [_lable4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lable3.mas_bottom).offset(0);
        make.right.equalTo(ws.mas_right).offset(-Margin_horizontal);
        make.width.offset(kScreen_Width-2*Margin_horizontal);
        make.height.offset(22);
    }];
    
}

#pragma mark getter

-(UILabel*)lable1{
    if (!_lable1) {
        _lable1 = [[UILabel alloc]init];
        _lable1.textAlignment = NSTextAlignmentLeft;
        _lable1.numberOfLines = 0;
        _lable1.attributedText = [[NSString stringWithFormat:@"<lable1>%@</lable1>",@"Alex"] attributedStringWithStyleBook:_style];
    }
    return _lable1;
}

-(UILabel*)lable2{
    if (!_lable2) {
        _lable2 = [[UILabel alloc]init];
        _lable2.textAlignment = NSTextAlignmentLeft;
        _lable2.numberOfLines = 0;
        _lable2.attributedText = [[NSString stringWithFormat:@"<lable2>%@</lable2>",@"Abc@gmail.com"] attributedStringWithStyleBook:_style];
    }
    return _lable2;
}

-(UILabel*)lable3{
    if (!_lable3) {
        _lable3 = [[UILabel alloc]init];
        _lable3.textAlignment = NSTextAlignmentRight;
        _lable3.numberOfLines = 0;
        _lable3.attributedText = [[NSString stringWithFormat:@"<lable3>%@%@</lable3>",NSLocalizedString(@"$",nil),@"61000"] attributedStringWithStyleBook:_style];
    }
    return _lable3;
}

-(UILabel*)lable4{
    if (!_lable4) {
        _lable4 = [[UILabel alloc]init];
        _lable4.textAlignment = NSTextAlignmentRight;
        _lable4.numberOfLines = 0;
        _lable4.attributedText = [[NSString stringWithFormat:@"<lable2>%@</lable2>",@"Due Today"] attributedStringWithStyleBook:_style];
    }
    return _lable4;
}


@end
