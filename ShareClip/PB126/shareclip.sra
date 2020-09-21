HA$PBExportHeader$shareclip.sra
$PBExportComments$PowerScript Clip Share Powerbuilder Application Object
forward
global type shareclip from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type shareclip from application
string appname = "shareclip"
end type
global shareclip shareclip

on shareclip.create
appname="shareclip"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on shareclip.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_shareclip)
end event

