//
//  SearchTextField.m
//  Search
//
//  Created by  plusub on 4/5/15.
//  Copyright (c) 2015 plusub. All rights reserved.
//

#import "SearchTextField.h"

@implementation SearchTextField

-(instancetype)initWithFrame:(CGRect)frame andPlaceText:(NSString *)ptext
{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeholder = ptext;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.backgroundColor = [UIColor clearColor];
    self.textAlignment = NSTextAlignmentRight;
    self.font = [UIFont systemFontOfSize:14];
    self.textColor = COLOR(178, 178, 178);
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 30)];
    self.leftViewMode = UITextFieldViewModeAlways;
    
    self.borderStyle = UITextBorderStyleNone;
    self.layer.cornerRadius = 2;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.adjustsFontSizeToFitWidth = YES;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.textColor = [UIColor blackColor];
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textAlignment = NSTextAlignmentLeft;
    self.font = [UIFont fontWithName:nil size:15];
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.returnKeyType = UIReturnKeySearch;
}



@end
                                               