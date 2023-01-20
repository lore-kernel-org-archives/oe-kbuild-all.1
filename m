Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D70117D7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674206214; x=1705742214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DBfYc5lilumwHLmsxbh07u7S3A8VQjEx9Bm0I2++QIA=;
  b=PwsFSdWjQ9tB5ff8jjCHA+a5KfqE0wvyxJAaRkEKIPXrGV0YG9Q2w+vM
   lrX3mUSNa6PV65WOljHwItqRfQqEKNgLsNcoFX+bXQkYIrZyWchnD5ZKh
   kq2wSgpj/qPAFnXudC9mwuH/8iq+mniddrYNH6YC0lg+xRTdPqHhC/qtO
   O2/tyTb0lvqFDsXAYWRDyNxbSiizwG6HH8CRSalfzZruh4YqrVrKgtlWD
   zK5mDvjdK8MV/dN95XutmHxq3+y74oklXc0p0rVA/P/EWLhzxJjEDbI7g
   sTAxC1ryd6W/smZQIgNfi/l7NNlzEGvu1d3Q+E0DN9P2Y2ooi+SJ9SLU/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="390054667"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="390054667"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 01:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="723892558"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="723892558"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jan 2023 01:16:52 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pInW0-0002QQ-01;
	Fri, 20 Jan 2023 09:16:52 +0000
Date: Fri, 20 Jan 2023 17:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [madvenka786:orc_v3 18/21] arch/arm64/include/asm/module.h:19:8:
 error: redefinition of 'struct mod_arch_specific'
Message-ID: <202301201718.RJBIP9MH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/madvenka786/linux orc_v3
head:   a0c212ed0823caa5a7ec431d3a5ec07b46964384
commit: c8b2b82a357707557f60ee6305f6e2cd5d23bde3 [18/21] arm64: Build the kernel with ORC information
config: arm64-randconfig-r031-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201718.RJBIP9MH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/madvenka786/linux/commit/c8b2b82a357707557f60ee6305f6e2cd5d23bde3
        git remote add madvenka786 https://github.com/madvenka786/linux
        git fetch --no-tags madvenka786 orc_v3
        git checkout c8b2b82a357707557f60ee6305f6e2cd5d23bde3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:32,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:15,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
>> arch/arm64/include/asm/module.h:19:8: error: redefinition of 'struct mod_arch_specific'
      19 | struct mod_arch_specific {
         |        ^~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/module.h:8:
   include/asm-generic/module.h:10:8: note: originally defined here
      10 | struct mod_arch_specific
         |        ^~~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:118: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1270: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:231: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +19 arch/arm64/include/asm/module.h

24af6c4e4e0f6e Ard Biesheuvel           2017-02-21  18  
24af6c4e4e0f6e Ard Biesheuvel           2017-02-21 @19  struct mod_arch_specific {
c8b2b82a357707 Madhavan T. Venkataraman 2023-01-08  20  #ifdef CONFIG_ARM64_MODULE_PLTS
24af6c4e4e0f6e Ard Biesheuvel           2017-02-21  21  	struct mod_plt_sec	core;
24af6c4e4e0f6e Ard Biesheuvel           2017-02-21  22  	struct mod_plt_sec	init;
e71a4e1bebaf7f Ard Biesheuvel           2017-06-06  23  
e71a4e1bebaf7f Ard Biesheuvel           2017-06-06  24  	/* for CONFIG_DYNAMIC_FTRACE */
3b23e4991fb66f Torsten Duwe             2019-02-08  25  	struct plt_entry	*ftrace_trampolines;
fd045f6cd98ec4 Ard Biesheuvel           2015-11-24  26  #endif
c8b2b82a357707 Madhavan T. Venkataraman 2023-01-08  27  #ifdef CONFIG_UNWINDER_ORC
c8b2b82a357707 Madhavan T. Venkataraman 2023-01-08  28  	unsigned int num_orcs;
c8b2b82a357707 Madhavan T. Venkataraman 2023-01-08  29  	int *orc_unwind_ip;
c8b2b82a357707 Madhavan T. Venkataraman 2023-01-08  30  	struct orc_entry *orc_unwind;
c8b2b82a357707 Madhavan T. Venkataraman 2023-01-08  31  #endif
c8b2b82a357707 Madhavan T. Venkataraman 2023-01-08  32  };
fd045f6cd98ec4 Ard Biesheuvel           2015-11-24  33  

:::::: The code at line 19 was first introduced by commit
:::::: 24af6c4e4e0f6e9803bec8dca0f7748afbb2bbf0 arm64: module: split core and init PLT sections

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
