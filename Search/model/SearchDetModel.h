//
//  SearchDetModel.h
//  Search
//
//  Created by  plusub on 4/5/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "MTLModel.h"

@interface SearchDetModel : MTLModel <MTLJSONSerializing>
@property (copy, nonatomic) NSString *Abstract;
@property (copy, nonatomic) NSString *Link;
@property (copy, nonatomic) NSString *Title;

@end
