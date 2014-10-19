HA$PBExportHeader$w_shareclip.srw
$PBExportComments$PowerScript Clip Share GUI
forward
global type w_shareclip from window
end type
type rb_pk from radiobutton within w_shareclip
end type
type rb_pb from radiobutton within w_shareclip
end type
type st_product from statictext within w_shareclip
end type
type st_copyright from statictext within w_shareclip
end type
type cb_close from commandbutton within w_shareclip
end type
type cb_apply from commandbutton within w_shareclip
end type
type ddlb_1 from dropdownlistbox within w_shareclip
end type
type st_version from statictext within w_shareclip
end type
type rb_import from radiobutton within w_shareclip
end type
type rb_export from radiobutton within w_shareclip
end type
type st_what from statictext within w_shareclip
end type
type ln_1 from line within w_shareclip
end type
type ln_2 from line within w_shareclip
end type
end forward

global type w_shareclip from window
integer width = 1925
integer height = 1488
boolean titlebar = true
string title = "PowerScript Clip Sharing Tool"
boolean controlmenu = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_pk rb_pk
rb_pb rb_pb
st_product st_product
st_copyright st_copyright
cb_close cb_close
cb_apply cb_apply
ddlb_1 ddlb_1
st_version st_version
rb_import rb_import
rb_export rb_export
st_what st_what
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
this.rb_pk=create rb_pk
this.rb_pb=create rb_pb
this.st_product=create st_product
this.st_copyright=create st_copyright
this.cb_close=create cb_close
this.cb_apply=create cb_apply
this.ddlb_1=create ddlb_1
this.st_version=create st_version
this.rb_import=create rb_import
this.rb_export=create rb_export
this.st_what=create st_what
this.ln_1=create ln_1
this.ln_2=create ln_2
this.Control[]={this.rb_pk,&
this.rb_pb,&
this.st_product,&
this.st_copyright,&
this.cb_close,&
this.cb_apply,&
this.ddlb_1,&
this.st_version,&
this.rb_import,&
this.rb_export,&
this.st_what,&
this.ln_1,&
this.ln_2}
end on

on w_shareclip.destroy
destroy(this.rb_pk)
destroy(this.rb_pb)
destroy(this.st_product)
destroy(this.st_copyright)
destroy(this.cb_close)
destroy(this.cb_apply)
destroy(this.ddlb_1)
destroy(this.st_version)
destroy(this.rb_import)
destroy(this.rb_export)
destroy(this.st_what)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;of_populate_product_version( )
end event

type rb_pk from radiobutton within w_shareclip
integer x = 146
integer y = 708
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
st_version.text = "For witch version of PocketBuilder ?"
of_populate_product_version( )
end event

type rb_pb from radiobutton within w_shareclip
integer x = 146
integer y = 604
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
st_version.text = "For witch version of PowerBuilder ?"
of_populate_product_version( )
end event

type st_product from statictext within w_shareclip
integer x = 37
integer y = 476
integer width = 1445
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "For witch Product ?"
boolean focusrectangle = false
end type

type st_copyright from statictext within w_shareclip
integer x = 32
integer y = 1280
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
string text = "Copyright $$HEX2$$a9002000$$ENDHEX$$2008 dP Software "
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_shareclip
integer x = 1472
integer y = 1260
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
integer y = 1260
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
string	ls_version

li_rc = inv_sc.of_setfilename( )

if li_rc <> 1 then return

ls_filename = inv_sc.of_getfilename()
ls_version = ddlb_1.text

choose case ii_mode
	case 1
		inv_sc.of_exportclip( ls_filename, ls_version, ii_product )
	case 2
		inv_sc.of_importclip( ls_filename, ls_version, ii_product )
end choose

end event

type ddlb_1 from dropdownlistbox within w_shareclip
integer x = 146
integer y = 1004
integer width = 704
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_version from statictext within w_shareclip
integer x = 37
integer y = 872
integer width = 1445
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "For witch version of PowerBuilder ?"
boolean focusrectangle = false
end type

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

type st_what from statictext within w_shareclip
integer x = 37
integer y = 80
integer width = 1445
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "What do you want to do ?"
boolean focusrectangle = false
end type

type ln_1 from line within w_shareclip
long linecolor = 16777215
integer linethickness = 4
integer beginx = 27
integer beginy = 1200
integer endx = 1902
integer endy = 1200
end type

type ln_2 from line within w_shareclip
long linecolor = 8421504
integer linethickness = 4
integer beginx = 27
integer beginy = 1196
integer endx = 1902
integer endy = 1196
end type

