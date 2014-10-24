HA$PBExportHeader$n_cst_shareclip.sru
$PBExportComments$Powerscript Share Clip Business Object
forward
global type n_cst_shareclip from nonvisualobject
end type
end forward

global type n_cst_shareclip from nonvisualobject autoinstantiate
end type

type variables
Public:
constant integer	CST_IDE_POWERBUILDER = 1
constant integer	CST_IDE_POCKETBUILDER = 2

Protected:
string		is_VersionsPb[]
string		is_VersionsPk[]
string		is_RegEntryClip[2] = { "HKEY_CURRENT_USER\Software\Sybase\PowerBuilder", "HKEY_CURRENT_USER\Software\Sybase\PocketBuilder" }
string		is_RegEntryIDE[2] =  { "HKEY_LOCAL_MACHINE\SOFTWARE\Sybase\PowerBuilder",  "HKEY_LOCAL_MACHINE\SOFTWARE\Sybase\PocketBuilder" }
string		is_filename
end variables

forward prototypes
public function integer of_createfile (string as_filename)
public function integer of_setfilename ()
public function string of_getfilename ()
public subroutine of_getavailableideversion (integer ai_idetype, ref string as_versions[])
public function integer of_importclip (string as_filename, string as_ideversion, integer ai_idetype)
public subroutine of_exportclip (string as_filename, string as_ideversion, integer ai_idetype)
public function boolean of_iscompatibleversion (string as_version)
public subroutine of_exportkeyboardshortcuts (string as_filename, string as_ideversion, integer ai_idetype)
public function integer of_importkeyboardshortcuts (string as_filename, string as_ideversion, integer ai_idetype)
end prototypes

public function integer of_createfile (string as_filename);/********************************************************************
	of_createfile

	<DESC>	Create a ShareClip initialization files.</DESC>

	<RETURN> integer:
				1, ok
				-1, an error occurs</RETURN>

	<ACCESS> Public

	<ARGS>	as_filename: The name of the file to be created</ARGS>

	<USAGE>	This function is automatically called by the
				of_exportclip method.</USAGE>

********************************************************************/

integer li_rc

li_rc = fileopen( as_filename, Linemode!, Write!, LockReadWrite!, Replace! )
filewrite( li_rc, "[Settings]")
filewrite( li_rc, "Limit=0" )
li_rc = fileclose( li_rc )

return li_rc

end function

public function integer of_setfilename ();/********************************************************************
	of_setfilename

	<DESC>	Let the user select the .ini file to be used by the
				service for import/export.</DESC>

	<RETURN> integer:
				 1, ok
				 0, operation canceled by the user
				-1, an error occurs</RETURN>

	<ACCESS> Public

	<USAGE>	Call this method to set the filename the service should
				use for import/export.</USAGE>

********************************************************************/

integer	li_rc
string	docpath
string	docname

li_rc = GetFileSaveName("Select File", docpath, docname, "INI", "Initialisation Files (*.INI),*.INI" )

if li_rc = 1 then
	is_filename = docpath
end if

return li_rc
end function

public function string of_getfilename ();/********************************************************************
	of_getfilename

	<DESC>	Returns the ini filename actually used by the service</DESC>

	<RETURN> string:
				The complete filename of the ini file currently used by
				the service for export/import</RETURN>

	<ACCESS> Public

	<USAGE>	Call this function to know the name used by the service
				for export/import</USAGE>

********************************************************************/

return is_filename
end function

public subroutine of_getavailableideversion (integer ai_idetype, ref string as_versions[]);/********************************************************************
	of_getavailableideversion

	<DESC>	Get the list of all installed version of the specified
				IDE on the current machine.</DESC>

	<RETURN> (none):
				</RETURN>

	<ACCESS> Public

	<ARGS>	ai_idetype: The IDE symbolic constant to get its list of
				installed versions on the current machine
				as_versions[]: The string arrays that will holds the result (by
				ref.)</ARGS>

	<USAGE>	Call this function to get the complete list of installed
				version of a specified IDE</USAGE>

********************************************************************/

integer	li_rc

li_rc = registryKeys( is_regentryide[ai_idetype], as_versions )


end subroutine

public function integer of_importclip (string as_filename, string as_ideversion, integer ai_idetype);/********************************************************************
	of_importclip

	<DESC>	Import shared PowerScript Clips from the specified .INI
				file for the specified IDE 's version.</DESC>

	<RETURN> integer:
				 1, ok
				 0, nothing done
				-1, an error occurs</RETURN>

	<ACCESS> Public

	<ARGS>	as_filename: The filename of the .ini files that containts
				PowerScript Clip informatin to be imported
				as_ideversion: The destination version number of the specified
				IDE
				ai_idetype: The symbolic constant value for the destination
				IDE, where
				CST_IDE_POWERBUILDER (1) = PowerBuilder
				CST_IDE_POCKETBUILDER (2) = PocketBuilder
				</ARGS>

	<USAGE>	Call this method to import shared powerscript clip</USAGE>

********************************************************************/

integer	li_i
integer	li_limit
string	ls_regentry
string	ls_clip
string	ls_desc
string ls_text
string	ls_entry
string	ls_tmp

if ai_idetype = cst_ide_powerbuilder then
	// Reject if specified version of PowerBuilder is less than 8.0
	if of_iscompatibleversion( as_ideversion ) = false  then return -1
	ls_regentry = is_regentryclip[ai_idetype]+"\"+as_ideversion+"\Clip"
end if

// Set the total number of clips to be handled
li_limit = ProfileInt(as_filename,"Settings","Limit", 0)

// Extract Clips information from .ini file and set it in the registry
for li_i = 1 to li_limit
	ls_entry = "Clip "+string(li_i)
	ls_clip = Profilestring( as_filename, ls_entry, "Name", "" )
	ls_text = Profilestring( as_filename, ls_entry, "Text", "" )
	
	ls_tmp = ls_regentry+"\"+ls_clip
	
	RegistrySet( ls_tmp, "Text", RegString!, ls_text )

	if ai_idetype = cst_ide_powerbuilder then
		ls_desc = Profilestring( as_filename, ls_entry, "Desc", "" )
		RegistrySet( ls_tmp, "Desc", RegString!, ls_desc )
	end if
next

return 1

end function

public subroutine of_exportclip (string as_filename, string as_ideversion, integer ai_idetype);/********************************************************************
	of_exportclip

	<DESC>	Export PowerScript Clips of the specified IDE's Version
				into the specified .INI File.</DESC>

	<RETURN> (none):
				</RETURN>

	<ACCESS> Public

	<ARGS>	as_filename: The .ini filename that will contains the exported
				clips information.
				as_ideversion: The source IDE's version number to exports its
				clips
				ai_idetype: The symbolic constant value of the source IDE,
				where :
				CST_IDE_POWERBUILDER (1) = PowerBuilder
				CST_IDE_POCKETBUILDER (2) = PocketBuilder
				</ARGS>

	<USAGE>	Call this method to share powerscript clips</USAGE>

********************************************************************/


integer	li_i
integer	li_limit
string 	ls_regentry
string	ls_clips[]
string	ls_desc
string	ls_text
string	ls_entry

// Create the corresponding ini file, if needed
if fileexists( as_filename ) = false then
	of_createfile( as_filename )
end if

// Set registry entry name according to specified IDE version
ls_regentry = is_regentryclip[ai_idetype]+"\"+as_ideversion+"\Clip"

// Extract Clips entries
registrykeys( ls_regentry, ls_clips )

// Store Clips number limits in the ini file
li_limit = UpperBound( ls_clips )
SetprofileString( as_filename, "Settings", "Limit", string(li_limit))

// Store current clips information in the ini file
for li_i = 1 to li_limit
	ls_entry = "Clip "+string(li_i)
	RegistryGet( ls_regentry+"\"+ls_clips[li_i], "Text", regstring!, ls_text )
	
	SetprofileString( as_filename, ls_entry, "Name", ls_clips[li_i])
	SetprofileString( as_filename, ls_entry, "Text", ls_text )

	if ai_idetype = cst_ide_powerbuilder then	
		RegistryGet( ls_regentry+"\"+ls_clips[li_i], "Desc", regstring!, ls_desc )
		SetprofileString( as_filename, ls_entry, "Desc", ls_desc )
	end if
next

end subroutine

public function boolean of_iscompatibleversion (string as_version);/********************************************************************
	of_iscompatibleversion

	<DESC>	Check if the specified versfion of the ide is compatible
				with the Clip fonctionnality.
				</DESC>

	<RETURN> boolean:
				 True, if major versiion number is above 7
				 False, if major version number is not above 7
				</RETURN>

	<ACCESS> Public

	<ARGS>	as_version: The version number of the IDE to check.</ARGS>

	<USAGE>	This method is used by the ImportClip() method to check
				that the clip functionnality is avalaible or not</USAGE>

********************************************************************/

long		ll_pos
integer	li_majorVersion

if isnull( as_version ) or len(trim(as_version)) = 0 then return false

// Take into account account only the Major Number of the version
ll_pos = pos( as_version, "." )
if ll_pos >  0 then
	as_version = left( as_version, ll_pos - 1)
end if

li_majorVersion = integer( as_version )

return (li_majorVersion > 7)
end function

public subroutine of_exportkeyboardshortcuts (string as_filename, string as_ideversion, integer ai_idetype);/********************************************************************
	of_exportkeyboardshortcuts

	<DESC>	Export Keyboard Shortcuts of the specified IDE's Version
				into the specified .REG File and link it to the .INI file.</DESC>

	<RETURN> (none):
				</RETURN>

	<ACCESS> Public

	<ARGS>	as_filename: The .REG filename that will contains the exported
				Keyboard shortcuts information. It will have the same name than the main .INI file.
				as_ideversion: The source IDE's version number to exports its
				keyboard shortcuts
				ai_idetype: The symbolic constant value of the source IDE,
				where :
				CST_IDE_POWERBUILDER (1) = PowerBuilder
				CST_IDE_POCKETBUILDER (2) = PocketBuilder
				</ARGS>

	<USAGE>	Call this method to share keyboard shortcuts</USAGE>

********************************************************************/

string 	ls_regentry
string		ls_filename
string		ls_run
integer	li_Rc

// set .REG filename to match .INI file
ls_filename = left( as_filename, len( as_filename ) - 3 )+ "reg"

// Set registry entry name according to specified IDE version
ls_regentry = is_regentryclip[ai_idetype]+"\"+as_ideversion+"\Shortcuts"

// Export Keyboard shortcuts
ls_run = "reg.exe export "+ ls_regentry + " " + ls_filename 
li_rc = run( ls_run )

// Store Keyboard Shortcuts .REG file reference into .INI file with a relative file path
ls_filename = "."+mid( ls_filename, lastpos( ls_filename, "\") )
SetprofileString( as_filename, "Settings", "KeyboardShortcuts", ls_filename)

end subroutine

public function integer of_importkeyboardshortcuts (string as_filename, string as_ideversion, integer ai_idetype);/********************************************************************
	of_importKeyboard SHortcuts

	<DESC>	Import shared PowerScript Keyboard SHortcuts from the specified .INI
				file for the specified IDE 's version.</DESC>

	<RETURN> integer:
				 1, ok
				 0, nothing done
				-1, an error occurs</RETURN>

	<ACCESS> Public

	<ARGS>	as_filename: The filename of the .ini files that containts
				PowerScript Keyboard SHortcuts informatin to be imported
				as_ideversion: The destination version number of the specified
				IDE
				ai_idetype: The symbolic constant value for the destination
				IDE, where
				CST_IDE_POWERBUILDER (1) = PowerBuilder
				CST_IDE_POCKETBUILDER (2) = PocketBuilder
				</ARGS>

	<USAGE>	Call this method to import shared powerscript Keyboard SHortcuts</USAGE>

********************************************************************/

string	ls_run
string ls_regfile

// Get linked .REG file that contains the Keyboard Shortcuts information to be imported
ls_regfile = left( as_filename, lastpos( as_filename, "\") ) + mid( Profilestring( as_filename, "Settings","KeyboardShortcuts", "" ), 3)
if ls_regfile ="" then return -1

// Import .REG file using regedit tool
ls_run = "reg.exe import "+ ls_regfile
run( ls_run)

return 1
end function

on n_cst_shareclip.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_shareclip.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

