HA$PBExportHeader$w_wizard.srw
forward
global type w_wizard from window
end type
type p_1 from picture within w_wizard
end type
type cb_previous from commandbutton within w_wizard
end type
type cb_next from commandbutton within w_wizard
end type
type cb_cancel from commandbutton within w_wizard
end type
type r_1 from rectangle within w_wizard
end type
type cb_finish from commandbutton within w_wizard
end type
end forward

global type w_wizard from window
integer width = 2633
integer height = 1980
boolean titlebar = true
string title = "Wizard"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_initialize ( )
event ue_nextstep ( )
event ue_previousstep ( )
event ue_showstep ( integer ai_index )
event ue_finish ( )
event ue_cancel ( )
p_1 p_1
cb_previous cb_previous
cb_next cb_next
cb_cancel cb_cancel
r_1 r_1
cb_finish cb_finish
end type
global w_wizard w_wizard

type variables
Protected:
integer				ii_CurrentStep
integer				ii_LastStep
u_wizard_step		iu_step[]

end variables

forward prototypes
public function integer of_addstep (string as_step_classname)
public subroutine of_manage_buttons ()
end prototypes

event ue_nextstep();if ii_currentstep > 0 then
	if iu_step[ii_currentstep].event ue_validate() <> 1 then return
end if

ii_currentstep ++
if ii_currentstep > ii_laststep then
	ii_currentstep = ii_laststep
end if

this.event ue_showstep( ii_currentstep )



end event

event ue_previousstep();ii_currentstep --
if ii_currentstep < 1 then
	ii_currentstep = 1
end if

this.event ue_showstep( ii_currentstep )

end event

event ue_showstep(integer ai_index);if ai_index < 1 or ai_index > ii_laststep then return

of_manage_buttons( )

iu_step[ai_index].event ue_initialize()

iu_step[ai_index].setposition(totop!)
iu_step[ai_index].visible = true

iu_step[ai_index].event ue_setfocus()


end event

public function integer of_addstep (string as_step_classname);if isnull( as_step_classname ) or len(trim( as_step_classname )) = 0 then return -1

ii_laststep++

this.openuserobject( iu_step[ii_LastStep], as_step_classname, r_1.x, r_1.y )
iu_step[ii_laststep].visible = false

return 1
end function

public subroutine of_manage_buttons ();cb_previous.enabled = (ii_currentstep > 1)
cb_next.enabled = (ii_currentstep < ii_laststep )
cb_finish.enabled = (ii_currentstep = ii_laststep )

end subroutine

on w_wizard.create
this.p_1=create p_1
this.cb_previous=create cb_previous
this.cb_next=create cb_next
this.cb_cancel=create cb_cancel
this.r_1=create r_1
this.cb_finish=create cb_finish
this.Control[]={this.p_1,&
this.cb_previous,&
this.cb_next,&
this.cb_cancel,&
this.r_1,&
this.cb_finish}
end on

on w_wizard.destroy
destroy(this.p_1)
destroy(this.cb_previous)
destroy(this.cb_next)
destroy(this.cb_cancel)
destroy(this.r_1)
destroy(this.cb_finish)
end on

event open;this.event ue_initialize()
end event

type p_1 from picture within w_wizard
integer x = 1093
integer y = 596
integer width = 457
integer height = 400
boolean originalsize = true
string picturename = "D:\Users\patrice\Documents\TFS\PowerBuilderToolsandUtilities\Wizard\loading.gif"
boolean focusrectangle = false
end type

type cb_previous from commandbutton within w_wizard
integer x = 626
integer y = 1744
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Previous"
end type

event clicked;parent.event ue_previousstep()
end event

type cb_next from commandbutton within w_wizard
integer x = 1074
integer y = 1744
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Next"
end type

event clicked;parent.event ue_nextstep()
end event

type cb_cancel from commandbutton within w_wizard
integer x = 2171
integer y = 1744
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;parent.event ue_cancel()
end event

type r_1 from rectangle within w_wizard
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 67108864
integer x = 27
integer y = 32
integer width = 2546
integer height = 1696
end type

type cb_finish from commandbutton within w_wizard
event ue_cancel ( )
integer x = 1522
integer y = 1744
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Finish"
end type

event clicked;parent.event ue_finish()
end event

