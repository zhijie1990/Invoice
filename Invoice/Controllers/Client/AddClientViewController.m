//
//  AddClientViewController.m
//  Invoice
//
//  Created by zj on 2020/4/8.
//  Copyright © 2020 zj. All rights reserved.
//

#import "AddClientViewController.h"

@interface AddClientViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray*leftArr,*heardArr;
@property (nonatomic,strong)UITextField *name,*mail,*phone,*mobile,*company,*building1,*building2,*building3,*shipping1,*shipping2;
@property (nonatomic,strong)UIButton *saveBtn;
@property (nonatomic,strong)NSString* ss;
@property (nonatomic,assign)BOOL isAddAddress;

@end

@implementation AddClientViewController

#pragma mark - Cycle life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupVerUI];
    _leftArr =@[NSLocalizedString(@"Name",nil),NSLocalizedString(@"E-mail",nil),NSLocalizedString(@"Phone",nil),NSLocalizedString(@"Moble",nil),NSLocalizedString(@"Company",nil)];
    _heardArr = @[NSLocalizedString(@"Billing Adresss",nil),NSLocalizedString(@"Shipping Adress",nil)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.saveBtn];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    _ss = @"1";
    _isAddAddress = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Getter and setter
- (UIButton *)saveBtn{
    if (!_saveBtn) {
        _saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 36)];
        [_saveBtn setTitle:NSLocalizedString(@"Save", nil) forState:UIControlStateNormal];
        [_saveBtn setTitleColor:[UIColor colorWithHexString:kMainColor] forState:UIControlStateNormal];
        [_saveBtn addTarget:self action:@selector(saveForm:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveBtn;
}

-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.backgroundColor = [UIColor whiteColor];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.numberOfLines = 0;
        _titleLable.text = NSLocalizedString(@"Add Client", nil);
        _titleLable.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:32];
        _titleLable.textColor = [UIColor blackColor];
    }
    return _titleLable;
}

-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = YES;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}



#pragma mark - Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_isAddAddress==NO) {
         return 2;
    }else{
        return 3;
    }
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isAddAddress==NO) {
        if (section==0) {
            return 5;
        }else{
            return 1;
        }
    }else{
        if (section==0) {
            return 5;
        }else if (section == 1){
            return 3;
        }else{
            return 2;
        }
    }
    
   
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        UILabel *leftLable = [[UILabel alloc]init];
        leftLable.textAlignment = NSTextAlignmentLeft;
        leftLable.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        leftLable.text = _leftArr[indexPath.row];
//        leftLable.backgroundColor = [UIColor redColor];
        [cell addSubview:leftLable];
        [leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cell.mas_top).offset(0);
            make.left.equalTo(cell.mas_left).offset(Margin_horizontal);
            make.width.offset(80);
            make.height.offset(44);
        }];
        
        switch (indexPath.row) {
            case 0:{
                    if (!_name) {
                        _name = [[UITextField alloc]init];
                        _name.textAlignment = NSTextAlignmentRight;
                        _name.font = [UIFont systemFontOfSize:16];
                        _name.placeholder = @"Jack";
                        _name.clearButtonMode = UITextFieldViewModeWhileEditing;
                        _name.returnKeyType = UIReturnKeyDone;
                        _name.keyboardType = UIKeyboardTypeDefault;
                    }
                        [cell addSubview:_name];
                        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(cell.mas_top).offset(0);
                            make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                            make.width.offset(kScreen_Width-80-2*Margin_horizontal);
                            make.height.offset(44);
                        }];
                    
                }
                break;
            case 1:{
                    if (!_mail) {
                        _mail = [[UITextField alloc]init];
                        _mail.textAlignment = NSTextAlignmentRight;
                        _mail.font = [UIFont systemFontOfSize:16];
                        _mail.placeholder = @"Abc@gmail.com";
                        _mail.clearButtonMode = UITextFieldViewModeWhileEditing;
                        _mail.returnKeyType = UIReturnKeyDone;
                        _mail.keyboardType = UIKeyboardTypeEmailAddress;
                    }
                        [cell addSubview:_mail];
                        [_mail mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(cell.mas_top).offset(0);
                            make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                            make.width.offset(kScreen_Width-80-2*Margin_horizontal);
                            make.height.offset(44);
                        }];
                    
                }
                break;
            case 2:{
                    if (!_phone) {
                        _phone = [[UITextField alloc]init];
                        _phone.textAlignment = NSTextAlignmentRight;
                        _phone.font = [UIFont systemFontOfSize:16];
                        _phone.placeholder = @"555-555-555";
                        _phone.clearButtonMode = UITextFieldViewModeWhileEditing;
                        _phone.returnKeyType = UIReturnKeyDone;
                        _phone.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
                    }
                        [cell addSubview:_phone];
                        [_phone mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(cell.mas_top).offset(0);
                            make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                            make.width.offset(kScreen_Width-80-2*Margin_horizontal);
                            make.height.offset(44);
                        }];
                }
                break;
            case 3:{
                    if (!_mobile) {
                        _mobile = [[UITextField alloc]init];
                        _mobile.textAlignment = NSTextAlignmentRight;
                        _mobile.font = [UIFont systemFontOfSize:16];
                        _mobile.placeholder = @"555-555-555";
                        _mobile.clearButtonMode = UITextFieldViewModeWhileEditing;
                        _mobile.returnKeyType = UIReturnKeyDone;
                        _mobile.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
                    }
                        [cell addSubview:_mobile];
                        [_mobile mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(cell.mas_top).offset(0);
                            make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                            make.width.offset(kScreen_Width-80-2*Margin_horizontal);
                            make.height.offset(44);
                        }];
                }
                break;
            case 4:{
                    if (!_company) {
                        _company = [[UITextField alloc]init];
                        _company.textAlignment = NSTextAlignmentRight;
                        _company.font = [UIFont systemFontOfSize:16];
                        _company.placeholder = @"GetGame.inc";
                        _company.clearButtonMode = UITextFieldViewModeWhileEditing;
                        _company.returnKeyType = UIReturnKeyDone;
                        _company.keyboardType = UIKeyboardTypeDefault;
                    }
                        [cell addSubview:_company];
                        [_company mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(cell.mas_top).offset(0);
                            make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                            make.width.offset(kScreen_Width-80-2*Margin_horizontal);
                            make.height.offset(44);
                        }];
                }
                break;
            default:
                break;
        }
        
    }else{
        if (_isAddAddress == NO) {
                    UIImageView *imageView = [[UIImageView alloc]init];
                    imageView.image = [UIImage imageNamed:@"clientAdd"];
                    [cell addSubview:imageView];
                    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.top.equalTo(cell.mas_top).offset(0);
                       make.left.equalTo(cell.mas_left).offset(Margin_horizontal-10);
                       make.width.offset(44);
                       make.height.offset(44);
                   }];
            
                    UILabel *leftLable = [[UILabel alloc]init];
                    leftLable.textAlignment = NSTextAlignmentLeft;
                    leftLable.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
                    leftLable.text = NSLocalizedString(@"Add Address", nil);
            //        leftLable.backgroundColor = [UIColor redColor];
                    [cell addSubview:leftLable];
                    [leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(cell.mas_top).offset(0);
                        make.left.equalTo(imageView.mas_right).offset(0);
                        make.width.offset(100);
                        make.height.offset(44);
                    }];
        }else{
            if (indexPath.section == 1) {
                switch (indexPath.row) {
                    case 0:{
                            if (!_building1) {
                                _building1 = [[UITextField alloc]init];
                                _building1.textAlignment = NSTextAlignmentLeft;
                                _building1.font = [UIFont systemFontOfSize:16];
                                _building1.placeholder = @"SlideShare Inc";
                                _building1.clearButtonMode = UITextFieldViewModeWhileEditing;
                                _building1.returnKeyType = UIReturnKeyDone;
                                _building1.keyboardType = UIKeyboardTypeDefault;
                            }
                                [cell addSubview:_building1];
                                [_building1 mas_makeConstraints:^(MASConstraintMaker *make) {
                                    make.top.equalTo(cell.mas_top).offset(0);
                                    make.left.equalTo(cell.mas_left).offset(Margin_horizontal);
                                    make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                                    make.height.offset(44);
                                }];
                        }
                        break;
                    case 1:{
                            if (!_building2) {
                                _building2 = [[UITextField alloc]init];
                                _building2.textAlignment = NSTextAlignmentLeft;
                                _building2.font = [UIFont systemFontOfSize:16];
                                _building2.placeholder = @"490 2nd St";
                                _building2.clearButtonMode = UITextFieldViewModeWhileEditing;
                                _building2.returnKeyType = UIReturnKeyDone;
                                _building2.keyboardType = UIKeyboardTypeDefault;
                            }
                                [cell addSubview:_building2];
                                [_building2 mas_makeConstraints:^(MASConstraintMaker *make) {
                                    make.top.equalTo(cell.mas_top).offset(0);
                                   make.left.equalTo(cell.mas_left).offset(Margin_horizontal);
                                    make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                                    make.height.offset(44);
                                }];
                        }
                        break;
                    case 2:{
                            if (!_building3) {
                                _building3 = [[UITextField alloc]init];
                                _building3.textAlignment = NSTextAlignmentLeft;
                                _building3.font = [UIFont systemFontOfSize:16];
                                _building3.placeholder = @"Suite 300";
                                _building3.clearButtonMode = UITextFieldViewModeWhileEditing;
                                _building3.returnKeyType = UIReturnKeyDone;
                                _building3.keyboardType = UIKeyboardTypeDefault;
                            }
                                [cell addSubview:_building3];
                                [_building3 mas_makeConstraints:^(MASConstraintMaker *make) {
                                    make.top.equalTo(cell.mas_top).offset(0);
                                    make.left.equalTo(cell.mas_left).offset(Margin_horizontal);
                                    make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                                    make.height.offset(44);
                                }];
                        }
                        break;
                default:
                    break;
                }
            }else{
                switch (indexPath.row) {
                    case 0:{
                            if (!_shipping1) {
                                _shipping1 = [[UITextField alloc]init];
                                _shipping1.textAlignment = NSTextAlignmentLeft;
                                _shipping1.font = [UIFont systemFontOfSize:16];
                                _shipping1.placeholder = @"SlideShare";
                                _shipping1.clearButtonMode = UITextFieldViewModeWhileEditing;
                                _shipping1.returnKeyType = UIReturnKeyDone;
                                _shipping1.keyboardType = UIKeyboardTypeDefault;
                            }
                                [cell addSubview:_shipping1];
                                [_shipping1 mas_makeConstraints:^(MASConstraintMaker *make) {
                                    make.top.equalTo(cell.mas_top).offset(0);
                                    make.left.equalTo(cell.mas_left).offset(Margin_horizontal);
                                    make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                                    make.height.offset(44);
                                }];
                        }
                        break;
                    case 1:{
                            if (!_shipping2) {
                                _shipping2 = [[UITextField alloc]init];
                                _shipping2.textAlignment = NSTextAlignmentLeft;
                                _shipping2.font = [UIFont systemFontOfSize:16];
                                _shipping2.placeholder = @"San Francisco";
                                _shipping2.clearButtonMode = UITextFieldViewModeWhileEditing;
                                _shipping2.returnKeyType = UIReturnKeyDone;
                                _shipping2.keyboardType = UIKeyboardTypeDefault;
                            }
                                [cell addSubview:_shipping2];
                                [_shipping2 mas_makeConstraints:^(MASConstraintMaker *make) {
                                    make.top.equalTo(cell.mas_top).offset(0);
                                    make.left.equalTo(cell.mas_left).offset(Margin_horizontal);
                                    make.right.equalTo(cell.mas_right).offset(-Margin_horizontal);
                                    make.height.offset(44);
                                }];
                        }
                        break;
                default:
                    break;
                }
            }
        }
        
    }
    
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 30;
    }
       
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
       return 44;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreen_Width, 20)];
    bg.backgroundColor = [UIColor colorWithHexString:@"F0F1F2"];
    if (section>0&&_isAddAddress == YES) {
        UILabel * lable = [[UILabel alloc]init];
        lable.textAlignment = NSTextAlignmentLeft;
        lable.font = [UIFont systemFontOfSize:14];
        lable.textColor = [UIColor colorWithHexString:@"1A2B3C"];
        lable.text = _heardArr[section-1];
        [bg addSubview:lable];
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bg.mas_top).offset(0);
            make.left.equalTo(bg.mas_left).offset(Margin_horizontal);
            make.right.equalTo(bg.mas_right).offset(-Margin_horizontal);
            make.height.offset(30);
        }];
    }
    
    return   bg;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_isAddAddress == NO && indexPath.section==1) {
        _isAddAddress = YES;
        [_tableView reloadData];
    }
    
}




#pragma mark - Net request



#pragma mark - Event method
-(void)saveForm:(UIButton*)btn{
    if (_ss == @"1") {
        _name.userInteractionEnabled = NO;
//        _name.enabled = NO;
        _ss = @"2";
    }else{
        _ss = @"1";
        _name.userInteractionEnabled = YES;
    }
    
}


#pragma mark - Pravit method
-(void)setupVerUI{
    WS(ws)
    [self.view addSubview:self.titleLable];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top).offset(0);
        make.left.equalTo(ws.view.mas_left).offset(Margin_horizontal);
        make.right.equalTo(ws.view.mas_right).offset(-Margin_horizontal);
        make.height.offset(54);
    }];
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLable.mas_bottom).offset(0);
        make.left.equalTo(ws.view.mas_left).offset(0);
        make.right.equalTo(ws.view.mas_right).offset(0);
        make.bottom.equalTo(ws.view.mas_bottom);
//         make.height.offset(294);
    }];
}
    



@end
