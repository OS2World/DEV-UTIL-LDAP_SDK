!IFNDEF DEBUGLEVEL
DEBUGLEVEL=3
!ENDIF
!IFNDEF IBMCXXO
IBMCXXO=D:\IBMCXXO
!ENDIF
!IFDEF USEIBMCXXO
LIBLOC=.\lib\ibmc36
OBJLOC=.\obj\ibmc36
!ELSE
LIBLOC=.\lib\ibmc30
OBJLOC=.\obj\ibmc30
!ENDIF
!IFNDEF NODEBUG
DEBUGOPT=-Ti
!ENDIF
!IFDEF USETCPIP40
LIBS=TCP32DLL.LIB SO32DLL.LIB
TCPIPOPT=-DTCPV40HDRS
TCPLOC=tcp40
!ELSE
LIBS=TCPIP32.LIB
TCPIPOPT=
TCPLOC=tcp41
!ENDIF
DLLLOC=.\dll

CFLAGS=-Gmd- -Q -Ss -I.\h -I.\include -W$(DEBUGLEVEL) $(DEBUGOPT) $(TCPIPOPT)
CC=icc

.SUFFIXES: .c .obj .lib

{.\libraries\libldap}.c{$(OBJLOC)\libldap}.obj:
   @$(MAKE) -c SRC_FILE=$< OBJ_FILE=$@ PART_DIR=libldap cc

{.\libraries\libldap}.c{$(OBJLOC)\ldapdll\$(TCPLOC)}.obj:
   @$(MAKE) -c SRC_FILE=$< OBJ_FILE=$@ PART_DIR=libldap DLL=1 cc

{.\libraries\liblber}.c{$(OBJLOC)\liblber}.obj:
   @$(MAKE) -c SRC_FILE=$< OBJ_FILE=$@ PART_DIR=liblber cc

{.\libraries\liblber}.c{$(OBJLOC)\lberdll\$(TCPLOC)}.obj:
   @$(MAKE) -c SRC_FILE=$< OBJ_FILE=$@ PART_DIR=liblber DLL=1 cc

{.\libraries\libldif}.c{$(OBJLOC)\libldif}.obj:
   @$(MAKE) -c SRC_FILE=$< OBJ_FILE=$@ PART_DIR=libldif cc
   
{.\libraries\libldif}.c{$(OBJLOC)\ldifdll\$(TCPLOC)}.obj:
   @$(MAKE) -c SRC_FILE=$< OBJ_FILE=$@ PART_DIR=libldif DLL=1 cc

{lib\ibmc30}.lib{lib}.lib:
   copy $< lib

{dll}.lib{lib}.lib:
   copy $< lib

LIBLDIFOBJS=\
$(OBJLOC)\libldif\line64.obj \
$(OBJLOC)\libldif\fetch.obj

LIBLBEROBJS=\
$(OBJLOC)\liblber\assert.obj \
$(OBJLOC)\liblber\bprint.obj \
$(OBJLOC)\liblber\decode.obj \
$(OBJLOC)\liblber\encode.obj \
$(OBJLOC)\liblber\io.obj \
$(OBJLOC)\liblber\memory.obj \
$(OBJLOC)\liblber\options.obj \
$(OBJLOC)\liblber\sockbuf.obj

LIBLDAPOBJS=\
$(OBJLOC)\libldap\abandon.obj \
$(OBJLOC)\libldap\add.obj \
$(OBJLOC)\libldap\addentry.obj \
$(OBJLOC)\libldap\bind.obj \
$(OBJLOC)\libldap\cache.obj \
$(OBJLOC)\libldap\charray.obj \
$(OBJLOC)\libldap\compare.obj \
$(OBJLOC)\libldap\controls.obj \
$(OBJLOC)\libldap\cyrus.obj \
$(OBJLOC)\libldap\delete.obj \
$(OBJLOC)\libldap\disptmpl.obj \
$(OBJLOC)\libldap\dn.obj \
$(OBJLOC)\libldap\dnssrv.obj \
$(OBJLOC)\libldap\dsparse.obj \
$(OBJLOC)\libldap\error.obj \
$(OBJLOC)\libldap\extended.obj \
$(OBJLOC)\libldap\free.obj \
$(OBJLOC)\libldap\friendly.obj \
$(OBJLOC)\libldap\getattr.obj \
$(OBJLOC)\libldap\getdn.obj \
$(OBJLOC)\libldap\getentry.obj \
$(OBJLOC)\libldap\getfilter.obj \
$(OBJLOC)\libldap\getvalues.obj \
$(OBJLOC)\libldap\init.obj \
$(OBJLOC)\libldap\kbind.obj \
$(OBJLOC)\libldap\messages.obj \
$(OBJLOC)\libldap\modify.obj \
$(OBJLOC)\libldap\modrdn.obj \
$(OBJLOC)\libldap\open.obj \
$(OBJLOC)\libldap\options.obj \
$(OBJLOC)\libldap\os-ip.obj \
$(OBJLOC)\libldap\os-local.obj \
$(OBJLOC)\libldap\print.obj \
$(OBJLOC)\libldap\references.obj \
$(OBJLOC)\libldap\request.obj \
$(OBJLOC)\libldap\result.obj \
$(OBJLOC)\libldap\sasl.obj \
$(OBJLOC)\libldap\sbind.obj \
$(OBJLOC)\libldap\schema.obj \
$(OBJLOC)\libldap\search.obj \
$(OBJLOC)\libldap\sort.obj \
$(OBJLOC)\libldap\sortctrl.obj \
$(OBJLOC)\libldap\srchpref.obj \
$(OBJLOC)\libldap\string.obj \
$(OBJLOC)\libldap\tls.obj \
$(OBJLOC)\libldap\tmplout.obj \
$(OBJLOC)\libldap\unbind.obj \
$(OBJLOC)\libldap\url.obj \
$(OBJLOC)\libldap\utf-8.obj \
$(OBJLOC)\libldap\util-int.obj \
$(OBJLOC)\libldap\vlvctrl.obj

LDIFDLLOBJS=\
$(OBJLOC)\ldifdll\$(TCPLOC)\line64.obj \
$(OBJLOC)\ldifdll\$(TCPLOC)\fetch.obj

LBERDLLOBJS=\
$(OBJLOC)\lberdll\$(TCPLOC)\assert.obj \
$(OBJLOC)\lberdll\$(TCPLOC)\bprint.obj \
$(OBJLOC)\lberdll\$(TCPLOC)\decode.obj \
$(OBJLOC)\lberdll\$(TCPLOC)\encode.obj \
$(OBJLOC)\lberdll\$(TCPLOC)\io.obj \
$(OBJLOC)\lberdll\$(TCPLOC)\memory.obj \
$(OBJLOC)\lberdll\$(TCPLOC)\options.obj \
$(OBJLOC)\lberdll\$(TCPLOC)\sockbuf.obj

LDAPDLLOBJS=\
$(OBJLOC)\ldapdll\$(TCPLOC)\abandon.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\add.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\addentry.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\bind.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\cache.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\charray.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\compare.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\controls.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\cyrus.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\delete.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\disptmpl.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\dn.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\dnssrv.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\dsparse.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\error.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\extended.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\free.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\friendly.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\getattr.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\getdn.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\getentry.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\getfilter.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\getvalues.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\init.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\kbind.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\messages.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\modify.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\modrdn.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\open.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\options.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\os-ip.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\os-local.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\print.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\references.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\request.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\result.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\sasl.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\sbind.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\schema.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\search.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\sort.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\sortctrl.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\srchpref.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\string.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\tls.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\tmplout.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\unbind.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\url.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\utf-8.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\util-int.obj \
$(OBJLOC)\ldapdll\$(TCPLOC)\vlvctrl.obj

PKGFILES=\
lib\libldap.lib \
lib\liblber.lib \
lib\libldif.lib \
dll\ldapdll.dll \
dll\ldapdll41.dll \
makefile \
build.cmd \
ldapdll.def \
ldapdll41.def \
lib\ldapdll.lib \
lib\ldapdll41.lib \
ldapsdk.txt

all: dirs staticlibs dynamiclibs

staticlibs: dirs $(LIBLOC)\libldap.lib $(LIBLOC)\liblber.lib $(LIBLOC)\libldif.lib

!IFDEF USETCPIP40
dynamiclibs: dirs $(DLLLOC)\ldapdll.dll
!ELSE
dynamiclibs: dirs $(DLLLOC)\ldapdll41.dll
!ENDIF

dirs:
   @if not exist .\dll mkdir .\dll
   @if not exist $(DLLLOC) mkdir $(DLLLOC)
   @if not exist .\lib mkdir .\lib
   @if not exist $(LIBLOC) mkdir $(LIBLOC)
   @if not exist .\obj mkdir .\obj
   @if not exist $(OBJLOC) mkdir $(OBJLOC)
   @if not exist $(OBJLOC)\libldap mkdir $(OBJLOC)\libldap
   @if not exist $(OBJLOC)\liblber mkdir $(OBJLOC)\liblber
   @if not exist $(OBJLOC)\libldif mkdir $(OBJLOC)\libldif
   @if not exist $(OBJLOC)\ldapdll mkdir $(OBJLOC)\ldapdll
   @if not exist $(OBJLOC)\ldapdll\tcp40 mkdir $(OBJLOC)\ldapdll\tcp40
   @if not exist $(OBJLOC)\ldapdll\tcp41 mkdir $(OBJLOC)\ldapdll\tcp41
   @if not exist $(OBJLOC)\ldifdll mkdir $(OBJLOC)\ldifdll
   @if not exist $(OBJLOC)\ldifdll\tcp40 mkdir $(OBJLOC)\ldifdll\tcp40
   @if not exist $(OBJLOC)\ldifdll\tcp41 mkdir $(OBJLOC)\ldifdll\tcp41
   @if not exist $(OBJLOC)\lberdll mkdir $(OBJLOC)\lberdll
   @if not exist $(OBJLOC)\lberdll\tcp40 mkdir $(OBJLOC)\lberdll\tcp40
   @if not exist $(OBJLOC)\lberdll\tcp41 mkdir $(OBJLOC)\lberdll\tcp41
   @set USEIBMCXXO=$(USEIBMCXXO)

$(OBJLOC)\libldap\os-ip.obj: .\src\os-ip.c
   @$(MAKE) -c SRC_FILE=$** OBJ_FILE=$@ PART_DIR=libldap cc

$(OBJLOC)\ldapdll\$(TCPLOC)\os-ip.obj: .\src\os-ip.c
   @$(MAKE) -c SRC_FILE=$** OBJ_FILE=$@ PART_DIR=libldap DLL=1 cc

$(OBJLOC)\libldap\tls.obj: .\src\tls.c
   @$(MAKE) -c SRC_FILE=$** OBJ_FILE=$@ PART_DIR=libldap cc

$(OBJLOC)\ldapdll\$(TCPLOC)\tls.obj: .\src\tls.c
   @$(MAKE) -c SRC_FILE=$** OBJ_FILE=$@ PART_DIR=libldap DLL=1 cc

$(OBJLOC)\libldap\util-int.obj: .\src\util-int.c
   @$(MAKE) -c SRC_FILE=$** OBJ_FILE=$@ PART_DIR=libldap cc

$(OBJLOC)\ldapdll\$(TCPLOC)\util-int.obj: .\src\util-int.c
   @$(MAKE) -c SRC_FILE=$** OBJ_FILE=$@ PART_DIR=libldap DLL=1 cc

$(OBJLOC)\liblber\sockbuf.obj: .\src\sockbuf.c
   @$(MAKE) -c SRC_FILE=$** OBJ_FILE=$@ PART_DIR=liblber cc

$(OBJLOC)\lberdll\$(TCPLOC)\sockbuf.obj: .\src\sockbuf.c
   @$(MAKE) -c SRC_FILE=$** OBJ_FILE=$@ PART_DIR=liblber cc

$(LIBLOC)\libldap.lib: $(LIBLDAPOBJS)
!IFDEF USEIBMCXXO
   @call $(IBMCXXO)\BIN\SETENV
!ENDIF
   !ilib /Q /NOBACKUP $@ -+ "$?";
   ilib /Q /LISTLEVEL:3 $@, $*.lst;
   
$(LIBLOC)\liblber.lib: $(LIBLBEROBJS) 
!IFDEF USEIBMCXXO
   @call $(IBMCXXO)\BIN\SETENV
!ENDIF
   !ilib /Q /NOBACKUP $@ -+ "$?";
   ilib /Q /LISTLEVEL:3 $@, $*.lst;
 
$(LIBLOC)\libldif.lib: $(LIBLDIFOBJS) 
!IFDEF USEIBMCXXO
   @call $(IBMCXXO)\BIN\SETENV
!ENDIF
   !ilib /Q /NOBACKUP $@ -+ "$?";
   ilib /Q /LISTLEVEL:3 $@, $*.lst;
 
!IFDEF USETCPIP40
$(DLLLOC)\ldapdll.dll: $(LDAPDLLOBJS) $(LIBLOC)\liblber.lib $(LIBLOC)\libldif.lib
!ELSE
$(DLLLOC)\ldapdll41.dll: $(LDAPDLLOBJS) $(LBERDLLOBJS) $(LDIFDLLOBJS)
!ENDIF
   @set icc=
!IFDEF USEIBMCXXO
   @call $(IBMCXXO)\BIN\SETENV
!ENDIF
   $(CC) @<<
$(CFLAGS) -Fe$@ -Fm$*.map $(@B).def $(LIBS)
$** /B"/EXEPACK:2"
<<
   implib /NOLOGO $*.lib $(@B).def

clean:
   @-call <<ttttzzzz.cmd
/**/   
if RxFuncQuery('SYSLOADFUNCS') then do
   call RxFuncAdd 'SYSLOADFUNCS', 'REXXUTIL', 'SYSLOADFUNCS'
   call SysLoadFuncs
end /* do */
'@for %%F in (*.bak) do @erase %%F'
'@for %%F in (*.exe) do @erase %%F'
'@for %%F in (*.map) do @erase %%F'
'@for %%F in (*.obj) do @erase %%F'
'@for %%F in (*.tmp) do @erase %%F'
call rm '.\obj'
call rm '.\dll'
call rm '.\lib'
exit

rm: procedure
parse arg a
call SysFileTree a || '\*', 'f.', 'fso'
do i = 1 to f.0
   call SysFileDelete f.i
end /* do */
do forever
   call SysFileTree a || '\*', 'd.', 'dso'
   if d.0 = 0 then leave
   do i = 1 to d.0
      call SysRmDir d.i
   end /* do */
   call SysRmDir a
end /* do */
return
<<

pkg: ldapsdk.zip

ldapsdk.zip: $(PKGFILES)
   @if exist $@ erase $@
   zip -9 $@ $**
   zip -r9 $@ .\h
   zip -r9 $@ .\src
   zip -r9 $@ .\doc
   zip -r9 $@ .\include
   zip -r9 $@ .\libraries

cc:
   @set icc=
!IFDEF USEIBMCXXO
   @call $(IBMCXXO)\BIN\SETENV
!ENDIF
!IFDEF DLL
   $(CC) -C $(CFLAGS) -Ge- -I.\libraries\$(PART_DIR) -Fo$(OBJ_FILE) -Fl$(OBJ_FILE:.lst=.obj) $(SRC_FILE)
!ELSE
   $(CC) -C $(CFLAGS) -I.\libraries\$(PART_DIR) -Fo$(OBJ_FILE) -Fl$(OBJ_FILE:.obj=.lst) $(SRC_FILE)
!ENDIF   
