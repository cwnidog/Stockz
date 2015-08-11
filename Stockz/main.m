//
//  main.m
//  Stockz
//
//  Created by John Leonard on 8/10/15.
//  Copyright (c) 2015 John Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>

// Make a plist the hard way - inline

int main(int argc, const char *argv[])
{
  @autoreleasepool
  {
    NSMutableArray *stocks = [NSMutableArray new];
    NSMutableDictionary *stock;
    NSString *heading = @"This is the first line of a plist file";
    
    [stocks addObject:heading];
    
    stock = [NSMutableDictionary dictionary];
    [stock setObject:@"AAPL" forKey:@"symbol"];
    [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
    [stocks addObject:stock];
    
    stock = [NSMutableDictionary dictionary];
    [stock setObject:@"GOOG" forKey:@"symbol"];
    [stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
    [stocks addObject:stock];
    
    NSString *secondString = @"This is the second string in stocks";
    NSData *data = [secondString dataUsingEncoding:NSUTF8StringEncoding];
    data = [data subdataWithRange:NSMakeRange(0, [data length] - 1)];
    [stocks addObject:data];
    
    NSDate *today = [NSDate date];
    [stocks addObject:today];
    
    NSNumber *number = [NSNumber numberWithInt:750];
    [stocks addObject:number];
    
    NSNumber *smallPi = [NSNumber numberWithFloat:3.14];
    [stocks addObject:smallPi];
    
    NSNumber *truth = [NSNumber numberWithBool:true];
    [stocks addObject:truth];
    
    [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
    
    NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
    
    NSString *firstLine = [stockList objectAtIndex:0];
    NSLog(@"%@", firstLine);
    
    for (int i = 1; i < 3; i++)
    {
      NSDictionary *d = [stockList objectAtIndex:i];
      NSLog(@"I have %@ shares of %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
    }
    
    NSData *newData = [stockList objectAtIndex:3];
    NSString* newString;
    newString = [[NSString alloc] initWithData:newData encoding:NSASCIIStringEncoding];
    NSLog(@"newData has string: %@",newString);
    
    NSDate *newDay = [stockList objectAtIndex:4];
    NSLog(@"The stored date is %@", newDay);
    
    NSNumber *newInt = [stockList objectAtIndex:5];
    NSNumber *newPi = [stockList objectAtIndex:6];
    NSNumber *newTruth = [stockList objectAtIndex:7];
    
    NSLog(@"Numbers stored are: %li  and %.2f. And truth is still %d",(long)[newInt intValue], [newPi floatValue], [newTruth boolValue]);

  } // @autoreleasepool
    return 0;
} // main()
