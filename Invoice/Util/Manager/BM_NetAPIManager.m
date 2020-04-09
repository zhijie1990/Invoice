//
//  BM_NetAPIManager.m
//  MBDoctorClient
//
//  Created by zj on 15/10/30.
//  Copyright © 2015年 zm. All rights reserved.
//

#import "BM_NetAPIManager.h"
#import "BMNetBasicAPIClient.h"
#import "AppDelegate.h"
//#import "LoginViewController.h"

@implementation BM_NetAPIManager
+ (instancetype)sharedManager {
    static BM_NetAPIManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc]init];
    });
    return shared_manager;
}


- (void)request_GET_WithParams:(id)params Path:(NSString*)aPath andBlock:(void (^)(id, NSError *))block{
    
    [[BMNetBasicAPIClient sharedJsonClient] requestJsonDataWithPath:aPath withParams:params withMethodType:Get andBlock:^(NSNumber *code, id data, NSString *message, NSError *error) {
        if(code.intValue ==99){
            [self showHudTipStr:message];
            block(nil, error);
        }else{
            if (data) {
//                [self showHudTipStr:message];
                block(data, nil);
            }else{
                block(nil, error);
            }
        }
        
    }];
}

- (void)request_POST_WithParams:(id)params Path:(NSString*)aPath andBlock:(void (^)(id, NSError *))block{
    [[BMNetBasicAPIClient sharedJsonClient] requestJsonDataWithPath:aPath withParams:params withMethodType:Post andBlock:^(NSNumber *code, id data, NSString *message, NSError *error) {
        if(code.intValue ==99){
            [self showHudTipStr:message];
            block(nil, error);
        }else{
            if (data) {
                [self showHudTipStr:message];
                block(data, nil);
            }else{
                block(nil, error);
            }
        }
        
    }];
}







@end
