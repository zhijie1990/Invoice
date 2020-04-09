//
//  BM_NetAPIManager.h
//  MBDoctorClient
//
//  Created by zj on 15/10/30.
//  Copyright © 2015年 zm. All rights reserved.
//

#import "BMNetBasicAPIClient.h"
#import "AFNetworking.h"

@interface BM_NetAPIManager : NSObject
+ (instancetype)sharedManager;
//登录
- (void)request_GET_WithParams:(id)params Path:(NSString*)aPath andBlock:(void (^)(id data, NSError *error))block;

- (void)request_POST_WithParams:(id)params Path:(NSString*)aPath andBlock:(void (^)(id data, NSError *error))block;

////注销登录
//- (void)request_Logout_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////发送验证码
//- (void)request_SendVerification_WithParams:(id)param andBlock:(void (^)(id data, NSError *error))block;
//
////登出
//- (void)request_LoginOut_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////获取房间类型
//- (void)request_RoomType_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////获取订单列表
//-(void)request_GetOrderList_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////批量添加room
//- (void)request_AddRoom_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////获得Furniture所有
//- (void)request_GetallFurnitures_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////根据roomid获得资产列表
//- (void)request_GetFurnitures_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////根据roomid添加资产
//- (void)request_AddFurniture_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////根据roomid删除房间
//- (void)request_DelRoom_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////根据furnitureid删除资产
//- (void)request_DelFurniture_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////根据type_id增加房间
//- (void)request_AddRoomSingle_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////完成订单
//- (void)request_CompleteOrder_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////删除订单
//- (void)request_CancelOrder_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////用户信息
//- (void)request_Info_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////修改保养期限
//- (void)request_SetSchedule_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////自动匹配资产
//- (void)request_AutoFurniture_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////修改用户信息
//- (void)request_UpdateEmployee_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////修改用户头像
//- (void)request_UploadDocImage_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////退出登录
//- (void)request_signOut_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////获取图片
//- (void)request_getImage_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////获取业绩
//- (void)request_GetChart_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////提交模板
//- (void)request_AddTemplate_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////获取模板
//- (void)request_GetTemplate_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
////删除模板
//- (void)request_DelTemplate_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////上传头像
//- (void)uploadDocWithImage:(UIImage *)image Path:(NSString *)path Name:(NSString *)name WithParams:(id)param 
//                  andBlock:(void (^)(id data, NSError *error))block
//             progerssBlock:(void (^)(CGFloat progressValue))progress;






@end
