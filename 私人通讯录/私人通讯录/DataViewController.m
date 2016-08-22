//
//  DataViewController.m
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/15.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "DataViewController.h"
#import "Person.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  Document
 */
- (void)createDocumentPlist{
    NSString *docPath = NSHomeDirectory();
    NSString *filePath = [docPath stringByAppendingPathComponent:docPath];
    NSArray *arr = @[@"往后",@"陕西"];
    [arr writeToFile:filePath atomically:YES];
}

- (void)readDocumentPlist{
    NSString *docPath = NSHomeDirectory();
    NSString *filePath = [docPath stringByAppendingPathComponent:docPath];
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
}


/**
 *  cache
 */
- (void)createCachePlist{
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePlist = [cachePath stringByAppendingString:cachePath];
    NSArray *arr = @[@"栀子",@"呢过i"];
    [arr writeToFile:filePlist atomically:YES];
}

- (void)readCachePlist{
    NSString *cashePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [cashePath stringByAppendingString:cashePath];
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
}


/**
 *  Prefrence
 */
- (void)createPrefrence{
    NSUserDefaults *defaul = [NSUserDefaults standardUserDefaults];
    
    [defaul setObject:@"梦话" forKey:@"name"];
    [defaul setInteger:10 forKey:@"age"];
    [defaul setBool:YES forKey:@"lauto_login"];
    
    [defaul synchronize];
}

- (void)readPrefrence{
    NSUserDefaults *defaul = [NSUserDefaults standardUserDefaults];
    
    NSString *name = [defaul objectForKey:@"name"];
    int age = [defaul integerForKey:@"age"];
    BOOL login = [defaul boolForKey:@"lauto_login"];
}


/**
 *  NSCoding
 */
- (void)createCode{
    Person *p = [[Person alloc]init];
    p.name = @"幽花";
    p.age = 18;
    p.auto_login = YES;
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"husn.plist"];
    
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}

- (void)readCode{
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"husn.plist"];

    [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
}































@end
