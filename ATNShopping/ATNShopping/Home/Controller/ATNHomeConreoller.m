//
//  ATNHomeConreoller.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/3.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#define goodListPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"goodList.plist"]

#import "ATNHomeConreoller.h"
#import "ATNCycleView.h"
#import"ATNUser.h"
#import "PYSearch.h"
#import "IMQuickSearch.h"
#import "ATNGoodModel.h"
#import "ATNGoodDetailController.h"
#define cellID   @"cellID"

@interface ATNHomeConreoller ()<UITableViewDelegate,UITableViewDataSource,PYSearchViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *GoodKinds;
@property(copy,nonatomic)NSArray*kindsOfGoods;

@property(copy,nonatomic)NSMutableArray*allGoods;

@property(assign,nonatomic)BOOL isLogin;
//@property(copy,nonatomic)IMQuickSearch*quickSearch;
@end



@implementation ATNHomeConreoller

-(NSArray *)allGoods{
    if (_allGoods==nil) {
//        _allGoods = [NSArray array];
//        _allGoods = @[@"C",@"CPP",@"Java",@"Python",@"Ruby",@"Objective-C",@"C#",@"Go",@"Swift",@"English",@"French",@"Gernmen",@"Chinese",@"Japanese",@"Spanish"];
    //    NSString*path = [[NSBundle mainBundle]pathForResource:@"GoodList" ofType:@"plist"];
        
        NSArray*goodList = [NSArray arrayWithContentsOfFile:goodListPath];
      //  [goodList writeToFile:goodListPath atomically:YES];
        NSMutableArray*arr = [NSMutableArray arrayWithCapacity:goodList.count];
        for (NSDictionary*dict in goodList) {
            
            ATNGoodModel*good = [ATNGoodModel initWithdict:dict];
            [arr addObject:good];
            
        }
        _allGoods = arr;
    }
    
    return _allGoods;
}


-(NSArray *)kindsOfGoods{
    if (_kindsOfGoods==nil) {
        _kindsOfGoods =@[@"电子用品",@"日常用品",@"食品",@"全部"];
      //  [self.GoodKinds reloadData];
    }
    return _kindsOfGoods;
}
- (void)viewDidLoad {
    [self setSaveData];
    [super viewDidLoad];
    [self setUpNavigationBar];
    ATNCycleView*cycleView = [[ATNCycleView alloc]init];
    NSLog(@"%f", self.navigationController.navigationBar.bounds.size.height);
    cycleView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 152);
    
    [self.view addSubview:cycleView];
    self.GoodKinds.delegate=self;
    self.GoodKinds.dataSource = self;
   // self.kindsOfGoods =@[@"电子用品",@"日常用品",@"食品"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setSaveData{
 //   NSDictionary*dict = [NSDictionary dictionary];
    
   // ATNUser*root = []
    NSString*pathInfo = [[NSBundle mainBundle]pathForResource:@"currentUser" ofType:@"plist"];
    NSDictionary*dict = [NSDictionary dictionaryWithContentsOfFile:pathInfo];
    NSString*dir = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"users.plist"];
    NSString *path = [dir stringByAppendingPathComponent:@"users.plist"];
 //   NSString*path2 = [dir stringByAppendingPathComponent:@"currentUse.plist"];
   // ATNUser *rootUser = [ATNUser initWithDict:dict];
    NSMutableArray*userList = [NSMutableArray array];
    [userList addObject:dict];
  //  [dict writeToFile:path2 atomically:YES];
    [userList writeToFile:path atomically:YES];
    NSLog(@"%@",path);
 //   NSLog(@"%@",path2);
}

-(void)setUpNavigationBar{
    
    UIButton*searchBtn = [[UIButton alloc]init];
    [searchBtn setImage:[UIImage imageNamed:@"btn_search"] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"btn_search_clicked"] forState:
     UIControlStateHighlighted];
    [searchBtn sizeToFit];
    [searchBtn addTarget:self action:@selector(pressSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    
}
-(void)pressSearchBtn{
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:NSLocalizedString(@"PYExampleSearchPlaceholderText", @"搜索编程语言") didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        // Called when search begain.
        // eg：Push to a temp view controller
        UIStoryboard*st = [UIStoryboard storyboardWithName:@"GoodDetail" bundle:nil];
        ATNGoodDetailController*gdvc = [st instantiateViewControllerWithIdentifier:@"gdvc"];
        gdvc.name = [searchText copy];
        [searchViewController.navigationController pushViewController:gdvc animated:YES];
    }];
    searchViewController.hotSearchStyle = 0;
    searchViewController.searchHistoryStyle = PYHotSearchStyleDefault;
    searchViewController.delegate = self;
    // 5. Present a navigation controller
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav animated:YES completion:nil];
}
#pragma mark-tableView dataSouce methods;
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.kindsOfGoods.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _kindsOfGoods[indexPath.row];
    NSLog(@"%@",self.allGoods[indexPath.row]);
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - PYSearchViewControllerDelegate
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText
{
    if (searchText.length) {
        // Simulate a send request to get a search suggestions
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSMutableArray *searchSuggestionsM = [NSMutableArray array];
//            for (int i = 0; i < arc4random_uniform(5) + 10; i++) {
//                NSString *searchSuggestion = [NSString stringWithFormat:@"Search suggestion %d", i];
//                [searchSuggestionsM addObject:searchSuggestion];
//            // NSArray*results = [self]
//            }
//             Refresh and display the search suggustions
            IMQuickSearchFilter *peopleFilter = [IMQuickSearchFilter filterWithSearchArray:self.allGoods keys:@[@"name"]];
            IMQuickSearch* quickSearch = [[IMQuickSearch alloc] initWithFilters:@[peopleFilter]];
            NSArray *filteredResults = [quickSearch filteredObjectsWithValue:searchText];
            for (ATNGoodModel*model in filteredResults) {
                [searchSuggestionsM addObject:model.name];
            }
            searchViewController.searchSuggestions = searchSuggestionsM;
            
        });
    }
}


@end
