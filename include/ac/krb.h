/* Generic krb.h */
/* $OpenLDAP: pkg/ldap/include/ac/krb.h,v 1.5.8.3 2001/05/30 05:10:45 kurt Exp $ */
/*
 * Copyright 1998-2001 The OpenLDAP Foundation, Redwood City, California, USA
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted only as authorized by the OpenLDAP
 * Public License.  A copy of this license is available at
 * http://www.OpenLDAP.org/license.html or in file LICENSE in the
 * top-level directory of the distribution.
 */

/* Kerberos IV */

#ifndef _AC_KRB_H
#define _AC_KRB_H

#if defined( HAVE_KRB4 )

#if defined( HAVE_KERBEROSIV_KRB_H )
#include <kerberosIV/krb.h>
#elif defined( HAVE_KRB_H )
#include <krb.h>
#endif

#if defined( HAVE_KERBEROSIV_DES_H )
#include <kerberosIV/des.h>
#elif defined( HAVE_DES_H )
#include <des.h>
#endif

#endif /* HAVE_KRB4 */
#endif /* _AC_KRB_H */
