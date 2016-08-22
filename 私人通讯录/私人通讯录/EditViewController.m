//
//  EditViewController.m
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/14.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "EditViewController.h"
#import "MNContact.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameF;
@property (weak, nonatomic) IBOutlet UITextField *phoneF;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)saveBtnClick;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barBtn;
- (IBAction)barBtnClick:(id)sender;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameF.text = self.contact.name;
    self.phoneF.text = self.contact.phone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameF];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneF];

}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textChange{
    self.saveBtn.enabled = (self.nameF.text.length && self.phoneF.text.length);
}


- (IBAction)saveBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(editController:didAddContact:)]) {
        self.contact.name = self.nameF.text;
        self.contact.phone = self.phoneF.text;
        [self.delegate editController:self didAddContact:self.contact];
    }
    
}



- (IBAction)barBtnClick:(id)sender {
    if (self.nameF.enabled) {
        self.nameF.enabled = NO;
        self.phoneF.enabled = NO;
        self.saveBtn.hidden = YES;
        [self.view endEditing:YES];
        
        self.barBtn.title = @"确定";
        self.nameF.text = self.contact.name;
        self.phoneF.text = self.contact.phone;
    }else{
        self.nameF.enabled = YES;
        self.phoneF.enabled = YES;
        self.saveBtn.hidden = NO;
        [self.phoneF becomeFirstResponder];
        
        self.barBtn.title = @"取消";
    }
}
@end
