//
//  BMNetBasicAPIClient.h
//  MBDoctorClient
//
//  Created by zj on 15/10/30.
//  Copyright © 2015年 zm. All rights reserved.
//

#import "AFHTTPSessionManager.h"
typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;
@interface BMNetBasicAPIClient : AFHTTPSessionManager
+ (BMNetBasicAPIClient *)sharedJsonClient;
- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary
                                 *)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(void (^)(NSNumber *code,id data,NSString* message,NSError *error))block;

//- (void)uploadImage:(UIImage *)image path:(NSString *)path name:(NSString *)name withParams:(NSDictionary*)params
//       successBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
//       failureBlock:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
//      progerssBlock:(void (^)(CGFloat progressValue))progress;

@end
