
//
//  NewsModel.m
//  新闻
//
//  Created by xuNick on 16/3/31.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "NewsModel.h"

#import "NetworkTools.h"

@implementation NewsModel

+ (instancetype)newsWithDict:(NSDictionary *)dict{
    NewsModel* model = [[NewsModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

+ (void)loadNewsListWithStirng:(NSString *)string{
    [[NetworkTools shareNetwoekTools] GET:string parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
