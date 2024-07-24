Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0144915ADB2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721829446; cv=none; b=Zvo98apkg6T1BsRGZJwRELDUPj1AaWI4pUXhv6VqpJtZwEC49IRDi8c8czrp6RvKjExdBgQTc6QeT6Wi6vT5BJUH5u5zDDuax09aYuOatbOaYu8D4L6hjIOv3RQxug7bUSPy+pYTpquIsHYzNBvdtf6mRIBHIzQjHgk7uyyZ0QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721829446; c=relaxed/simple;
	bh=BmcCKXypi9AjUOHsR+Ss9cdsh5t1B/551uIZs2l5P+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mWOhhw2zPZnTJq2FOnhFBCewzCYm43FGWafPrMrNmb5fAMnX+ESJrAeAtYXc/NG7YMVRaGxPBPpXGubHezNNtrhQUNSwsaoi0l19AMCu/SXKDa4m9aCoTXVtL74UQAHUFe7DGhVL1rKCbnxnlo0oOs5UNU5NNgP+4oZQ9jkZo4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOKkIfBT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOKkIfBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721829445; x=1753365445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BmcCKXypi9AjUOHsR+Ss9cdsh5t1B/551uIZs2l5P+c=;
  b=IOKkIfBTWjV/Rmn8UsHQBPdJbWKGmSByoQU7pE4vos9nUNvZJb4OWomQ
   SGm2C5eiLUsEttm941tpgME/KsqeUh9yLxpF6TLYnDfEmYkZAA4NjCCtw
   0L2gRkGbwH/QOyahcvznTuPQRhiOJORTcjFmnmX6Tub9UQ6KdWQyDja0M
   5IRj5BnnmQEv/IaUqEj0mUo0euQ7FzUqaM6lXuunikirteq3LFjDKvhQV
   ZGy/pvg/jjkXTbWfwUidP5bRskXp4SfFN4hVaSNcb1DtvcysY2LfaTZco
   KNWBnJTwfb0oNqdUFd3jELPyhDVeu01gyXoGLMCDi/mx12K8ROTt+dfp9
   g==;
X-CSE-ConnectionGUID: 8K4tNXYNQz6UlMiT0+g44Q==
X-CSE-MsgGUID: 44qFODsxRry0/4z9rxw5cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30107930"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30107930"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:57:22 -0700
X-CSE-ConnectionGUID: fUiYSAYGQb+LwbRZe04vnw==
X-CSE-MsgGUID: +hX1KqWPSXyT8ly+mcHNHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="53367251"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Jul 2024 06:57:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWcUY-000n3U-1m;
	Wed, 24 Jul 2024 13:57:18 +0000
Date: Wed, 24 Jul 2024 21:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 35/41]
 arch/powerpc/include/asm/book3s/64/hash-64k.h:277:18: warning: declaration
 of 'struct ptdesc' will not be visible outside of this function
Message-ID: <202407242145.qoR1fiIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: 0eb0bad67d339a9f84a2b8a3723eba5297425516 [35/41] mm/pgtable: return ptdesc pointer in pgtable_trans_huge_withdraw
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240724/202407242145.qoR1fiIi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242145.qoR1fiIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242145.qoR1fiIi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/powerpc/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:18:
   In file included from arch/powerpc/include/asm/mmu.h:385:
   In file included from arch/powerpc/include/asm/book3s/64/mmu.h:32:
   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
   In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:297:
   In file included from arch/powerpc/include/asm/book3s/64/hash.h:17:
>> arch/powerpc/include/asm/book3s/64/hash-64k.h:277:18: warning: declaration of 'struct ptdesc' will not be visible outside of this function [-Wvisibility]
     277 |                                              struct ptdesc *ptdesc);
         |                                                     ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/powerpc/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:18:
   In file included from arch/powerpc/include/asm/mmu.h:385:
   In file included from arch/powerpc/include/asm/book3s/64/mmu.h:32:
   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
   arch/powerpc/include/asm/book3s/64/pgtable.h:1371:54: error: incompatible pointer types passing 'pgtable_t' (aka 'pte_t *') to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
    1371 |                 return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
         |                                                                    ^~~~~~~
   arch/powerpc/include/asm/book3s/64/radix.h:294:21: note: passing argument to parameter 'ptdesc' here
     294 |                                         struct ptdesc *ptdesc);
         |                                                        ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/powerpc/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:23:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:18:
   In file included from arch/powerpc/include/asm/mmu.h:385:
   In file included from arch/powerpc/include/asm/book3s/64/mmu.h:32:
   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
   arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible pointer types passing 'pgtable_t' (aka 'pte_t *') to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
    1372 |         return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
         |                                                           ^~~~~~~
   arch/powerpc/include/asm/book3s/64/hash-64k.h:277:26: note: passing argument to parameter 'ptdesc' here
     277 |                                              struct ptdesc *ptdesc);
         |                                                             ^
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +277 arch/powerpc/include/asm/book3s/64/hash-64k.h

   270	
   271	extern unsigned long hash__pmd_hugepage_update(struct mm_struct *mm,
   272						   unsigned long addr, pmd_t *pmdp,
   273						   unsigned long clr, unsigned long set);
   274	extern pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma,
   275					   unsigned long address, pmd_t *pmdp);
   276	extern void hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 > 277						     struct ptdesc *ptdesc);
   278	extern struct ptdesc *hash__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
   279	extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
   280					       unsigned long addr, pmd_t *pmdp);
   281	extern int hash__has_transparent_hugepage(void);
   282	#endif /*  CONFIG_TRANSPARENT_HUGEPAGE */
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
