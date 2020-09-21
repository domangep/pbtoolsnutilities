HA$PBExportHeader$wizard.sra
$PBExportComments$Generated Application Object
forward
global type wizard from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type wizard from application
string appname = "wizard"
end type
global wizard wizard

on wizard.create
appname="wizard"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on wizard.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_wizard_test )
end event

