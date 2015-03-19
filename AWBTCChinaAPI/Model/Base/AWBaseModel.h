//
//  AWBaseModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AWBaseModel : NSObject

/**
 *  解析JSON数据函数
 *
 *  @param responseObject 网络请求的结果
 */
- (void)parseJSONData:(id)responseObject;

@end
