//
//  FlagItem.h
//  ReactiveCocoaDemo
//
//  Created by 曾国锐 on 2017/9/1.
//  Copyright © 2017年 曾国锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlagItem : NSObject

@property (nonatomic, strong)NSString *hex;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *rgb;

+ (id)flagWithDict:(NSDictionary *)dict;

@end
