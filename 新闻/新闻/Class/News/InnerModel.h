//
//  InnerModel.h
//  新闻
//
//  Created by xuNick on 16/4/5.
//  Copyright © 2016年 NN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InnerModel : NSObject

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *imgsrc;


+(instancetype)InnerModelWithDict:(NSDictionary *)dict;


+(void)innerListwithSuccess:(void(^)(NSArray *array))success;

@end
