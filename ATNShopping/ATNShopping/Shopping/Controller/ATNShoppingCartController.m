//
//  ShoppingCartController.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/8.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#define usersListPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"users.plist"]
#define currentUserPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"currentUse.plist"]

#import "ATNShoppingCartController.h"
#import "ATNUser.h"
#import "ATNGoodModel.h"
@interface ATNShoppingCartController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)ATNUser*user;
@property(copy,nonatomic)NSMutableArray*goodArray;
@property (weak, nonatomic) IBOutlet UITableView *cartTableView;
@property(assign,nonatomic)BOOL isEditable;
@end

@implementation ATNShoppingCartController
-(NSMutableArray *)goodArray{
    if (_goodArray==nil) {
        NSString*path = [[NSBundle mainBundle]pathForResource:@"GoodList" ofType:@"plist"];
        NSArray*goodList = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray*array = [NSMutableArray array];
        for (int i=0; i<self.user.purchaseGoods.count; i++) {
            NSString*g = self.user.purchaseGoods[i];
            for (NSDictionary*good in goodList) {
                ATNGoodModel*goodM = [ATNGoodModel initWithdict:good];
                if ([goodM.GoodID isEqualToString: g]) {
                    [array addObject:goodM ];
                }
            }
        }
        _goodArray = array;
    }
    return _goodArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.isEditable = NO;
    //self.cartTableView.delegate = self;
   // self.cartTableView.dataSource = self;
    NSDictionary*user = [NSDictionary dictionaryWithContentsOfFile:currentUserPath];
    
    self.user = [ATNUser initWithDict:user];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)editGoodList:(UIButton *)sender {
    if (self.isEditable==NO) {
        self.cartTableView.editing = YES;
        self.isEditable = YES;
        [sender setTitle:@"取消编辑" forState:UIControlStateNormal];
    }else{
        self.cartTableView.editing = NO;
        self.isEditable = NO;
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
    }
    
}

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.goodArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cartCell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cartCell"];
    }
    ATNGoodModel*good = self.goodArray[indexPath.row];
    cell.textLabel.text = good.name;
    
    // Configure the cell...
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
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
