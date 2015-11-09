//
//  AppDelegate.h
//  ShoppingCart
//
//  Created by Suhit P on 05/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

@import UIKit;

@class PersistentStore;
@class PersistentStack;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)updateCartTabBadge;

@end

