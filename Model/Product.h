//
//  Product.h
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


NS_ASSUME_NONNULL_BEGIN

@interface Product : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (void)insertItemWithId:(NSInteger )itemId
                    name:(NSString *)name
                   price:(double)price
                   image:(NSString *)imageName
  inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Product+CoreDataProperties.h"
