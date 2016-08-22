//
//  AddViewController.h
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/14.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddViewController,MNContact;

@protocol AddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(AddViewController *)addVc didAddContact:(MNContact *)contact;

@end


@interface AddViewController : UIViewController


@property(nonatomic,weak)id<AddViewControllerDelegate> delegate;
@end
