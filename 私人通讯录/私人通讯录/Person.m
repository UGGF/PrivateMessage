//
//  Person.m
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/15.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeBool:_auto_login forKey:@"auto_login"];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        [aDecoder decodeObjectForKey:@"name"];
        [aDecoder decodeObjectForKey:@"age"];
        [aDecoder decodeObjectForKey:@"auto_login"];
    }
    return self;
}
@end
