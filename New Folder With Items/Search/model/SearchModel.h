//
//  SearchModel.h
//  Search
//
//  Created by  plusub on 4/5/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "MTLModel.h"
#import "SearchDetModel.h"

@interface SearchModel : MTLModel<MTLJSONSerializing>
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSMutableArray *ResultData;

@property (strong, nonatomic) NSString *NextPage;

@end
