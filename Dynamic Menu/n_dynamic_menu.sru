HA$PBExportHeader$n_dynamic_menu.sru
forward
global type n_dynamic_menu from nonvisualobject
end type
end forward

global type n_dynamic_menu from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer of_insert_menu_at_end (menu am_parent_menu, menu am_menu)
public function integer of_insert_menu (menu am_parent_menu, integer ai_index, menu am_menu, boolean ab_shift)
public function integer of_refresh_menu (menu am_menu)
end prototypes

public function integer of_insert_menu_at_end (menu am_parent_menu, menu am_menu);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_insert_menu_at_end
//
// Access:			Public
//
// Arguments:
// am_parent_menu:		The parent menu under will be added am_menu.
// am_menu:			The menu that will be added at the end of items
//						below am_parent_menu.
//
// Returns:			integer
//						 1, OK
//						-1, An error occurs
//
// Description:	Insert dynamically a new menu item under an existing
//						parent one.
//						The new menu item will be displayed at the end of the
//						existing items listed below the parent menu.
//
// Usage:			Call this method to add a new menu at the end of the list
//							of existing one under its parent menu.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// V1.0	PDO	10/09/2015	Initial version
//////////////////////////////////////////////////////////////////////////////

return of_insert_menu( am_parent_menu, 0, am_menu, false )
end function

public function integer of_insert_menu (menu am_parent_menu, integer ai_index, menu am_menu, boolean ab_shift);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_insert_menu
//
// Access:			Public
//
// Arguments:
// am_parent_menu:		The parent menu under will be insert am_menu.
// ai_index:			The index of the position to insert am_menu under
//						am_parent_menu.
// am_menu:			The dynamic menu to be inserted under am_menu at
//						ai_index position.
// ab_shift:			Wether existing entries at and below ai_index
//						will be shifted down or not:
//						True, shift down existing entries starting from
//						ai_index
//						False, overwrite existing entry under ai_index
//
// Returns:			integer
//						The index of the inserted dynamic menu, or
//						-1, if an error occurs.
//
// Description:	Insert specified dynamic menu at indicated position under
//						a parent menu.
//
// Usage:			Call this method to insert dynamically a menu under
//							another one.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// V1.0	PDO	10/09/2015	Initial version
// V1.1	PDO	11/09/2015	Do not refresh parent menu automatically 
//									- See of_refresh_menu method
//////////////////////////////////////////////////////////////////////////////

integer	li_i
integer	li_limit

// Check parameters
if isnull( am_parent_menu ) or not isvalid( am_parent_menu ) then return -1
if isnull( am_menu ) or not isvalid( am_menu) then return -1
if isnull( ai_index ) or ai_index < 0 then return -1
if isnull( ab_shift ) then return -1

// Compute Total Items existing under specified parent menu
li_limit = upperbound( am_parent_menu.item )

// if insertion position is specified, 
if ai_index > 0 then
	// if shift flag is set, then make room to be able to insert it
	if ab_shift = true then
		li_limit ++		
		for li_i = li_limit to (ai_index + 1) step -1
			am_parent_menu.item[li_i] = am_parent_menu.item[li_i - 1]
		next
	end if
end if

// if insertion position equal to zero then insert dynamic menu at the end 
// otherwise overwrite existing item under specified position.
if ai_index = 0 then
	ai_index = li_limit + 1
end if

// Insert dynamic menu at adequate position
am_parent_menu.Item[ai_index] = am_menu

// Return the insertion index used
return ai_index

end function

public function integer of_refresh_menu (menu am_menu);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_refresh_menu
//
// Access:			Public
//
// Arguments:
// am_menu:		The Parent Menu to refresh it's contents
//
// Returns:			integer
//						 1, OK
//						-1, An error occurs
//						
//
// Description:	Refresh content of the specified menu in order to make
//						newly inserted sub item menus visible.
//
// Usage:			Call this method to refresh specified menu after having
//							inserted all needed sub menu items needed.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// V1.0	PDO	11/09/2015	Initial version
//////////////////////////////////////////////////////////////////////////////

if isnull( am_menu ) or not isvalid( am_menu ) then return -1

hide(am_menu)
show(am_menu)

return 1
end function

on n_dynamic_menu.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dynamic_menu.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
// n_dynamic_menu:  
//
// Object:			This Auto Instantiate NVO allows to create menu dynamically
//						at run time under an existing menu item created with the
//						menu painter.
//						The dynamically created menu can inherit from an
//						existing menu object to have specific/generic behaviors.
//
// Usage:			1. Create a specific ancestor menu with needed
//						behaviors, if needed.
//						2. Declare a menu variable with adequate scope to hold
//						the dynamic menu reference while the parent menu will be
//						used.
//						3. a. Declare an n_dynamic_menu variable in adequate
//						script.
//						    b. Create a new instance of the menu needed and set
//						adequates properties
//						4. Call the of_insert_menu() or of_insert_menu_at_end() as
//						described in the documentation. (See function code)
//						5. Refresh parent menu contents to make all new menu items visible at once
//						    by calling the of_refresh_menu() method.
//
//						And thats all folks !!!
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// V1.0	Patrice Domange	10/09/2015	Initial version
// V1.1	Patrice Domange	11/09/2015	Add reference to the of_refresh_menu() method
//////////////////////////////////////////////////////////////////////////////
//
//Copyright (C) 2015 dP Software.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>
//
///////////////////////////////////////////////////////////////////////////////
end event

