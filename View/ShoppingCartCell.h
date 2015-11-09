//
//  ShoppingCartCell.h
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cartImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;

@property (weak, nonatomic) IBOutlet UIButton *removeItemButton;

@end
