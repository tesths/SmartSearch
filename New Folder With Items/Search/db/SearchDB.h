//
//  SearchDB.h
//  Search
//
//  Created by  plusub on 4/6/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchDB : NSObject
+ (void)initSearchDB;
+ (BOOL)insertData:(SearchDetModel *)model;
+ (BOOL)deleteData:(NSString *)title;
+ (BOOL)selectChoose:(NSString *)title;
+(NSMutableArray *)searchCollectionTable;
@end
