//
//  MNContact.h
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/14.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNContact : NSObject<NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *phone;
@end
