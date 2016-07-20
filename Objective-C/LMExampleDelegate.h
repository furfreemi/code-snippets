@protocol LMExampleDelegate <NSObject>

@required
-(void)requiredMethod:(NSObject *)parameter;
@end

//in header of class calling delegate method:
//@property (nonatomic, weak) id<LMExampleDelegate> delegate;

//in implementation of class calling delegate method: 
//[self.delegate requiredMethod:input];


//in header of class serving as delegate:
//@interface SomeCustomViewController : UITableViewController <LMExampleDelegate>

//in implementation of class serving as delegate:
//classCallingDelegateMethod.delegate = self;
//-(void)requiredMethod:(NSObject *)parameter { ...body... };
