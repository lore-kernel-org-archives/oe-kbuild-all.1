Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B6E17D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 02:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688092031; x=1719628031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OR9L96bDwroPN8sQOt0sbDHGwrtaen76lkDLYnojGlM=;
  b=LRovpAUf4298YpbYezB6NMLHgllPc9HKWM0GOnEOuaqfxDWVDOLicOGV
   PaVBfS+bqpebHDzfeZLvTpKCr79G74anUROiJCjHB4zMrOQjjA9/9mH9A
   jVT67Nh2OnqsfWfncfVKNk+hVKmAJyqWNgeTfZx3D8mOXOt+cBHnfVrKm
   YE0CuaXuTcuh0wkW3y4LDJrUZfL4OYmZEhNsNboXc6VYze61tv2CZO3NX
   14hZRLvT3TLlWro3bQHWAUE768uc48E/pZ2P0AtVFE7Q296HZE08RLPhi
   kIf7I5ZdW0Pi6HVcN43HT+eilyyyWQIiqebfxXkDyvzBHE7CCuK6OVuI2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="365774451"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="365774451"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 19:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="964213186"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="964213186"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 19:27:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF3ql-000Ebv-2h;
	Fri, 30 Jun 2023 02:27:07 +0000
Date: Fri, 30 Jun 2023 10:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split 11/26]
 arch/arm64/kernel/vdso.c:291:45: warning: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202306301053.R6i3XPKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split
head:   d0cf2fe7497259ee8a7308da99a8cbafaab5e5b5
commit: e9d83dd0dd653d3355fb5c7309ce964050c162ed [11/26] arm64: memory: Make virt_to_pfn() a static inline
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230630/202306301053.R6i3XPKb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301053.R6i3XPKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301053.R6i3XPKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/memory.h:335,
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
>> arch/arm64/kernel/vdso.c:291:45: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     291 |         aarch32_vectors_page = virt_to_page(vdso_page);
         |                                             ^~~~~~~~~
         |                                             |
         |                                             long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/arm64/kernel/vdso.c:291:32: note: in expansion of macro 'virt_to_page'
     291 |         aarch32_vectors_page = virt_to_page(vdso_page);
         |                                ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:337:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     337 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from arch/arm64/include/asm/memory.h:335,
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
>> drivers/net/xen-netback/netback.c:692:37: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     692 |                 page = virt_to_page(idx_to_kaddr(queue, pending_idx));
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   drivers/net/xen-netback/netback.c:692:24: note: in expansion of macro 'virt_to_page'
     692 |                 page = virt_to_page(idx_to_kaddr(queue, pending_idx));
         |                        ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:337:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     337 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~


vim +/virt_to_pfn +291 arch/arm64/kernel/vdso.c

9031fefde6f2ac Will Deacon       2012-03-05  275  
1255a7341bee6c Vincenzo Frascino 2019-04-15  276  static int aarch32_alloc_kuser_vdso_page(void)
9031fefde6f2ac Will Deacon       2012-03-05  277  {
9031fefde6f2ac Will Deacon       2012-03-05  278  	extern char __kuser_helper_start[], __kuser_helper_end[];
9031fefde6f2ac Will Deacon       2012-03-05  279  	int kuser_sz = __kuser_helper_end - __kuser_helper_start;
1255a7341bee6c Vincenzo Frascino 2019-04-15  280  	unsigned long vdso_page;
9031fefde6f2ac Will Deacon       2012-03-05  281  
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  282  	if (!IS_ENABLED(CONFIG_KUSER_HELPERS))
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  283  		return 0;
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  284  
7cd6ca1d790226 Will Deacon       2021-03-18  285  	vdso_page = get_zeroed_page(GFP_KERNEL);
1255a7341bee6c Vincenzo Frascino 2019-04-15  286  	if (!vdso_page)
0d747f6585954d Vincenzo Frascino 2019-04-15  287  		return -ENOMEM;
9031fefde6f2ac Will Deacon       2012-03-05  288  
1255a7341bee6c Vincenzo Frascino 2019-04-15  289  	memcpy((void *)(vdso_page + 0x1000 - kuser_sz), __kuser_helper_start,
1255a7341bee6c Vincenzo Frascino 2019-04-15  290  	       kuser_sz);
74fc72e77dc5c8 Mark Rutland      2020-04-28 @291  	aarch32_vectors_page = virt_to_page(vdso_page);
1255a7341bee6c Vincenzo Frascino 2019-04-15  292  	return 0;
0d747f6585954d Vincenzo Frascino 2019-04-15  293  }
9031fefde6f2ac Will Deacon       2012-03-05  294  

:::::: The code at line 291 was first introduced by commit
:::::: 74fc72e77dc5c8033d1b47d2c8a7229b4b83a746 arm64: vdso: remove aarch32_vdso_pages[]

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
