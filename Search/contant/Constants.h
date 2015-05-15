//
//  Constants.h
//  Search
//
//  Created by  plusub on 15-4-2.
//  Copyright (c) 2015年 plusub. All rights reserved.
//

#ifndef Search_Constants_h
#define Search_Constants_h

#define COLOR(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define COLLECTION_DB @"collection.db" //db名字
#define FILEPATH [NSString stringWithFormat:@"%@", [FileUn getFilePath:COLLECTION_DB]]

#endif
