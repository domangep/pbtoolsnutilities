HA$PBExportHeader$w_shareclip.srw
$PBExportComments$PowerScript Clip Share GUI
forward
global type w_shareclip from window
end type
type cbx_keyboardshortcuts from checkbox within w_shareclip
end type
type ddlb_1 from dropdownlistbox within w_shareclip
end type
type rb_pk from radiobutton within w_shareclip
end type
type rb_pb from radiobutton within w_shareclip
end type
type st_copyright from statictext within w_shareclip
end type
type cb_close from commandbutton within w_shareclip
end type
type cb_apply from commandbutton within w_shareclip
end type
type rb_import from radiobutton within w_shareclip
end type
type rb_export from radiobutton within w_shareclip
end type
type gb_1 from groupbox within w_shareclip
end type
type gb_2 from groupbox within w_shareclip
end type
type gb_3 from groupbox within w_shareclip
end type
type ln_1 from line within w_shareclip
end type
type ln_2 from line within w_shareclip
end type
end forward

global type w_shareclip from window
integer width = 1925
integer height = 1712
boolean titlebar = true
string title = "PowerScript Clip Sharing Tool"
boolean controlmenu = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_keyboardshortcuts cbx_keyboardshortcuts
ddlb_1 ddlb_1
rb_pk rb_pk
rb_pb rb_pb
st_copyright st_copyright
cb_close cb_close
cb_apply cb_apply
rb_import rb_import
rb_export rb_export
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
ln_1 ln_1
ln_2 ln_2
end type
global w_shareclip w_shareclip

type variables
Public:
constant integer CST_MODE_EXPORT = 1
constant integer CST_MODE_IMPORT = 2

Protected:
n_cst_shareclip	inv_sc

Integer	ii_mode = cst_mode_export
integer	ii_product = inv_sc.cst_ide_powerbuilder
Boolean	ib_KeyboardShortcuts = false


end variables
forward prototypes
public subroutine of_populate_product_version ()
end prototypes

public subroutine of_populate_product_version ();/********************************************************************
	of_populate_product_version

	<DESC>	Populate the available installed version dropdownlist for
				the current selected Product.
				Automatically choose the last version of the installed product as default version.</DESC>

	<RETURN> (none):
				</RETURN>

	<ACCESS> Public

	<USAGE>	Call this method to populate the product's version
				dropdownlist.</USAGE>

********************************************************************/

integer li_i
integer li_limit
string ls_versions[]

inv_sc.of_getavailableideversion( ii_product, ls_versions )

li_limit = UpperBound( ls_versions )

ddlb_1.reset( )

for li_i = 1 to li_limit
	if ii_product = inv_sc.cst_ide_powerbuilder then
		if integer( ls_versions[li_i] ) > 7 then continue
	end if
	
	ddlb_1.additem( ls_versions[li_i] )
next

ddlb_1.selectitem(li_limit)
ddlb_1.setfocus( )
end subroutine

on w_shareclip.create
this.cbx_keyboardshortcuts=create cbx_keyboardshortcuts
this.ddlb_1=create ddlb_1
this.rb_pk=create rb_pk
this.rb_pb=create rb_pb
this.st_copyright=create st_copyright
this.cb_close=create cb_close
this.cb_apply=create cb_apply
this.rb_import=create rb_import
this.rb_export=create rb_export
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.ln_1=create ln_1
this.ln_2=create ln_2
this.Control[]={this.cbx_keyboardshortcuts,&
this.ddlb_1,&
this.rb_pk,&
this.rb_pb,&
this.st_copyright,&
this.cb_close,&
this.cb_apply,&
this.rb_import,&
this.rb_export,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.ln_1,&
this.ln_2}
end on

on w_shareclip.destroy
destroy(this.cbx_keyboardshortcuts)
destroy(this.ddlb_1)
destroy(this.rb_pk)
destroy(this.rb_pb)
destroy(this.st_copyright)
destroy(this.cb_close)
destroy(this.cb_apply)
destroy(this.rb_import)
destroy(this.rb_export)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;of_populate_product_version( )
end event

type cbx_keyboardshortcuts from checkbox within w_shareclip
integer x = 146
integer y = 424
integer width = 1216
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "I also want to include Keyboard Shortcuts"
end type

event clicked;ib_keyboardshortcuts = this.checked
end event

type ddlb_1 from dropdownlistbox within w_shareclip
integer x = 123
integer y = 1144
integer width = 983
integer height = 400
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_pk from radiobutton within w_shareclip
integer x = 123
integer y = 828
integer width = 1659
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PocketBuilder"
end type

event clicked;/********************************************************************
	clicked

	<DESC>	Set PocketBuilder as the current Product and populate the
				installed version(s) of the current product dropdownlist</DESC>

	<RETURN> long:
				</RETURN>

	<ACCESS> public

********************************************************************/

ii_product = inv_sc.cst_ide_pocketbuilder
gb_3.text = "For witch version of PocketBuilder ?"
of_populate_product_version( )
end event

type rb_pb from radiobutton within w_shareclip
integer x = 123
integer y = 724
integer width = 1623
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PowerBuilder"
boolean checked = true
end type

event clicked;/********************************************************************
	clicked

	<DESC>	Set PowerBuilder as the current Product and populate the
				installed version(s) of the current product dropdownlist</DESC>

	<RETURN> long:
				</RETURN>

	<ACCESS> public

********************************************************************/

ii_product = inv_sc.cst_ide_powerbuilder
gb_3.text = "For witch version of PowerBuilder ?"
of_populate_product_version( )
end event

type st_copyright from statictext within w_shareclip
integer x = 32
integer y = 1508
integer width = 974
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Copyright $$HEX2$$a9002000$$ENDHEX$$2014 dP Software "
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_shareclip
integer x = 1472
integer y = 1488
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_apply from commandbutton within w_shareclip
integer x = 1038
integer y = 1488
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Export..."
boolean default = true
end type

event clicked;integer 	li_rc
string  	ls_filename
string		ls_version

li_rc = inv_sc.of_setfilename( )

if li_rc <> 1 then return

ls_filename = inv_sc.of_getfilename()
ls_version = ddlb_1.text

choose case ii_mode
	case 1
		inv_sc.of_exportclip( ls_filename, ls_version, ii_product )
		if ib_keyboardshortcuts = true then
			inv_sc.of_exportkeyboardshortcuts( ls_filename, ls_version, ii_product )
		end if
	case 2
		inv_sc.of_importclip( ls_filename, ls_version, ii_product )
		if ib_keyboardshortcuts = true then
			inv_sc.of_importkeyboardshortcuts( ls_filename, ls_version, ii_product )
		end if
end choose

end event

type rb_import from radiobutton within w_shareclip
integer x = 146
integer y = 320
integer width = 1659
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "I want to use (Import) shared PowerScript Clips from others"
end type

event clicked;/********************************************************************
	clicked

	<DESC>	Set current mode to import</DESC>

	<RETURN> long:
				</RETURN>

	<ACCESS> public

********************************************************************/

ii_mode =cst_mode_import
cb_apply.text = "Import..."
end event

type rb_export from radiobutton within w_shareclip
integer x = 146
integer y = 216
integer width = 1623
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "I want to share (Export) my PowerScript Clips with others"
boolean checked = true
end type

event clicked;/********************************************************************
	clicked

	<DESC>	Set the current mode to export</DESC>

	<RETURN> long:
				</RETURN>

	<ACCESS> public

********************************************************************/

ii_mode = cst_mode_export
cb_apply.text = "Export..."

end event

type gb_1 from groupbox within w_shareclip
integer x = 37
integer y = 60
integer width = 1838
integer height = 520
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "What do you want to do ?"
end type

type gb_2 from groupbox within w_shareclip
integer x = 37
integer y = 596
integer width = 1838
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "For witch Product ?"
end type

type gb_3 from groupbox within w_shareclip
integer x = 37
integer y = 1016
integer width = 1838
integer height = 324
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "For witch version of PowerBuilder ?"
end type

type ln_1 from line within w_shareclip
long linecolor = 16777215
integer linethickness = 4
integer beginx = 27
integer beginy = 1428
integer endx = 1902
integer endy = 1428
end type

type ln_2 from line within w_shareclip
long linecolor = 8421504
integer linethickness = 4
integer beginx = 27
integer beginy = 1424
integer endx = 1902
integer endy = 1424
end type

