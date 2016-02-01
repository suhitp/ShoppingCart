//
//  AppDelegate.m
//  ShoppingCart
//
//  Created by Suhit P on 27/01/16.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "AppDelegate.h"
#import "PersistentStore.h"
#import "PersistentStack.h"
#import "ShoppingItemsViewController.h"
#import "ShoppingCartViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) PersistentStore *store;
@property (nonatomic, strong) PersistentStack *persistentStack;
@property (nonatomic, assign) NSUserDefaults *defaults;
@property (nonatomic, strong) UITabBarController *tabBarController;

@end

static NSString *FIRST_LAUNCH_KEY = @"kFirstAppLaunch";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self registerDefaults];
    
    self.persistentStack = [[PersistentStack alloc] initWithStoreURL:self.storeURL modelURL:self.modelURL];
    self.store = [[PersistentStore alloc] init];
    self.store.managedObjectContext = self.persistentStack.managedObjectContext;
    
    if ([self isFirstLaunch]) {
        [self.store initProducts];
        [self updateDefaults];
    }
    
    self.tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = self.tabBarController.viewControllers[0];
    ShoppingItemsViewController *rootViewController = (ShoppingItemsViewController *)navigationController.topViewController;
    rootViewController.store = self.store;
    
    UINavigationController *navController = self.tabBarController.viewControllers[1];
    ShoppingCartViewController *cartViewController = (ShoppingCartViewController *)navController.topViewController;
    cartViewController.store = self.store;
    [self updateCartTabBadge];
    
    return YES;
}

#pragma mark - Update CartBadge
- (void)updateCartTabBadge
{
    NSInteger total = [self.store totalProducts];
    UITabBarItem *cartTab = [self.tabBarController.tabBar.items objectAtIndex:1];
    if(total == 0) {
        cartTab.badgeValue = nil;
    } else {
        cartTab.badgeValue = [NSString stringWithFormat:@"%ld", (long)total];
    }
}

#pragma mark - CoreData

- (NSURL *)storeURL {
    
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"ShoppingCart.sqlite"];
}

- (NSURL *)modelURL {
    return [[NSBundle mainBundle] URLForResource:@"ShoppingCart" withExtension:@"momd"];
}

#pragma mark - AppDefaults
- (void)registerDefaults
{
    NSDictionary *appDefaults = @{ FIRST_LAUNCH_KEY:@YES };
    [self.defaults registerDefaults:appDefaults];
    [self.defaults synchronize];
}

- (void)updateDefaults
{
    [self.defaults  setValue:@NO forKey:FIRST_LAUNCH_KEY];
    [self.defaults synchronize];
}

- (BOOL)isFirstLaunch
{
    return [self.defaults boolForKey:FIRST_LAUNCH_KEY];
}

- (NSUserDefaults *)defaults {
    return [NSUserDefaults standardUserDefaults];
}


#pragma mark - Application Lifecycle
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     [self.store.managedObjectContext save:NULL];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
