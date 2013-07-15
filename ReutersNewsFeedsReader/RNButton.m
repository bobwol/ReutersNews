//
//  RNButton.m
//  ReutersNewsFeedsReader
//
//  Created by Barney on 7/13/13.
//  Copyright (c) 2013 pvllnspk. All rights reserved.
//

#import "RNButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation RNButton
{
    UIView *_selectionView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    static CGRect sectionSize;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        sectionSize = CGRectMake(0, 0, 36, 38);
    }
    else
    {
        sectionSize = CGRectMake(0, 0, 45, 32);
    }
    _selectionView = [[UIView alloc] initWithFrame:sectionSize];
    [_selectionView setBackgroundColor:[UIColor clearColor]];
    [_selectionView setCenter:[self convertPoint:CGPointMake(round(self.imageView.center.x), round(self.imageView.center.y)) fromView:self]];
    _selectionView.layer.cornerRadius = 5;
    _selectionView.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.7].CGColor;
    _selectionView.layer.borderWidth = 1.0f;
    [_selectionView setUserInteractionEnabled:NO];
    [_selectionView setAlpha:0.2];
    [self addSubview:_selectionView];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [UIView animateWithDuration:0.2 animations:^
     {
         [_selectionView setAlpha:(selected)?1.0:0.2];
     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
