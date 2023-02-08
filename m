Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8458B2560
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675858625; x=1707394625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P1Wlb2eGETIdAed2GP1rClNZT1VBsO1mIXIdiErYBGs=;
  b=Fh0KGSSfiGL2F2eVZlngi7uWayvkhjayOioLMaWSn+T2Auo6N1okRvdU
   LoUPqvpO1wamrHFd9ALwYnZkYl7iLde3ZFUvyb7nuX2lTT/aw+a9bKCs4
   sSHCUEOxPFUnzkQm+2/U9y69t0u46a++lKV0Vwt86+XiZPjNx1RQ18J6U
   wD6yabz7EY3OHm/WpmRakON2QgnpR3fJM++gn0/MBJrthqlcN2qZpr1di
   PzXdjtdUA6NdBIirk6dD8rRtAfj+obb3JZDMuRT2glQdHCvkKfuqJLfHR
   jy1bam1bvNlDHlwXGmY6orxjlN8yYA+mGdWJ1eBiCF9UczJDSz0oNk/s+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="357174324"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="357174324"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 04:17:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="697653237"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="697653237"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2023 04:17:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPjNn-0004R4-0A;
	Wed, 08 Feb 2023 12:17:03 +0000
Date: Wed, 8 Feb 2023 20:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.2-rc3 12/20]
 arch/m68k/include/asm/page_no.h:30:26: error: invalid operands to binary <<
 (have 'void *' and 'int')
Message-ID: <202302082037.45I7Wat6-lkp@intel.com>
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
commit: 246a4c87fbded16b1202eac820589fbf249f129f [12/20] m68k/mm: Make pfn accessors static inlines
config: m68k-randconfig-r035-20230204 (https://download.01.org/0day-ci/archive/20230208/202302082037.45I7Wat6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=246a4c87fbded16b1202eac820589fbf249f129f
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.2-rc3
        git checkout 246a4c87fbded16b1202eac820589fbf249f129f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:62,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from arch/m68k/include/asm/current.h:16,
                    from include/linux/sched.h:12,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/page_no.h: In function 'pfn_to_virt':
>> arch/m68k/include/asm/page_no.h:30:26: error: invalid operands to binary << (have 'void *' and 'int')
      30 |         return __va(pfn) << PAGE_SHIFT;
         |                          ^~
   make[2]: *** [scripts/Makefile.build:114: arch/m68k/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +30 arch/m68k/include/asm/page_no.h

    27	
    28	static inline void * pfn_to_virt(unsigned long pfn)
    29	{
  > 30		return __va(pfn) << PAGE_SHIFT;
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
