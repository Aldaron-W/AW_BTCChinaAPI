//
//  ErrorModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

@interface ErrorModel : AWBaseModel

/** 错误码 */
@property (nonatomic, readonly) NSInteger code;
/** 错误信息 */
@property (nonatomic, readonly) NSString *message;
/** 错误ID */
@property (nonatomic, readonly) NSInteger errorID;

@end
