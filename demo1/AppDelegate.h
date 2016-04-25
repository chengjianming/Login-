//
//  AppDelegate.h
//  demo1
//
//  Created by jame on 16/4/19.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,getter=isOnLine) BOOL onLine; //网络状态


@end

