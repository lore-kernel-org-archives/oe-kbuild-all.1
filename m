Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F01775C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691580036; x=1723116036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d1lk1RwU666VUnAniJXK4fAYEvZLzdBNLE6kHH8jI0A=;
  b=njPGy1SMboQyksIbQAKjavBKf4dLBtJkK+KJXZkSCvVSNCNaUMlTA8G+
   5uSSEtsG6bCNyH/ANfsMQ6qxiUNE+s5AJ2enjTzCau9DfdjxPfderYWB2
   D5iv33GCpt65BhytDLC8k7m+Hl2egKfTqd6YYr1YMLzFrtnEjPLkL+I0h
   pCanengMhHpIWyxT45w4B68NkaKSKguFtbbA7ThjzU2YNIHWKNghaD7kc
   fMscBfgmf+HGJrz8+GrdjV775bX9Oh2woHziPd9IT1lUiG1ReGvhGtRt+
   4t33S36biLLSzlHvBW/7ErFOragHKXJuEa1h3c4HiaYwFuvPvQVQGYAcl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437461208"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="437461208"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 04:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="725364073"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="725364073"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Aug 2023 04:20:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qThEt-00064K-0F;
	Wed, 09 Aug 2023 11:20:31 +0000
Date: Wed, 9 Aug 2023 19:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-s390 2/2]
 arch/s390/include/asm/page.h:207:33: error: return discards 'const'
 qualifier from pointer target type
Message-ID: <202308091920.uWbQOI4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-s390
head:   8ecc52ceb357c56a3841a03f5743120a217d08b0
commit: 8ecc52ceb357c56a3841a03f5743120a217d08b0 [2/2] s390/mm: Make virt_to_pfn() a static inline
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230809/202308091920.uWbQOI4e-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091920.uWbQOI4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091920.uWbQOI4e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from arch/s390/include/asm/timex.h:13,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/test_bitops.c:9:
   include/linux/mm.h: In function 'lowmem_page_address':
>> arch/s390/include/asm/page.h:207:33: error: return discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
     207 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2120:16: note: in expansion of macro 'page_to_virt'
    2120 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/const +207 arch/s390/include/asm/page.h

16f48641716000 arch/s390/include/asm/page.h Heiko Carstens    2017-08-07  205  
16f48641716000 arch/s390/include/asm/page.h Heiko Carstens    2017-08-07  206  #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
3d84683bd737e3 arch/s390/include/asm/page.h David Hildenbrand 2015-11-16 @207  #define page_to_virt(page)	pfn_to_virt(page_to_pfn(page))
^1da177e4c3f41 include/asm-s390/page.h      Linus Torvalds    2005-04-16  208  

:::::: The code at line 207 was first introduced by commit
:::::: 3d84683bd737e397ae200e881a3230e469c59ad6 s390: introduce page_to_virt() and pfn_to_virt()

:::::: TO: David Hildenbrand <dahi@linux.vnet.ibm.com>
:::::: CC: Christian Borntraeger <borntraeger@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
