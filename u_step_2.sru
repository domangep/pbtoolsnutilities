HA$PBExportHeader$u_step_2.sru
forward
global type u_step_2 from u_wizard_step
end type
type st_1 from statictext within u_step_2
end type
end forward

global type u_step_2 from u_wizard_step
st_1 st_1
end type
global u_step_2 u_step_2

on u_step_2.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_step_2.destroy
call super::destroy
destroy(this.st_1)
end on

event ue_validate;call super::ue_validate;return 1
end event

type st_1 from statictext within u_step_2
integer x = 457
integer y = 348
integer width = 1248
integer height = 748
integer textsize = -36
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Step 2"
alignment alignment = center!
boolean focusrectangle = false
end type

