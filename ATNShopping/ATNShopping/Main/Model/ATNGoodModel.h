//
//  ATNGoodModel.h
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/3.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATNGoodModel : NSObject

//@property(nonatomic,copy)NSString*price;
//@property(nonatomic,copy)NSString*timesOfBuy;
//@property(nonatomic,copy)NSArray*commentArr;
//@property(nonatomic,copy)NSString*imageName;
@property(nonatomic,copy)NSString*GoodID;
@property(nonatomic,copy)NSString*name;

@property(nonatomic,copy)NSString*userID;
@property(nonatomic,copy)NSArray*customerList;
@property(nonatomic,strong)NSData*imgData;


@property(copy,nonatomic)NSString*price;

@property(copy,nonatomic)NSString*detail;

+(instancetype)initWithdict:(NSDictionary*)dict;
@end
