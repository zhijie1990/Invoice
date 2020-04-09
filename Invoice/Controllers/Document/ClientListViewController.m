//
//  ClientListViewController.m
//  Invoice
//
//  Created by zj on 2020/3/31.
//  Copyright © 2020 zj. All rights reserved.
//

#import "ClientListViewController.h"
#import "DocumentTemp1Cell.h"

@interface ClientListViewController ()
@property(nonatomic,strong)UIButton *backButton1;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray * listGroupname;


@end

@implementation ClientListViewController

#pragma mark - Cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"Clients";
//    self.navigationController.navigationBar.prefersLargeTitles = YES;
//    self.navigationController.navigationItem.largeTitleDisplayMode =  UINavigationItemLargeTitleDisplayModeAutomatic;
    
    _listGroupname = @[@"#",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    
    [self setupVerUI];
    
    

//
//
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backButton1];
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    _segmentType = @"1";
//    NSArray *ss = _segmentArr;
//    NSInteger aa = self.documentTpye;
    
}

#pragma mark - Getter and setter
- (UIButton *)backButton1{
    
    if (!_backButton1) {
        _backButton1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 36)];
        [_backButton1 setImage:[UIImage imageNamed:@"custom_back_btn_icon"] forState:UIControlStateNormal];
//        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
//        [_backButton setTitle:@"按钮" forState:UIControlStateNormal];
//        [_backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_backButton1 addTarget:self action:@selector(showLeftMenuPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton1;
}

-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.backgroundColor = [UIColor whiteColor];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.numberOfLines = 0;
        _titleLable.text = NSLocalizedString(@"Clients", nil);
        _titleLable.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:32];
        _titleLable.textColor = [UIColor blackColor];
    }
    return _titleLable;
}


-(UISegmentedControl*)segment{
    if(!_segment){
        _segment = [[UISegmentedControl alloc]initWithItems:_segmentArr];
        _segment.selectedSegmentIndex = 0;
        _segment.momentary = NO;
        [_segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _segment;
}


-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = YES;
        _tableView.sectionIndexMinimumDisplayRowCount = 5;
    }
    return _tableView;
}


#pragma mark - Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 27;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DocumentTemp1Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"documentTemp1Cell"];
         if (cell==nil) {
             cell = [[DocumentTemp1Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"documentTemp1Cell"];
                cell.selectionStyle = UITableViewCellSelectionStyleDefault;
         }
         cell.backgroundColor = [UIColor whiteColor];
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if([_segmentType  isEqual: @"1"]){
        return 30;
    }else{
        return 0;
    }
       
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
       return 80;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreen_Width, 30)];
    bg.backgroundColor = [UIColor colorWithHexString:@"F0F1F2"];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(Margin_horizontal, 5, 100, 20)];
    lable.text = _listGroupname[section];
    lable.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
    lable.textAlignment = NSTextAlignmentLeft;
    [bg addSubview:lable];
    return   bg;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat sectionHeaderHeight = 20;
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}

- (NSArray *) sectionIndexTitlesForTableView: (UITableView *)tableView {
    
    
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    for (NSString *item in _listGroupname) {
          NSString *title = [item substringToIndex: 1];
          [listTitles addObject: title];
    }
    
    if(_segmentType == @"1"){
          return listTitles;
       }else{
           return nil;
       }

    
}





#pragma mark - Net request



#pragma mark - Event method
- (void)segmentAction:(UISegmentedControl*)sender
{
    NSLog(@"%ld",sender.selectedSegmentIndex);
    switch (sender.selectedSegmentIndex) {
        case 0:{
            _segmentType = @"1";
            [_tableView reloadData];
        }
        break;
        case 1:{
            _segmentType = @"2";
            [_tableView reloadData];
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

-(void) setupVerUI{
    WS(ws)
    [self.view addSubview:self.titleLable];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top).offset(0);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.height.offset(54);
    }];
    
    [self.view addSubview:self.segment];
    [_segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLable.mas_bottom).offset(10);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.height.offset(32);
    }];
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_segment.mas_bottom).offset(10);
        make.left.equalTo(ws.view.mas_left).offset(0);
        make.right.equalTo(ws.view.mas_right).offset(0);
        make.bottom.equalTo(ws.view.mas_bottom).offset(-GLOBAL_SYS_HOME_INDICATOR_HEIGHT);
    }];
    
    
}


@end
