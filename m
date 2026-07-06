Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B5430CFE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330015; cv=none; b=Tc2/h/Qj2eVGat00JYJ2Daiwfen+Jv3eZWNW+EJfHFJvbzh7rE7FSR9NqgpZUFAeoikvngxG7kTa9w/9RNbAX2rOz36/+QUtROMQzFa2ErOLIpCiErWwIdt2h6yCnaRk0F4yXD3REnDlcEsBUpSRNSN197HRX4raY79Medj9PLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330015; c=relaxed/simple;
	bh=dDrV41kTFJAAlz/Bj9+hhVXxWHrkLmsF2+AoA2e0YEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p3gGq0bu5iLBecJFKgzoO9s7AXH4ULwKSZilMDVNdWksYImWYMEK0tAxQ6AUARYEOjtJwR/1FfiDrOgikEzGqP63NONoihE5qSXw3M1UogH+SIWRTAoDWxGz8eCHqQhSsei20zQC1OmYHY7VE1kLn0VORs3PkjpdE2//KM6fjXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iU61ZDBK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iU61ZDBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783330012; x=1814866012;
  h=date:from:to:cc:subject:message-id;
  bh=dDrV41kTFJAAlz/Bj9+hhVXxWHrkLmsF2+AoA2e0YEc=;
  b=iU61ZDBKzqUen0yQ67YHpv8jpHQd8OHOHfax+XVkNeu69bmb3SmAai0s
   /upVTetRDCPpYFNDFHvwkqFtc9uTBqdVeClvNgo7pONwo1UzljXGDznGf
   y5q9dT1riLCVLvgOaAXKP3K+kZztnTa1543PspDbkk6Ldw/YKJd39Yc64
   AwHjEGAkfU0SSEIUCJYflDL6QnQkbNxr+OzZHBxHKQi52pXjEmHQ68A2b
   X2Jv5UDwmzXowZpouhA3FOFxVbRp77GyFDEe/l69o/DUez3BjX5QIXuL8
   6159MEPZrZWeTVT0LlJHLPfOTb4sHnwfPZkYugdbNHZsTYHHK18bl+Duv
   A==;
X-CSE-ConnectionGUID: jcRjbWcdToKBppgjZE1+3A==
X-CSE-MsgGUID: qeUFG9FcQB6/GTjbKBnqmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="82939003"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="82939003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:26:46 -0700
X-CSE-ConnectionGUID: 99cfzy+URcqOW0JfrL/AiA==
X-CSE-MsgGUID: /oaFH0EaTESbH1bz6JxauQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257995376"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Jul 2026 02:26:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgfb7-00000000EEh-3vB7;
	Mon, 06 Jul 2026 09:26:41 +0000
Date: Mon, 06 Jul 2026 17:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [devsec-tsm:devsec-phase2 17/24]
 include/uapi/linux/const.h:20:25: warning: conversion from 'long long
 unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from
 '4294967296' to '0'
Message-ID: <202607061727.kioVZ9AG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm devsec-phase2
head:   fca18645f5a7726a7d2723322a520ecff3e72b45
commit: fd618410a970bc2a623b6644a124eee76535a92d [17/24] samples/devsec: Introduce a PCI device-security bus + endpoint sample
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260706/202607061727.kioVZ9AG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061727.kioVZ9AG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061727.kioVZ9AG-lkp@intel.com/

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

9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02   6  
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02   7  /* Some constant macros are used in both assembler and
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02   8   * C code.  Therefore we cannot annotate them always with
6df95fd7ad9a842 include/linux/const.h      Randy Dunlap        2007-05-08   9   * 'UL' and other type specifiers unilaterally.  We
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  10   * use the following macros to deal with this.
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  11   *
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  12   * Similarly, _AT() will cast an expression with a type in C, but
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  13   * leave it unchanged in asm.
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  14   */
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  15  
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  16  #ifdef __ASSEMBLY__
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  17  #define _AC(X,Y)	X
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  18  #define _AT(T,X)	X
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  19  #else
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @20  #define __AC(X,Y)	(X##Y)
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  21  #define _AC(X,Y)	__AC(X,Y)
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  22  #define _AT(T,X)	((T)(X))
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  23  #endif
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  24  

:::::: The code at line 20 was first introduced by commit
:::::: 9d291e787b2b71d1b57e5fbb24ba9c70e748ed84 [PATCH] x86-64: Assembly safe page.h and pgtable.h

:::::: TO: Vivek Goyal <vgoyal@in.ibm.com>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
