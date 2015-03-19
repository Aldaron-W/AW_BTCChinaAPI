//
//  MarketDepthModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

/**
 *  市场深度Model
 */
@interface MarketDepthModel : AWBaseModel

/** 买单对象列表。价格从高到低排列 **/
@property (nonatomic, readonly) NSArray *bid;
/** 卖单对象列表。价格从低到高排列 **/
@property (nonatomic, readonly) NSArray *ask;

@end
