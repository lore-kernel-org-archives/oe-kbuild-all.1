Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FC85CBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674920440; x=1706456440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYX/Ve95c4Jq8K46vWVPwCJPinspKLns1ajwL5ICjzI=;
  b=QUUIChWOj2TLuSFqPsTT5IQaTiCQQrmXPqNu95Z1UzgdQOaJO0jc/NgC
   YpKEHDdkTh0gAKyyrf3DRSnmErw6kG9vk+PDDYj07VM8rqMv1nc9LkW5u
   RwCyrNz1ti0Z05as/3hnZ2gjWmycaQi13Eunh2QECj2GYLNS1t5RpSNvn
   nn8RxcX0cW2i+x7sDXJfatfy0Hh0UdqzwwnJgpaql6tIOQgAG0Lef/WXf
   M+/N6uBRXPJes4ETM4L7wYynt2b5wgk1CJowxNLumG24BPCH+94Dm1y7r
   4GC2zBzKKCAaFWwd/WkBsCFwQ9fH/EaPpnu9LSs37TDAl7hIrUGk5v1uK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="391855173"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="391855173"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 07:40:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="695881728"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="695881728"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jan 2023 07:40:39 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLnJm-0000qj-0U;
	Sat, 28 Jan 2023 15:40:38 +0000
Date: Sat, 28 Jan 2023 23:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v2 4/4] arch/xtensa/include/asm/page.h:34:25:
 error: implicit declaration of function '_AC'
Message-ID: <202301282310.ig9OY108-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v2
head:   d155b3698ab1a295c1db9d8729ce2645147739f8
commit: d155b3698ab1a295c1db9d8729ce2645147739f8 [4/4] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: xtensa-nommu_kc705_defconfig (https://download.01.org/0day-ci/archive/20230128/202301282310.ig9OY108-lkp@intel.com/config)
compiler: xtensa-de212-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=d155b3698ab1a295c1db9d8729ce2645147739f8
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v2
        git checkout d155b3698ab1a295c1db9d8729ce2645147739f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/generic-radix-tree.h:39,
                    from lib/generic-radix-tree.c:3:
   include/asm-generic/memory_model.h: In function 'pfn_valid':
>> arch/xtensa/include/asm/page.h:34:25: error: implicit declaration of function '_AC' [-Werror=implicit-function-declaration]
      34 | #define PHYS_OFFSET     _AC(CONFIG_DEFAULT_MEM_START, UL)
         |                         ^~~
   arch/xtensa/include/asm/page.h:162:34: note: in expansion of macro 'PHYS_OFFSET'
     162 | #define ARCH_PFN_OFFSET         (PHYS_OFFSET >> PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   include/asm-generic/memory_model.h:27:36: note: in expansion of macro 'ARCH_PFN_OFFSET'
      27 |         unsigned long pfn_offset = ARCH_PFN_OFFSET;
         |                                    ^~~~~~~~~~~~~~~
>> arch/xtensa/include/asm/page.h:34:55: error: 'UL' undeclared (first use in this function)
      34 | #define PHYS_OFFSET     _AC(CONFIG_DEFAULT_MEM_START, UL)
         |                                                       ^~
   arch/xtensa/include/asm/page.h:162:34: note: in expansion of macro 'PHYS_OFFSET'
     162 | #define ARCH_PFN_OFFSET         (PHYS_OFFSET >> PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   include/asm-generic/memory_model.h:27:36: note: in expansion of macro 'ARCH_PFN_OFFSET'
      27 |         unsigned long pfn_offset = ARCH_PFN_OFFSET;
         |                                    ^~~~~~~~~~~~~~~
   arch/xtensa/include/asm/page.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
      34 | #define PHYS_OFFSET     _AC(CONFIG_DEFAULT_MEM_START, UL)
         |                                                       ^~
   arch/xtensa/include/asm/page.h:162:34: note: in expansion of macro 'PHYS_OFFSET'
     162 | #define ARCH_PFN_OFFSET         (PHYS_OFFSET >> PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   include/asm-generic/memory_model.h:27:36: note: in expansion of macro 'ARCH_PFN_OFFSET'
      27 |         unsigned long pfn_offset = ARCH_PFN_OFFSET;
         |                                    ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/_AC +34 arch/xtensa/include/asm/page.h

9a8fd558990215 include/asm-xtensa/page.h      Chris Zankel    2005-06-23  26  
e5083a63b6a854 arch/xtensa/include/asm/page.h Johannes Weiner 2009-03-04  27  #ifdef CONFIG_MMU
9a8fd558990215 include/asm-xtensa/page.h      Chris Zankel    2005-06-23  28  #define PAGE_OFFSET	XCHAL_KSEG_CACHED_VADDR
a9f2fc628e3a26 arch/xtensa/include/asm/page.h Max Filippov    2016-04-13  29  #define PHYS_OFFSET	XCHAL_KSEG_PADDR
d39af90265feb4 arch/xtensa/include/asm/page.h Max Filippov    2016-04-11  30  #define MAX_LOW_PFN	(PHYS_PFN(XCHAL_KSEG_PADDR) + \
d39af90265feb4 arch/xtensa/include/asm/page.h Max Filippov    2016-04-11  31  			 PHYS_PFN(XCHAL_KSEG_SIZE))
e5083a63b6a854 arch/xtensa/include/asm/page.h Johannes Weiner 2009-03-04  32  #else
aea731c81f998a arch/xtensa/include/asm/page.h Max Filippov    2018-08-13  33  #define PAGE_OFFSET	_AC(CONFIG_DEFAULT_MEM_START, UL)
aea731c81f998a arch/xtensa/include/asm/page.h Max Filippov    2018-08-13 @34  #define PHYS_OFFSET	_AC(CONFIG_DEFAULT_MEM_START, UL)
3de00482b006da arch/xtensa/include/asm/page.h Max Filippov    2016-07-23  35  #define MAX_LOW_PFN	PHYS_PFN(0xfffffffful)
e5083a63b6a854 arch/xtensa/include/asm/page.h Johannes Weiner 2009-03-04  36  #endif
e5083a63b6a854 arch/xtensa/include/asm/page.h Johannes Weiner 2009-03-04  37  

:::::: The code at line 34 was first introduced by commit
:::::: aea731c81f998af5e45654459bac24a1c808fb22 xtensa: rework {CONFIG,PLATFORM}_DEFAULT_MEM_START

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
