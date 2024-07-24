Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7415920B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721834553; cv=none; b=rtFPooTeghkClg8iCcdImn8qZ9mVdtzM4OXoqACj5mrYg3seLqsSgdCOyQfKVHzYL2yz9SGB8BwEDVPfqUhBtJkckalETnKRrg9e1XgQIWbyzlcpc5rP3I5GFKCbu3YeFTLOas+lmHZX/1mG1XoKZBxy+HrXSqz8B7XpNeRNwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721834553; c=relaxed/simple;
	bh=nmMn3/E//pAkR6mxy37ZNnrta9z//ITiIeXMmQv1uV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErVEL018SUXV6np88N4Fl7a9HQtDHMt5c1gyY0XFS1mxuHJeOqZMa8qbbSOO7W9qa+iPslR7QO4z4EPF2DxBjmSRENZpaUazrCpJZSpGWZFdFTaBBqHbXkAKnaBWYOE5ngBLDJKKDpe2xEsTe0PTiJDno09G+472g8r7AfGzu+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONNUqdlt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONNUqdlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721834552; x=1753370552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmMn3/E//pAkR6mxy37ZNnrta9z//ITiIeXMmQv1uV8=;
  b=ONNUqdlthi6cLMKvW2RM08qqWmjZIqa73JLjiU2wZiIKJudcye2JUaTA
   2JBCebCBxOA2iapnGmyef3xs8ldrXS2lxeBbFgcC8AMGKiCXI9R/hk9s3
   8KlJlPaqBgdXQjwA11UMkAT1hQmpcF8U0WBCewUqmX+uBbhV3iIzopc/U
   OTPU6Nf+3HjxsWhhmW9rC4wIAc1GWkndoF5TNDIKsXEeFpn6kFpnLl+cE
   R0Pnp54CfMw6wsmM6TBQeDSDCsvmwAFCf89vrAkb4oYzMzLhoc68SPQcW
   OsTLJOZujUQR0Y4zvbrwQX68iYesbK8JfAOrV5TaUQynFQov6RyiaSHUm
   A==;
X-CSE-ConnectionGUID: uulJB/wRRkqVzFiRW+7GNQ==
X-CSE-MsgGUID: O6WCv9waQpqukMAmmVky4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30122650"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30122650"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 08:22:28 -0700
X-CSE-ConnectionGUID: 3GZVpb0jQZym5I8e/lM/Ng==
X-CSE-MsgGUID: N4401Ii7Sh2XYtA3ZOEr9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="83226369"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jul 2024 08:22:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWdor-000n70-1k;
	Wed, 24 Jul 2024 15:22:21 +0000
Date: Wed, 24 Jul 2024 23:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 36/41]
 arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible
 pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc
 *'
Message-ID: <202407242340.2qnLeYK9-lkp@intel.com>
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
commit: e1190b1dfe88c581729aa2c155042c52c2933478 [36/41] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240724/202407242340.2qnLeYK9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242340.2qnLeYK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242340.2qnLeYK9-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   arch/powerpc/include/asm/book3s/64/hash-64k.h:277:18: warning: declaration of 'struct ptdesc' will not be visible outside of this function [-Wvisibility]
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
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
    1372 |         return hash__pgtable_trans_huge_deposit(mm, pmdp, ptdesc);
         |                                                           ^~~~~~
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
   6 warnings and 1 error generated.
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1372 arch/powerpc/include/asm/book3s/64/pgtable.h

  1355	
  1356	#define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
  1357	pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
  1358					   unsigned long addr,
  1359					   pmd_t *pmdp, int full);
  1360	
  1361	#define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
  1362	pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
  1363					   unsigned long addr,
  1364					   pud_t *pudp, int full);
  1365	
  1366	#define __HAVE_ARCH_PGTABLE_DEPOSIT
  1367	static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
  1368						      pmd_t *pmdp, struct ptdesc *ptdesc)
  1369	{
  1370		if (radix_enabled())
  1371			return radix__pgtable_trans_huge_deposit(mm, pmdp, ptdesc);
> 1372		return hash__pgtable_trans_huge_deposit(mm, pmdp, ptdesc);
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
