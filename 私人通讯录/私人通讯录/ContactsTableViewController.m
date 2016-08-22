//
//  ContactsTableViewController.m
//  私人通讯录
//
//  Created by Zhuge_Su on 16/6/14.
//  Copyright © 2016年 Mn_Su. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "AddViewController.h"
#import "MNContact.h"
#import "EditViewController.h"
#import "MNContactCell.h"





@interface ContactsTableViewController ()<AddViewControllerDelegate,EditViewControllerDelegate>
- (IBAction)logoutClick:(id)sender;
@property(nonatomic,strong)NSMutableArray *muArr;
@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}



- (NSMutableArray *)muArr{
    if (_muArr == nil) {
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"cache.data"];
        _muArr = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
       
        if (_muArr == nil) {
            _muArr = [NSMutableArray array];
        }
    }
    
     return _muArr;
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.muArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MNContactCell *cell = [MNContactCell cellWithTableView:tableView];
    
    cell.contact = self.muArr[indexPath.row];
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.muArr removeObjectAtIndex:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"cache.data"];
        [NSKeyedArchiver archiveRootObject:self.muArr toFile:filePath];
    }

}



- (IBAction)logoutClick:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定注销吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    id Vv = segue.destinationViewController;
    if ([Vv isKindOfClass:[AddViewController class]]) {
        AddViewController *addVc = Vv;
        addVc.delegate =  self;
    }else if ([Vv isKindOfClass:[EditViewController class]]){
        EditViewController *editVc = Vv;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editVc.contact = self.muArr[path.row];
        editVc.delegate = self;
    }
    
    
    
   
}

- (void)addViewController:(AddViewController *)addVc didAddContact:(MNContact *)conract{
    [self.muArr addObject:conract];
    
    [self.tableView reloadData];
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"cache.data"];
    [NSKeyedArchiver archiveRootObject:self.muArr toFile:filePath];
}


- (void)editController:(EditViewController *)controller didAddContact:(MNContact *)contact{
    [self.tableView reloadData];
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"cache.data"];
    [NSKeyedArchiver archiveRootObject:self.muArr toFile:filePath];
}

@end
