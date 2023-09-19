Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E432347AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 23:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695166295; x=1726702295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mGcK0swoEalivBNNHxtWaNWDkJ1wcBQMPAV547VGABI=;
  b=nbUDU1O0851aHdM7u3+TsTWSmre4WRwpzEHDUTu3oYfuZ3nerSKd0a5+
   0ROREuzORkmNlqdBiNNz9tCPznQtn1z/L5XRYpaVGjmAXEY+BVS60ESM5
   LJvpPU6R5n63XVUWJfQA8aDzqqZQ9P43CB4J0W3NWEglfyWUp2r9pWDUe
   KVkbxnZlbw84dA33b1YkT+9WWr3pk0efpRv3+ewZGV5BExFKsUt6s3jgz
   DVzWK3WpHKwzgvXH945y6pWyB2/67g+bOc05pxXtsfwtQFlcNVeYbhMNe
   578kjM5EmHlzdXoNsesMFIKJ3dvUuwn0mj0W+97zWdkXfo1XkRTrpdcx6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446554148"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="446554148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781481811"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="781481811"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Sep 2023 16:31:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qikBm-00084A-11;
	Tue, 19 Sep 2023 23:31:30 +0000
Date: Wed, 20 Sep 2023 07:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 15/276]
 arch/arm64/include/asm/atomic_lse.h:351:9: warning: array subscript 'long
 unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned
 int[1]'}
Message-ID: <202309200715.F8QRrZAj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   cfe32cb3c3a4d4ee8b1350b9d9366b06021cb60b
commit: bb964d6864307aab86412a8bc2cdc7f28eb726ac [15/276] UPSTREAM: arm64: perf: Don't register user access sysctl handler multiple times
config: arm64-randconfig-003-20230920 (https://download.01.org/0day-ci/archive/20230920/202309200715.F8QRrZAj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200715.F8QRrZAj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200715.F8QRrZAj-lkp@intel.com/

All warnings (new ones prefixed by >>):

     113 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR                0x43
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:145:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR'
     145 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:122:65: warning: initialized field overwritten [-Woverride-init]
     122 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x4E
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:147:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     147 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:122:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][0][0]')
     122 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x4E
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:147:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     147 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:123:65: warning: initialized field overwritten [-Woverride-init]
     123 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x4F
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:148:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     148 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:123:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][1][0]')
     123 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x4F
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:148:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     148 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:120:65: warning: initialized field overwritten [-Woverride-init]
     120 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x4C
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:149:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     149 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:120:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][0][1]')
     120 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x4C
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:149:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     149 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:121:65: warning: initialized field overwritten [-Woverride-init]
     121 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x4D
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:150:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     150 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:121:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][1][1]')
     121 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x4D
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:150:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     150 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:137:65: warning: initialized field overwritten [-Woverride-init]
     137 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x60
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:152:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     152 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:137:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[6][0][0]')
     137 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x60
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:152:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     152 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:138:65: warning: initialized field overwritten [-Woverride-init]
     138 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x61
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:153:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     153 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/perf_event.h:138:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[6][1][0]')
     138 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x61
         |                                                                 ^~~~
   arch/arm64/kernel/perf_event.c:153:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     153 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/lse.h:16,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:26,
                    from include/linux/bitops.h:33,
                    from arch/arm64/include/asm/cache.h:60,
                    from include/linux/cache.h:6,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/asm-generic/irq_regs.h:11,
                    from ./arch/arm64/include/generated/asm/irq_regs.h:1,
                    from arch/arm64/kernel/perf_event.c:11:
   In function '__lse__cmpxchg_case_32',
       inlined from '__cmpxchg_case_32' at arch/arm64/include/asm/cmpxchg.h:117:1,
       inlined from '__cmpxchg' at arch/arm64/include/asm/cmpxchg.h:172:1,
       inlined from 'armv8_pmu_register_sysctl_table' at arch/arm64/kernel/perf_event.c:1126:7,
       inlined from 'armv8_pmu_init.constprop' at arch/arm64/kernel/perf_event.c:1162:2:
>> arch/arm64/include/asm/atomic_lse.h:351:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Warray-bounds=]
     351 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:366:1: note: in expansion of macro '__CMPXCHG_CASE'
     366 | __CMPXCHG_CASE(w,  ,     , 32,   )
         | ^~~~~~~~~~~~~~
   arch/arm64/kernel/perf_event.c: In function 'armv8_pmu_init.constprop':
   arch/arm64/kernel/perf_event.c:1124:20: note: object 'tbl_registered' of size 4
    1124 |         static u32 tbl_registered = 0;
         |                    ^~~~~~~~~~~~~~
   In function '__lse__cmpxchg_case_32',
       inlined from '__cmpxchg_case_32' at arch/arm64/include/asm/cmpxchg.h:117:1,
       inlined from '__cmpxchg' at arch/arm64/include/asm/cmpxchg.h:172:1,
       inlined from 'armv8_pmu_register_sysctl_table' at arch/arm64/kernel/perf_event.c:1126:7,
       inlined from 'armv8_pmu_init.constprop' at arch/arm64/kernel/perf_event.c:1162:2:
>> arch/arm64/include/asm/atomic_lse.h:351:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Warray-bounds=]
     351 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:366:1: note: in expansion of macro '__CMPXCHG_CASE'
     366 | __CMPXCHG_CASE(w,  ,     , 32,   )
         | ^~~~~~~~~~~~~~
   arch/arm64/kernel/perf_event.c: In function 'armv8_pmu_init.constprop':
   arch/arm64/kernel/perf_event.c:1124:20: note: object 'tbl_registered' of size 4
    1124 |         static u32 tbl_registered = 0;
         |                    ^~~~~~~~~~~~~~


vim +351 arch/arm64/include/asm/atomic_lse.h

c0385b24af1502 Will Deacon   2015-02-03  339  
5ef3fe4cecdf82 Will Deacon   2018-09-13  340  #define __CMPXCHG_CASE(w, sfx, name, sz, mb, cl...)			\
a48e61de758c6b Will Deacon   2019-10-01  341  static __always_inline u##sz						\
a48e61de758c6b Will Deacon   2019-10-01  342  __lse__cmpxchg_case_##name##sz(volatile void *ptr,			\
b4f9209bfcd596 Will Deacon   2018-09-13  343  					      u##sz old,		\
5ef3fe4cecdf82 Will Deacon   2018-09-13  344  					      u##sz new)		\
c342f78217e822 Will Deacon   2015-04-23  345  {									\
c342f78217e822 Will Deacon   2015-04-23  346  	register unsigned long x0 asm ("x0") = (unsigned long)ptr;	\
b4f9209bfcd596 Will Deacon   2018-09-13  347  	register u##sz x1 asm ("x1") = old;				\
5ef3fe4cecdf82 Will Deacon   2018-09-13  348  	register u##sz x2 asm ("x2") = new;				\
3337cb5aea594e Andrew Murray 2019-08-28  349  	unsigned long tmp;						\
c342f78217e822 Will Deacon   2015-04-23  350  									\
addfc38672c73e Andrew Murray 2019-08-28 @351  	asm volatile(							\
4307fb91346616 Sami Tolvanen 2019-02-06  352  	__LSE_PREAMBLE							\
3337cb5aea594e Andrew Murray 2019-08-28  353  	"	mov	%" #w "[tmp], %" #w "[old]\n"			\
3337cb5aea594e Andrew Murray 2019-08-28  354  	"	cas" #mb #sfx "\t%" #w "[tmp], %" #w "[new], %[v]\n"	\
3337cb5aea594e Andrew Murray 2019-08-28  355  	"	mov	%" #w "[ret], %" #w "[tmp]"			\
3337cb5aea594e Andrew Murray 2019-08-28  356  	: [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr),		\
3337cb5aea594e Andrew Murray 2019-08-28  357  	  [tmp] "=&r" (tmp)						\
c342f78217e822 Will Deacon   2015-04-23  358  	: [old] "r" (x1), [new] "r" (x2)				\
3337cb5aea594e Andrew Murray 2019-08-28  359  	: cl);								\
c342f78217e822 Will Deacon   2015-04-23  360  									\
c342f78217e822 Will Deacon   2015-04-23  361  	return x0;							\
c342f78217e822 Will Deacon   2015-04-23  362  }
c342f78217e822 Will Deacon   2015-04-23  363  

:::::: The code at line 351 was first introduced by commit
:::::: addfc38672c73efd5c4e559a2e455b086e3e20c5 arm64: atomics: avoid out-of-line ll/sc atomics

:::::: TO: Andrew Murray <andrew.murray@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
