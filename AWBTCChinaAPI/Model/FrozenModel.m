//
//  FrozenModel.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "FrozenModel.h"

@interface FrozenModel ()

/** 货币代码 **/
@property (nonatomic, strong) NSString *currency;
/** 货币符号 **/
@property (nonatomic, strong) NSString *symbol;
/** 账户冻结金额 (小数精度) **/
@property (nonatomic, strong) NSNumber *amount;
/** 账户冻结金额 (整数精度) **/
@property (nonatomic, strong) NSString *amount_integer;
/** 在使用“amount_integer”时小数点的位置 **/
@property (nonatomic, assign) NSInteger amount_decimal;

@end

@implementation FrozenModel

@end
