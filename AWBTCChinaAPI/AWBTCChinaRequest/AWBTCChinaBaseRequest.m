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

- (void)sendRequestWithMethod:(NSString *)methodName andParams:(NSDictionary *)params andID:(NSInteger)requestID
                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    
    NSTimeInterval tonce = [[[NSDate alloc] init] timeIntervalSince1970];
    NSString *tonceString = [NSString stringWithFormat:@"%.0f",tonce*1000000];
    NSString *signature = [NSString stringWithFormat:@"tonce=%@&accesskey=%@&requestmethod=post&id=1&method=%@&params=%@", tonceString, self.accessKey, methodName, params];
    NSString *hash = [self signHmacSHA1String:signature withKey:self.secretKey];
    
    AFHTTPRequestSerializer *requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    [requestSerializer setValue:tonceString forHTTPHeaderField:@"Json-Rpc-Tonce"];
    [requestSerializer setAuthorizationHeaderFieldWithUsername:self.accessKey password:hash];
    
    AFJSONRPCClient *client = [AFJSONRPCClient clientWithEndpointURL:[NSURL URLWithString:BTCCHINA_REQUEST_BASE_URL]];
    [client setRequestSerializer:requestSerializer];
    [client invokeMethod:methodName withParameters:nil requestId:nil success:success failure:failure];
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

@end
