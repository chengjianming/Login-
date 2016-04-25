//
//  LoginHttp.m
//  demo1
//
//  Created by jame on 16/4/21.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import "LoginHttp.h"
#import "UserLogin.h"

// 测试部测试环境
#ifdef TEST
#define URL_API_DOMAIN @"http://192.168.1.126:8080/living-area-web/api"
#endif

@implementation LoginHttp
+(id)loginUserName:(NSString *)userName UserPwd:(NSString *)userPwd completionHandle:(void (^)(UserLogin *use,NSError *error ))complete{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:userName,@"contact",userPwd,@"password", nil];
//    [params setValue:userName forKey:@"contact"];
//    [params setValue:userPwd forKey:@"password"];
    NSLog(@"%@",params);
//    NSString *loginUrl = @"http://192.168.1.115:8080/living-area-web/api/login.do?contact=18868196382&password=000000";
//    NSString *url = @"http://192.168.1.115:8080/living-area-web/api";
//    NSString *login = [url stringByAppendingString:@"/login.do?contact=%@&password=%@"];
    NSString *loginUrl = [NSString stringWithFormat:@"http://192.168.1.115:8080/living-area-web/api/login.do?contact=%@&password=%@",params[@"contact"],params[@"password"]];
    NSLog(@"%@",loginUrl);
    return [self POST:loginUrl parameters:nil completionHandler:^(id responseObj, NSError *error) {
        if (responseObj != nil) {
            NSLog(@"%@",[UserLogin mj_objectWithKeyValues:responseObj]);
            complete([UserLogin mj_objectWithKeyValues:responseObj],nil);
        }else{
            NSLog(@"%@",error);
            complete(nil,error);
        }
        
    }];
//
    
    
}
@end
