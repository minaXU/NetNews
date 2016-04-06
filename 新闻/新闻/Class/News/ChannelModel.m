//
//  ChannelModel.m
//  新闻
//
//  Created by xuNick on 16/4/6.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel


+ (instancetype)ChannelModelWithDictionary:(NSDictionary *)dict{
    ChannelModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+(NSArray *)channelList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *tempdict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *mutable = [NSMutableArray array];
    for (NSDictionary *dict in tempdict[@"tList"]) {
        ChannelModel *model =  [ChannelModel ChannelModelWithDictionary:dict];
        [mutable addObject:model];
    }
    
//    [mutable.copy sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        
//        return <#expression#>
//    }];
    
    return mutable.copy;
}

@end
