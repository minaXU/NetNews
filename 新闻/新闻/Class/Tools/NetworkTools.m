//
//  NetworkTools.m
//  新闻
//
//  Created by xuNick on 16/3/30.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (instancetype)shareNetwoekTools{
    static NetworkTools * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        
        instance = [[NetworkTools alloc]initWithBaseURL:url];
        
        //AFN默认只支持前三种数据类型的解析
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
     
    });
    return instance;
}

@end
