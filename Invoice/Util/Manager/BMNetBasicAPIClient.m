//
//  EYNetBasicAPIClient.m
//  Electricity
//
//  Created by zj on 15/7/24.
//  Copyright (c) 2015年 king. All rights reserved.
//

#import "BMNetBasicAPIClient.h"
//#import "SBJson.h"
#import "AppDelegate.h"
//#import "LoginViewController.h"




@implementation BMNetBasicAPIClient
+ (BMNetBasicAPIClient *)sharedJsonClient {
    static BMNetBasicAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BMNetBasicAPIClient alloc] initWithBaseURL:[NSURL URLWithString:@""]];
    });
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    // 组织报文头
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    //[self.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:@"doAction"forHTTPHeaderField:@"te_method"];
    [self.requestSerializer setValue:@"1.0"forHTTPHeaderField:@"te_version"];
    [self.requestSerializer setValue:@"moa"forHTTPHeaderField:@"party_id"];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",nil];
    self.requestSerializer.timeoutInterval = 15;
    return self;
}


- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(void (^)(NSNumber *code,id data,NSString* message,NSError *error))block {
    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:kToken];
    if ([token isEqualToString:@""]) {
        
    }else{
    [self.requestSerializer setValue:[[NSUserDefaults standardUserDefaults]objectForKey:kToken]forHTTPHeaderField:@"token"];
//        [self.requestSerializer setValue:@"asdf" forHTTPHeaderField:@"token"];
    }
    //log请求数据
    NSLog(@"\n===========request===========\n%@:\n%@",aPath, params);
    
//    NSDictionary* parameter = [[NSMutableDictionary alloc]init];
////    [parameter setValue:[params objectForKey:@"actionName"] forKey:@"actionName"];
//    [parameter setValue:[NSString stringWithFormat:@"%@|%@", [params JSONRepresentation],[self md5HexDigest:[NSString stringWithFormat:@"%@%@",kMD5Key,[params JSONRepresentation]]]] forKey: @"parameters"];
    

    //发起请求
    switch (NetworkMethod) {
        case Get:{
            [self GET:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//                NSDictionary* responseHeaders = [self.responseSerializer mutableHTTPResponseHeaders];
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary *allHeaders = response.allHeaderFields;
                
                NSNumber* code = [responseObject objectForKey:@"code"];
                NSString* message = [responseObject objectForKey:@"msg"];
                NSLog(@"\n===========response===========\n%@:\n%@", allHeaders, responseObject);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(code,nil,message, error);
                }else{
                    if ([[NSString stringWithFormat:@"%@",code] isEqual:@"A003"]) {
                        [self showHudTipStr:@"您的账号已在其他设备上登录，请重新登录"];
                        [self logOut];
                    }else{
                        block(code,responseObject,message,nil);
                    }
                }
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                //[self showError:error];
                block(nil,nil,nil, error);
            }];
            break;}
        case Post:{
            [self POST:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//                NSDictionary* responseHeaders = [self.responseSerializer mutableHTTPResponseHeaders];
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary *allHeaders = response.allHeaderFields;
                
                NSNumber* code = [responseObject objectForKey:@"code"];
                NSString* message = [responseObject objectForKey:@"msg"];
                NSLog(@"\n===========response===========\n%@:\n%@", allHeaders, responseObject);
                id error = [self handleResponse:responseObject];
                if (error) {
                    block(code,nil,message,error);
                }else{
                    if ([[NSString stringWithFormat:@"%@",code] isEqual:@"A003"]) {
                        [self showHudTipStr:@"您的账号已在其他设备上登录，请重新登录"];
                        [self logOut];
                    }else{
                        block(code,responseObject,message,nil);
                    }
                    
                }
                
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                //[self showError:error];
                block(nil,nil,@"服务器访问失败",error);
            }];
            break;
        }
        default:
            break;
    }
    
}


//- (void)uploadImage:(UIImage *)image path:(NSString *)path name:(NSString *)name withParams:(NSDictionary*)params
//       successBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
//       failureBlock:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
//      progerssBlock:(void (^)(CGFloat progressValue))progress
//{
//    
//    NSData *data = UIImageJPEGRepresentation(image, 0.5);
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyyMMddHHmmss";
//    NSString *str = [formatter stringFromDate:[NSDate date]];
//    NSString *fileName = [NSString stringWithFormat:@"%@_%@.png", @"dada",str];
//    NSLog(@"\nuploadImageSize\n%@ : %.0f", fileName, (float)data.length/1024);
//    NSLog(@"\n===========request===========\n%@:\n%@\n%@", path, fileName,params);
//    AFHTTPRequestOperation *operation = [self POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileData:data name:@"image" fileName:fileName mimeType:@"image/png"];
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
//        if (success) {
//            success(operation, responseObject);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@ ***** %@", operation.responseString, error);
//        if (failure) {
//            failure(operation, error);
//        }
//    }];
//    
//    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
//        CGFloat progressValue = (float)totalBytesWritten/(float)totalBytesExpectedToWrite;
//        if (progress) {
//            progress(progressValue);
//        }
//    }];
//    [operation start];
//    
//}


-(id)handleResponse:(id)responseJSON{
    NSError *error = nil;
    //code为0值时，表示有错
    NSNumber *resultCode = [responseJSON valueForKeyPath:@"code"];
    
    if (resultCode.intValue == 99) {
        error = [NSError errorWithDomain:kNetPath_BM_Base code:resultCode.intValue userInfo:responseJSON];
        //[self showError:error];
        
//        if (resultCode.intValue == 1000) {//用户未登录
//            //[self loginOutToLoginVC];
//        }
    }
    return error;
}


- (void)logOut{
    
    AppDelegate *app =(AppDelegate *)[[UIApplication sharedApplication] delegate];
    //    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    [app.window setRootViewController:[[LoginViewController alloc]init]];
//
//    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kUserId];
//    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kToken];
//    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kPlanId];
}




@end
