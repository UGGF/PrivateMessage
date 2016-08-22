//
//  MNContactCell.m
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/15.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "MNContactCell.h"
#import "MNContact.h"

@interface MNContactCell()

@property(nonatomic,strong)UIView *bgView;
@end

@implementation MNContactCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"contact";
    return [tableView dequeueReusableCellWithIdentifier:cellID];
}


- (void)awakeFromNib {
    self.bgView = [[UIView alloc]init];
    self.bgView.backgroundColor = [UIColor lightGrayColor];
    self.bgView.alpha = 0.3;
    [self.contentView addSubview:self.bgView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.bgView.frame = CGRectMake(10, self.frame.size.height-1, self.frame.size.width-20, 1);
}

- (void)setContact:(MNContact *)contact{
    _contact = contact;
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;
}

@end
