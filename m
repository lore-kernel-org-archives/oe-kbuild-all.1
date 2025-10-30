Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5B24BBEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761840163; cv=none; b=CDOdB4k+0ICGrUkwH79IkG651wV2GUYayE2CaphLum9O1toXlA/7QdTXfD1mOolNcF7aTKfUpCGSbhu3zIQbwTtyXdrFfl7klpoLOK2hbjC4qLEMNpSc585Fx9emPrLsiuu9e8ZY9gmQAEgXBELuBPIkgY27IIaMdnpfQJ0D5qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761840163; c=relaxed/simple;
	bh=MBTV9z3wysey+CNwJJQOkTMoA2NpaR7fEVVeOkB93q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OowSiYCTl/LYYwDDZ0U4wd73oagzfsWvz2utnRthrPsL+NxaCOT7+yHqoT2B/5HsSKF+0uSTlrNW5w/uneJIvjHaheJ4aqaISlta48Q5cWcK+9NfC3Oj2ojDPkrlKbbv1ludRzAdTeHygwEDOmnkL9N4GsHhRB5lMIbgJdjLf/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mb1LhIIt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mb1LhIIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761840162; x=1793376162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBTV9z3wysey+CNwJJQOkTMoA2NpaR7fEVVeOkB93q4=;
  b=Mb1LhIItQxZNayIJUnYuuQFf6acKJ4+lD6G8B3zln0aKYOq7ArmtA9Cp
   JmXPqPIB5Jh5HWf17jSIuWKlnmdS6d0Nlfs/9oArbfKWeK/RLhPu/S73A
   d4Qzu3F4xR8IqW4OtPK4NdHxgk6BgbtEgHaith3Kg65FDkv23OurBVF4a
   7cyI5RJsS8d2UX40MSN1+UcgTOxMhdM4cuSkFj4oC5uTV9wB3oXOmOGQA
   2JcTg4wVcqePCld6BcC/4uAT9meWcztn7Fao8FDbbzORfSNai6us8kXmx
   3Oqaz98dwQHEuEfW4f7h6/79ZqLzzhhvWN+x16Qpxo2KFqyXkkUZc4eaa
   Q==;
X-CSE-ConnectionGUID: ju9ztOSQRbeDCVZ4Nk3XxA==
X-CSE-MsgGUID: QGLVQxECTveY+aq0RkRfxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63873628"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63873628"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 09:02:41 -0700
X-CSE-ConnectionGUID: hhxULVvvRZestE2mKeUXXw==
X-CSE-MsgGUID: RXOKBadyQhS90bSr+5/tzg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2025 09:02:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEV6j-000MBT-2P;
	Thu, 30 Oct 2025 16:02:37 +0000
Date: Fri, 31 Oct 2025 00:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:must-be-lval 40/57] include/linux/compiler.h:209:50: error:
 lvalue required as unary '&' operand
Message-ID: <202510310012.cjBykotw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git must-be-lval
head:   ddd6ff4d1945e2040067848741c3e94855fd43c7
commit: 62248f5a605c51779775d5669569b1cc152b2750 [40/57] acpi/**/acenv.h: Use __lvalue() in ACPI_ACQUIRE_GLOBAL_LOCK - RFC
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251031/202510310012.cjBykotw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310012.cjBykotw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310012.cjBykotw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ioport.h:15,
                    from include/linux/acpi.h:12,
                    from lib/test_lvalue.c:5:
   lib/test_lvalue.c: In function 'test_lvalue_macros':
   include/linux/minmax.h:308:41: error: lvalue required as left operand of assignment
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                         ^
   lib/test_lvalue.c:13:9: note: in expansion of macro 'swap'
      13 |         swap(1, 2);
         |         ^~~~
   include/linux/minmax.h:308:52: error: lvalue required as left operand of assignment
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                    ^
   lib/test_lvalue.c:13:9: note: in expansion of macro 'swap'
      13 |         swap(1, 2);
         |         ^~~~
   In file included from include/linux/uidgid.h:16,
                    from include/linux/kernfs.h:18,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:14:
   include/linux/highuid.h:70:38: error: lvalue required as left operand of assignment
      70 | #define SET_UID(var, uid) do { (var) = __convert_uid(sizeof(__lvalue(var)), (uid)); } while (0)
         |                                      ^
   lib/test_lvalue.c:14:9: note: in expansion of macro 'SET_UID'
      14 |         SET_UID(1, 1);
         |         ^~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/ioport.h:13:
>> include/linux/compiler.h:209:50: error: lvalue required as unary '&' operand
     209 | #define __is_lval(a)            (!__same_type(0, &(a)))
         |                                                  ^
   include/linux/compiler.h:197:84: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                    ^
   include/linux/compiler.h:209:35: note: in expansion of macro '__same_type'
     209 | #define __is_lval(a)            (!__same_type(0, &(a)))
         |                                   ^~~~~~~~~~~
   include/linux/compiler.h:210:58: note: in expansion of macro '__is_lval'
     210 | #define __must_be_lval(a)       __BUILD_BUG_ON_ZERO_MSG(!__is_lval(a),  \
         |                                                          ^~~~~~~~~
   include/linux/compiler.h:213:42: note: in expansion of macro '__must_be_lval'
     213 | #define __lvalue(x)             ({ (void)__must_be_lval(x); x; })
         |                                          ^~~~~~~~~~~~~~
   include/acpi/platform/acenv.h:248:51: note: in expansion of macro '__lvalue'
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) __lvalue(acquired) = 1
         |                                                   ^~~~~~~~
   lib/test_lvalue.c:15:9: note: in expansion of macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
      15 |         ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:197:82: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:210:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     210 | #define __must_be_lval(a)       __BUILD_BUG_ON_ZERO_MSG(!__is_lval(a),  \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:213:42: note: in expansion of macro '__must_be_lval'
     213 | #define __lvalue(x)             ({ (void)__must_be_lval(x); x; })
         |                                          ^~~~~~~~~~~~~~
   include/acpi/platform/acenv.h:248:51: note: in expansion of macro '__lvalue'
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) __lvalue(acquired) = 1
         |                                                   ^~~~~~~~
   lib/test_lvalue.c:15:9: note: in expansion of macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
      15 |         ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/acpi/acpi.h:22,
                    from include/linux/acpi.h:26:
   include/acpi/platform/acenv.h:248:70: error: lvalue required as left operand of assignment
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) __lvalue(acquired) = 1
         |                                                                      ^
   lib/test_lvalue.c:15:9: note: in expansion of macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
      15 |         ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_lvalue.c:8:
   lib/test_lvalue.c:16:26: error: passing argument 3 of 'pci_get_device' makes pointer from integer without a cast [-Wint-conversion]
      16 |         for_each_pci_dev(1);
         |                          ^
         |                          |
         |                          int
   include/linux/pci.h:576:80: note: in definition of macro 'for_each_pci_dev'
     576 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                                                                ^
   include/linux/pci.h:1236:48: note: expected 'struct pci_dev *' but argument is of type 'int'
    1236 |                                struct pci_dev *from);
         |                                ~~~~~~~~~~~~~~~~^~~~
   include/linux/pci.h:576:39: error: lvalue required as left operand of assignment
     576 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                       ^
   lib/test_lvalue.c:16:9: note: in expansion of macro 'for_each_pci_dev'
      16 |         for_each_pci_dev(1);
         |         ^~~~~~~~~~~~~~~~


vim +209 include/linux/compiler.h

cb7380de9e4cbc Kees Cook  2025-02-05  199  
cb7380de9e4cbc Kees Cook  2025-02-05  200  /* &a[0] degrades to a pointer: a different type from an array */
20e5cc26e56db0 Kees Cook  2025-02-05  201  #define __is_array(a)		(!__same_type((a), &(a)[0]))
20e5cc26e56db0 Kees Cook  2025-02-05  202  #define __must_be_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
20e5cc26e56db0 Kees Cook  2025-02-05  203  							"must be array")
20e5cc26e56db0 Kees Cook  2025-02-05  204  
20e5cc26e56db0 Kees Cook  2025-02-05  205  #define __is_byte_array(a)	(__is_array(a) && sizeof((a)[0]) == 1)
20e5cc26e56db0 Kees Cook  2025-02-05  206  #define __must_be_byte_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_byte_array(a), \
20e5cc26e56db0 Kees Cook  2025-02-05  207  							"must be byte array")
cb7380de9e4cbc Kees Cook  2025-02-05  208  
5de8c269d6d370 Jim Cromie 2025-10-27 @209  #define __is_lval(a)		(!__same_type(0, &(a)))
5de8c269d6d370 Jim Cromie 2025-10-27  210  #define __must_be_lval(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_lval(a),	\
5de8c269d6d370 Jim Cromie 2025-10-27  211  							"must be lvalue")
5de8c269d6d370 Jim Cromie 2025-10-27  212  

:::::: The code at line 209 was first introduced by commit
:::::: 5de8c269d6d3703dacb21f9fba9d7f2c7a32b38c compiler.h: Add __is_lval(), __must_be_lval(), and __lvalue()

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
