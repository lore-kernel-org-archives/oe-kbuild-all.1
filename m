Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A64C65
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKxv7gSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705163732; x=1736699732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ING2l6667xNzlW3d6Sn3SUdynURZwLx0zx0rV0TdZjc=;
  b=fKxv7gSXWU7gzKvi8DUghjT2KcCUcVK/YFXtI5KiyAEKCdBhyAddgPHh
   cYoiRtvikd8q1P0LV0WxKhowros6OpxneEMH6G7QXLJhDb5wBw3lNcPmO
   D8al9fKU8Mg/UQB11LBryf51NNEG+gXp3oIQjyUjAkjuV/jRsNI2YrtNB
   NCWiHbIB3/6l29jUwqXpiMVBl+0tjyJBHHQuW1jtKsow1Xffxscyp9Z+c
   GHcTswzPJIai0tGdZ8g6lwlTvQLDbY6TM0210K8xvn9eI4ZoR2clPa3S0
   TTT8KVl/yEAEyZdkt+xmvaxLxdc5SncUHyvszf1QtArhjgEKwsWSPtnbV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="398259676"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="398259676"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 08:35:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="759433538"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="759433538"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2024 08:35:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOgym-000AhQ-2L;
	Sat, 13 Jan 2024 16:35:28 +0000
Date: Sun, 14 Jan 2024 00:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19307/21544]
 arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long
 unsigned int[0]' is partly outside array bounds of 'enum
 mitigation_state[1]'
Message-ID: <202401140053.ep4tTSCX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: cb917077efa4fecd975ab17d6aececdd90abe82e [19307/21544] arm64: Mitigate spectre style branch history side channels
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240114/202401140053.ep4tTSCX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140053.ep4tTSCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140053.ep4tTSCX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/cpu_errata.c:335:13: warning: no previous prototype for 'arm64_update_smccc_conduit' [-Wmissing-prototypes]
     335 | void __init arm64_update_smccc_conduit(struct alt_instr *alt,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:357:13: warning: no previous prototype for 'arm64_enable_wa2_handling' [-Wmissing-prototypes]
     357 | void __init arm64_enable_wa2_handling(struct alt_instr *alt,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:1323:13: warning: no previous prototype for 'spectre_bhb_patch_loop_iter' [-Wmissing-prototypes]
    1323 | void __init spectre_bhb_patch_loop_iter(struct alt_instr *alt,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/arm64/kernel/cpu_errata.c:22:
   In function '__cmpxchg_case_4',
       inlined from '__cmpxchg' at arch/arm64/include/asm/cmpxchg.h:140:1,
       inlined from 'update_mitigation_state' at arch/arm64/kernel/cpu_errata.c:1044:11,
       inlined from 'spectre_bhb_enable_mitigation' at arch/arm64/kernel/cpu_errata.c:1319:2,
       inlined from 'spectre_bhb_enable_mitigation' at arch/arm64/kernel/cpu_errata.c:1271:6:
>> arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'enum mitigation_state[1]' [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:279:1: note: in expansion of macro '__CMPXCHG_CASE'
     279 | __CMPXCHG_CASE(w,  ,     4,        ,  ,  ,         )
         | ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c: In function 'spectre_bhb_enable_mitigation':
   arch/arm64/kernel/cpu_errata.c:1058:30: note: object 'spectre_bhb_state' of size 4
    1058 | static enum mitigation_state spectre_bhb_state;
         |                              ^~~~~~~~~~~~~~~~~
   In function '__cmpxchg_case_4',
       inlined from '__cmpxchg' at arch/arm64/include/asm/cmpxchg.h:140:1,
       inlined from 'update_mitigation_state' at arch/arm64/kernel/cpu_errata.c:1044:11,
       inlined from 'spectre_bhb_enable_mitigation' at arch/arm64/kernel/cpu_errata.c:1319:2,
       inlined from 'spectre_bhb_enable_mitigation' at arch/arm64/kernel/cpu_errata.c:1271:6:
>> arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'enum mitigation_state[1]' [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:279:1: note: in expansion of macro '__CMPXCHG_CASE'
     279 | __CMPXCHG_CASE(w,  ,     4,        ,  ,  ,         )
         | ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c: In function 'spectre_bhb_enable_mitigation':
   arch/arm64/kernel/cpu_errata.c:1058:30: note: object 'spectre_bhb_state' of size 4
    1058 | static enum mitigation_state spectre_bhb_state;
         |                              ^~~~~~~~~~~~~~~~~


vim +259 arch/arm64/include/asm/atomic_ll_sc.h

c275f76bb4ce16 Will Deacon  2015-02-03  250  
305d454aaa292b Will Deacon  2015-10-08  251  #define __CMPXCHG_CASE(w, sz, name, mb, acq, rel, cl)			\
c342f78217e822 Will Deacon  2015-04-23  252  __LL_SC_INLINE unsigned long						\
c342f78217e822 Will Deacon  2015-04-23  253  __LL_SC_PREFIX(__cmpxchg_case_##name(volatile void *ptr,		\
c342f78217e822 Will Deacon  2015-04-23  254  				     unsigned long old,			\
c342f78217e822 Will Deacon  2015-04-23  255  				     unsigned long new))		\
c342f78217e822 Will Deacon  2015-04-23  256  {									\
c342f78217e822 Will Deacon  2015-04-23  257  	unsigned long tmp, oldval;					\
c342f78217e822 Will Deacon  2015-04-23  258  									\
c342f78217e822 Will Deacon  2015-04-23 @259  	asm volatile(							\
7f08a414f29e7d Mark Rutland 2015-08-04  260  	"	prfm	pstl1strm, %[v]\n"				\
305d454aaa292b Will Deacon  2015-10-08  261  	"1:	ld" #acq "xr" #sz "\t%" #w "[oldval], %[v]\n"		\
c342f78217e822 Will Deacon  2015-04-23  262  	"	eor	%" #w "[tmp], %" #w "[oldval], %" #w "[old]\n"	\
c342f78217e822 Will Deacon  2015-04-23  263  	"	cbnz	%" #w "[tmp], 2f\n"				\
4e39715f4b5cb3 Will Deacon  2015-05-29  264  	"	st" #rel "xr" #sz "\t%w[tmp], %" #w "[new], %[v]\n"	\
c342f78217e822 Will Deacon  2015-04-23  265  	"	cbnz	%w[tmp], 1b\n"					\
c342f78217e822 Will Deacon  2015-04-23  266  	"	" #mb "\n"						\
c342f78217e822 Will Deacon  2015-04-23  267  	"2:"								\
c342f78217e822 Will Deacon  2015-04-23  268  	: [tmp] "=&r" (tmp), [oldval] "=&r" (oldval),			\
c342f78217e822 Will Deacon  2015-04-23  269  	  [v] "+Q" (*(unsigned long *)ptr)				\
c342f78217e822 Will Deacon  2015-04-23  270  	: [old] "Lr" (old), [new] "r" (new)				\
c342f78217e822 Will Deacon  2015-04-23  271  	: cl);								\
c342f78217e822 Will Deacon  2015-04-23  272  									\
c342f78217e822 Will Deacon  2015-04-23  273  	return oldval;							\
c342f78217e822 Will Deacon  2015-04-23  274  }									\
c342f78217e822 Will Deacon  2015-04-23  275  __LL_SC_EXPORT(__cmpxchg_case_##name);
c342f78217e822 Will Deacon  2015-04-23  276  

:::::: The code at line 259 was first introduced by commit
:::::: c342f78217e822d2178265b0b1de232eeb717149 arm64: cmpxchg: patch in lse instructions when supported by the CPU

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
