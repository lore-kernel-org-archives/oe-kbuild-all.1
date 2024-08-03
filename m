Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F34D272
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722655627; cv=none; b=katMBW7yi7Tdp2mswqOwbIZk8tovpxeTresAGlsiZV1Phf5kWUeR6XlLMXlDJDtJAU2Lok661P1Hqmnlr80YHnHN2AhqcvnRzqwFqmyGUL5HR5ul4p5EMlXvtDlAfXLT5rWJ35Pzgpm/OStPxaYo8b6Q1tp2MJeRWlR76rctodw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722655627; c=relaxed/simple;
	bh=JF+P6Y4wlPuHMWPWecbAuG3o8hYeE4p0W6PopneepNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ANsM1hEy4aOQPFj274YDW0mXZqhw6psYr7IKs0d3aNP/ddqvs5QLEjoJz5ZAmNMO33aI77BlvGh9dL6ri4ByVPArjW7oq6QarKaUZQdyNQ/VeIajbS+uxP6WiL/h8IcYx+E7UWo6QTRjlt6v6bTmjdZKxKITtCCdKosYxTe3F7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyubiQS5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyubiQS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722655625; x=1754191625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JF+P6Y4wlPuHMWPWecbAuG3o8hYeE4p0W6PopneepNg=;
  b=LyubiQS5o5GJsD1e2kfW9dj/Mpcel34damV1Fs1JQu6WKfcLaP/pl1Ei
   PNPSAHdjW+feWchiX7Zzt22CynyIFdrjT25EeyaA7tMuDS8T6p8gTQVF2
   tGCqLMItDdSq+IFWf/Uqa0S41lDb1XM6Yh6l0HtGRoVtfplWnA54ij0w8
   MqOVDI68PTg/qXEItLF/bRY5BacXfucSRiItaTlGz4xfWbpIqsRwtVOXi
   u2VvIYjAFiG0YwUjjowFG0QG/5GH33rUGUptgNnnyElYClq61KysGl7St
   KNcRGIhTVSYEogXoC2z4Y6uXLULL4UBqEb+iXIQrIBVIvD5WommtRFuqa
   w==;
X-CSE-ConnectionGUID: SDYNqlaWRs2uxmWMbYXn0A==
X-CSE-MsgGUID: vUos73TMRcGaibrTS4TOUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31839928"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="31839928"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 20:27:04 -0700
X-CSE-ConnectionGUID: fgkICvSeRla2LBGZXlRNIg==
X-CSE-MsgGUID: MDqN6xH+SXWBxL8kkFS6UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="78880736"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Aug 2024 20:27:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa5Q5-000xx8-0a;
	Sat, 03 Aug 2024 03:27:01 +0000
Date: Sat, 3 Aug 2024 11:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 14/17]
 arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible
 pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc
 *'
Message-ID: <202408031130.UnwgnuLS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   3735e634f8feb67c941d17222b53906ace2fd2b8
commit: 8ac2ea5f299444d065b292043aed0a1e94996159 [14/17] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031130.UnwgnuLS-lkp@intel.com/

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
   In file included from arch/powerpc/include/asm/mmu.h:377:
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
   In file included from arch/powerpc/include/asm/mmu.h:377:
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
   In file included from include/linux/mm.h:2234:
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
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
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
