//
//  SearchDB.m
//  Search
//
//  Created by  plusub on 4/6/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SearchDB.h"
#import "SearchDetModel.h"

@implementation SearchDB
+ (void)initSearchDB
{
    debugMethod();
    NSFileManager *filemanager = [NSFileManager defaultManager];
    if ([filemanager fileExistsAtPath:FILEPATH] == NO) {
        FMDatabase *collectiondb = [FMDatabase databaseWithPath:FILEPATH];
        if ([collectiondb open]) {
            NSString *sql = @"CREATE TABLE 'Collection' ('title' VARCHAR(200), 'url' TEXT)";
            BOOL res = [collectiondb executeUpdate:sql];
            if (!res) {
                debugLog(@"init error!!");
            } else {
                debugLog(@"init success!!");
            }
            [collectiondb close];
        } else {
            debugLog(@"can not open");
        }
    }
}

+ (BOOL)insertData:(SearchDetModel *)model
{
    BOOL isSuccess;
    FMDatabase *collectiondb = [FMDatabase databaseWithPath:FILEPATH];
    NSString *title = model.Title;
    NSString *link = model.Link;
    if ([collectiondb open]) {
        NSString *sql = @"insert into collection (title, url) values(?, ?)";
        isSuccess = [collectiondb executeUpdate:sql, title, link];
        if (!isSuccess) {
            debugLog(@"insert error!");
            isSuccess = false;
        } else {
            debugLog(@"insert success!!");
            isSuccess = true;
        }
        [collectiondb close];
    } else {
        debugLog(@"can not open");
    }
    return isSuccess;
}

+ (BOOL)deleteData:(NSString *)title
{
    BOOL isSuccess;
    FMDatabase *collectiondb = [FMDatabase databaseWithPath:FILEPATH];
    if ([collectiondb open]) {
        NSString *sql = [NSString stringWithFormat:@"delete from collection where title = ?"];
        isSuccess = [collectiondb executeUpdate:sql, title];
        if (!isSuccess) {
            debugLog(@"delete error!");
            isSuccess = false;
        } else {
            debugLog(@"delete success!!");
            isSuccess = true;
        }
        [collectiondb close];
    }
    return isSuccess;
}

+ (BOOL)selectChoose:(NSString *)title
{
    BOOL isSuccess;
    FMDatabase *collectiondb = [FMDatabase databaseWithPath:FILEPATH];
    if ([collectiondb open]) {
        NSString *sql = [NSString stringWithFormat:@"select * from collection where title = ?"];
        FMResultSet *s = [collectiondb executeQuery:sql, title];
        if (![s next]) {
//            debugLog(@"select no data!");
            isSuccess = false;
        } else {
            debugLog(@"select success!!");
            isSuccess = true;
        }
    }
    return isSuccess;
}

+(NSMutableArray *)searchCollectionTable
{
    NSMutableArray *dataArray= [[NSMutableArray alloc] init];
    FMDatabase *collectiondb = [FMDatabase databaseWithPath:FILEPATH];
    if ([collectiondb open]) {
        FMResultSet *s = [collectiondb executeQuery:@"select * from collection"];
        while ([s next]) {
            //retrieve values for each record
            NSDictionary *dbdata = @{@"Link":[s stringForColumn:@"url"], @"Title":[s stringForColumn:@"title"]};
            NSError *error = nil;
            SearchDetModel *service = [MTLJSONAdapter modelOfClass:SearchDetModel.class fromJSONDictionary:dbdata error:&error];
            [dataArray addObject:service];
        }
    }
    return dataArray;
}
@end
