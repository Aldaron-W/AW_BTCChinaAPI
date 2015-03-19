//
//  LoanModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  借款Model
 */
@interface LoanModel : AWBaseModel

/** 货币代码 **/
@property (nonatomic, readonly) NSString *currency;
/** 货币符号 **/
@property (nonatomic, readonly) NSString *symbol;
/** 账户冻结金额 (小数精度) **/
@property (nonatomic, readonly) NSNumber *amount;
/** 账户冻结金额 (整数精度) **/
@property (nonatomic, readonly) NSString *amount_integer;
/** 在使用“amount_integer”时小数点的位置 **/
@property (nonatomic, readonly) NSInteger amount_decimal;

@end
