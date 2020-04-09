//
//  Document_RootViewController.m
//  Invoice
//
//  Created by zj on 2020/3/28.
//  Copyright © 2020 zj. All rights reserved.
//

#import "Document_RootViewController.h"
#import "RootTobView.h"
#import "ClientListViewController.h"
#import "InvoiceListViewController.h"

@interface Document_RootViewController ()<RootTobDelegate,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating,UISearchControllerDelegate>
@property(nonatomic,strong) UIView *documentView;
@property (nonatomic,strong) UIScrollView *businessView;
@property (nonatomic,strong) RootTobView *rootTobView;
@property (nonatomic) UIStatusBarStyle StatusBarStyle;
@property (nonatomic) BOOL isBussinessViewShow;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *doucmentnArr;
//searchController
@property (strong, nonatomic)  UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *historyListArray; // 搜索历史数组
@property(nonatomic,assign)BOOL searchActive;

@end

@implementation Document_RootViewController



#pragma mark - Cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _doucmentnArr = @[@[NSLocalizedString(@"Clients", nil),NSLocalizedString(@"Create and manage your clients", nil)],
                      @[NSLocalizedString(@"Items", nil),NSLocalizedString(@"Reusable services or products", nil)],
                      @[NSLocalizedString(@"Invoices", nil),NSLocalizedString(@"Charge for services or products", nil)],
                      @[NSLocalizedString(@"Estimate", nil),NSLocalizedString(@"Send a proposal of services or products", nil)],
                      @[NSLocalizedString(@"Purchase orders", nil),NSLocalizedString(@"Request a purchase from a seller", nil)],
                      @[NSLocalizedString(@"Credit memos", nil),NSLocalizedString(@"Issue a cost reduction or cancellation of an invoice", nil)],
                      @[NSLocalizedString(@"Expenses", nil),NSLocalizedString(@"Track your company’s costs", nil)],
                      @[NSLocalizedString(@"Time Tracking", nil),NSLocalizedString(@"Track work hours", nil)],
                      @[NSLocalizedString(@"Trash", nil),NSLocalizedString(@"Deleted files will remain in the trash", nil)]];
    [self setupVerUI];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    _isBussinessViewShow = NO;
    [self addBusinessView];
    [self animate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Getter and setter
-(UIView*)documentView{
    if (!_documentView) {
        CGRect  frame = [UIView frameWithOutTabSta];
        _documentView = [[UIView alloc]initWithFrame:frame];
        _documentView.backgroundColor = [UIColor whiteColor];
    }
    return _documentView;
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

-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"dddddd"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = YES;
        _tableView.tableFooterView = [[UIView alloc] init];

        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]){
//            [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
//            [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    return _tableView;
}

-(UISearchController*)searchController{
    if (!_searchController) {
        //创建UISearchController
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        //设置代理
        _searchController.delegate = self;
        _searchController.searchResultsUpdater = self;
        //设置UISearchController的显示属性，以下3个属性默认为YES
        //搜索时，背景变暗色
        _searchController.dimsBackgroundDuringPresentation = NO;
        //搜索时，背景变模糊
        _searchController.obscuresBackgroundDuringPresentation = NO;
        //隐藏导航栏
        _searchController.hidesNavigationBarDuringPresentation = NO;
        _searchController.searchBar.backgroundColor = [UIColor whiteColor];
        _searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchController.searchBar.placeholder =[NSString stringWithFormat:@"%@%@",@"  ",NSLocalizedString(@"Search", nil)];
        _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 54.0);
        //UIViewController中的属性，将UISearchViewController的view添加在了当前控制器View上。避免searchBar被遮挡，或者cell跳转时候依然在上面的情况
        self.definesPresentationContext = YES;
    }
    return _searchController;
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
    
    if (self.searchController.active) {
           return 0 ;
       }
    return 9;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIImageView * icon_img = [[UIImageView alloc]init];
    icon_img.image = [UIImage imageNamed:@"clients_icon"];
    [cell addSubview:icon_img];
    [icon_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.mas_top).offset(11);
        make.left.equalTo(cell.mas_left).offset(14);
        make.height.offset(60);
        make.width.offset(60);
    }];
    
    UILabel *lable1 = [[UILabel alloc]init];
    lable1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    lable1.text = _doucmentnArr[indexPath.row][0];
    lable1.textColor = [UIColor colorWithHexString:@"091522"];
    lable1.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:lable1];
    [lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.mas_top).offset(16);
        make.left.equalTo(icon_img.mas_right).offset(14);
        make.height.offset(35);
        make.width.offset(kScreen_Width-128);
    }];
    
    UILabel *lable2 = [[UILabel alloc]init];
    lable2.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    lable2.textColor = [UIColor colorWithHexString:@"828B95"];
    lable2.text = _doucmentnArr[indexPath.row][1];
    lable2.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:lable2];
    [lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lable1.mas_bottom).offset(-5);
        make.left.equalTo(icon_img.mas_right).offset(14);
        make.height.offset(20);
        make.width.offset(kScreen_Width-128);
    }];
    
    
    return  cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//       return 0;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
       return 80;
    
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreen_Width, 45)];
//    bg.backgroundColor = [UIColor redColor];
//    return   bg;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            ClientListViewController *VC = [[ClientListViewController alloc]init];
            VC.documentTpye = Clients;
        //  VC.segmentArr = [[NSArray alloc]initWithObjects:NSLocalizedString(@"Name", nil),NSLocalizedString(@"Price", nil), nil];
            VC.titleLable.text = NSLocalizedString(@"Clients", nil);
            VC.segmentArr = @[NSLocalizedString(@"Name", nil),NSLocalizedString(@"Date", nil)];
            [self.navigationController pushViewController:VC animated:YES];
            }
            break;
        case 1:{
           ClientListViewController *VC = [[ClientListViewController alloc]init];
           VC.documentTpye = Items;
           VC.titleLable.text = NSLocalizedString(@"Items", nil);
           VC.segmentArr = @[NSLocalizedString(@"Name", nil),NSLocalizedString(@"Price", nil)];
           [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 2:{
           InvoiceListViewController *VC = [[InvoiceListViewController alloc]init];
           VC.documentTpye = Invoices;
           VC.titleLable.text = NSLocalizedString(@"Inovices", nil);
           VC.segmentArr = @[NSLocalizedString(@"Number", nil),NSLocalizedString(@"Client", nil),NSLocalizedString(@"Date", nil),NSLocalizedString(@"DUE Date", nil)];
           [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 3:{
           InvoiceListViewController *VC = [[InvoiceListViewController alloc]init];
           VC.documentTpye = Estimates;
           VC.titleLable.text = NSLocalizedString(@"Estimates", nil);
           VC.segmentArr = @[NSLocalizedString(@"Number", nil),NSLocalizedString(@"Client", nil),NSLocalizedString(@"Date", nil)];
           [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 4:{
           InvoiceListViewController *VC = [[InvoiceListViewController alloc]init];
           VC.documentTpye = PurchaseOrders;
           VC.titleLable.text = NSLocalizedString(@"Purchase orders", nil);
           VC.segmentArr = @[NSLocalizedString(@"Number", nil),NSLocalizedString(@"Client", nil),NSLocalizedString(@"Date", nil)];
           [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 5:{
           InvoiceListViewController *VC = [[InvoiceListViewController alloc]init];
           VC.documentTpye = CreditMemos;
           VC.titleLable.text = NSLocalizedString(@"Credit memos", nil);
           VC.segmentArr = @[NSLocalizedString(@"Number", nil),NSLocalizedString(@"Client", nil),NSLocalizedString(@"Date", nil)];
           [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 8:{
           InvoiceListViewController *VC = [[InvoiceListViewController alloc]init];
           VC.documentTpye = Trash;
           VC.titleLable.text = NSLocalizedString(@"Trash", nil);
           VC.segmentArr = @[NSLocalizedString(@"Name", nil),NSLocalizedString(@"Date", nil)];
           [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        default:
            break;
    }
    
}

//- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
//    CGFloat sectionHeaderHeight =0;
//    if(scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset=UIEdgeInsetsMake(-scrollView.contentOffset.y,0,0,0);
//    }else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset=UIEdgeInsetsMake(-sectionHeaderHeight,0,0,0);
//    }
//}


#pragma mark ----------------UISearchControllerDelegate---------------------
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
//    self.searchModelResultArray = [NSMutableArray array];
    NSLog(@"updateSearchResultsForSearchController");
    NSString *searchString = [self.searchController.searchBar text];
    
    //刷新表格
    [self.tableView reloadData];
}

#pragma mark - Net request



#pragma mark - Event method



#pragma mark - Pravit method
-(void)setupVerUI{
    [self.view addSubview:self.businessView];
    [self.view addSubview:self.documentView];
    [self.documentView addSubview:self.rootTobView];

     WS(ws);
    
    [_rootTobView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(_documentView.mas_top).offset(20);
           make.left.equalTo(ws.view.mas_left).offset(0);
           make.right.equalTo(ws.view.mas_right).offset(0);
           make.height.offset(55);
       }];
    
    [self.documentView addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rootTobView.mas_bottom).offset(15);
        make.left.equalTo(ws.view.mas_left).offset(0);
        make.right.equalTo(ws.view.mas_right).offset(0);
        make.bottom.equalTo(_documentView.mas_bottom).offset(0);
//        make.height.offset(765);
    }];
    
    //UISearchController UITableView的contentSize 会无缘故的变高
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 54)];
    headerView.backgroundColor = [UIColor redColor];
    [headerView addSubview:self.searchController.searchBar];
    self.tableView.tableHeaderView = headerView;
    
    
    
    
    
}

-(void)animate{
    WS(ws)
        [UIView animateWithDuration:0.5 animations:^{
            CGRect  frame= ws.documentView.frame;
            if(ws.isBussinessViewShow){
                if (frame.origin.y == GLOBAL_SYS_STATUS_HEIGHT) {
                    frame.origin.y += 70;
                    ws.documentView.frame = frame;
                    PCBViewBorderRadius(ws.documentView,25,0,[UIColor whiteColor]);
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
                    ws.documentView.frame = frame;
                    PCBViewBorderRadius(ws.documentView,0,0,[UIColor whiteColor]);
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
