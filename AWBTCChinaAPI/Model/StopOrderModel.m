//
//  StopOrderModel.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "StopOrderModel.h"

@interface StopOrderModel ()

/** 止损止盈订单号. **/
@property (nonatomic, assign) NSInteger stopOrderID;
/** bid | ask **/
@property (nonatomic, strong) NSString *type;
/** 触发止损止盈订单的BTC/LTC单价. 如果设置了追单波动价格数量/率，触发单价将由系统自动调节. **/
@property (nonatomic, strong) NSNumber *stop_price;
/** 追单波动数量，设置后可动态决定止损止盈单价. **/
@property (nonatomic, strong) NSNumber *trailing_amount;
/** 追单波动率，设置后可动态决定止损止盈单价. **/
@property (nonatomic, strong) NSNumber *trailing_percentage;
/** 由止损止盈订单触发的订单中，所下订单的BTC/LTC单价. **/
@property (nonatomic, strong) NSNumber *price;
/** [BTCCNY|LTCCNY|LTCBTC] **/
@property (nonatomic, strong) NSString *market;
/** 由止损止盈订单触发的订单中，所下订单的BTC/LTC数量. **/
@property (nonatomic, strong) NSNumber *amount;
/** 止损止盈订单下单时间. **/
@property (nonatomic, assign) NSInteger date;
/** [ open | closed | cancelled | error ] **/
@property (nonatomic, strong) NSString *status;
/** 由止损止盈订单触发的订单的订单号，如果止损止盈订单尚未触发或者已被取消则值为null. **/
@property (nonatomic, assign) NSInteger order_id;

@end

@implementation StopOrderModel

@end
