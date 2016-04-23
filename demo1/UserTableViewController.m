//
//  UserTableViewController.m
//  demo1
//
//  Created by jame on 16/4/22.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import "UserTableViewController.h"
#import "RealNameTableViewController.h"
@interface UserTableViewController ()

@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
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
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0 || indexPath.row == 6) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"头像";
        UIImageView *userImgv = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-40, 5, 35, cell.frame.size.height-10)];
        userImgv.image = [UIImage imageNamed:@"ziliao_touxiang70"];
        [cell addSubview:userImgv];
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"昵称";
        cell.detailTextLabel.text = @"123";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"性别";
        cell.detailTextLabel.text = @"女";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"手机号码";
        cell.detailTextLabel.text = @"12312412412";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"修改密码";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"常住地";
    }else{
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width-20, cell.frame.size.height);
//        btn.titleLabel.text = @"退出登录";
        [btn setBackgroundImage:[UIImage imageNamed:@"denglu_bg"] forState:UIControlStateNormal];
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btn];
    }
    
    
    // Configure the cell...
    
    return cell;
}

-(void)quit{
    self.tabBarController.tabBar.hidden = YES;
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"select %ld ",indexPath.row);
    if (indexPath.row == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择" message:nil  preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *photo = [UIAlertAction actionWithTitle:@"图库" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"打开图库");
        }];
        UIAlertAction *tphont = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"打开拍照");
        }];
        UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"取消操作");
        }];
        [alert addAction:photo];
        [alert addAction:tphont];
        [alert addAction:cancle];
        [self presentViewController:alert animated:YES completion:nil];
    }else if (indexPath.row == 1){
        RealNameTableViewController *rvc = [[RealNameTableViewController alloc]init];
        self.tabBarController.tabBar.hidden = YES;
        self.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:rvc animated:YES];
    }

}
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
