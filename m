Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1963E7E5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675301107; x=1706837107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F34GK2VOzWe7o4/J1v5DZAxONy6MBq95AWepEaQ0lMY=;
  b=ACci/KWbX8h3E8RUnUC4ok/BHn3kVqOTi/jjtZg7JmBWNbcr/TGw2MFX
   D2RhQikglgx/XmA6YG14vpH1/KENIpq3uQNqlPsNhNYRMAD6rzQdTsTyN
   u+zrhZ+7pAxaWW5PEUvbD+FhfWkRlYI5LuOWMkUhzOoSG1LPDcQLxiCaf
   d1f7mr98HAtHKEbl8DnmVLBQdwAZArOHL+TL7oyDQ+8AnzVS2y1Rd/ZqF
   7gDuPmzmaB5bm77PJX2dfWJC86D1nb+r2fky9oraEQWGTXGJO11RCzfN4
   xmubEpYeS+IUXZaru2XAcSEOkXDNAkIVrrfGmKAoAfxSYCVBiAe3OnSNS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="328334749"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="328334749"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 17:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695579225"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="695579225"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Feb 2023 17:25:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNOLU-0005yo-0e;
	Thu, 02 Feb 2023 01:25:00 +0000
Date: Thu, 2 Feb 2023 09:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 6/25]
 arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
Message-ID: <202302020907.waQJ85f3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3
head:   ac3cfb78163256f2febd47ebd017d9f5b75820dd
commit: 2472f5903b11b4362be6823cdb6e0937b719aa99 [6/25] ARM: mm: Make virt_to_pfn() a static inline
config: arm-randconfig-r046-20230129 (https://download.01.org/0day-ci/archive/20230202/202302020907.waQJ85f3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=2472f5903b11b4362be6823cdb6e0937b719aa99
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout 2472f5903b11b4362be6823cdb6e0937b719aa99
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 
--
   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from fs/proc/meminfo.c:5:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 
   fs/proc/meminfo.c:22:28: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
      22 | void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
         |                            ^~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
>> arch/arm/include/asm/pgtable-nommu.h:49: warning: "ZERO_PAGE" redefined
      49 | #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
         | 
   arch/arm/include/asm/pgtable.h:19: note: this is the location of the previous definition
      19 | #define ZERO_PAGE(vaddr)        (empty_zero_page)
         | 


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
