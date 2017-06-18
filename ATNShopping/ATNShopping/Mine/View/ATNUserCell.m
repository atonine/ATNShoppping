//
//  ATNUserCell.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/7.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNUserCell.h"
#import "ATNUser.h"

@interface ATNUserCell ()


@property(strong,nonatomic)UIImageView*img;
@property(strong,nonatomic)UILabel*nameLabel;

@end


@implementation ATNUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.img = [[UIImageView alloc]initWithFrame:CGRectMake(13, 13, 54, 54)];
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(146, 23, 62, 12)];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.img];
    // Initialization code
    
   // UILabel*la = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 40, 20)];
    //la.text = @"sddf";
    //[self.contentView addSubview:la];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    NSLog(@"ssss");
    // Configure the view for the selected state
}
+(instancetype)setUserCellWithTabelView:(UITableView*) tableView user:(ATNUser*)user{
    ATNUserCell*cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ATNUserCell" owner:self options:nil]lastObject];
    }
    
    cell.nameLabel.text = user.userName;
    cell.img.image = [UIImage imageNamed:@"default"];
    return cell;
}
@end
