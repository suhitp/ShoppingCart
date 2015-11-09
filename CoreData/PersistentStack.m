//
//  PersistentStack.m
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "PersistentStack.h"

@interface PersistentStack ()

@property (nonatomic,strong,readwrite) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSURL *modelURL;
@property (nonatomic,strong) NSURL *storeURL;

@end

@implementation PersistentStack

- (instancetype)initWithStoreURL:(NSURL*)storeURL modelURL:(NSURL*)modelURL
{
    self = [super init];
    if (self) {
        self.storeURL = storeURL;
        self.modelURL = modelURL;
        [self setupManagedObjectContext];
    }
    return self;
}

- (void)setupManagedObjectContext
{
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    self.managedObjectContext.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    
    if (![self.managedObjectContext.persistentStoreCoordinator  addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:self.storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //abort();
    }
    
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
}


- (NSManagedObjectModel *)managedObjectModel
{
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
}




@end
