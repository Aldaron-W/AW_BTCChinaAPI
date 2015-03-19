//
//  StopOrderModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  止损止盈订单Model
 */
@interface StopOrderModel : AWBaseModel

/** 止损止盈订单号. **/
@property (nonatomic, readonly) NSInteger stopOrderID;
/** bid | ask **/
@property (nonatomic, readonly) NSString *type;
/** 触发止损止盈订单的BTC/LTC单价. 如果设置了追单波动价格数量/率，触发单价将由系统自动调节. **/
@property (nonatomic, readonly) NSNumber *stop_price;
/** 追单波动数量，设置后可动态决定止损止盈单价. **/
@property (nonatomic, readonly) NSNumber *trailing_amount;
/** 追单波动率，设置后可动态决定止损止盈单价. **/
@property (nonatomic, readonly) NSNumber *trailing_percentage;
/** 由止损止盈订单触发的订单中，所下订单的BTC/LTC单价. **/
@property (nonatomic, readonly) NSNumber *price;
/** [BTCCNY|LTCCNY|LTCBTC] **/
@property (nonatomic, readonly) NSString *market;
/** 由止损止盈订单触发的订单中，所下订单的BTC/LTC数量. **/
@property (nonatomic, readonly) NSNumber *amount;
/** 止损止盈订单下单时间. **/
@property (nonatomic, readonly) NSInteger date;
/** [ open | closed | cancelled | error ] **/
@property (nonatomic, readonly) NSString *status;
/** 由止损止盈订单触发的订单的订单号，如果止损止盈订单尚未触发或者已被取消则值为null. **/
@property (nonatomic, readonly) NSInteger order_id;

@end
