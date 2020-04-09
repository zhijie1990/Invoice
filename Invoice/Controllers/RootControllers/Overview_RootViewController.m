//
//  Overview_RootViewController.m
//  Invoice
//
//  Created by zj on 2020/3/28.
//  Copyright © 2020 zj. All rights reserved.
//

#import "Overview_RootViewController.h"
#import "invoceViewController.h"
#import "ClientListViewController.h"
#import "RootTobView.h"
#import "checkView.h"
#import "LatestInvioceTableViewCell.h"
#import "AddClientViewController.h"

@interface Overview_RootViewController ()<RootTobDelegate>
@property (nonatomic,strong) UIView *chartView;
@property (nonatomic,strong) UIScrollView *OverviewView,*businessView;
@property (nonatomic,strong) RootTobView *rootTobView;
@property (nonatomic,strong) UIImageView *invoiceImg,*estimateImg,*clientImg;
@property (nonatomic,strong) UILabel *sales,*salesDetail,*average,*rate,*check,*latest;
@property (nonatomic,strong) NSDictionary *style;
@property (nonatomic,strong) checkView *checkView1,*checkView2;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic) UIStatusBarStyle StatusBarStyle;
@property BOOL isBussinessViewShow;
@end

@implementation Overview_RootViewController

#pragma mark - Cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    

    _style = @{
                @"common":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],
                            [UIColor colorWithHexString:@"000000"]],
                @"average":@[[UIFont fontWithName:@"HelveticaNeue" size:12.0],
                             [UIColor colorWithHexString:@"828B95"]],
                @"salesDetail":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],
                            [UIColor colorWithHexString:@"2272FF"]],
                @"rate":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0],
                          [UIColor colorWithHexString:@"ffffff"]],
    };
    
    [self setupVerUI];

}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    _isBussinessViewShow = NO;
    [self addBusinessView];
    [self animate];
    
//    [self loginRequest];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self getScrollViewHeight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Getter and setter
-(UIScrollView *)OverviewView{
    if(!_OverviewView){
        CGRect  frame = [UIView frameWithOutTabSta];
        _OverviewView = [[UIScrollView alloc]initWithFrame:frame];
        _OverviewView.backgroundColor = [UIColor whiteColor];
    }
    return _OverviewView;
}

-(UIScrollView *)businessView{
    if(!_businessView){
        _businessView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 200)];
        _businessView.backgroundColor = [UIColor whiteColor];
    }
    return _businessView;
}

-(RootTobView*)rootTobView{
    if (!_rootTobView) {
        _rootTobView = [[RootTobView alloc] init];
        _rootTobView.delegate = self;
    }
    return _rootTobView;
}


-(UIImageView *)invoiceImg{
    if (!_invoiceImg){
        _invoiceImg = [[UIImageView alloc]init];
        _invoiceImg.image = [UIImage imageNamed:@"invoiceImg"];
        
        _invoiceImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick:)];
        _invoiceImg.tag = 1001;
        [_invoiceImg addGestureRecognizer:tapGesture];
    }
    return _invoiceImg;
}

-(UIImageView *)estimateImg{
    if (!_estimateImg){
        _estimateImg = [[UIImageView alloc]init];
        _estimateImg.image = [UIImage imageNamed:@"estimateImg"];
        
        _estimateImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick:)];
        _estimateImg.tag = 1002;
        [_estimateImg addGestureRecognizer:tapGesture];
    }
    return _estimateImg;
}

-(UIImageView *)clientImg{
    if (!_clientImg){
        _clientImg = [[UIImageView alloc]init];
        _clientImg.image = [UIImage imageNamed:@"clientImg"];
        
        _clientImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick:)];
        _clientImg.tag = 1003;
        [_clientImg addGestureRecognizer:tapGesture];
    }
    return _clientImg;
}

-(UILabel*)sales{
    if (!_sales) {
        _sales = [[UILabel alloc]init];
        _sales.backgroundColor = [UIColor whiteColor];
        _sales.textAlignment = NSTextAlignmentLeft;
        _sales.numberOfLines = 0;
        _sales.attributedText = [[NSString stringWithFormat:@"<common>%@</common>",NSLocalizedString(@"Sales of this year",nil )] attributedStringWithStyleBook:_style];
       
    }
    return _sales;
}

-(UILabel*)salesDetail{
    if (!_salesDetail) {
        _salesDetail = [[UILabel alloc]init];
        _salesDetail.backgroundColor = [UIColor whiteColor];
        _salesDetail.textAlignment = NSTextAlignmentRight;
        _salesDetail.numberOfLines = 0;
        _salesDetail.attributedText = [[NSString stringWithFormat:@"<salesDetail>%@%@</salesDetail>",NSLocalizedString(@"$",nil),@"8888.00"] attributedStringWithStyleBook:_style];
       
    }
    return _salesDetail;
}

-(UILabel*)average{
    if (!_average) {
        _average = [[UILabel alloc]init];
        _average.backgroundColor = [UIColor whiteColor];
        _average.textAlignment = NSTextAlignmentLeft;
        _average.numberOfLines = 0;
        _average.attributedText = [[NSString stringWithFormat:@"<average>%@%@</average>",NSLocalizedString(@"average",nil),@"638.75"] attributedStringWithStyleBook:_style];
       
    }
    return _average;
}

-(UILabel*)rate{
    if (!_rate) {
        _rate = [[UILabel alloc]init];
        _rate.backgroundColor = [UIColor colorWithHexString:@"4CA865"];
        _rate.textAlignment = NSTextAlignmentCenter;
        _rate.numberOfLines = 0;
        PCBViewBorderRadius(_rate,2,0,[UIColor whiteColor]);
        _rate.attributedText = [[NSString stringWithFormat:@"<rate>%@%%</rate>",@"＋3.00"] attributedStringWithStyleBook:_style];
       
    }
    return _rate;
}

-(UIView*)chartView{
    if (!_chartView) {
        _chartView = [[UIView alloc]init];
        _chartView.backgroundColor = [UIColor colorWithHexString:@"2272FF"];
    }
    return _chartView;
}


-(UILabel*)check{
    if (!_check) {
        _check = [[UILabel alloc]init];
        _check.backgroundColor = [UIColor whiteColor];
        _check.textAlignment = NSTextAlignmentLeft;
        _check.numberOfLines = 0;
        _check.attributedText = [[NSString stringWithFormat:@"<common>%@%@</common>",@"4",NSLocalizedString(@"items to check",nil )] attributedStringWithStyleBook:_style];
       
    }
    return _check;
}

-(checkView*)checkView1{
    if(!_checkView1){
//        _checkView1 = [[checkView alloc]initwithType:@"unpaid"];
        _checkView1 = [[checkView alloc]init];
        _checkView1.count.text =@"3";
        _checkView1.money.text =[NSString stringWithFormat:@"%@%@",NSLocalizedString(@"$",nil ),@"1100.00"];
        _checkView1.checkType.text = NSLocalizedString(@"Total unpaid",nil );
        
    }
    return _checkView1;
}

-(checkView*)checkView2{
    if(!_checkView2){
//        _checkView2 = [[checkView alloc]initwithType:@"overdue"];
        _checkView2 = [[checkView alloc]init];
        _checkView2.count.text =@"1";
        _checkView2.money.text =[NSString stringWithFormat:@"%@%@",NSLocalizedString(@"$",nil ),@"220.00"];
        _checkView2.checkType.text = NSLocalizedString(@"Total overdue",nil );
        
        _checkView2.count.textColor = [UIColor colorWithHexString:@"E94845"];
        _checkView2.count.backgroundColor = [UIColor colorWithHexString:@"FFE5E5"];
         _checkView2.checkType.textColor = [UIColor colorWithHexString:@"E94845"];
    }
    return _checkView2;
}


-(UILabel*)latest{
    if (!_latest) {
        _latest = [[UILabel alloc]init];
        _latest.backgroundColor = [UIColor whiteColor];
        _latest.textAlignment = NSTextAlignmentLeft;
        _latest.numberOfLines = 0;
        _latest.attributedText = [[NSString stringWithFormat:@"<common>%@</common>",NSLocalizedString(@"Latest invoices",nil )] attributedStringWithStyleBook:_style];
       
    }
    return _latest;
}

-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = YES;
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]){
//            [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
            [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    return _tableView;
}


#pragma mark - Delegate
#pragma mark RootTobDelegate
-(void)MyBusinessShow{
    if(_isBussinessViewShow){
        _isBussinessViewShow = NO;
    }else{
        _isBussinessViewShow = YES;
    }
    [self animate];
}

#pragma mark UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     LatestInvioceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"latestInvioceTableViewCell"];
         if (cell==nil) {
             cell = [[LatestInvioceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"latestInvioceTableViewCell"];
                cell.selectionStyle = UITableViewCellSelectionStyleDefault;
         }
         cell.backgroundColor = [UIColor whiteColor];
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
       return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
       return 90;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        WS(ws)
        dispatch_async(dispatch_get_main_queue(),^{
            NSLog(@"加载完成！！！");
//            CGFloat height = ws.latest.frame.origin.y;
//            CGFloat heightO = ws.tableView.frame.size.height;
//            ws.OverviewView.contentSize = CGSizeMake(kScreen_Width, height+heightO);
        });
    }
}



#pragma mark - Net request
- (void)loginRequest{
[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *aPath = @"http://gateway.hypereact.com/invoice/user/msgLogin";
    
    NSDictionary *paramOthers = @{
                         @"account":@"zhaojun1990@126.com",
                         @"registerCode":@"692310"
                         };

[[BM_NetAPIManager sharedManager]request_POST_WithParams:paramOthers Path:aPath andBlock:^(id data, NSError *error) {
     [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    

}];
}

#pragma mark - Event method

-(void)onclick:(UITapGestureRecognizer*)recognizer{
    int tag = (int)recognizer.view.tag;
    switch (tag) {
               case 1001:{
                   ClientListViewController * vc  = [[ClientListViewController alloc]init];
                   [self.navigationController pushViewController:vc animated:YES];
                   
//                   invoceViewController * vc  = [[invoceViewController alloc]init];
//                   [self.navigationController pushViewController:vc animated:NO];
                   
               }
                    break;
                case 1003:{
                   AddClientViewController * vc  = [[AddClientViewController alloc]init];
                   [self.navigationController pushViewController:vc animated:YES];
                   
               }
                    break;
               default:
                    break;
    }
    
}

-(void)onclickLable:(UITapGestureRecognizer*)recognizer{
    int tag = (int)recognizer.view.tag;
    [self showHudTipStr:[NSString stringWithFormat:@"%d",tag]];
    
}

#pragma mark - Pravit method
-(void)setupVerUI{
    [self.view addSubview:self.businessView];
    
    [self.view addSubview:self.OverviewView];
    [self.OverviewView addSubview:self.rootTobView];
    
    
     WS(ws);
    

    
    [_rootTobView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(_OverviewView.mas_top).offset(20);
           make.left.equalTo(ws.view.mas_left).offset(0);
           make.right.equalTo(ws.view.mas_right).offset(0);
           make.height.offset(55);
       }];
    
    [self.OverviewView addSubview:self.invoiceImg];
    [self.OverviewView addSubview:self.estimateImg];
    [self.OverviewView addSubview:self.clientImg];
    
    [_invoiceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rootTobView.mas_bottom).offset(22);
        make.left.equalTo(ws.view.mas_left).offset(30);
        make.width.offset(66);
        make.height.offset(66);
    }];
    
    [_estimateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rootTobView.mas_bottom).offset(22);
        make.centerX.equalTo(ws.view.mas_centerX).offset(0);
        make.width.offset(66);
        make.height.offset(66);
    }];
    
    [_clientImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rootTobView.mas_bottom).offset(22);
        make.right.equalTo(ws.view.mas_right).offset(-30);
        make.width.offset(66);
        make.height.offset(66);
    }];
    
    NSArray * arr = @[NSLocalizedString(@"Invoice",nil),NSLocalizedString(@"Estimate",nil),NSLocalizedString(@"Client",nil)];
    
    for(int i=0;i<3;i++){
        UILabel *lable = [[UILabel alloc]init];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.numberOfLines = 0;
        lable.text = arr[i];
        lable.font = [UIFont systemFontOfSize:13 weight:0.3];
        lable.textColor = [UIColor colorWithHexString:@"000"];
        [self.OverviewView addSubview:lable];
        
        if (i==0) {
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_invoiceImg.mas_bottom).offset(5);
                make.centerX.equalTo(_invoiceImg.mas_centerX).offset(0);
                make.width.offset(66);
                make.height.offset(15);
            }];
        }else if (i==1){
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_estimateImg.mas_bottom).offset(5);
                make.centerX.equalTo(_estimateImg.mas_centerX).offset(0);
                make.width.offset(66);
                make.height.offset(15);
            }];
        }else{
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_clientImg.mas_bottom).offset(5);
                make.centerX.equalTo(_clientImg.mas_centerX).offset(0);
                make.width.offset(66);
                make.height.offset(15);
            }];
        }
        
    }
   
    [self.OverviewView addSubview:self.sales];
    [_sales mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_invoiceImg.mas_bottom).offset(55);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.width.offset((kScreen_Width-2*Margin_horizontal)/2);
        make.height.offset(22);
    }];
    
    [self.OverviewView addSubview:self.salesDetail];
    [_salesDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_invoiceImg.mas_bottom).offset(55);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.width.offset((kScreen_Width-2*Margin_horizontal)/2);
        make.height.offset(22);
    }];
    
    [self.OverviewView addSubview:self.average];
    [_average mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sales.mas_bottom).offset(5);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.width.offset((kScreen_Width-2*Margin_horizontal)/2);
        make.height.offset(15);
    }];
    
    [self.OverviewView addSubview:self.rate];
    [_rate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_salesDetail.mas_bottom).offset(5);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.width.offset(55);
        make.height.offset(15);
    }];
    
    [self.OverviewView addSubview:self.chartView];
    [_chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_average.mas_bottom).offset(10);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.height.offset(180);
    }];
    
    [self.OverviewView addSubview:self.check];
    [_check mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_chartView.mas_bottom).offset(25);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.width.offset(kScreen_Width);
        make.height.offset(22);
    }];
    
    [self.OverviewView addSubview:self.checkView1];
    [_checkView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_check.mas_bottom).offset(10);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.height.offset(76);
    }];
    
    [self.OverviewView addSubview:self.checkView2];
    [_checkView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_checkView1.mas_bottom).offset(1);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.height.offset(76);
    }];
    
    [self.OverviewView addSubview:self.latest];
    [_latest mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_checkView2.mas_bottom).offset(20);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.width.offset((kScreen_Width-2*Margin_horizontal)/2);
        make.height.offset(22);
    }];
    
    [self.OverviewView addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_latest.mas_bottom).offset(10);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.height.offset(450);
    }];
    
    
    
}

-(void)getScrollViewHeight{
        CGFloat height = _tableView.frame.origin.y;
        CGFloat heightO = _tableView.frame.size.height;
        _OverviewView.contentSize = CGSizeMake(kScreen_Width, height+heightO);
}


-(void)animate{
    WS(ws)
        [UIView animateWithDuration:0.5 animations:^{
            CGRect  frame= ws.OverviewView.frame;
//            if(frame.origin.y == GLOBAL_SYS_STATUS_HEIGHT){
            if(ws.isBussinessViewShow){
                if (frame.origin.y == GLOBAL_SYS_STATUS_HEIGHT) {
                    frame.origin.y += 70;
                    ws.OverviewView.frame = frame;
                    PCBViewBorderRadius(ws.OverviewView,25,0,[UIColor whiteColor]);
                    ws.businessView.backgroundColor = [UIColor colorWithHexString:@"08214C"];

                    if (@available(iOS 13.0, *)) {
        //                        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;//文字是白色 ios9后不推荐使用
                        ws.StatusBarStyle = UIStatusBarStyleLightContent;
                    } else {
        //                        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;//文字白色
                        ws.StatusBarStyle = UIStatusBarStyleLightContent;
                    }
        //                UIStatusBarStyle dd = self.preferredStatusBarStyle;
                }
            }else{
                if (frame.origin.y == GLOBAL_SYS_STATUS_HEIGHT) {
                    
                }else{
                    frame.origin.y -= 70;
                    ws.OverviewView.frame = frame;
                    PCBViewBorderRadius(ws.OverviewView,0,0,[UIColor whiteColor]);
                    ws.businessView.backgroundColor = [UIColor whiteColor];
                    if (@available(iOS 13.0, *)) {
        //                        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;//文字是黑色
                        ws.StatusBarStyle = UIStatusBarStyleDarkContent;
                    } else {
        //                        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//文字黑色
                        ws.StatusBarStyle = UIStatusBarStyleDefault;
                    }
                }
            }
        }];
        [self setNeedsStatusBarAppearanceUpdate];
}

-(void)addBusinessView{
    NSArray * arr = @[@"Business",@"Name",@"Company",@"Business",@"Name",@"Company"];
    CGFloat totalWidth = 0;
    
    for (int i=0; i<arr.count; i++) {
        UILabel *lable = [[UILabel alloc]init];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.text = arr[i];
        UIFont * font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
        lable.font = font;
        lable.tag = 100+i;
        lable.textColor = [UIColor colorWithHexString:@"ffffff"];
        if(i==0){
            lable.backgroundColor = [UIColor colorWithHexString:@"2272FF"];
        }else{
            lable.backgroundColor = [UIColor colorWithHexString:@"3F4F69"];
        }
        
        lable.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclickLable:)];
        [lable addGestureRecognizer:tapGesture];
        
        [self.businessView addSubview:lable];
        PCBViewBorderRadius(lable,8,0,[UIColor whiteColor]);
        
        CGFloat width = [arr[i] getWidthWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
        totalWidth += width+16+12;
        
        if (i==0) {
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_businessView.mas_top).offset(64);
                make.left.equalTo(_businessView.mas_left).offset(12);
                make.width.offset(width+16);
                make.height.offset(38);
            }];
        }else{
            NSInteger lastTag = 100+i-1;
            UILabel *lastLable = (UILabel *)[self.view viewWithTag:lastTag];
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_businessView.mas_top).offset(64);
                make.left.equalTo(lastLable.mas_right).offset(12);
                make.width.offset(width+16);
                make.height.offset(38);
            }];
        }
    }
    
    _businessView.contentSize = CGSizeMake(totalWidth+12, 200);
}

//控制器修改状态栏样式  重写系统属性
- (UIStatusBarStyle)preferredStatusBarStyle {
    return  _StatusBarStyle;
}
@end
