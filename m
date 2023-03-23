Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3431A93A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679587238; x=1711123238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dytR8SLOjfCGoc5GSCgIe5nn5l68I4RBi2nQSshmFLs=;
  b=namSqLl6LweQVCtanNct3Q3/aYfhfI/0why/wgzmJPWJ5Aad/GasS0Wt
   WydounHNDSXoJ+jPJyJe0CTk9LJROSClUyoHPPRqmOqzSO7Ts4Us4yQVN
   1/ZJDy3X+8HTjX63evzC10HkZjy+LaQN6MC9KwNQf0PsvEAESaGmkfvwg
   jQx2IJ45DQ4O1HttH4NfwRo2N+NDFM8I5/+GckSWMtOM6+u1RKJ1r76hT
   sWISMR9o26e3Wt86m0f0NyYf63uz74EOxGBSPuV4uxIHbGarBTL1Uwbnc
   Xr7hIhs03R7MKxKWo+H1Kbu2LI4v3Y4n+qNrF08/bVOvmOQOHjMt1/V9x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402114771"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="402114771"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 09:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1011862106"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="1011862106"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2023 09:00:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfNMe-000EVO-1P;
	Thu, 23 Mar 2023 16:00:32 +0000
Date: Thu, 23 Mar 2023 23:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 6/8]
 arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
Message-ID: <202303232352.GlZIKb4n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   b5fe3402030c1ea066167108866fd21881895594
commit: 1df3431f995d6bb7a731770a7393c3011b52a581 [6/8] ARM: mm: Make virt_to_pfn() a static inline
config: arm-randconfig-r033-20230322 (https://download.01.org/0day-ci/archive/20230323/202303232352.GlZIKb4n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=1df3431f995d6bb7a731770a7393c3011b52a581
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout 1df3431f995d6bb7a731770a7393c3011b52a581
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232352.GlZIKb4n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/arm/kernel/asm-offsets.c:12:
   include/linux/mmzone.h:925:33: error: size of array 'free_area' is negative
     925 |         struct free_area        free_area[MAX_ORDER];
         |                                 ^~~~~~~~~
   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/ZERO_PAGE +49 arch/arm/include/asm/pgtable-nommu.h

    44	
    45	/*
    46	 * ZERO_PAGE is a global shared page that is always zero: used
    47	 * for zero-mapped memory areas etc..
    48	 */
  > 49	#define ZERO_PAGE(vaddr)	(virt_to_page((const void *)0))
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
