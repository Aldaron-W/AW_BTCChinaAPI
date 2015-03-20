//
//  AWBTCChinaBaseRequest.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFJSONRPCClient/AFJSONRPCClient.h>

@interface AWBTCChinaBaseRequest : NSObject

@property (nonatomic,copy) NSString *accessKey;
@property (nonatomic,copy) NSString *secretKey;

- (void)sendRequestWithMethod:(NSString *)methodName andParams:(NSString *)params andID:(NSInteger)requestID
                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
#pragma mark - JSON
- (NSString *)getRequestJSON:(id)requestParameters;
@end
