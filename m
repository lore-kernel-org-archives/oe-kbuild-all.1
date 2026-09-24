Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E8F47ECDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278817; cv=none; b=NwozAxYfrwTB7rpPyGP2lLLSwvq8KcAudy+ynS3Q50JbC4iwUgfLXvJumlkUWgfhF4v3T1bIOBFa9F2MBd8c1fEp5qCXDC7GO+XJtjSyjrrW3g3djkBb+x2SEXtDw3K4uNEI0Mg5t/+Y/iH66htVdH7ELZakIYmi5nqDyg5o8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278817; c=relaxed/simple;
	bh=JXy430elWLlAAqNbsez+Vf955WrJ6dfpCJSJAbfX2cc=;
	h=Date:From:Cc:Subject:Message-ID; b=rBJ6qDtzyfHxLO30uuPbh7MEg5WI7vePhPQ3zShtVfCq/k3n717VjE7xbRPYy7IbBMCEY19YY47G5LURmr3bRyDuMDp+Vj1wAfMtfSRAz2TOIg5OaeOJJU6N4qivSNNroktXsNTCaY5vx2qrb4qLo4vmjY7S0M/ptRL7WGVKe/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgLVKh/U; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgLVKh/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790278814; x=1821814814;
  h=date:from:cc:subject:message-id;
  bh=JXy430elWLlAAqNbsez+Vf955WrJ6dfpCJSJAbfX2cc=;
  b=cgLVKh/U0/JraNNuz4N+qe1X2mAp+m1t5egZdWc3estKBPMcmvdueHm9
   dPp6N+I4JnMgL639T97+DJ6YlXt6DIyYo4OppeSW77QZqHiLPL2dPoG6t
   cEMqLN8k5tOfENEELkHU0PxKQ3pvzY86OCQ2/fn8selkxssNd/kWU24II
   6vtoeyAgVilKOnqOzH0s5GZN326jYpABgd/vFqHP7Y5duOc1cXIDIAvjz
   wLbYQPRnrg/jC+S9EIF6ILB6q8qbKgMbVIWoeSu7U5rSgP5hbyKdSsDiu
   IoAB5ceq1NfPcdlT3v16SwQBURCFdWDZe3ycqUGFteCv5N3E8cXUzGUiQ
   Q==;
X-CSE-ConnectionGUID: /ggHATQ6Txee9ccKQbnHFg==
X-CSE-MsgGUID: xQNnT21OQjuYChrGiYkqNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89926496"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="89926496"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 12:40:12 -0700
X-CSE-ConnectionGUID: VAj6lvCaSiaC9wxFX7Fnng==
X-CSE-MsgGUID: B9lLp4u2QcKHd9MERa6/FQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Sep 2026 12:40:11 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9pIf-000000000PG-0r43;
	Thu, 24 Sep 2026 19:40:09 +0000
Date: Thu, 24 Sep 2026 21:39:27 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [intel-tdx:v7.3-rc4_tdx_connect_phase2.for_upstream 17/44]
 include/uapi/linux/const.h:20:25: warning: conversion from 'long long
 unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from
 '4294967296' to '0'
Message-ID: <202609242140.qZJIMn5F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git v7.3-rc4_tdx_connect_phase2.for_upstream
head:   69fd611d89afafa408b11f0e1304297433d3d471
commit: 8d401a08daff7db72c8affddf302b70aa2dcb8e7 [17/44] samples/devsec: Introduce a PCI device-security bus + endpoint sample
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260924/202609242140.qZJIMn5F-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609242140.qZJIMn5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609242140.qZJIMn5F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/vdso/bits.h:5,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/device/faux.h:17,
                    from samples/devsec/bus.c:6:
   samples/devsec/bus.c: In function 'devsec_add_host_bridge':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '4294967296' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   samples/devsec/bus.c:665:59: note: in expansion of macro 'SZ_4G'
     665 |                                MMIO_SIZE * NR_DEVICES, 0, SZ_4G, MMIO_SIZE,
         |                                                           ^~~~~
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '4294967296' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   samples/devsec/bus.c:679:60: note: in expansion of macro 'SZ_4G'
     679 |                                PREFETCH_SIZE * NR_DEVICES, SZ_4G, U64_MAX,
         |                                                            ^~~~~
   In file included from include/linux/overflow.h:6,
                    from include/linux/bits.h:32:
>> include/linux/limits.h:25:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      25 | #define U64_MAX         ((u64)~0ULL)
         |                         ^~~~~~~~~~~~
   samples/devsec/bus.c:679:67: note: in expansion of macro 'U64_MAX'
     679 |                                PREFETCH_SIZE * NR_DEVICES, SZ_4G, U64_MAX,
         |                                                                   ^~~~~~~
--
   In file included from include/vdso/const.h:5,
                    from include/vdso/bits.h:5,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/device/faux.h:17,
                    from bus.c:6:
   bus.c: In function 'devsec_add_host_bridge':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '4294967296' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   bus.c:665:59: note: in expansion of macro 'SZ_4G'
     665 |                                MMIO_SIZE * NR_DEVICES, 0, SZ_4G, MMIO_SIZE,
         |                                                           ^~~~~
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '4294967296' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   bus.c:679:60: note: in expansion of macro 'SZ_4G'
     679 |                                PREFETCH_SIZE * NR_DEVICES, SZ_4G, U64_MAX,
         |                                                            ^~~~~
   In file included from include/linux/overflow.h:6,
                    from include/linux/bits.h:32:
>> include/linux/limits.h:25:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      25 | #define U64_MAX         ((u64)~0ULL)
         |                         ^~~~~~~~~~~~
   bus.c:679:67: note: in expansion of macro 'U64_MAX'
     679 |                                PREFETCH_SIZE * NR_DEVICES, SZ_4G, U64_MAX,
         |                                                                   ^~~~~~~


vim +20 include/uapi/linux/const.h

9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   6  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   7  /* Some constant macros are used in both assembler and
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   8   * C code.  Therefore we cannot annotate them always with
6df95fd7ad9a84 include/linux/const.h      Randy Dunlap        2007-05-08   9   * 'UL' and other type specifiers unilaterally.  We
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  10   * use the following macros to deal with this.
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  11   *
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  12   * Similarly, _AT() will cast an expression with a type in C, but
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  13   * leave it unchanged in asm.
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  14   */
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  15  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  16  #ifdef __ASSEMBLY__
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  17  #define _AC(X,Y)	X
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  18  #define _AT(T,X)	X
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  19  #else
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @20  #define __AC(X,Y)	(X##Y)
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  21  #define _AC(X,Y)	__AC(X,Y)
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  22  #define _AT(T,X)	((T)(X))
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  23  #endif
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  24  

:::::: The code at line 20 was first introduced by commit
:::::: 9d291e787b2b71d1b57e5fbb24ba9c70e748ed84 [PATCH] x86-64: Assembly safe page.h and pgtable.h

:::::: TO: Vivek Goyal <vgoyal@in.ibm.com>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
