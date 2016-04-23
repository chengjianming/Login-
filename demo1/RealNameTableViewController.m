//
//  RealNameTableViewController.m
//  demo1
//
//  Created by jame on 16/4/22.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import "RealNameTableViewController.h"

@interface RealNameTableViewController ()<UINavigationBarDelegate>

@end

@implementation RealNameTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.title = @"昵称";
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(returnMine)];
    rightBarItem.tintColor = [UIColor orangeColor];
    [self.navigationItem setRightBarButtonItem:rightBarItem];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(returnMine)];
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"nav_back"];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor grayColor];
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
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"您的昵称";
    cell.textLabel.textColor = [UIColor orangeColor];
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(90, 0, cell.frame.size.width-90, cell.frame.size.height)];
    CGRect frame = cell.textLabel.frame;
    NSLog(@"x:%f,y:%f,w:%f,h:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    textFiled.placeholder = @"请录入您喜欢的昵称";
    [cell addSubview:textFiled];
    
    
    // Configure the cell...
    
    return cell;
}

-(void)returnMine{
//    self.tabBarController.tabBar.hidden = YES;
//    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController popViewControllerAnimated:YES];
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
