//
//  ChannelModel.h
//  新闻
//
//  Created by xuNick on 16/4/6.
//  Copyright © 2016年 NN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic,copy)NSString *tname;

@property (nonatomic,copy)NSString *tid;

+ (instancetype)ChannelModelWithDictionary:(NSDictionary *)dict;

+ (NSArray *)channelList;

@end
