//
//  AWBTCChinaRequest.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBTCChinaBaseRequest.h"

@interface AWBTCChinaRequest : AWBTCChinaBaseRequest

+ (AWBTCChinaRequest *)sharedAPIKit;

- (void)getAccountInfoWithType:(NSString *)requestType withSuccess:(void (^)(NSDictionary *responseDictionary))success andFailure:(void (^)(NSError *error))failure;

/**
 *  获得用户全部充值记录。
 *
 *  @param currency      目前支持“BTC”，“LTC”
 *  @param isPendingOnly 默认为“true”。如果为“true”，仅返回尚未入账的比特币或者莱特币充值
 *  @param success       成功的回调函数
 *  @param failure       失败的回调函数
 */
- (void)getDepositsWithCurrency:(NSString *)currency andPendingOnly:(BOOL)isPendingOnly withSuccess:(void (^)(NSDictionary *responseDictionary))success andFailure:(void (^)(NSError *error))failure;
@end
