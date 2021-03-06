//
//  WithdrawalModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  取现Model
 */
@interface WithdrawalModel : AWBaseModel

/** 提现 ID **/
@property (nonatomic, readonly) NSInteger WithdrawalID;
/** 比特币或者莱特币提现地址 **/
@property (nonatomic, readonly) NSString *address;
/** 货币代码。可能值：BTC 或 LTC **/
@property (nonatomic, readonly) NSString *currency;
/** 提现数量 **/
@property (nonatomic, readonly) NSNumber *amount;
/** Unix 时间戳。自1970年1月1日以来的秒数 **/
@property (nonatomic, readonly) NSInteger date;
/** 交易 ID **/
@property (nonatomic, readonly) NSString *transaction;
/** 提现状态。可能值：pending 、completed、 processing、 cancel、refund **/
@property (nonatomic, readonly) NSString *status;

@end
