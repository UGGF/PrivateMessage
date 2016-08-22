//
//  AddViewController.m
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/14.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "AddViewController.h"
#import "MNContact.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameF;
@property (weak, nonatomic) IBOutlet UITextField *PhoneF;
- (IBAction)addBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameF];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.PhoneF];
}


- (void)viewDidAppear:(BOOL)animated{
    [self.nameF becomeFirstResponder];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textChange{
    self.addBtn.enabled = (self.nameF.text.length && self.PhoneF.text.length);
}


- (IBAction)addBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(addViewController:didAddContact:)]) {
        MNContact *contact = [[MNContact alloc]init];
        contact.name = self.nameF.text;
        contact.phone = self.PhoneF.text;
        [self.delegate addViewController:self didAddContact:contact];
    }
}
@end
