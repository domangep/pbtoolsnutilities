HA$PBExportHeader$u_step_1.sru
forward
global type u_step_1 from u_wizard_step
end type
type mle_2 from multilineedit within u_step_1
end type
type mle_1 from multilineedit within u_step_1
end type
end forward

global type u_step_1 from u_wizard_step
mle_2 mle_2
mle_1 mle_1
end type
global u_step_1 u_step_1

on u_step_1.create
int iCurrent
call super::create
this.mle_2=create mle_2
this.mle_1=create mle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_2
this.Control[iCurrent+2]=this.mle_1
end on

on u_step_1.destroy
call super::destroy
destroy(this.mle_2)
destroy(this.mle_1)
end on

event ue_validate;call super::ue_validate;return 1
end event

type mle_2 from multilineedit within u_step_1
integer x = 18
integer y = 180
integer width = 2501
integer height = 1492
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "This is a sample of Wizard~'s welcome page.thhis kind of step is usually used to describe the functionnality or the goal of the wizard."
boolean border = false
boolean displayonly = true
end type

type mle_1 from multilineedit within u_step_1
integer width = 2551
integer height = 160
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Welcome to the Wizard"
boolean border = false
alignment alignment = center!
boolean displayonly = true
end type

