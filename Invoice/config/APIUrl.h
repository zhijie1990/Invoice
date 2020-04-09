//
//  APIUrl.h
//  Invoice
//
//  Created by zj on 2020/3/26.
//  Copyright © 2020 zj. All rights reserved.
//


#ifndef APIUrl_h
#define APIUrl_h


#endif /* APIUrl_h */


#define kNetPath_BM_Base @"http://47.100.127.232:8098"
#define kNetPath_BM_Other @"http://47.100.127.232:8099"
#define kNetPath_BM_Login @"http://47.100.127.232:8088"


//关于的版本

#define kAbout_Invoce_Version  @""

//登录
//#define kNetPath_BM_Login @"/api/user/login"



//测试
//#define kNetPath_BM_Login @"zx?type=1&catalog=41"



//发送验证码
#define kNetPath_BM_SendVerification @"api/employee/sendVerificationCode"
//获取options信息
#define kNetPath_GJ_options @"/api/info/options"
//获取订单列表
#define kNetPath_GJ_Orders @"/api/employee/orders"
//批量添加房间
#define kNetPath_GJ_AddOrder @"/api/room/batchcreate"
//获取所有资产信息
#define kNetPath_GJ_AllFurnitures @"/api/furniture"
//获取资产信息
#define kNetPath_GJ_Furnitures @"/api/furniture/roomList"
//添加资产信息
#define kNetPath_GJ_AddFurnitures @"/api/furniture/create"
//删除房间信息
#define kNetPath_GJ_Delroom @"/api/room/delete"
//删除资产信息
#define kNetPath_GJ_DelFurniture @"/api/furniture/delete"
//添加单个房间
#define kNetPath_GJ_Addroom @"/api/room/create"
//完成订单
#define kNetPath_GJ_Complete @"/api/employee/finish"
//撤销订单
#define kNetPath_GJ_Cancel @"/api/orders/refuse"
//用户信息
#define kNetPath_GJ_Infon @"/api/employee/info"
//修改保养计划
#define kNetPath_GJ_SetSchedule @"/api/furniture/setSchedule"
//自动匹配资产
#define kNetPath_GJ_AutoFurniture @"/api/furniture/auto"
//更新用户信息
#define kNetPath_GJ_UpdateEmployee @"/api/employee/update"
//上传头像
#define kNetPath_GJ_UploadImage @"/api/member/upload"
//退出登录
#define kNetPath_GJ_SignOut @"/api/employee/signOut"
//获取图片
#define kNetPath_GJ_GetImage @"/api/member/image"
//获取业绩
#define kNetPath_GJ_GetChart @"/api/employee/completed"
//提交模板
#define kNetPath_GJ_AddTemplate @"/api/employee/createTemplate"
//获取模板
#define kNetPath_GJ_GetTemplate @"/api/employee/templates"
//删除模板
#define kNetPath_GJ_DelTemplate @"/api/employee/deleteTemplate"

//注册
#define kNetPath_E_Register kNetPath_BM_Login@"/translate/auth/register"
//登录
#define kNetPath_E_Login kNetPath_BM_Login@"/translate/auth/login"
//退出登录
#define kNetPath_E_SignOut kNetPath_BM_Login@"/translate/auth/logoff"
//获取计划内容（单词）
#define kNetPath_E_GetPlan kNetPath_BM_Base@"/translate/task/getTask"
//获取计划详情
#define kNetPath_E_GetTeskDetail kNetPath_BM_Base@"/translate/task/getTaskSummary"
//获取计划详情
#define kNetPath_E_GetPlanDetail kNetPath_BM_Base@"/translate/plan/query"
//获取计划id
#define kNetPath_E_GetPlanId kNetPath_BM_Base@"/translate/plan/getUserPlan"
//同步每日计划结果
#define kNetPath_E_SendPlan kNetPath_BM_Base@"/translate/task/synchronize/TaskResult"
//获取英语书
#define kNetPath_E_GetBooks kNetPath_BM_Other@"/translate/book/books"
//制定计划
#define kNetPath_E_Make kNetPath_BM_Base@"/translate/plan/make"
//修改计划
#define kNetPath_E_Modify kNetPath_BM_Base@"/translate/plan/modify"







