//
//  ATNUser.h
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/3.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATNUser : NSObject
@property(assign,nonatomic)BOOL isMerchat;//判断是否是一名商家
@property(copy,nonatomic)NSString*userName;

@property(copy,nonatomic)NSArray*purchaseGoods;

@property(copy,nonatomic)NSString*userID;

@property(copy,nonatomic)NSData*image;
@property(copy,nonatomic)NSArray*uploadGoods;
@property(copy,nonatomic)NSString*pwd;

+(instancetype)initWithDict:(NSDictionary*)dict;





@end
