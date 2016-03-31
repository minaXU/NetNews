
//
//  NewsModel.m
//  新闻
//
//  Created by xuNick on 16/3/31.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "NewsModel.h"

#import "NetworkTools.h"

#import <objc/runtime.h>

@implementation NewsModel

+ (instancetype)newsWithDict:(NSDictionary *)dict{
    NewsModel* model = [[NewsModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

+ (void)loadNewsListWithStirng:(NSString *)string{
    [[NetworkTools shareNetwoekTools] GET:string parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        //拿到返回的数组
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        //遍历数组,抓换模型
        //可变数组保存数据
        NSMutableArray *mutable = [NSMutableArray arrayWithCapacity:20];
        for (NSDictionary *dict in array) {
            [mutable addObject:[NewsModel newsWithDict:dict]];
        }
        //返回给主线程
        NSLog(@"%@",mutable);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

const char * Kper = "kProperty";

- (NSString *)description{
    //如果属性列表已经存在,直接返回
    NSString *pList = objc_getAssociatedObject(self.class, Kper);
    NSLog(@"%@",pList);
    if (pList.length > 0) {
        
        return pList;
    }
    
    
    
    //运行时的方式获取属性字典
    unsigned int count;
    objc_property_t * list = class_copyPropertyList([self class], &count);
    //遍历取出属性
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i ++) {
        objc_property_t property = list[i];
        const char * name = property_getName(property);
        [array addObject:[NSString stringWithUTF8String:name]];
    }
    NSLog(@"%@",array.copy);
    //model转字典
    //释放list
    free(list);
    
    NSDictionary *dict = [self dictionaryWithValuesForKeys:array.copy];
    NSString *string = [NSString stringWithFormat:@"%@",dict];
    objc_setAssociatedObject(self.class, Kper, string, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return objc_getAssociatedObject(self.class, Kper);
   
    
}

//忽略未定义的字典数据
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
