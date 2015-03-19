//
//  Bid&AskModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  买&卖Model
 */
@interface Bid_AskModel : AWBaseModel

/** 1 BTC 或者 LTC 的价格 **/
@property (nonatomic, readonly) NSNumber *price;
/** BTC 或者 LTC 数量 **/
@property (nonatomic, readonly) NSNumber *amount;

@end
