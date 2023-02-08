Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8912561
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675863727; x=1707399727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dM2DXMqM32ssIYNyJUMdB7//UUl2UNsQbXYyC/ETiLQ=;
  b=DmAoPBTNbcLytqVf/5VmgMVXgAoA6Gyzn1e3W9v00cIbU3pW4rYL2lu3
   lrdkooUxve9A4VCRhBR2I+7whsht0PIm0A1dhEJeWTx3wQISliwydb04A
   3mvr0dKBd67P/bX1/XTU1HDX5j+r5LHxFMbC43ePgMQTxBoYFs6/uwHRm
   iU3wwoIjICtukQjdzFKD1W1jdBM/LDt7GRXxCeGezbjeNS/D0Qs1BbxsT
   mko3NOQRjrnYnK8ovcHYgTS6ELjpEQdg9HuRUhI3TK90QKh4KQyUOQas3
   1Kj7tDHEs7jp+dIZFrW+XrcyDDGdVM4UrzP4cacj7JVNzYANvfEVGiXOF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="317798723"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="317798723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 05:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="841185360"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="841185360"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Feb 2023 05:42:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPki4-0004TE-2S;
	Wed, 08 Feb 2023 13:42:04 +0000
Date: Wed, 8 Feb 2023 21:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.2-rc3 7/20]
 arch/arm64/kernel/vdso.c:293:45: warning: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202302082128.V2hlDTh8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.2-rc3
head:   e7b124e682b6f0adf09d2bb405e70bee2024175f
commit: 6e863d123cc67f8fb660aa54f971a01ddc56b5b2 [7/20] arm64: memory: Make virt_to_pfn() a static inline
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230208/202302082128.V2hlDTh8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=6e863d123cc67f8fb660aa54f971a01ddc56b5b2
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.2-rc3
        git checkout 6e863d123cc67f8fb660aa54f971a01ddc56b5b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ drivers/net/xen-netback/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/memory.h:322,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/smp.h:110,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/clocksource.h:13,
                    from arch/arm64/kernel/vdso.c:11:
   arch/arm64/kernel/vdso.c: In function 'aarch32_alloc_kuser_vdso_page':
>> arch/arm64/kernel/vdso.c:293:45: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     293 |         aarch32_vectors_page = virt_to_page(vdso_page);
         |                                             ^~~~~~~~~
         |                                             |
         |                                             long unsigned int
   include/asm-generic/memory_model.h:25:45: note: in definition of macro '__pfn_to_page'
      25 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/arm64/kernel/vdso.c:293:32: note: in expansion of macro 'virt_to_page'
     293 |         aarch32_vectors_page = virt_to_page(vdso_page);
         |                                ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:324:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     324 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from arch/arm64/include/asm/memory.h:322,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/smp.h:110,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from drivers/net/xen-netback/common.h:32,
                    from drivers/net/xen-netback/netback.c:35:
   drivers/net/xen-netback/netback.c: In function 'xenvif_fill_frags':
>> drivers/net/xen-netback/netback.c:671:37: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     671 |                 page = virt_to_page(idx_to_kaddr(queue, pending_idx));
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     long unsigned int
   include/asm-generic/memory_model.h:25:45: note: in definition of macro '__pfn_to_page'
      25 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   drivers/net/xen-netback/netback.c:671:24: note: in expansion of macro 'virt_to_page'
     671 |                 page = virt_to_page(idx_to_kaddr(queue, pending_idx));
         |                        ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:324:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     324 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   drivers/net/xen-netback/netback.c: In function 'xenvif_tx_build_gops':
   drivers/net/xen-netback/netback.c:886:21: warning: variable 'pending_idx' set but not used [-Wunused-but-set-variable]
     886 |                 u16 pending_idx;
         |                     ^~~~~~~~~~~


vim +/virt_to_pfn +293 arch/arm64/kernel/vdso.c

9031fefde6f2ac Will Deacon       2012-03-05  277  
1255a7341bee6c Vincenzo Frascino 2019-04-15  278  static int aarch32_alloc_kuser_vdso_page(void)
9031fefde6f2ac Will Deacon       2012-03-05  279  {
9031fefde6f2ac Will Deacon       2012-03-05  280  	extern char __kuser_helper_start[], __kuser_helper_end[];
9031fefde6f2ac Will Deacon       2012-03-05  281  	int kuser_sz = __kuser_helper_end - __kuser_helper_start;
1255a7341bee6c Vincenzo Frascino 2019-04-15  282  	unsigned long vdso_page;
9031fefde6f2ac Will Deacon       2012-03-05  283  
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  284  	if (!IS_ENABLED(CONFIG_KUSER_HELPERS))
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  285  		return 0;
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  286  
7cd6ca1d790226 Will Deacon       2021-03-18  287  	vdso_page = get_zeroed_page(GFP_KERNEL);
1255a7341bee6c Vincenzo Frascino 2019-04-15  288  	if (!vdso_page)
0d747f6585954d Vincenzo Frascino 2019-04-15  289  		return -ENOMEM;
9031fefde6f2ac Will Deacon       2012-03-05  290  
1255a7341bee6c Vincenzo Frascino 2019-04-15  291  	memcpy((void *)(vdso_page + 0x1000 - kuser_sz), __kuser_helper_start,
1255a7341bee6c Vincenzo Frascino 2019-04-15  292  	       kuser_sz);
74fc72e77dc5c8 Mark Rutland      2020-04-28 @293  	aarch32_vectors_page = virt_to_page(vdso_page);
1255a7341bee6c Vincenzo Frascino 2019-04-15  294  	return 0;
0d747f6585954d Vincenzo Frascino 2019-04-15  295  }
9031fefde6f2ac Will Deacon       2012-03-05  296  

:::::: The code at line 293 was first introduced by commit
:::::: 74fc72e77dc5c8033d1b47d2c8a7229b4b83a746 arm64: vdso: remove aarch32_vdso_pages[]

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
