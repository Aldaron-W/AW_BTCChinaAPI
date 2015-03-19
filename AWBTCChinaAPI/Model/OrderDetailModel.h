//
//  OrderDetailModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  交易明细Model
 */
@interface OrderDetailModel : AWBaseModel

/** Unix 时间戳. **/
@property (nonatomic, readonly) NSInteger dateline;
/** 买/卖 BTC/LTC的成交单价. **/
@property (nonatomic, readonly) NSNumber *price;
/** 成交的BTC/LTC数量. **/
@property (nonatomic, readonly) NSNumber *amount;

@end
