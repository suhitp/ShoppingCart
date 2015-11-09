//
//  ShoppingMenuCell.h
//  ShoppingCart
//
//  Created by Suhit P on 05/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingMenuCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;

@end
