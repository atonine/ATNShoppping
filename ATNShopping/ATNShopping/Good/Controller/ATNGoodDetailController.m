//
//  GoodDetailController.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/7.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNGoodDetailController.h"

@interface ATNGoodDetailController ()

@end

@implementation ATNGoodDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.goodNameLabel.text = self.name;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
