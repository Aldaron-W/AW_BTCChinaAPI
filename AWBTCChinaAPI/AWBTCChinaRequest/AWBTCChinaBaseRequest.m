//
//  AWBTCChinaBaseRequest.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "AWBTCChinaBaseRequest.h"
#import <CommonCrypto/CommonHMAC.h>

#import "AWRequestMecros.h"

@implementation AWBTCChinaBaseRequest

- (void)sendRequestWithMethod:(NSString *)methodName andParams:(NSString *)params andID:(NSInteger)requestID
                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    
    NSTimeInterval tonce = [[[NSDate alloc] init] timeIntervalSince1970];
    NSString *tonceString = [NSString stringWithFormat:@"%.0f",tonce*1000000];
    NSString *signature = [NSString stringWithFormat:@"tonce=%@&accesskey=%@&requestmethod=post&id=1&method=%@&params=%@", tonceString, self.accessKey, methodName, params];
    NSString *hash = [self signHmacSHA1String:signature withKey:self.secretKey];
    
    AFJSONRequestSerializer *requestSerializer = [[AFJSONRequestSerializer alloc] init];
    [requestSerializer setValue:tonceString forHTTPHeaderField:@"Json-Rpc-Tonce"];
    [requestSerializer setAuthorizationHeaderFieldWithUsername:self.accessKey password:hash];
    
    AFJSONRPCClient *client = [AFJSONRPCClient clientWithEndpointURL:[NSURL URLWithString:BTCCHINA_REQUEST_BASE_URL]];
    [client setRequestSerializer:requestSerializer];
    if (![self checkRequestKeysWithFailureBlock:failure]) {
        return;
    }
    [client invokeMethod:methodName withParameters:@[params] requestId:@1 success:success failure:failure];
    
}

#pragma mark - JSON
- (NSString *)getRequestJSON:(id)requestParameters{
    if ([NSJSONSerialization isValidJSONObject:requestParameters]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestParameters options:NSJSONWritingPrettyPrinted error:&error];
        if (!error) {
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        else{
            NSLog(@"%@", error);
        }
    }
    return @"";
}

#pragma mark - Check Request Keys
- (BOOL)checkRequestKeysWithFailureBlock:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    if (self.accessKey && self.secretKey && [self.accessKey length] > 0 && [self.secretKey length] > 0) {
        return YES;
    }
    
    failure(nil, [self getErrorWithErrorCode:-31000]);
    return NO;
}

#pragma mark - HMAC-SHA1 (NO BASE64)

- (NSString *)signHmacSHA1String:(NSString *)string
                         withKey:(NSString *)key{
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [string cStringUsingEncoding:NSASCIIStringEncoding];
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMACData = [NSData dataWithBytes:cHMAC length:sizeof(cHMAC)];
    const unsigned char *buffer = (const unsigned char *)[HMACData bytes];
    NSMutableString *HMAC = [NSMutableString stringWithCapacity:HMACData.length * 2];
    for (int i = 0; i < HMACData.length; ++i){
        [HMAC appendFormat:@"%02x", buffer[i]];
    }
    return HMAC;
}

#pragma mark - Error

- (NSError *)getErrorWithErrorCode:(NSInteger)errorCode{
    NSError *error = nil;
    
    switch (errorCode) {
        case -31000:
            error = [NSError errorWithDomain:@"AWBTCChinaAPI.RequestError" code:errorCode userInfo:@{@"because" : @"Access key or Secret key error"}];
            break;
            
        default:
            break;
    }
    
    return error;
}

@end
