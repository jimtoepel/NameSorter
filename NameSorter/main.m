//
//  main.m
//  NameSorter
//
//  Created by Jim Toepel on 2/22/15.
//  Copyright (c) 2015 FunderDevelopment. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Starting...");
        
        // read in the file as a huge string (ignoring errors)
        
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];

        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        NSLog(@"Strings loaded.");
        
        
        // Break that up into an array of strings
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        NSUInteger namesCount = [names count];
        NSLog(@"Name array completed");
        
        NSMutableSet *words = [NSMutableSet setWithArray:[wordString componentsSeparatedByString:@"\n"]];
        
            //remove the empty string to avoid an extra match
            [words removeObject:@""];
        
        NSUInteger wordsCount = [words count];
        NSLog(@"Word array completed");
       
        
        // Enumerate through the names array one at a time and ask if the lowercased name is a member of the words pile. (not interested in upper case)
        
        unsigned int total = 0;
        
        for (NSString *n in names) {
                if ([words containsObject:[n lowercaseString]])
                    NSLog(@"%@", n);
            total ++;
        }
        
        
        NSLog(@"There are %lu words.\n", wordsCount);
        NSLog(@"There are %lu names.\n", namesCount);
        NSLog(@"There were %d matched, total.\n", total);
    }
    return 0;
}
