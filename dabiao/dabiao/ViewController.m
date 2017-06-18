//
//  ViewController.m
//  dabiao
//
//  Created by 于洪志 on 2017/6/16.
//  Copyright © 2017年 于洪志. All rights reserved.
//
#define goodListPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"goodList.plist"]
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString*path = [[NSBundle mainBundle]pathForResource:@"GoodList" ofType:@"plist"];
    NSArray*goodList = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray*arr = [NSMutableArray arrayWithCapacity:goodList.count];
    int i =1;
    for (NSMutableDictionary*dict in goodList) {
        UIImage*image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG",i]];
        NSData*data = UIImageJPEGRepresentation(image, 0.7f);
        [dict setValue:data forKey:@"imgData"];
        [arr addObject:dict];
        
    }
    [arr writeToFile:goodListPath atomically:YES];
    NSLog(@"%@",goodList);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
