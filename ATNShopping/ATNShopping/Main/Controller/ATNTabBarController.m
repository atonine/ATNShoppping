//
//  ATNTabBarController.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/8.
//  Copyright © 2017年 于洪志. All rights reserved.
//
#define usersListPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"users.plist"]
#define currentUserPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"currentUse.plist"]
#import "ATNTabBarController.h"
#import "ATNVLoginController.h"
#import "ATNUser.h"
@interface ATNTabBarController ()

@end

@implementation ATNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     //   self.user = [ATNUser initWithDict:dict];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSDictionary*dict = [NSDictionary dictionaryWithContentsOfFile:currentUserPath];
    if (dict==nil&&[item.title isEqual:@"我的"]) {
        // self.isLogin = NO;
        UIStoryboard*st = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        ATNVLoginController*loginVC = [st instantiateViewControllerWithIdentifier:@"loginVC"];
        [self presentViewController:loginVC animated:NO completion:nil];
    }
   
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
