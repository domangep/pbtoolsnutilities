HA$PBExportHeader$u_wizard_step.sru
forward
global type u_wizard_step from userobject
end type
end forward

global type u_wizard_step from userobject
integer width = 2546
integer height = 1696
long backcolor = 67108864
string text = "none"
borderstyle borderstyle = stylelowered!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event type integer ue_validate ( )
event type string ue_summarize ( )
event ue_initialize ( )
event ue_setfocus ( )
end type
global u_wizard_step u_wizard_step

on u_wizard_step.create
end on

on u_wizard_step.destroy
end on

event constructor;//	Wizard - u_wizard_step
//	Copyright (C) 2015 dP Software
//	
//	This program is free software: you can redistribute it and/or modify
//	it under the terms of the GNU General Public License as published by
//	the Free Software Foundation, either version 3 of the License, or
//	(at your option) any later version.
//	
//	This program is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//	GNU General Public License for more details.
//	
//	You should have received a copy of the GNU General Public License
//	along with this program. If not, see <http://www.gnu.org/licenses/>
end event

