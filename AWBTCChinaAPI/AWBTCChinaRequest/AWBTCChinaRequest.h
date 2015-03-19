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

- (void)getAccountInfoWithType:(NSString *)requestType;

@end
