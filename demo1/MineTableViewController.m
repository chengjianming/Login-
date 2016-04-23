//
//  MineTableViewController.m
//  demo1
//
//  Created by jame on 16/4/19.
//  Copyright © 2016年 剑鸣. All rights reserved.
//

#import "MineTableViewController.h"
#import "LoginTableViewController.h"
#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

@interface MineTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MineTableViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Mine";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_user"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_userselect"];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0.1;
//}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/640*300)];
    UIImageView *headerImv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/640*300)];
    headerImv.image = [UIImage imageNamed:@"m_beijing"];
    headerView.backgroundColor = [UIColor clearColor];
    UIButton *headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/640*300)];
    [headerBtn addTarget:self action:@selector(headerBtnCkick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:headerImv];
    [headerView addSubview:headerBtn];
    
    //插入3个button
    UIButton *btn1= [[UIButton alloc]initWithFrame:CGRectMake(0, kWindowW/640*300, kWindowW/3, 60)];
    [btn1 setTitle:@"代付款" forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"m_daifu"] forState:UIControlStateNormal];
    [self setBtn:btn1];
    [headerView addSubview:btn1];
    
    UIButton *btn2= [[UIButton alloc]initWithFrame:CGRectMake(kWindowW/3, kWindowW/640*300, kWindowW/3, 60)];
    [btn2 setTitle:@"待收货" forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"m_daishou"] forState:UIControlStateNormal];
    [self setBtn:btn2];
    [headerView addSubview:btn2];
    
    UIButton *btn3= [[UIButton alloc]initWithFrame:CGRectMake(kWindowW/3*2, kWindowW/640*300, kWindowW/3, 60)];
    [btn3 setTitle:@"待评价" forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"m_pingjia"] forState:UIControlStateNormal];
    [self setBtn:btn3];
    [headerView addSubview:btn3];
    //插入头像
    UIImageView *headimgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ziliao_touxiang70"]];
    headimgv.frame = CGRectMake(10, kWindowW/640*300/2-30, 60,60);
    headimgv.layer.masksToBounds = YES;
    headimgv.layer.cornerRadius = 30;
    [headerView addSubview:headimgv];
    UILabel *headLb = [[UILabel alloc]init];
    headLb.frame = CGRectMake(10+60+10, kWindowW/640*300/2-20, 100, 40);
    headLb.text = @"立即登录";
    headLb.textColor = [UIColor whiteColor];
    [headerView addSubview:headLb];
    UIImageView *pushImv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"m_jiantou"]];
    pushImv.frame = CGRectMake(kWindowW-30, kWindowW/640*300/2-20, 10, 20);
    [headerView addSubview:pushImv];
    return headerView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kWindowW/640*300+60+10;
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

    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
        NSArray *arr = @[@"我的订单",@"收货地址",@"我的收藏", @"我的消息", @"我的帖子", @"资质认证",@"我的店铺",@"清除缓存", @"关于我们"];
        NSArray *img = @[@"m_dingdan",@"m_shouhuo",@"m_shoucang", @"m_xiaoxi", @"m_tiezi", @"m_zizhi", @"m_dianpu", @"m_qingchu", @"m_guanyu"];
        cell.textLabel.text = arr[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:img[indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Configure the cell...
    
    return cell;
}

#pragma tableView
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了%ld行",indexPath.row);
}

//移除iOS7之后，cell默认左侧的分割线边距
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}


//点击登陆方法
-(void)headerBtnCkick{
    NSLog(@"点击了headerBtn");
    //隐藏底部的tabBar
    self.tabBarController.tabBar.hidden = YES;
    self.hidesBottomBarWhenPushed=YES;
    LoginTableViewController *lvc = [[LoginTableViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

#pragma setBtn
-(void)setBtn:(UIButton *)btn{
    NSLog(@"建立了btn");
//    btn.frame = CGRectMake(0, kWindowW/640*300, kWindowW/3, 60);
    //    btn1.imageEdgeInsets = UIEdgeInsetsMake(10, kWindowW/6, 30, kWindowW/6);
    btn.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    btn.titleLabel.font = [UIFont systemFontOfSize:10];//title字体大小
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为灰色字体
    //    btn1.titleEdgeInsets = UIEdgeInsetsMake(kWindowW/6, btn1.titleLabel.bounds.size.width, 20, 0);//设置title在button上的位置（上top，左left，下bottom，右right）
    btn.backgroundColor = [UIColor whiteColor];
    btn.adjustsImageWhenHighlighted = NO;

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
