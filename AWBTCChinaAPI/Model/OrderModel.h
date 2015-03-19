//
//  OrderModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  订单Model
 */
@interface OrderModel : AWBaseModel

/** 挂单 ID **/
@property (nonatomic, readonly) NSInteger orderID;
/** 挂单类型。可能值：bid 或 ask **/
@property (nonatomic, readonly) NSString *type;
/** 挂单价格 **/
@property (nonatomic, readonly) NSNumber *price;
/** 货币。可能值：CNY **/
@property (nonatomic, readonly) NSString *currency;
/** 挂单剩余数量。如果此值小于 amount_original，说明此挂单仅有部分成交 **/
@property (nonatomic, readonly) NSNumber *amount;
/** 初始挂单数量 **/
@property (nonatomic, readonly) NSNumber *amount_original;
/** Unix 时间戳。自1970年1月1日以来的秒数 **/
@property (nonatomic, readonly) NSInteger date;
/** 状态。可能值：open、closed 、cancelled、pending 或 error **/
@property (nonatomic, readonly) NSString *status;
/** 订单详情,可选返回值。返回对象数组：order_detail **/
@property (nonatomic, readonly) NSArray *detail;

@end
