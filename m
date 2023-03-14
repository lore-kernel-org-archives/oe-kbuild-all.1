Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BFA3C10
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678794576; x=1710330576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWLJdg4mb08iyoZj7QpeYD0qVu7egFmPWzh/rIz3Bxg=;
  b=iMi0isQG0WVLfPYwpp9+Q/DAAROfWkQosJl9fU0iRGIEvZNl4p/orcZl
   oCpnspzudJuAkxQto1qYefcAFV1ex7aH5ktyvW938YEf7SUwvp7yafFmj
   WDkmgkbDavPAEgNyO+zkcnJz80o/CwWzoXf3wujbXXcAm3L1IJ8fF/vE5
   Kgbn+rhLg/PhnGL61fTZ6M9ktE1fJR0ZHiF3Orym0ztVQVSP2bogMedNl
   FMYHlt8mKxQQFQWU3tU7hRfpL+EyT+eWbhNpNIk0KmPIw6gFnob6CtPAt
   UvB0gavH3Netmk3deaQ1JiQyHAVBvXRjlHAgwDt1LBaSzvNOFuVhGIdxy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321250016"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="321250016"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 04:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="802821088"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="802821088"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Mar 2023 04:49:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc39p-0006sw-2x;
	Tue, 14 Mar 2023 11:49:33 +0000
Date: Tue, 14 Mar 2023 19:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 16/31] arch/openrisc/include/asm/page.h:82:26: error: invalid operands to
 binary << (have 'void *' and 'int')
Message-ID: <202303141917.wUepTMhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: 75984ecc1bee531256344b9ac1ff5639a2762bba [16/31] openrisc: Make pfn accessors statics inlines
config: openrisc-randconfig-r026-20230312 (https://download.01.org/0day-ci/archive/20230314/202303141917.wUepTMhy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=75984ecc1bee531256344b9ac1ff5639a2762bba
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout 75984ecc1bee531256344b9ac1ff5639a2762bba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141917.wUepTMhy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/openrisc/include/asm/processor.h:19,
                    from arch/openrisc/include/asm/thread_info.h:22,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:5,
                    from ./arch/openrisc/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/openrisc/kernel/asm-offsets.c:23:
   arch/openrisc/include/asm/page.h: In function 'pfn_to_virt':
>> arch/openrisc/include/asm/page.h:82:26: error: invalid operands to binary << (have 'void *' and 'int')
      82 |         return __va(pfn) << PAGE_SHIFT;
         |                          ^~
   make[2]: *** [scripts/Makefile.build:114: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +82 arch/openrisc/include/asm/page.h

    79	
    80	static inline void * pfn_to_virt(unsigned long pfn)
    81	{
  > 82		return __va(pfn) << PAGE_SHIFT;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
