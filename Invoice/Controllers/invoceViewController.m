//
//  invoceViewController.m
//  Invoice
//
//  Created by zj on 2020/3/28.
//  Copyright © 2020 zj. All rights reserved.
//

#import "invoceViewController.h"

@interface invoceViewController ()
@property (nonatomic,strong)UIView * invoceView;

@end

@implementation invoceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.invoceView];
//    self.view.backgroundColor = [UIColor redColor];
}

-(UIView *)invoceView{
    if(!_invoceView){
        CGRect  frame = [UIView frameWithOutNavSta];
        _invoceView = [[UIView alloc]initWithFrame:frame];
        _invoceView.backgroundColor = [UIColor redColor];
    }
    return _invoceView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
