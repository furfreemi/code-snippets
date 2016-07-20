#import "LM+UITableViewController.h"

@interface LM+UITableViewController ()

@end

@implementation LM+UITableViewController {

}



#pragma mark - general UIViewController methods, not specific to TVCs

//basic setup methods I've commonly used
//many assume use of a base navigation controller
-(void)_basicSetupExamples{

  //set title in navigation controller
  [self setTitle:@"View Controller Title"];

  //edit bar button item example
  UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                              target:self
                                                                              action:@selector(_didPressCancel)];
  [self.navigationItem setLeftBarButtonItem:cancelItem];
}


-(void)_didPressCancel{

  //returns to previous VC in hierarchy, removing this VC
  [self.navigationController popViewControllerAnimated:YES];
  
  //other navigation options:
  //could push to another VC: will automatically link back to this VC in 'back' bar button item
  //[self.navigationController pushViewController:[UIViewController new] animated:YES];
  //can also present: presentViewController:animated:completion:
  
}


//method called by UIKit upon device rotation: iOS8 only
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
}





#pragma mark - UITableViewController methods

-(void)_basicTableViewSetupExamples{

  //auto-detect cell height based on autolayout constraints of cell's contentView
  //remove implementation of tableView:heightForRowAtIndexPath: if implementing autolayout
  self.tableView.rowHeight = UITableViewAutomaticDimension;
  //likely height: used to smooth scrollbar- implement tableView:estimatedHeightForRowAtIndexPath: if heights are wide-ranging
  self.tableView.estimatedRowHeight = 80;
  
  //if supporting editing: allow multiple selection or not
  self.tableView.allowsMultipleSelectionDuringEditing = NO;
  
  //set header for tableview: can customize this view as much as you'd like
  [self.tableView setTableHeaderView:[UIView new]];

}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  //save processing: attempt to reuse cell if already created
  UITableViewCell *currentCell = [self.tableView dequeueReusableCellWithIdentifier:@"identifier"];
  
  //if cell doesn't exist in queue yet, create this cell
  if (!cell){
    currentCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"identifier"];
    
    //any customization to cell can go here
    [currentCell setSelectionStyle:UITableViewCellSelectionStyleNone];
  }

  return currentCell;
}




#pragma mark - TableView appearance, supporting views, and layout

//don't implement if using autolayout to automatically detect height of cell
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 55.0f;
}


//set up custom view for section header (also available for footer)
//return nil for sections without headers
//frame specified here does NOT affect display; use following height method to customize
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  return [UIView new];
}

//determines height for header view (also available for footer)
//will not be called for sections with nil header views
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  return 40.0f;
}




#pragma mark - TableView interactions

//if cell is selected
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

//various ways of reloading or redisplaying portions of the tableview
-(void)_reloadTableViewAspect{
  [self.tableView reloadData];
  
  //reload visible cells
  //can also reload full sections: reloadSections:withRowAnimation:
  [self.tableView reloadRowsAtIndexPaths:self.tableView.indexPathsForVisibleRows withRowAnimation:UITableViewRowAnimationFade];

}

//if user edits an editable cell: example- delete (default)
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      //delete cell
      [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
      
      //update data source here
    }
}

//if different cells have different editing styles
//delete is default, don't need to implemenent if not editable or only supporting delete
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}



@end
