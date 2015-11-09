//
//  ShoppingCartCell.m
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "ShoppingCartCell.h"

@implementation ShoppingCartCell

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
    self.nameLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.priceLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.quantityLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    [self.removeItemButton.titleLabel setFont: [UIFont fontWithName:@"Avenir-Medium" size:14]];
}

@end
