//
//  LoginHttp.h
//  demo1
//
//  Created by jame on 16/4/21.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserLogin.h"
#import "BaseNetManager.h"
@interface LoginHttp : BaseNetManager
@property (strong,nonatomic) NSDictionary  *data;
//登录
+(id)loginUserName:(NSString *)userName UserPwd:(NSString *)userPwd completionHandle:(void (^)(UserLogin *use,NSError *error ))complete;
@end
