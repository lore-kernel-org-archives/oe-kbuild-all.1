Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396449899
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLiZYv/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702927634; x=1734463634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sc7EdNeJDokQT2+rGVozm/W8LMj86aoC1mzS3as/z0c=;
  b=MLiZYv/6RdIBxO54jpXSbiTTkvkluJ5FK+UVMqwrBgabgSnnSrOvhc6v
   TXgh7XmUYtqGg9nQ09QaHiLUE/5sMU6rdxLXV8UY0xEK9/oykKq09b244
   uqvoo8EK40EVi6Jww943hw3uBhyuXrcmHH7ZfKbcaj4LY8UCWKSs5SB5a
   9Q69Emja68f4aeV6K+ita1F/DBLTjOmvfTSdMk6kemz2u+7lyjRHrEiif
   rDY0NgSaHdX2hDO3hKxILH+8H/dmP5J8bjh8TVtb1oAyU+xNFUpXog/dy
   dFoJCwXC0vBxFIOtBXpv/UD+qWfdkUqqOEdE83lrrSglo/VgD3IyI/1/t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="462008205"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="462008205"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 11:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="899083881"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="899083881"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Dec 2023 11:27:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFJGh-0004T3-0B;
	Mon, 18 Dec 2023 19:27:11 +0000
Date: Tue, 19 Dec 2023 03:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 31/49] arch/parisc/mm/init.c:534:29: error:
 invalid application of 'sizeof' to incomplete type 'struct shmid64_ds'
Message-ID: <202312190349.2AUFvMDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   0e034194a81f95ba6377786660a88f5403fcbf19
commit: 64b13e1eb9b7e21f6d2d78e5c5533a1045763d6b [31/49] shm: Slim down dependencies
config: parisc-randconfig-002-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190349.2AUFvMDO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190349.2AUFvMDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190349.2AUFvMDO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/parisc/mm/init.c: In function 'mem_init':
>> arch/parisc/mm/init.c:534:29: error: invalid application of 'sizeof' to incomplete type 'struct shmid64_ds'
     534 |         BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
         |                             ^~~~~~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/parisc/mm/init.c:534:9: note: in expansion of macro 'BUILD_BUG_ON'
     534 |         BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
         |         ^~~~~~~~~~~~


vim +534 arch/parisc/mm/init.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  526  
^1da177e4c3f41 Linus Torvalds 2005-04-16  527  void __init mem_init(void)
^1da177e4c3f41 Linus Torvalds 2005-04-16  528  {
d0cf62fb63f760 Helge Deller   2015-11-06  529  	/* Do sanity checks on IPC (compat) structures */
d0cf62fb63f760 Helge Deller   2015-11-06  530  	BUILD_BUG_ON(sizeof(struct ipc64_perm) != 48);
d0cf62fb63f760 Helge Deller   2015-11-06  531  #ifndef CONFIG_64BIT
d0cf62fb63f760 Helge Deller   2015-11-06  532  	BUILD_BUG_ON(sizeof(struct semid64_ds) != 80);
d0cf62fb63f760 Helge Deller   2015-11-06  533  	BUILD_BUG_ON(sizeof(struct msqid64_ds) != 104);
d0cf62fb63f760 Helge Deller   2015-11-06 @534  	BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
d0cf62fb63f760 Helge Deller   2015-11-06  535  #endif
d0cf62fb63f760 Helge Deller   2015-11-06  536  #ifdef CONFIG_COMPAT
d0cf62fb63f760 Helge Deller   2015-11-06  537  	BUILD_BUG_ON(sizeof(struct compat_ipc64_perm) != sizeof(struct ipc64_perm));
d0cf62fb63f760 Helge Deller   2015-11-06  538  	BUILD_BUG_ON(sizeof(struct compat_semid64_ds) != 80);
d0cf62fb63f760 Helge Deller   2015-11-06  539  	BUILD_BUG_ON(sizeof(struct compat_msqid64_ds) != 104);
d0cf62fb63f760 Helge Deller   2015-11-06  540  	BUILD_BUG_ON(sizeof(struct compat_shmid64_ds) != 104);
d0cf62fb63f760 Helge Deller   2015-11-06  541  #endif
d0cf62fb63f760 Helge Deller   2015-11-06  542  
48d27cb2299c0b Helge Deller   2009-01-18  543  	/* Do sanity checks on page table constants */
48d27cb2299c0b Helge Deller   2009-01-18  544  	BUILD_BUG_ON(PTE_ENTRY_SIZE != sizeof(pte_t));
48d27cb2299c0b Helge Deller   2009-01-18  545  	BUILD_BUG_ON(PMD_ENTRY_SIZE != sizeof(pmd_t));
48d27cb2299c0b Helge Deller   2009-01-18  546  	BUILD_BUG_ON(PGD_ENTRY_SIZE != sizeof(pgd_t));
48d27cb2299c0b Helge Deller   2009-01-18  547  	BUILD_BUG_ON(PAGE_SHIFT + BITS_PER_PTE + BITS_PER_PMD + BITS_PER_PGD
48d27cb2299c0b Helge Deller   2009-01-18  548  			> BITS_PER_LONG);
b7795074a04669 Helge Deller   2021-02-12  549  #if CONFIG_PGTABLE_LEVELS == 3
b7795074a04669 Helge Deller   2021-02-12  550  	BUILD_BUG_ON(PT_INITIAL > PTRS_PER_PMD);
b7795074a04669 Helge Deller   2021-02-12  551  #else
b7795074a04669 Helge Deller   2021-02-12  552  	BUILD_BUG_ON(PT_INITIAL > PTRS_PER_PGD);
b7795074a04669 Helge Deller   2021-02-12  553  #endif
48d27cb2299c0b Helge Deller   2009-01-18  554  

:::::: The code at line 534 was first introduced by commit
:::::: d0cf62fb63f760e98244d31396b3b58f3a1e326b parisc: Fixes and cleanups in kernel uapi header files

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
