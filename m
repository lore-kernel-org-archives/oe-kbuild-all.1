Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4B3FEA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 09:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688032708; x=1719568708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wH86bF8rVkUs5g+pOQ/ciU5y7mYb3dJrkv4Vxk9CK6U=;
  b=j3VfEJdfF/rTHT828EaYVODvlFQwTPvLALv3rGnNQZipioJncTXJVUPv
   L33LQ/4CCom9aKGbl6AinVsB45nMZyoNuYzhMlb6soN3HvxC0t6piRWfe
   4J4vkpPs6EPYV2oQt7jByAAiAq9hh2xGD/LX0cya5SK5qMOVf3CLQDd9k
   y/s+ZqJMGTrGz8Hyes8oJUiCtLS97ZrlfU7OuKwLlMftbwVRrw6LqX2KT
   Bg7EeprYScEIGsfP5p8lfRLaeE1W0sTDWwvL/Ks+sNgd3WA2BVI7M9sfo
   suMG3A24Fw60aTbNwZ2dne2vnVK8o2H3eU4O84MFxKU5HwZHMWvxikztE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364617209"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="364617209"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 02:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="787321538"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="787321538"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jun 2023 02:58:21 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEoPs-000E2P-2D;
	Thu, 29 Jun 2023 09:58:20 +0000
Date: Thu, 29 Jun 2023 17:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 33/36] arch/parisc/kernel/setup.c:358:9:
 error: implicit declaration of function 'eisa_init'; did you mean
 'eisa_in32'?
Message-ID: <202306291732.PVUF2T5R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   b4b5b694fd1edc41bc3237f15e7b0368690132a9
commit: 762a3a488cea554bd65a4bd9819f8d451c3a0aef [33/36] parisc: Rename eisa_init() to parisc_eisa_init()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230629/202306291732.PVUF2T5R-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291732.PVUF2T5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291732.PVUF2T5R-lkp@intel.com/

Note: the deller-parisc/for-next HEAD b4b5b694fd1edc41bc3237f15e7b0368690132a9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/parisc/kernel/setup.c: In function 'parisc_init':
>> arch/parisc/kernel/setup.c:358:9: error: implicit declaration of function 'eisa_init'; did you mean 'eisa_in32'? [-Werror=implicit-function-declaration]
     358 |         eisa_init();
         |         ^~~~~~~~~
         |         eisa_in32
   cc1: some warnings being treated as errors


vim +358 arch/parisc/kernel/setup.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  348  
^1da177e4c3f41 Linus Torvalds 2005-04-16  349  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  350  	 * Need to register Asp & Wax before the EISA adapters for the IRQ
^1da177e4c3f41 Linus Torvalds 2005-04-16  351  	 * regions.  EISA must come before PCI to be sure it gets IRQ region
^1da177e4c3f41 Linus Torvalds 2005-04-16  352  	 * 0.
^1da177e4c3f41 Linus Torvalds 2005-04-16  353  	 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  354  #if defined(CONFIG_GSC_LASI) || defined(CONFIG_GSC_WAX)
^1da177e4c3f41 Linus Torvalds 2005-04-16  355  	gsc_init();
^1da177e4c3f41 Linus Torvalds 2005-04-16  356  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  357  #ifdef CONFIG_EISA
^1da177e4c3f41 Linus Torvalds 2005-04-16 @358  	eisa_init();
^1da177e4c3f41 Linus Torvalds 2005-04-16  359  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  360  

:::::: The code at line 358 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
