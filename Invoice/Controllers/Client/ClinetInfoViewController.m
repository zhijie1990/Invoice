//
//  ClinetInfoViewController.m
//  Invoice
//
//  Created by zj on 2020/4/9.
//  Copyright © 2020 zj. All rights reserved.
//

#import "ClinetInfoViewController.h"

@interface ClinetInfoViewController ()
@property (nonatomic,strong) NSDictionary *style;
@property (nonatomic,strong) UIImageView *messageView,*callView,*EmailView;
@property (nonatomic,strong) UILabel *messageLable,*callLable,*EmailLable;
@property (nonatomic,strong) UISegmentedControl *segment;

@end

@implementation ClinetInfoViewController

#pragma mark - Cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    _style = @{
                   @"common":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],
                               [UIColor colorWithHexString:@"000000"]],
                   @"name":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:26.0],
                                [UIColor colorWithHexString:@"091522"]],
                   @"salesDetail":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],
                               [UIColor colorWithHexString:@"2272FF"]],
                   @"rate":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0],
                             [UIColor colorWithHexString:@"ffffff"]],
       };
    
    [self setupVerUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Getter and setter
-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc]init];
        _name.textAlignment = NSTextAlignmentCenter;
//        _name.attributedText = [[NSString stringWithFormat:@"<name>%@</name>",@"Jack"] attributedStringWithStyleBook:_style];
        _name.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:32];
        _name.textColor = [UIColor colorWithHexString:@"091522"];
    }
    return _name;
}

-(UIImageView *)messageView{
    if (!_messageView){
        _messageView = [[UIImageView alloc]init];
        _messageView.image = [UIImage imageNamed:@"invoiceImg"];
        
        _messageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick:)];
        _messageView.tag = 1001;
        [_messageView addGestureRecognizer:tapGesture];
    }
    return _messageView;
}

-(UIImageView *)callView{
    if (!_callView){
        _callView = [[UIImageView alloc]init];
        _callView.image = [UIImage imageNamed:@"estimateImg"];
        
        _callView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick:)];
        _callView.tag = 1002;
        [_callView addGestureRecognizer:tapGesture];
    }
    return _callView;
}

-(UIImageView *)EmailView{
    if (!_EmailView){
        _EmailView = [[UIImageView alloc]init];
        _EmailView.image = [UIImage imageNamed:@"clientImg"];
        
        _EmailView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick:)];
        _EmailView.tag = 1003;
        [_EmailView addGestureRecognizer:tapGesture];
    }
    return _EmailView;
}

-(UILabel *)messageLable{
    if (!_messageLable) {
        _messageLable = [[UILabel alloc]init];
        _messageLable.textAlignment = NSTextAlignmentCenter;
        _messageLable.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        _messageLable.textColor = [UIColor colorWithHexString:@"4E5B69"];
        _messageLable.text = NSLocalizedString(@"Message", nil);
    }
    return _messageLable;
}

-(UILabel *)callLable{
    if (!_callLable) {
        _callLable = [[UILabel alloc]init];
        _callLable.textAlignment = NSTextAlignmentCenter;
        _callLable.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        _callLable.textColor = [UIColor colorWithHexString:@"4E5B69"];
        _callLable.text = NSLocalizedString(@"Call", nil);
    }
    return _callLable;
}

-(UILabel *)EmailLable{
    if (!_EmailLable) {
        _EmailLable = [[UILabel alloc]init];
        _EmailLable.textAlignment = NSTextAlignmentCenter;
        _EmailLable.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        _EmailLable.textColor = [UIColor colorWithHexString:@"4E5B69"];
        _EmailLable.text = NSLocalizedString(@"E-mail", nil);
    }
    return _EmailLable;
}

-(UISegmentedControl*)segment{
    if(!_segment){
        _segment = [[UISegmentedControl alloc]initWithItems:@[NSLocalizedString(@"Activity", nil),NSLocalizedString(@"Info", nil)]];
        _segment.selectedSegmentIndex = 0;
        _segment.momentary = NO;
        [_segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _segment;
}



#pragma mark - Delegate



#pragma mark - Net request



#pragma mark - Event method
- (void)segmentAction:(UISegmentedControl*)sender
{
    NSLog(@"%ld",sender.selectedSegmentIndex);
    switch (sender.selectedSegmentIndex) {
        case 0:{
//            _segmentType = @"1";
//            [_tableView reloadData];
        }
        break;
        case 1:{
//            _segmentType = @"2";
//            [_tableView reloadData];
        }
        break;
        case 2:{
            
        }
        break;
        default:
        break;
    }


}


#pragma mark - Pravit method
-(void)setupVerUI{
    [self.view addSubview:self.name];
    WS(ws);
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(ws.view.mas_top).offset(6);
           make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
           make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
           make.height.offset(30);
       }];
    
    [self.view addSubview:self.messageView];
    [self.view addSubview:self.callView];
    [self.view addSubview:self.EmailView];
    
    [_messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name.mas_bottom).offset(22);
        make.right.equalTo(_callView.mas_left).offset(-60);
        make.width.offset(45);
        make.height.offset(45);
    }];
    
    [_callView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name.mas_bottom).offset(22);
        make.centerX.equalTo(ws.view.mas_centerX).offset(0);
        make.width.offset(45);
        make.height.offset(45);
    }];
    
    [_EmailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name.mas_bottom).offset(22);
        make.left.equalTo(_callView.mas_right).offset(60);
        make.width.offset(45);
        make.height.offset(45);
    }];
    
    [self.view addSubview:self.messageLable];
    [self.view addSubview:self.callLable];
    [self.view addSubview:self.EmailLable];
    
    [_messageLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_messageView.mas_bottom).offset(2);
        make.centerX.equalTo(_messageView.mas_centerX).offset(0);
        make.width.offset(100);
        make.height.offset(20);
    }];
    
    [_callLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_callView.mas_bottom).offset(2);
        make.centerX.equalTo(_callView.mas_centerX).offset(0);
        make.width.offset(100);
        make.height.offset(20);
    }];
    
    [_EmailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_EmailView.mas_bottom).offset(2);
        make.centerX.equalTo(_EmailView.mas_centerX).offset(0);
        make.width.offset(100);
        make.height.offset(20);
    }];
    
    [self.view addSubview:self.segment];
    [_segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_messageLable.mas_bottom).offset(35);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.height.offset(32);
    }];
    
}


@end
