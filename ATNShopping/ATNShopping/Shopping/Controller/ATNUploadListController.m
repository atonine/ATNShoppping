//
//  ATNUploadListController.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/8.
//  Copyright © 2017年 于洪志. All rights reserved.
//
#define goodListPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"goodList.plist"]
#import "ATNUploadListController.h"
#import "ATNGoodModel.h"
#import "ATNUpoadViewController.h"

@interface ATNUploadListController ()

@property(nonatomic,copy)NSArray*goodArray;


@end

@implementation ATNUploadListController
-(NSArray *)goodArray{
    if (_goodArray==nil) {
        
       // NSString*path = [[NSBundle mainBundle]pathForResource:@"GoodList" ofType:@"plist"];
        NSArray*goodList = [NSArray arrayWithContentsOfFile:goodListPath];
        NSMutableArray*arr = [NSMutableArray arrayWithCapacity:goodList.count];
        for (NSDictionary*dict in goodList) {
            
            ATNGoodModel*good = [ATNGoodModel initWithdict:dict];
            if (good.userID==self.userID) {
                [arr addObject:good];
            }
            
        }
        _goodArray = arr;
    }
    return _goodArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"upload" object:nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIButton*button = [[UIButton alloc]initWithFrame:CGRectMake(278, 20, 91, 30)];
    [button setTitle:@"上传" forState:UIControlStateNormal ];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
   // [button sizeToFit];
    [button addTarget:self action:@selector(pressSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    
}

-(void)reloadData{
    [self.tableView reloadData];
}

-(void)pressSearchBtn{
    NSLog(@"kkk");
    UIStoryboard*st = [UIStoryboard storyboardWithName:@"upload" bundle:nil];
    ATNUpoadViewController*uvc = [st instantiateViewControllerWithIdentifier:@"upload"];
    [self presentViewController:uvc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
        
        // NSString*path = [[NSBundle mainBundle]pathForResource:@"GoodList" ofType:@"plist"];
        NSArray*goodList = [NSArray arrayWithContentsOfFile:goodListPath];
        NSMutableArray*arr = [NSMutableArray arrayWithCapacity:goodList.count];
        for (NSDictionary*dict in goodList) {
            
            ATNGoodModel*good = [ATNGoodModel initWithdict:dict];
            if (good.userID==self.userID) {
                [arr addObject:good];
            }
            
        }
        self.goodArray = arr;
    
 //   return _goodArray;
//#warning Incomplete implementation, return the number of rows
    return self.goodArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goodCell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"goodCell"];
    }
    ATNGoodModel*good = self.goodArray[indexPath.row];
    cell.textLabel.text = good.name;
    
    // Configure the cell...
    
    return cell;
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
