//
//  UserLogin.h
//  demo1
//
//  Created by jame on 16/4/21.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface User : NSObject
@property (strong,nonatomic) NSString  *attestation;
@property (strong,nonatomic) NSString  *cardNo;
@property (assign,nonatomic) NSInteger  *countyCode;
@property (strong,nonatomic) NSString  *lastLoginIp;
@property (strong,nonatomic) NSString  *lastLoginTime;
@property (strong,nonatomic) NSString  *loginIp;
@property (strong,nonatomic) NSString  *loginTime;
@property (strong,nonatomic) NSString  *recordCreateTime;
@property (strong,nonatomic) NSString  *role;
@property (strong,nonatomic) NSString  *secondpwd;
@property (strong,nonatomic) NSString  *state;
@property (strong,nonatomic) NSString  *villageId;
@property (strong,nonatomic) NSString  *villageName;
@property(nonatomic,strong)NSString *contact;
@property(nonatomic,assign)NSInteger password;
@property(nonatomic,assign)NSInteger sex;
@property(nonatomic,strong)NSString *realName;
@property(nonatomic,strong)NSString *headImg;
@end


@interface UserLogin : NSObject
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,copy) NSString *succ;
//登录成功时候获取
@property(nonatomic,strong)User *userId;
@end
