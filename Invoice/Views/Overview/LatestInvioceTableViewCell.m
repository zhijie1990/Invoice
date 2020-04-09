//
//  LatestInvioceTableViewCell.m
//  Invoice
//
//  Created by zj on 2020/4/2.
//  Copyright © 2020 zj. All rights reserved.
//

#import "LatestInvioceTableViewCell.h"

@implementation LatestInvioceTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        _style = @{
                   @"name":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:18],
                              [UIColor colorWithHexString:@"000000"]],
                   @"money":@[[UIFont fontWithName:@"HelveticaNeue" size:16],
                               [UIColor colorWithHexString:@"000000"]],
                   @"date":@[[UIFont systemFontOfSize:14],
                               [UIColor colorWithHexString:@"1A2B3C"]],
                   @"type1":@[[UIFont systemFontOfSize:13],
                             [UIColor colorWithHexString:@"E94845"]],
                   @"type2":@[[UIFont systemFontOfSize:13],
                              [UIColor colorWithHexString:@"2272FF"]],
                   @"type2":@[[UIFont systemFontOfSize:13],
                              [UIColor colorWithHexString:@"4E5B69"]],
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
    [self addSubview:self.clientName];
    
    [self addSubview:self.money];
    
    [self addSubview:self.date];
    
    [self addSubview:self.dateDetail];
    
    [self layoutUI];
}

-(void)layoutUI{
    WS(ws)
    
    [_clientName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(20);
        make.left.equalTo(ws.mas_left).offset(0);
        make.width.offset((kScreen_Width-2*Margin_horizontal)/2);
        make.height.offset(25);
    }];
    
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(20);
        make.right.equalTo(ws.mas_right).offset(0);
        make.width.offset((kScreen_Width-2*Margin_horizontal)/2);
        make.height.offset(25);
    }];
    
    [_date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_clientName.mas_bottom).offset(10);
        make.left.equalTo(ws.mas_left).offset(0);
         make.width.offset((kScreen_Width-2*Margin_horizontal)/2);
        make.height.offset(16);
    }];
    
    [_dateDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_money.mas_bottom).offset(5);
         make.right.equalTo(ws.mas_right).offset(0);
        make.width.offset((kScreen_Width-2*Margin_horizontal)/2);
        make.height.offset(16);
    }];
    
}

#pragma mark getter
-(UILabel*)clientName{
    if (!_clientName) {
        _clientName = [[UILabel alloc]init];
//        _clientName.backgroundColor = [UIColor whiteColor];
        _clientName.textAlignment = NSTextAlignmentLeft;
        _clientName.numberOfLines = 0;
        _clientName.attributedText = [[NSString stringWithFormat:@"<name>#%@:%@</name>",@"1",@"Client name"] attributedStringWithStyleBook:_style];
    }
    return _clientName;
}

-(UILabel*)money{
    if (!_money) {
        _money = [[UILabel alloc]init];
//        _money.backgroundColor = [UIColor whiteColor];
        _money.textAlignment = NSTextAlignmentRight;
        _money.numberOfLines = 0;
        _money.attributedText = [[NSString stringWithFormat:@"<money>%@%@</money>",NSLocalizedString(@"$",nil),@"6100"] attributedStringWithStyleBook:_style];
    }
    return _money;
}


-(UILabel*)date{
    if (!_date) {
        _date = [[UILabel alloc]init];
//        _date.backgroundColor = [UIColor whiteColor];
        _date.textAlignment = NSTextAlignmentLeft;
        _date.numberOfLines = 0;
        _date.attributedText = [[NSString stringWithFormat:@"<date>%@</date>",@"2019.12.24"] attributedStringWithStyleBook:_style];
    }
    return _date;
}


-(UILabel*)dateDetail{
    if (!_dateDetail) {
        _dateDetail = [[UILabel alloc]init];
//        _dateDetail.backgroundColor = [UIColor whiteColor];
        _dateDetail.textAlignment = NSTextAlignmentRight;
        _dateDetail.numberOfLines = 0;
        _dateDetail.attributedText = [[NSString stringWithFormat:@"<type1>%@</type1>",@"Overdue by 2 days"] attributedStringWithStyleBook:_style];
    }
    return _dateDetail;
}


@end
