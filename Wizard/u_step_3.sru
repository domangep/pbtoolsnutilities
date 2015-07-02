HA$PBExportHeader$u_step_3.sru
forward
global type u_step_3 from u_step_2
end type
end forward

global type u_step_3 from u_step_2
end type
global u_step_3 u_step_3

on u_step_3.create
call super::create
end on

on u_step_3.destroy
call super::destroy
end on

type st_1 from u_step_2`st_1 within u_step_3
string text = "Step 3"
end type

