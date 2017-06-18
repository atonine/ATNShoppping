//
//  ATNGoodModel.m
//  ATNShopping
//
//  Created by 于洪志 on 2017/6/3.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNGoodModel.h"

@implementation ATNGoodModel

+(instancetype)initWithdict:(NSDictionary*)dict{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
