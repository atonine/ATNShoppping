//
//  ATNVLoginController.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/8.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNVLoginController.h"

@interface ATNVLoginController ()

@end

@implementation ATNVLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)loginClicked:(id)sender {
     NSString*pathInfo = [[NSBundle mainBundle]pathForResource:@"currentUser" ofType:@"plist"];
     NSDictionary*dict = [NSDictionary dictionaryWithContentsOfFile:pathInfo];
    NSString*dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] ;
    NSString*path2 = [dir stringByAppendingPathComponent:@"currentUse.plist"];
    [dict writeToFile:path2 atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"login" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
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
