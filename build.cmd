/**/
parse arg mode
select
   when mode = 'clean' then p = '-c clean'
   when mode = '' then p = '-c DEBUGLEVEL=2 USETCPIP40=1 staticlibs'
   when mode = 'ibmcxxo' then p = '-c DEBUGLEVEL=2 USEIBMCXXO=1 USETCPIP40=1 staticlibs'
   when mode = 'tcpip40' then p = '-c DEBUGLEVEL=2 USETCPIP40=1 dynamiclibs'
   when mode = 'tcpip41' then p = '-c DEBUGLEVEL=2 dynamiclibs'
otherwise
exit 8
end  /* select */
'nmake' p
