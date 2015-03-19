//
//  TransactionModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  转账Model
 */
@interface TransactionModel : AWBaseModel

/** 交易 ID **/
@property (nonatomic, readonly) NSInteger *transactionID;
/** 交易类型。'fundbtc | withdrawbtc | fundmoney | withdrawmoney | refundmoney | buybtc | sellbtc | refundbtc |tradefee| rebate | fundltc | refundltc | withdrawltc | buyltc | sellltc' **/
@property (nonatomic, readonly) NSString *type;
/** 成交的 BTC 数量。负数表明是从账户余额中扣减 **/
@property (nonatomic, readonly) NSNumber *btc_amount;
/** 成交的 LTC 数量。负数表明是从账户余额中扣减 **/
@property (nonatomic, readonly) NSNumber *ltc_amount;
/** 成交的 CNY 数量。负数表明是从账户余额中扣减 **/
@property (nonatomic, readonly) NSNumber *cny_amount;
/** Unix 时间戳（自1970年1月1日以来经过的秒数） **/
@property (nonatomic, readonly) NSInteger date;

@end
