//
//  LoginTableViewController.m
//  demo1
//
//  Created by jame on 16/4/19.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import "LoginTableViewController.h"
#import "UserTableViewController.h"
@interface LoginTableViewController ()<UITextFieldDelegate>

@end

@implementation LoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    //账号密码登录框的实现
    if (indexPath.row == 4) {
        UITextField *phoneTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width-20, cell.frame.size.height-10)];
        phoneTextFiled.placeholder = @"请输入手机号码";
        [self setTextFiled:phoneTextFiled WithImageName:@"user"];
        [cell addSubview:phoneTextFiled];
    }
    if (indexPath.row == 5) {
        UITextField *pwdTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width-20, cell.frame.size.height-10)];
        pwdTextFiled.placeholder = @"请输入密码";
        [self setTextFiled:pwdTextFiled WithImageName:@"mima"];
        [cell addSubview:pwdTextFiled];
    }
    if (indexPath.row == 6) {
        UIButton *forgotPwdBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, cell.height)];
        [forgotPwdBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [forgotPwdBtn setTitleColor:self.view.tintColor forState:UIControlStateNormal];
//        forgotPwdBtn.backgroundColor = [UIColor redColor];
        forgotPwdBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        forgotPwdBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [forgotPwdBtn addTarget:self action:@selector(forgotPwdBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:forgotPwdBtn];
    }
    if (indexPath.row == 7) {
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        loginBtn.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width-20, cell.height);
        [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        loginBtn.backgroundColor = [UIColor redColor];
        loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        loginBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [loginBtn setBackgroundImage:[UIImage imageNamed:@"denglu_bg"] forState:UIControlStateNormal];
        [cell addSubview:loginBtn];
    }


    
    
    
    
    // Configure the cell...
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld行",indexPath.row);
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 6) {
//        return 40;
//}
#pragma 设置textfiled
-(void)setTextFiled:(UITextField *)textFiled WithImageName:(NSString *)imageName{
    textFiled.borderStyle = UITextBorderStyleLine;
    textFiled.layer.borderColor = [UIColor colorWithRed:196.0 green:196.0 blue:196.0 alpha:0.8].CGColor;
    textFiled.layer.borderWidth = 1;
    textFiled.layer.cornerRadius = 3;
    UIImageView *textFiledImv = [[UIImageView alloc]init];
    textFiledImv.image = [UIImage imageNamed:imageName];
    textFiledImv.frame = CGRectMake(10, 5, textFiled.height-10, textFiled.height-10);
    textFiledImv.contentMode = UIViewContentModeScaleAspectFit;
    textFiled.leftView = textFiledImv;
    textFiled.leftViewMode = UITextFieldViewModeAlways;
}
#pragma 点击login按钮
-(void)loginBtnClick{
    NSLog(@"loginBtnClick");
    self.tabBarController.tabBar.hidden = YES;
    self.hidesBottomBarWhenPushed=YES;
    UserTableViewController *utvc = [[UserTableViewController alloc]init];
    [self.navigationController pushViewController:utvc animated:YES];
}
-(void)forgotPwdBtnClick{
    NSLog(@"forgotPwdBtnClick");
}
#pragma UITextFieldDelegate
//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    return YES;
//}
//-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    return NO;
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
