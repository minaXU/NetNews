//
//  InnerModel.m
//  新闻
//
//  Created by xuNick on 16/4/5.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "InnerModel.h"

#import "NetworkTools.h"

@implementation InnerModel



+(instancetype)InnerModelWithDict:(NSDictionary *)dict{
    InnerModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


+(void)innerListwithSuccess:(void(^)(NSArray *array))success{
    
    [[NetworkTools shareNetwoekTools] GET:@"http://c.m.163.com/nc/ad/headline/0-4.html" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        NSArray *responseArray = responseObject[responseObject.keyEnumerator.nextObject];
        NSMutableArray *mutable = [NSMutableArray array];
        
        [responseArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        InnerModel *model = [InnerModel InnerModelWithDict:obj];
            [mutable addObject:model];
        }];
        success(mutable.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

@end
