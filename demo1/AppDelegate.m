//
//  AppDelegate.m
//  demo1
//
//  Created by jame on 16/4/19.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import "AppDelegate.h"
#import "MineTableViewController.h"
#import "AppDelegate+Category.h"
#import "BaseNetManager.h"
#import "UserLogin.h"
#import "LoginHttp.h"

@interface AppDelegate ()
@property (strong,nonatomic) UserLogin  *user;
@end

@implementation AppDelegate
-(UserLogin *)user{
    if (!_user) {
        _user = [[UserLogin alloc]init];
    }
    return _user;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    MineTableViewController *MineVc = [[MineTableViewController alloc]initWithNibName:@"MineTableViewController" bundle:nil];
    UINavigationController *NMVc = [[UINavigationController alloc]initWithRootViewController:MineVc];
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    tabBar.viewControllers = @[NMVc];
    self.window.rootViewController = tabBar;
    
    
    
    
    
    
    
    
    
    
    //测试登录返回的信息
//    NSString *url =@"http://192.168.1.115:8080/living-area-web/api/login.do?contact=18868196382&password=000000";
//    [BaseNetManager POST:url parameters:nil completionHandler:^(id responseObj, NSError *error) {
//        if (responseObj) {
//            NSLog(@"%@",responseObj);
//            self.user = [UserLogin mj_objectWithKeyValues:responseObj];
//            NSLog(@"----------------------------------");
//            NSLog(@"user:%@,,,,,,,,,,,,,,%@",self.user.msg,[NSThread currentThread]);
//            NSLog(@"----------------------------------");
//            NSLog(@"userId:%@,,,,,,,,,,,,,,%@",self.user.userId,[self.user.userId class]);
//            NSDictionary *dic = self.user.userId;
//            NSLog(@"%@",dic);
//             NSLog(@"%@",[dic objectForKey:@"id"]);
//        }else{
//            NSLog(@"%@",error);
//            
//        }
//        
//
//    }];
    NSString *contact = @"18868196382";
    NSString *pwd = @"000000";
    [LoginHttp loginUserName:contact UserPwd:pwd completionHandle:^(UserLogin *use, NSError *error) {
        self.user = use.userId;
    }];
    NSDictionary * dic = self.user;
    NSLog(@"%@",self.user);
    return YES;
}


/** 代码重构:用代码把功能实现以后，考虑代码结构如何编写可以更加方便后期维护 */
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        [_window makeKeyAndVisible];
        
    }
    return _window;
}
//- (void)applicationWillResignActive:(UIApplication *)application {
//    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application {
//    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//}
//
//- (void)applicationWillEnterForeground:(UIApplication *)application {
//    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//}
//
//- (void)applicationWillTerminate:(UIApplication *)application {
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}
//
@end
