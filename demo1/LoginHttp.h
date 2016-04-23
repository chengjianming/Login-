//
//  LoginHttp.h
//  demo1
//
//  Created by jame on 16/4/21.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserLogin.h"
@interface LoginHttp : NSObject
@property (strong,nonatomic) NSDictionary  *data;
//登录
+(void)loginUserName:(NSString *)userName UserPwd:(NSString *)userPwd callback:(void(^)(UserLogin *))callback error:(void(^)(NSError *))error;
@end
