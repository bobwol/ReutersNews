//
//  NSString+Additions.h
//  ReutersNewsReader
//
//  Created by Barney on 7/13/13.
//  Copyright (c) 2013 pvllnspk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

- (NSString *)sha1;

- (NSString *)md5;

- (NSString*)stringBetweenString:(NSString *)start andString:(NSString *)end;

- (NSString*)lastStringBetweenString:(NSString *)start andString:(NSString *)end;

- (NSString *)stringByStrippingHTML;

@end
