//
//  main.m
//  Stockz
//
//  Created by John Leonard on 8/10/15.
//  Copyright (c) 2015 John Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
  @autoreleasepool
  {
    NSMutableArray *stocks = [NSMutableArray new];
    NSMutableDictionary *stock;
    
    stock = [NSMutableDictionary dictionary];
    [stock setObject:@"AAPL" forKey:@"symbol"];
    [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
    [stocks addObject:stock];
    
    stock = [NSMutableDictionary dictionary];
    [stock setObject:@"GOOG" forKey:@"symbol"];
    [stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
    [stocks addObject:stock];
    
    [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
    
    NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
    
    for (NSDictionary *d in stockList)
    {
      NSLog(@"I have %@ shares of %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
    }
  } // @autoreleasepool
    return 0;
} // main()
