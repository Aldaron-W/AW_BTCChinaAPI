//
//  DepositModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  存款Model
 */
@interface DepositModel : AWBaseModel

/** 存款 ID **/
@property (nonatomic, readonly) NSInteger depositID;
/** 比特币或者莱特币充值地址 **/
@property (nonatomic, readonly) NSString *address;
/** 货币代码。可能值：BTC 或 LTC **/
@property (nonatomic, readonly) NSString *currency;
/** 充值数量 **/
@property (nonatomic, readonly) NSNumber *amount;
/** Unix 时间戳。自1970年1月1日以来的秒数 **/
@property (nonatomic, readonly) NSInteger date;
/** 充值状态。可能值：pending 或 completed **/
@property (nonatomic, readonly) NSString *status;

@end
