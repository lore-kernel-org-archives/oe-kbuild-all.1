Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA73D72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 12:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676550690; x=1708086690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9El2COOTjSRRe5ADJzTgVMurldDuMZjnIHovoTAZ+KQ=;
  b=MlRdiSB4+HmzX6MBFmTvCVGkBZ3o9pzkn9LeSVTFN+rqjNxdbWMpgX8l
   pvwE/I7Fhl+Vdml7tBnHBnlV5z0bENgPq0fP4Kuk7HzoTQ4Rh834lgp9g
   4Cl8ZUDKNKh8kSlOn5nhnEbAq2XbvQJX+YovOKTFRFPOIcVNOyCeAS+0Q
   f5hgZLy2lEIyrWNFDqSexwuNxQYrv65GCXwqKhxbzPLv8O8jmwHqMykX/
   oRRHBqFQtAoJIaeQdhmnhhKbRBo9pcIomBzia0Qs9f9cQgHUoclQcgdHc
   27ltSjOK8OKQ6Pzijet2O9AuDI40YHB7GEdGyvO4AeWIPni5JeIg16e17
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="329424224"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="329424224"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 04:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="663447075"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="663447075"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Feb 2023 04:31:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSdQ6-000AFs-0u;
	Thu, 16 Feb 2023 12:31:26 +0000
Date: Thu, 16 Feb 2023 20:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Pearson <rpearsonhpe@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [linux-next:master 7236/13217] arch/mips/include/asm/page.h:255:55:
 warning: cast to pointer from integer of different size
Message-ID: <202302162019.2WhIRkSA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   509583475828c4fd86897113f78315c1431edcc3
commit: 592627ccbdff0ec6fff00fc761142a76db750dd4 [7236/13217] RDMA/rxe: Replace rxe_map and rxe_phys_buf by xarray
config: mips-randconfig-r011-20230214 (https://download.01.org/0day-ci/archive/20230216/202302162019.2WhIRkSA-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=592627ccbdff0ec6fff00fc761142a76db750dd4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 592627ccbdff0ec6fff00fc761142a76db750dd4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302162019.2WhIRkSA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/page.h:270,
                    from arch/mips/include/asm/io.h:29,
                    from include/linux/io.h:13,
                    from arch/mips/include/asm/mips-cps.h:11,
                    from arch/mips/include/asm/smp-ops.h:16,
                    from arch/mips/include/asm/smp.h:21,
                    from include/linux/smp.h:113,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/libnvdimm.h:13,
                    from drivers/infiniband/sw/rxe/rxe_mr.c:7:
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_set_page':
>> arch/mips/include/asm/page.h:255:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     255 | #define virt_to_pfn(kaddr)      PFN_DOWN(virt_to_phys((void *)(kaddr)))
         |                                                       ^
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/mips/include/asm/page.h:255:33: note: in expansion of macro 'PFN_DOWN'
     255 | #define virt_to_pfn(kaddr)      PFN_DOWN(virt_to_phys((void *)(kaddr)))
         |                                 ^~~~~~~~
   arch/mips/include/asm/page.h:256:45: note: in expansion of macro 'virt_to_pfn'
     256 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                             ^~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c:216:29: note: in expansion of macro 'virt_to_page'
     216 |         struct page *page = virt_to_page(iova & mr->page_mask);
         |                             ^~~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_copy_dma':
>> arch/mips/include/asm/page.h:255:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     255 | #define virt_to_pfn(kaddr)      PFN_DOWN(virt_to_phys((void *)(kaddr)))
         |                                                       ^
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/mips/include/asm/page.h:255:33: note: in expansion of macro 'PFN_DOWN'
     255 | #define virt_to_pfn(kaddr)      PFN_DOWN(virt_to_phys((void *)(kaddr)))
         |                                 ^~~~~~~~
   arch/mips/include/asm/page.h:256:45: note: in expansion of macro 'virt_to_pfn'
     256 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                             ^~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c:291:24: note: in expansion of macro 'virt_to_page'
     291 |                 page = virt_to_page(iova & mr->page_mask);
         |                        ^~~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_do_atomic_op':
>> arch/mips/include/asm/page.h:255:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     255 | #define virt_to_pfn(kaddr)      PFN_DOWN(virt_to_phys((void *)(kaddr)))
         |                                                       ^
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/mips/include/asm/page.h:255:33: note: in expansion of macro 'PFN_DOWN'
     255 | #define virt_to_pfn(kaddr)      PFN_DOWN(virt_to_phys((void *)(kaddr)))
         |                                 ^~~~~~~~
   arch/mips/include/asm/page.h:256:45: note: in expansion of macro 'virt_to_pfn'
     256 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                             ^~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c:484:24: note: in expansion of macro 'virt_to_page'
     484 |                 page = virt_to_page(iova & PAGE_MASK);
         |                        ^~~~~~~~~~~~


vim +255 arch/mips/include/asm/page.h

e53639d8f31397 include/asm-mips/page.h      Ralf Baechle     2006-06-12  254  
37d15948eb7253 arch/mips/include/asm/page.h Florian Fainelli 2017-03-09 @255  #define virt_to_pfn(kaddr)   	PFN_DOWN(virt_to_phys((void *)(kaddr)))
37d15948eb7253 arch/mips/include/asm/page.h Florian Fainelli 2017-03-09  256  #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
d3ce88431892b7 arch/mips/include/asm/page.h Ralf Baechle     2012-12-28  257  

:::::: The code at line 255 was first introduced by commit
:::::: 37d15948eb72533757ff352cf6f92dc64daa291f MIPS: page.h: Define virt_to_pfn()

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: James Hogan <jhogan@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
