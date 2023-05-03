Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D346AC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683111919; x=1714647919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pWY6J82Q0vnyzpp9JBeJL20ChUdrUHEFz93kmwstMtw=;
  b=ilUCcLE+lOVILogd9FKhok2IL6q/FSc3W73SJaKfUvnVcy+E4SIz911G
   GTK/wj9O3SarboMxqzup4LLTGvJsM8Gj/slMioRhXjxYQSUsuGJYyQ8rM
   uUFEIcUlDxdONkbF0Y6ZycYL0nhpzFoVUuyKoe4Wre5/oyT5h70Fognkd
   HUyEDc6nCdK1nBZiRjLRrIgj14efVFBZdB4042frGf0jraS6qHtvAn7+5
   Iyqo8ofrGFd4A0QiRRuGSP0Gh075+eZkYyCYFfsae96IWu58Zoi8trUYx
   OSM0EEXpPPLKGZciBkXe9y8upQyf4IzjZO/8U9Tn9P0BeYxSr4DuHlQ7w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="346106733"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="346106733"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 04:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="761450717"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="761450717"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 May 2023 04:05:15 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puAIM-0001wU-0f;
	Wed, 03 May 2023 11:05:14 +0000
Date: Wed, 3 May 2023 19:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-pfn-v6-4-rc1 11/12]
 arch/arm64/kernel/vdso.c:291:45: warning: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202305031919.7J96d1Wq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-pfn-v6-4-rc1
head:   042946296cd2b01e67500f6ca02c750fbd5d0046
commit: abe98e4b9a19f13cca92d0121e49563052302103 [11/12] arm64: memory: Make virt_to_pfn() a static inline
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230503/202305031919.7J96d1Wq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=abe98e4b9a19f13cca92d0121e49563052302103
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator b4/virt-to-pfn-v6-4-rc1
        git checkout abe98e4b9a19f13cca92d0121e49563052302103
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ drivers/net/xen-netback/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031919.7J96d1Wq-lkp@intel.com/

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
https://github.com/intel/lkp-tests
