//
//  ATNCycleView.m
//  ATNStore
//
//  Created by 于洪志 on 2017/6/2.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNCycleView.h"
#import "ATNCycleViewCell.h"
#define kCellID @"CellID"
@interface ATNCycleView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIPageControl *pageCtr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(copy,nonatomic)NSArray*array;
@property(strong,nonatomic)NSTimer*cycleTimer;
@end

@implementation ATNCycleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSArray *)array{
    if (_array==nil) {
     //   NSArray*arr =[NSArray array];
        
        _array = @[@"h1.jpg",@"h2.jpg",@"h3.jpg"];
        self.pageCtr.numberOfPages = _array.count;
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_array.count*10 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft  animated:NO];
        [self.collectionView reloadData];
        [self removeTimer];
        [self addTimer];
    }
    return _array;
}

-(instancetype)init{

return (ATNCycleView*)[[[NSBundle mainBundle]loadNibNamed:@"ATNCycleView" owner:nil options:nil]firstObject];


}
-(void)addTimer{
    self.cycleTimer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES ];
    [[NSRunLoop mainRunLoop]addTimer:_cycleTimer forMode:NSRunLoopCommonModes];
  
   
}
-(void)removeTimer{
    [self.cycleTimer invalidate];
    self.cycleTimer = nil;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
  
  
    return (ATNCycleView*)[[[NSBundle mainBundle]loadNibNamed:@"ATNCycleView" owner:nil options:nil]firstObject];
    
}


-(void)scrollToNext{
    CGFloat currentX = _collectionView.contentOffset.x;
    CGFloat offSetX = currentX+_collectionView.bounds.size.width;
    [self.collectionView setContentOffset:CGPointMake(offSetX, 0)animated:YES ];
}
-(void)layoutSubviews{
    UICollectionViewFlowLayout*layout= [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = self.bounds.size;
    layout.minimumLineSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.autoresizingMask = UIViewAutoresizingNone;
    _collectionView.collectionViewLayout = layout;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"ATNCycleViewCell" bundle:nil] forCellWithReuseIdentifier:kCellID];
    NSLog(@"Sub");
    
}


-(void)awakeFromNib{
    [super awakeFromNib];
    
    
    
}
#pragma mark - collectionView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x+scrollView.bounds.size.width*0.5;
    self.pageCtr.currentPage=(NSInteger)(offsetX/scrollView.bounds.size.width)%(self.array.count);
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}
#pragma mark -collection datasource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ATNCycleViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    NSString*title = self.array[indexPath.item%self.array.count];
    cell.imgView.image = [UIImage imageNamed:title];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count*1000;
}

@end
