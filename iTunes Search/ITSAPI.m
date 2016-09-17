//
//  ITSAPI.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSAPI.h"
#import "ITSJsonParser.h"

@implementation ITSAPI

+ (NSArray<ITSMediaObject *> *)getItemsForTerm:(NSString *)term entity:(NSString *)entity {
    dispatch_semaphore_t sem;
    __block NSMutableArray<ITSMediaObject *> *result = [NSMutableArray new];
    
    sem = dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[[NSURLSession sharedSession]
          dataTaskWithURL:[ITSAPI urlFromTerm:term entity:entity]
          completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
              if (error == nil) {
                  id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                  if (error == nil) {
                      if (json[@"results"] != nil) {
                          json = [ITSJsonParser extractArrayFromJSON:json[@"results"]];
                          for (NSDictionary *item in json) {
                              [result addObject:[[ITSMediaObject alloc] initWithDictionary:item]];
                          }
                      }
                  }
              }
              dispatch_semaphore_signal(sem);
          }] resume];
    });
    
    
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    return result.copy;
}

+ (void)getItemsForTerm:(NSString *)term entity:(NSString *)entity competion:(CompletionBlock)completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[[NSURLSession sharedSession]
          dataTaskWithURL:[ITSAPI urlFromTerm:term entity:entity]
          completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
              if (error != nil)
                  dispatch_async(dispatch_get_main_queue(), ^{
                      completion(nil, error);
                      return;
                  });
              
              id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
              
              if (error != nil)
                  dispatch_async(dispatch_get_main_queue(), ^{
                      completion(nil, error);
                      return;
                  });
              
              if (json[@"results"] == nil) {
                  dispatch_async(dispatch_get_main_queue(), ^{
                      completion(nil, [NSError errorWithDomain:NSURLErrorDomain code:200 userInfo:@{NSLocalizedFailureReasonErrorKey : NSLocalizedString(@"No results", nil)}]);
                      return;
                  });
              }
              
              json = [ITSJsonParser extractArrayFromJSON:json[@"results"]];
              
              NSMutableArray<ITSMediaObject *> *result = [NSMutableArray new];
              
              for (NSDictionary *item in json) {
                  [result addObject:[[ITSMediaObject alloc] initWithDictionary:item]];
              }
              
              dispatch_async(dispatch_get_main_queue(), ^{
                  completion(result.copy, error);
                  return;
              });
              
          }] resume];
    });
}

+ (NSURL *)urlFromTerm:(NSString *)term entity:(NSString *)entity {
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&limit=200",
                           [term stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
    
    if (entity != nil)
        urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&entity=%@", entity]];
    
    return [NSURL URLWithString:urlString];
}


@end
