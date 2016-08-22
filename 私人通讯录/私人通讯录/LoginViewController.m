//
//  LoginViewController.m
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/14.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"

#define MJAccountKey @"account"
#define MJPwdKey @"pwd"
#define MJRmbPwdKey @"rmb_pwd"
#define MJAutoLoginKey @"auto_login"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textF;
@property (weak, nonatomic) IBOutlet UITextField *PwdF;
@property (weak, nonatomic) IBOutlet UISwitch *rmbSwich;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
- (IBAction)rmbChange;
@property (weak, nonatomic) IBOutlet UISwitch *loginSwich;
- (IBAction)loginChange;
- (IBAction)LoginBtnClick;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfieldChange) name:UITextFieldTextDidChangeNotification object:self.textF];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfieldChange) name:UITextFieldTextDidChangeNotification object:self.PwdF];

    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    //读取上次的配置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.textF.text = [defaults objectForKey:MJAccountKey];
    self.rmbSwich.on = [defaults boolForKey:MJRmbPwdKey];
    self.loginSwich.on = [defaults boolForKey:MJAutoLoginKey];
    
    // 处理密码
    if (self.rmbSwich.isOn) {
        self.PwdF.text = [defaults objectForKey:MJPwdKey];
        self.LoginBtn.enabled = YES;
    }
    
    // 处理自动登录的情况
    if (self.loginSwich.isOn) {
        [self LoginBtnClick]; // 点击了"登录"按钮
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)textfieldChange{
    self.LoginBtn.enabled = (self.textF.text.length && self.PwdF.text.length);
}


- (IBAction)rmbChange {
    if (self.rmbSwich.isOn == NO) {
//        self.loginSwich.on = NO;
        [self.loginSwich setOn:NO animated:YES];
    }
}
- (IBAction)loginChange {
    if (self.loginSwich.isOn) {
//        self.rmbSwich.on = YES;
        [self.rmbSwich setOn:YES animated:YES];
    }
}

- (IBAction)LoginBtnClick {
    if (![self.textF.text isEqualToString:@"mn"]) {
        [MBProgressHUD showError:@"账户不存在"];
        return;
    }
    
    if (![self.PwdF.text isEqualToString:@"123"]) {
        [MBProgressHUD showError:@"密码错误"];
        return;
    }
    
    [MBProgressHUD showMessage:@"哥正在努力帮你加载.."];
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUD];

        [self performSegueWithIdentifier:@"login2contact" sender:nil];
        
        

        
        // 存储数据
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.textF.text forKey:MJAccountKey];
        [defaults setObject:self.PwdF.text forKey:MJPwdKey];
        [defaults setBool:self.rmbSwich.isOn forKey:MJRmbPwdKey];
        [defaults setBool:self.loginSwich.isOn forKey:MJAutoLoginKey];
        [defaults synchronize];
        
        
    });
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *Vc = segue.destinationViewController;
    Vc.title = [NSString stringWithFormat:@"%@的联系人列表",self.textF.text];

}




@end
