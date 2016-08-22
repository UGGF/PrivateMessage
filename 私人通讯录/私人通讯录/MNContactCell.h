//
//  MNContactCell.h
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/15.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MNContact;


@interface MNContactCell : UITableViewCell

@property(nonatomic,strong)MNContact *contact;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
