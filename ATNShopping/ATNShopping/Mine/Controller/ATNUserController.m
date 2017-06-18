//
//  ATNUserController.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/7.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#define usersListPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"users.plist"]
#define currentUserPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"currentUse.plist"]

#import "ATNUserController.h"
#import "ATNUserCell.h"
#import "ATNUser.h"
#import "ATNUploadListController.h"
#import "ATNShoppingCartController.h"
#import "ATNVLoginController.h"
@interface ATNUserController ()



@property(nonatomic,strong)ATNUser*user;

@property(nonatomic,copy)NSArray*funcArray;


@end

@implementation ATNUserController
//-(ATNUser *)user{
//    if (_user==nil) {
//        _user.userName = @"dddd";
//   //     [self.tableView reloadData];
//    }
//    return _user;
//}
-(NSArray *)funcArray{
    if (_funcArray==nil) {
        _funcArray = @[@"我的店铺",@"我的购物车",@"设置"];
    }
    return _funcArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"login" object:nil];
    
  //  self.user.userName = @"上天";
    //[self.tableView reloadData];
  //  self.user.userName = @"ddd";
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)reloadData{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    NSDictionary*dict = [NSDictionary dictionaryWithContentsOfFile:currentUserPath];
    if (dict==nil) {
        self.isLogin = NO;
        self.user = [[ATNUser alloc]init];
        self.user.userName = @"未登录";
        //        UIStoryboard*st = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        //        ATNVLoginController*loginVC = [st instantiateViewControllerWithIdentifier:@"loginVC"];
        //        [self.navigationController pushViewController:loginVC animated:NO];
    }
    else{
        self.isLogin = YES;
        self.user = [ATNUser initWithDict:dict];
    }
    if (section==0) {
        
        return 1;
    }else{
        return [self.funcArray count];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 98;
    }else{
        return 44;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0) {
        ATNUserCell*cell = [ATNUserCell setUserCellWithTabelView:tableView user:self.user];
        return cell;
    }
    else{
        UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"other"];
        if (cell==nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"other"];
            cell.textLabel.text = _funcArray[indexPath.row];
            
        }
        return cell;
    }
   
}
#pragma mark-tableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isLogin==NO) {
        UIStoryboard*st = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        ATNVLoginController*loginVC = [st instantiateViewControllerWithIdentifier:@"loginVC"];
        if (indexPath.section==0) {
            [self presentViewController:loginVC animated:YES completion:nil];
        }
        
    }else{
        if (indexPath.section==1) {
            if (indexPath.row==0) {
                UIStoryboard*st = [UIStoryboard storyboardWithName:@"GoodList" bundle:nil];
                ATNUploadListController*uvc = [st instantiateViewControllerWithIdentifier:@"GoodList"];
                uvc.userID = self.user.userID;
                [self.navigationController pushViewController:uvc animated:YES];
            }
            if (indexPath.row==1) {
                UIStoryboard*st = [UIStoryboard storyboardWithName:@"shoppingCart" bundle:nil];
                ATNShoppingCartController*uvc = [st instantiateViewControllerWithIdentifier:@"cart"];
                // uvc.userID = self.user.userID;
                //[self.navigationController pushViewController:uvc animated:YES];
                [self presentViewController:uvc animated:YES completion:nil];
            }
        }
        
        
        
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
