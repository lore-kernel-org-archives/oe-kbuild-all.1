Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1720626
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 04:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHHP3n9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702787722; x=1734323722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4Df1itdK9OLgw4VMmxmjFytNpZ6Ho+XDePKLWsHGx8=;
  b=fHHP3n9Vse5NsxbKmJSm21Ic60z4G0hHv8LghUyfsTX7i1obfRrrsFgL
   PGbQL90Kpu2e+dHYcCaCwRNrpOYnhoq4D5U58y8xHcI989v75butQ9bgi
   mzYlAn7NickjF8odw0iEntUIX60cXm4pKgkcbyFNpbjhh9+hVgrnm1l15
   xoJEPLRUpfAxcfcwMv7PkiZSbhyO/5bPQ4BEskQ6cctyNxxalhn8SxPvh
   u0SO29/bTv4tVI5O3IkHrq2w/RuQ3tloaa7fBlA3GyI94EJ6LlOhU75Mi
   iVEvK8MLT2rETujnt6IYdIpNHACZT3bIVajCW85lTJ9O1S+iV5TrruX74
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="398186548"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="398186548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:35:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="23320652"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2023 20:35:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEis1-0002ds-0W;
	Sun, 17 Dec 2023 04:35:17 +0000
Date: Sun, 17 Dec 2023 12:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 20/50] include/linux/posix-timers.h:120:8:
 error: redefinition of 'struct posix_cputimers'
Message-ID: <202312171205.4ImfVyrW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 09bece4ec7253adb67c34861b8a86cf85a32b065 [20/50] posix-cpu-timers: Split out posix-timers_types.h
config: i386-randconfig-011-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171205.4ImfVyrW-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171205.4ImfVyrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171205.4ImfVyrW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched/signal.h:12,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> include/linux/posix-timers.h:120:8: error: redefinition of 'struct posix_cputimers'
     120 | struct posix_cputimers { };
         |        ^~~~~~~~~~~~~~~
   In file included from include/linux/sched.h:34,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
   include/linux/posix-timers_types.h:54:8: note: originally defined here
      54 | struct posix_cputimers {
         |        ^~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=179081529
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2 shuffle=179081529
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=179081529
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=179081529
   make: Target 'prepare' not remade because of errors.


vim +120 include/linux/posix-timers.h

2b69942f9021bf Thomas Gleixner 2019-08-21  114  
2b69942f9021bf Thomas Gleixner 2019-08-21  115  #define INIT_CPU_TIMERS(s)						\
2b69942f9021bf Thomas Gleixner 2019-08-21  116  	.posix_cputimers = {						\
87dc64480fb19a Thomas Gleixner 2019-08-26  117  		.bases = INIT_CPU_TIMERBASES(s.posix_cputimers.bases),	\
2b69942f9021bf Thomas Gleixner 2019-08-21  118  	},
2b69942f9021bf Thomas Gleixner 2019-08-21  119  #else
2b69942f9021bf Thomas Gleixner 2019-08-21 @120  struct posix_cputimers { };
8f2edb4a78f7f5 Thomas Gleixner 2019-08-29  121  struct cpu_timer { };
2b69942f9021bf Thomas Gleixner 2019-08-21  122  #define INIT_CPU_TIMERS(s)
3a245c0f110e2b Thomas Gleixner 2019-08-21  123  static inline void posix_cputimers_init(struct posix_cputimers *pct) { }
3a245c0f110e2b Thomas Gleixner 2019-08-21  124  static inline void posix_cputimers_group_init(struct posix_cputimers *pct,
3a245c0f110e2b Thomas Gleixner 2019-08-21  125  					      u64 cpu_limit) { }
2b69942f9021bf Thomas Gleixner 2019-08-21  126  #endif
2b69942f9021bf Thomas Gleixner 2019-08-21  127  

:::::: The code at line 120 was first introduced by commit
:::::: 2b69942f9021bf75bd1b001f53bd2578361fadf3 posix-cpu-timers: Create a container struct

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
