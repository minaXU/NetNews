//
//  NetworkTools.h
//  新闻
//
//  Created by xuNick on 16/3/30.
//  Copyright © 2016年 NN. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkTools : AFHTTPSessionManager

+ (instancetype) shareNetwoekTools;

@end
