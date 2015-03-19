//
//  MarketDepthModel.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "MarketDepthModel.h"

@interface MarketDepthModel ()

/** 买单对象列表。价格从高到低排列 **/
@property (nonatomic, strong) NSArray *bid;
/** 卖单对象列表。价格从低到高排列 **/
@property (nonatomic, strong) NSArray *ask;

@end

@implementation MarketDepthModel

@end
