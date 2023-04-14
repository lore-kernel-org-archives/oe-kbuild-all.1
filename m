Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC47B7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 04:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681448190; x=1712984190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25are1nBw+sCN7DMjjdg1PWJpLr9rzer5Ke92O4Kb7Y=;
  b=ibdPU0bxFMA2HuuhJ9AbuCKp+FClkK0JnZ5xa/b24fuvUEv7k0mBhdyZ
   wMwAbtNhsKwhV5f10QzS/5usAC7Ypf6QpctlLAehs+yCT5ZmpoxhePQHt
   r3ma272bhEle5/NOXTeVD2z2C2EXPGkfG5h8pMaSoiE459/W4fScnwU04
   ykj0HQn3pZq7VSSHOuR6z/atrvtm0jKEN58iNgyto8kqTtrc6thC+ImY8
   uAgWOovYZC0F++5JzfJl9XlEThdwPhR8H4Cq9aoyDpqpPAOducStjySB1
   GEyTUeS6IXa75JzhEiFSzKqELp04878NkCeZGDdapr3t+HnGD6igjSpJ/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324736279"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324736279"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 21:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="801042910"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="801042910"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 21:56:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnBTq-000ZEv-3B;
	Fri, 14 Apr 2023 04:56:14 +0000
Date: Fri, 14 Apr 2023 12:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:cove_integeration_v2 1/50]
 arch/sparc/include/asm/io_64.h:434:58: error: 'X' undeclared
Message-ID: <202304141243.9BlAy9zh-lkp@intel.com>
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
commit: e32ab24e32712babc0a3116f5271a0a26e619395 [1/50] asm/io.h: Add iounmap_driver_hardened
config: sparc-randconfig-r014-20230409 (https://download.01.org/0day-ci/archive/20230414/202304141243.9BlAy9zh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/e32ab24e32712babc0a3116f5271a0a26e619395
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 cove_integeration_v2
        git checkout e32ab24e32712babc0a3116f5271a0a26e619395
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141243.9BlAy9zh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/io.h:5,
                    from include/linux/io.h:13,
                    from include/linux/pci.h:39,
                    from lib/devres.c:3:
   lib/devres.c: In function 'devm_ioremap_release':
>> arch/sparc/include/asm/io_64.h:434:58: error: 'X' undeclared (first use in this function)
     434 | #define iounmap_driver_hardened                 iounmap((X))
         |                                                          ^
   lib/devres.c:19:17: note: in expansion of macro 'iounmap_driver_hardened'
      19 |                 iounmap_driver_hardened(*(void __iomem **)res);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/io_64.h:434:58: note: each undeclared identifier is reported only once for each function it appears in
     434 | #define iounmap_driver_hardened                 iounmap((X))
         |                                                          ^
   lib/devres.c:19:17: note: in expansion of macro 'iounmap_driver_hardened'
      19 |                 iounmap_driver_hardened(*(void __iomem **)res);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +/X +434 arch/sparc/include/asm/io_64.h

   425	
   426	#define ioremap_uc(X,Y)			ioremap((X),(Y))
   427	#define ioremap_wc(X,Y)			ioremap((X),(Y))
   428	#define ioremap_wt(X,Y)			ioremap((X),(Y))
   429	/* Share memory with host in confidential guest platforms */
   430	#define ioremap_driver_hardened(X, Y)	ioremap((X), (Y))
   431	/* Share memory with host in confidential guest platforms (WB version) */
   432	#define ioremap_cache_shared(X, Y)	ioremap((X), (Y))
   433	/* Unmap memory shared with the host in confidential guest platforms */
 > 434	#define iounmap_driver_hardened			iounmap((X))
   435	#define ioremap_driver_hardened_uc(X, Y)	ioremap_uc((X), (Y))
   436	#define ioremap_driver_hardened_wc(X, Y)	ioremap_wc((X), (Y))
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
