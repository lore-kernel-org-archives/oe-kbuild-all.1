Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6635CED8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927318; cv=none; b=JjEd7KIRyMaNO8rA4ZtCjC/34jtmifLgszLREFze3GBa/0Yv/lMgxCCBFGh0E+A0uMT4Vu1B8mzcbBF4WzQKVedW9lcVioxUgiMpowyxJskfHg3uW8GewHSTwTwQL6B/WQNDfWMNjYs1efw+yKlgTZ/CkgNQwWi64LNq6eYgUC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927318; c=relaxed/simple;
	bh=wwh9NNgaYIFrGb9jnkl3O8hP6UoWuAVK7ZfnS6VZJV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2S5g4IIUdxYHaCRxtkVf6XcpnoWtb9Qx58ZNMhULmj5G1yVkgr6aOW5r9CRf4Giv6vjVmznDDf/POB1yZZdwmLDKP0jEzFtIHZxblpBKSbHF/RdyidSQx8OnwMkbbtqVHmrpwJWPX35caY3duHOLLj5rNOVyT7lkCy4aYwgK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7411U+k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7411U+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756927317; x=1788463317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wwh9NNgaYIFrGb9jnkl3O8hP6UoWuAVK7ZfnS6VZJV0=;
  b=W7411U+k3HEybzsqhYcw2zjSUR6hRBgHLA2C8A/l6SS69Grccolg/1re
   mEOez/yKJRbCXp4EPnGeaYgPsTGoUBi9OMgdHl1wBLRAkBjL12LJFe7hx
   F7IZ3/ij3nnjrvh6va1MPZQoBr84CJ27qm9+gVeYWZqiBSxbEglxK4dHk
   VsUTWs2sHTlrNHJbfFcZD9KZ5uM4uLS8G1mLrRZeu0VFQE8uW9JDUkunQ
   jZASGUilQ7Jjp5OvaGYXhjG3plmww93nS6SdvKWUDwIf0Ab0Z3NAq3AGo
   Qo4QPrmkKVzsvn4ln9K4LladsrkCNYC/ZOczvVUo/Ux1+OVNf6x4/22Ie
   A==;
X-CSE-ConnectionGUID: +9VXwX/3S/itWb9djeujCw==
X-CSE-MsgGUID: nYUIuAVUQkmNynf6PG3mkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59110889"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="59110889"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 12:21:56 -0700
X-CSE-ConnectionGUID: 4zv/kassSemcdxwsRLPsGQ==
X-CSE-MsgGUID: CfgTtrV/T7OyDW5tkH5hTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176905160"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Sep 2025 12:21:54 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utt3I-0004Ln-2m;
	Wed, 03 Sep 2025 19:21:52 +0000
Date: Thu, 4 Sep 2025 03:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:nested_lazy_mmu 2/7]
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h:35:17: error: 'return'
 with no value, in function returning non-void
Message-ID: <202509040307.50Z30uOL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/6b/6bd8375a897e4aee7a5cb7a9583f3d365fe9c3de-first_error_kconfig --flag create-dir

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git nested_lazy_mmu
head:   95673e91d66295c538fe848aa7ce00753f02b2e1
commit: 6bd8375a897e4aee7a5cb7a9583f3d365fe9c3de [2/7] mm: introduce local state for lazy_mmu sections
config: powerpc64-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040307.50Z30uOL-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040307.50Z30uOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040307.50Z30uOL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/book3s/64/tlbflush.h:9,
                    from arch/powerpc/include/asm/book3s/tlbflush.h:6,
                    from arch/powerpc/include/asm/tlbflush.h:6,
                    from arch/powerpc/include/asm/pgtable.h:11,
                    from include/linux/pgtable.h:6,
                    from arch/powerpc/include/asm/kup.h:43,
                    from arch/powerpc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   arch/powerpc/include/asm/book3s/64/tlbflush-hash.h: In function 'arch_enter_lazy_mmu_mode':
>> arch/powerpc/include/asm/book3s/64/tlbflush-hash.h:35:17: error: 'return' with no value, in function returning non-void [-Wreturn-mismatch]
      35 |                 return;
         |                 ^~~~~~
   arch/powerpc/include/asm/book3s/64/tlbflush-hash.h:30:32: note: declared here
      30 | static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/powerpc/kernel/asm-offsets.s] Error 1 shuffle=3253080104
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=3253080104
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3253080104
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3253080104
   make: Target 'prepare' not remade because of errors.


vim +/return +35 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h

ee3b93ebfbed62 Aneesh Kumar K.V 2016-03-01  29  
6bd8375a897e4a Kevin Brodsky    2025-07-31  30  static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
ee3b93ebfbed62 Aneesh Kumar K.V 2016-03-01  31  {
1a472c9dba6b96 Aneesh Kumar K.V 2016-04-29  32  	struct ppc64_tlb_batch *batch;
ee3b93ebfbed62 Aneesh Kumar K.V 2016-03-01  33  
1a472c9dba6b96 Aneesh Kumar K.V 2016-04-29  34  	if (radix_enabled())
1a472c9dba6b96 Aneesh Kumar K.V 2016-04-29 @35  		return;
b9ef323ea1682f Nicholas Piggin  2022-10-14  36  	/*
b9ef323ea1682f Nicholas Piggin  2022-10-14  37  	 * apply_to_page_range can call us this preempt enabled when
b9ef323ea1682f Nicholas Piggin  2022-10-14  38  	 * operating on kernel page tables.
b9ef323ea1682f Nicholas Piggin  2022-10-14  39  	 */
b9ef323ea1682f Nicholas Piggin  2022-10-14  40  	preempt_disable();
1a472c9dba6b96 Aneesh Kumar K.V 2016-04-29  41  	batch = this_cpu_ptr(&ppc64_tlb_batch);
ee3b93ebfbed62 Aneesh Kumar K.V 2016-03-01  42  	batch->active = 1;
6bd8375a897e4a Kevin Brodsky    2025-07-31  43  
6bd8375a897e4a Kevin Brodsky    2025-07-31  44  	return LAZY_MMU_DEFAULT;
ee3b93ebfbed62 Aneesh Kumar K.V 2016-03-01  45  }
ee3b93ebfbed62 Aneesh Kumar K.V 2016-03-01  46  

:::::: The code at line 35 was first introduced by commit
:::::: 1a472c9dba6b9646fd36717968f6a531b4441c7d powerpc/mm/radix: Add tlbflush routines

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
