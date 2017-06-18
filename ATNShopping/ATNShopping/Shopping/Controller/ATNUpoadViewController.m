//
//  ATNUpoadViewController.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/17.
//  Copyright © 2017年 于洪志. All rights reserved.
//
#define goodListPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"goodList.plist"]
#define currentUserPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"currentUse.plist"]
#import "ATNUpoadViewController.h"
#import "ATNGoodModel.h"


@interface ATNUpoadViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *nameTesxtField;
@property (weak, nonatomic) IBOutlet UITextView *instructTv;
@property (weak, nonatomic) IBOutlet UITextField *pricetf;



@property(copy,nonatomic)NSArray*kindsArr;
@property(copy,nonatomic)NSArray*arrOfGood;


@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;



@end

@implementation ATNUpoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.kindsArr = @[@"电子用品",@"日常用品",@"食品"];
   
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)uploadPressed:(id)sender {
    NSMutableArray*goodList = [NSMutableArray arrayWithContentsOfFile:goodListPath];
 //   NSMutableArray*arr = [NSMutableArray arrayWithCapacity:goodList.count];
    NSString*pathInfo = [[NSBundle mainBundle]pathForResource:@"goodModel" ofType:@"plist"];
    NSMutableDictionary*dict = [NSMutableDictionary dictionaryWithContentsOfFile:pathInfo];
    NSDictionary*user = [NSDictionary dictionaryWithContentsOfFile:currentUserPath];
    
    NSInteger i = [goodList count]+1;
    NSInteger row = [self.pickerView selectedRowInComponent:0];
    NSString*kind = self.kindsArr[row];
    dict[@"name"] = self.nameTesxtField.text;
    dict[@"GoodID"] = [NSString stringWithFormat:@"%ld",(long)i];
    dict[@"userID"] = user[@"userID"];
    dict[@"detail"] = self.instructTv.text;
    dict[@"price"] = self.pricetf.text;
    dict[@"customerList"] = nil;
    dict[@"kind"] = kind;
    [goodList addObject:dict];
    
    [goodList writeToFile:goodListPath atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"upload" object:nil];
    NSLog(@"%@",dict);
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.kindsArr[row];
}

// 设置各分组的行数




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
