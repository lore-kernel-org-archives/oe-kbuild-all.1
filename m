Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C102B15539A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 01:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764378109; cv=none; b=bIR4J541a2kl6XnLiuqXmnel1prw1UGm9QXMhvyiUfALN8U3Dlj7wxGhIxXJX2d2UrQGIzdyS9TR2o8TItHFJ8ZnNwvl4gN4wKV+LSztxgA4B5qxqKoGNPWqK5zY812NxL+DPdM5W2AXBw7MECl8geqPJF5MguITnWADjkoeAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764378109; c=relaxed/simple;
	bh=yKPBrOQdI8/tYjq0qBt9Ci6zNq43AYfrFlGQaRH0V1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjW0PGFSa1ED/I48ouXmf2hXmqtfHC1zyhTcax2ePlObxyMw+cn+oCdy5lkTKReUv6gkOlcM1jFfa4ro/AqM389Mgqhd3paFMsA4dJi2W1J8U16X5EB0xxrqo2q0oFct2h6h+kulqPGTGNWN1xhmzLQIUIjeI6EQM9o1pGETso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnGDPy/P; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnGDPy/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764378107; x=1795914107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yKPBrOQdI8/tYjq0qBt9Ci6zNq43AYfrFlGQaRH0V1s=;
  b=AnGDPy/PMbR7QirKpILIzzVH4O/J/YkwD5XV+d6bj2z0/YDarPUcURPB
   ACvomkEMW63HWsuRHBbJAg2BgfUdcPKruMax+8VK4tfb7pKmpMMqGjCLw
   epB69gFOn66uJIHYX/afSiZJN9wPHTg0xbDxJYf3CNHJ7YotE3u6Wki6e
   QaQjqKVZAErQt7Q9YSMIsts+VhZ3pfeB0FlA/pjsA5iGWondRfNZhLLac
   fOJIQpnp0GPGurri7dbY6f9EHFXQzv2QJ9tXrJA1GNM5pBJStesAGKeW1
   /QrA8ngBtfeaZvHUA0Ob8YfNKiaVk2l3op8J0h2GiMwtxhQmGUnjlBY9p
   A==;
X-CSE-ConnectionGUID: +ZPGaMkSRbm8G2BhA0txVg==
X-CSE-MsgGUID: qVuExR2WTN2rhn1CL5eqHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66115324"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66115324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 17:01:45 -0800
X-CSE-ConnectionGUID: IRWCRJOCRzGUDZOlxmPM6Q==
X-CSE-MsgGUID: 7q/UX/9HQhmZNmtNukRntg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Nov 2025 17:01:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP9LI-000000006rh-1nkH;
	Sat, 29 Nov 2025 01:01:40 +0000
Date: Sat, 29 Nov 2025 09:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 46/46]
 include/uapi/linux/const.h:20:25: warning: conversion from 'long long
 unsigned int' to 'size_t' {aka 'unsigned int'} changes value from
 '34359738368' to '0'
Message-ID: <202511290848.Uqepzr98-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   b6f9c712b4dc25b00af4208e59b4ee8f344e0ab8
commit: a0a3f0a41c8789060f0ed28f79066d97bfc47a8b [46/46] UPSTREAM: drm/xe: Add a xe_bo subtest for shrinking / swapping
config: arm-randconfig-003-20251129 (https://download.01.org/0day-ci/archive/20251129/202511290848.Uqepzr98-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290848.Uqepzr98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290848.Uqepzr98-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'shrink_test_run_device':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '34359738368' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:49:41: note: in expansion of macro '_AC'
      49 | #define SZ_32G                          _AC(0x800000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/xe/tests/xe_bo.c:461:17: note: in expansion of macro 'SZ_32G'
     461 |         limit = SZ_32G;
         |                 ^~~~~~
   include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '17179869184' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:48:41: note: in expansion of macro '_AC'
      48 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/xe/tests/xe_bo.c:464:25: note: in expansion of macro 'SZ_16G'
     464 |                 limit = SZ_16G;
         |                         ^~~~~~


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
