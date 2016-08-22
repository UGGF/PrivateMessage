//
//  EditViewController.h
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/14.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MNContact,EditViewController;


@protocol EditViewControllerDelegate <NSObject>

@optional
- (void) editController:(EditViewController *)controller didAddContact:(MNContact *)contact;


@end

@interface EditViewController : UIViewController

@property(nonatomic,weak) id<EditViewControllerDelegate> delegate;
@property(nonatomic,strong)MNContact *contact;

@end
