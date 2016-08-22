//
//  Person.h
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/15.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int age;
@property(nonatomic,assign)BOOL auto_login;
@end
