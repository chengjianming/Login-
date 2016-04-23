//
//  LoginHttp.m
//  demo1
//
//  Created by jame on 16/4/21.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import "LoginHttp.h"
#import "UserLogin.h"
#import "BaseNetManager.h"
// 测试部测试环境
#ifdef TEST
#define URL_API_DOMAIN @"http://192.168.1.126:8080/living-area-web/api"
#endif

@implementation LoginHttp
+(void)loginUserName:(NSString *)userName UserPwd:(NSString *)userPwd callback:(void (^)(UserLogin *))callback error:(void (^)(NSError *))error{
    NSDictionary *params = [NSDictionary dictionary];
    [params setValue:userName forKey:@"contact"];
    [params setValue:userPwd forKey:@"password"];
    NSLog(@"%@",params);
//    NSString *loginUrl = @"http://192.168.1.126:8080/living-area-web/api/login.do?contact=18868196382&password=000000";
    NSString *url = @"http://192.168.1.126:8080/living-area-web/api";
    NSString *login = [url stringByAppendingString:@"/login.do?contact=%@&password=%@"];
    NSString *loginUrl = [NSString stringWithFormat:@"http://192.168.1.106:8080/living-area-web/api/login.do?contact=%@&password=%@",userName,userPwd];
    [BaseNetManager POST:loginUrl parameters:nil completionHandler:^(id responseObj, NSError *error) {
//        UserLogin *user = [UserLogin mj_objectWithKeyValues:responseObj];
//        NSDictionary *dic = user.userId;
//
        
    }];
    
}
@end
