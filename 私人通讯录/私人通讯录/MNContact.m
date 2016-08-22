//
//  MNContact.m
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/14.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "MNContact.h"

@implementation MNContact
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
       self.name = [aDecoder decodeObjectForKey:@"name"];
       self.phone = [aDecoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end
