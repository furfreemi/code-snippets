#import "LMExampleReadFromPlist.h"

@implementation LMExampleReadFromPlist {}

- (instancetype)init {
    self = [super init];
    
    if (self) {
    
        //get plist file
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"PlistName" ofType:@"plist"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:plist]) {
            
            //reads root array from plist, composed of Items 0...n
            NSArray *plistConfiguration = [[NSArray alloc] initWithContentsOfFile:plist];
            
            //can now go over each item in plist
            for (NSInteger i = 0; i < [plistConfiguration count]; i++) {
                
                //example: Items are dictionaries
                //Item i in plist: change type as necessary
                NSDictionary *currentLocation = [locationsConfiguration objectAtIndex:i];
                
                //can read from this dictionary using key specified in plist file just as you would any other dictionary
            }
        }
    }
    
    return self;
}
