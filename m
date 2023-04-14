Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99241368
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 02:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681439479; x=1712975479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f9O+mLc5sJOmEpTzOfzFoqw89UynDcFFr0LLh/oGVbo=;
  b=BLe4kZEva6tv5h7CxTR+m9Tl5azk1z3tSkjL1ELH9eNloXVp6SvUIwOA
   MPStR/ZZNkL+4Em3+oxq1uVfTUDWTLmw2vRDRgHTBjRIykvp5J+N7UdTn
   /uLNRw/iRa4VuBZy6Ielx+GAiOlVFPba/RKYrkeM93gUF+V3223P22pJb
   wNxKOEtuspQqHvdpYW18DPO7CorjFv9GW0edyzdyaaMjba4cqlXyVMm6O
   38U7goMPWi5tsNdoiRmO9PvpGVyCz1w+KFyX5luHjwd0G3uWEqmo186Lv
   32K3tIwonlya1/rjgpKt5zpO6Db9G7xYtqYvDC/vq2r04KWfm6p9pm3q7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="344363157"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="344363157"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 19:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="639924322"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="639924322"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 19:31:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn9DS-000Z9H-2i;
	Fri, 14 Apr 2023 02:31:10 +0000
Date: Fri, 14 Apr 2023 10:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:cove_integeration_v2 2/50]
 arch/nios2/include/asm/page.h:89:54: error: implicit declaration of function
 'virt_to_phys'; did you mean 'virt_to_page'?
Message-ID: <202304141012.09mwn3wC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux cove_integeration_v2
head:   94c0fb847a505a21d11c0de2e0acefc2e9965311
commit: 221c4ab39514a85f7ce6236849897bb4d00af571 [2/50] pci: Use ioremap_driver_hardened for ECAM spaces for authorized devices.
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230414/202304141012.09mwn3wC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/221c4ab39514a85f7ce6236849897bb4d00af571
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 cove_integeration_v2
        git checkout 221c4ab39514a85f7ce6236849897bb4d00af571
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141012.09mwn3wC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/nios2/include/asm/page.h:94,
                    from arch/nios2/include/asm/processor.h:22,
                    from include/linux/rcupdate.h:30,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/nios2/kernel/asm-offsets.c:7:
   include/linux/mm.h: In function 'virt_to_head_page':
>> arch/nios2/include/asm/page.h:89:54: error: implicit declaration of function 'virt_to_phys'; did you mean 'virt_to_page'? [-Werror=implicit-function-declaration]
      89 | # define virt_to_page(vaddr)    pfn_to_page(PFN_DOWN(virt_to_phys(vaddr)))
         |                                                      ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/nios2/include/asm/page.h:89:45: note: in expansion of macro 'PFN_DOWN'
      89 | # define virt_to_page(vaddr)    pfn_to_page(PFN_DOWN(virt_to_phys(vaddr)))
         |                                             ^~~~~~~~
   include/linux/mm.h:1050:29: note: in expansion of macro 'virt_to_page'
    1050 |         struct page *page = virt_to_page(x);
         |                             ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/nios2/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +89 arch/nios2/include/asm/page.h

863cf8da0f32a4 Tobias Klauser 2016-11-09  88  
5ccc6af5e88efd Ley Foon Tan   2014-11-06 @89  # define virt_to_page(vaddr)	pfn_to_page(PFN_DOWN(virt_to_phys(vaddr)))
5ccc6af5e88efd Ley Foon Tan   2014-11-06  90  # define virt_addr_valid(vaddr)	pfn_valid(PFN_DOWN(virt_to_phys(vaddr)))
5ccc6af5e88efd Ley Foon Tan   2014-11-06  91  

:::::: The code at line 89 was first introduced by commit
:::::: 5ccc6af5e88efdd0c7facba64078d8d61de9012b nios2: Memory management

:::::: TO: Ley Foon Tan <lftan@altera.com>
:::::: CC: Ley Foon Tan <lftan@altera.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
