//
//  FlagItem.m
//  ReactiveCocoaDemo
//
//  Created by 曾国锐 on 2017/9/1.
//  Copyright © 2017年 曾国锐. All rights reserved.
//

#import "FlagItem.h"

@implementation FlagItem

+ (id)flagWithDict:(NSDictionary *)dict{

    FlagItem *flagItem = [[FlagItem alloc] init];
    flagItem.hex = dict[@"hex"];
    flagItem.name = dict[@"name"];
    flagItem.rgb = dict[@"rgb"];
    
    return flagItem;
}

@end
