//
//  SearchModel.m
//  Search
//
//  Created by  plusub on 4/5/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

+ (NSValueTransformer *)ResultDataJSONTransformer
{
    NSMutableArray *obArray = [NSMutableArray new];
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray *array) {
                for (NSDictionary *dic in array) {
                    SearchDetModel *file = [MTLJSONAdapter modelOfClass:SearchDetModel.class fromJSONDictionary:dic error:nil];
                    [obArray addObject:file];
                }
                return obArray;
            } reverseBlock:^id(NSMutableArray *fileArray) {
                return fileArray;
            }];
}
@end
