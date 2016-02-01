//
//  ShoppingMenuCell.m
//  ShoppingCart
//
//  Created by Suhit P on 27/01/16.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "ShoppingMenuCell.h"

@implementation ShoppingMenuCell

- (void)awakeFromNib {
    // Initialization code
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.productNameLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.priceLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    [self.addToCartButton.titleLabel setFont: [UIFont fontWithName:@"Avenir-Medium" size:14]];
}

@end
