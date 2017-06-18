//
//  ATNGoodCell.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/15.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNGoodCell.h"
//#import "ATNGoodModel.h"


@interface ATNGoodCell ()

@property(strong,nonatomic)UIImageView*img;


@property(nonatomic,strong)UILabel*nameLabel;




@end



@implementation ATNGoodCell

//-(ATNGoodModel *)good{
//    if (_good==nil) {
//        NSString*path = [[NSBundle mainBundle]pathForResource:@"GoodList" ofType:@"plist"];
//        NSArray*goodList = [NSArray arrayWithContentsOfFile:path];
//        
//        for (NSDictionary*dict in goodList) {
//            ATNGoodModel*good = [ATNGoodModel initWithdict:dict];
//            if (good.GoodID == self.goodID) {
//                _good = good;
//            }
//        }
//    }
//    return _good;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.img = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 54, 54)];
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(146, 23, [UIScreen mainScreen].bounds.size.width*2/3, 12)];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.img];
    // Initialization code
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
//+(instancetype)setUserCellWithTabelView:(UITableView *)tableView user:(ATNGoodModel *)good{
//    ATNGoodCell*cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
//    if (cell==nil) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"ATNGoodCell" owner:self options:nil]lastObject];
//    }
//    
//    cell.nameLabel.text = good.name;
//    cell.img.image = [UIImage imageNamed:@"default"];
//    return cell;
//}

@end
