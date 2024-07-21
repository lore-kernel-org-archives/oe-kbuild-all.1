Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03801F19A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 21:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721598743; cv=none; b=LZxmsA8nSQ/aedHzBRARB81TWTB+Sx4Qguho5IPC51V+17kPkKWcShW2PZxU4bbtfHq2AKE2AjWSaYRG8HyT7vLdGoObf3hhqE85Zr5cJsYrGglbrKZmx7PRDtWOeDcUS6hvICJ+nmdfjQ2Zx4Ci86W85j4IUoX8Yqt6YGpkHa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721598743; c=relaxed/simple;
	bh=+zIt49lnqDcSmnO8B59PjpXkFxsWIWFI22x6dFQ7los=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrcfuxyxYiSeNdlAlBh8enDiT51iWXhOe9cqjaXCWThzslRDib7wxJc47oCWoG3ny7w2+pryaoDvSzEXjm171RVwsZpTmf3X885Wj3onfNy782vSbPOVy8RhT5jUb0Sk72lilrq2rZQiSGdLw2n6fbrHLZnqEVStnfUtwQQNO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSBL92SP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSBL92SP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721598740; x=1753134740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+zIt49lnqDcSmnO8B59PjpXkFxsWIWFI22x6dFQ7los=;
  b=TSBL92SPUsFiN2TbdtW55IJQcE2PKXDSEfoOIlovs+93dB44SSmBH27b
   cRMBTLWxE364yUeBzGMV1fVRzRN7TxBtTJHJXdv5R4GMw0+VcptLqCnER
   EGUSdkQk1vjDV8SGecaGB1FWuIsGzpv4q4keObL8AcgGIWTUCNcTBdI9s
   7Kxrwj3/iatG37v6ZaMXRHixvDHM2W+hmjK6Qry8Apmyor1/nBOy6nY0B
   0lXH7xJPKyj9xE5dWWV1l0iRNGMaBC21oFE0PzvyrS5isyBnB579nMrUi
   +V4J7OVJeXay5Qn93vzeE5cLOLzdgSFzwWfrFmvPKL3YQfgiYGzmjLaxS
   g==;
X-CSE-ConnectionGUID: Cd1STx2JQWCh0YBtcWpEoA==
X-CSE-MsgGUID: N/QLZBy6Rqq7Et6r1GW8fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="23018136"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="23018136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 14:52:20 -0700
X-CSE-ConnectionGUID: xXj0CwQBQJOPyfPo9CJutA==
X-CSE-MsgGUID: qYJ9u/oyRXq9YPzXEYH7UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56788835"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jul 2024 14:52:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVeTY-000kf4-2T;
	Sun, 21 Jul 2024 21:52:16 +0000
Date: Mon, 22 Jul 2024 05:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 35/43]
 arch/powerpc/include/asm/book3s/64/pgtable.h:1371:54: error: incompatible
 pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t'
 (aka 'pte_t *')
Message-ID: <202407220535.mz1u8bJ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   24c8778745b223097d5e3d590967626176306b1d
commit: e164d85b0aa7cdfe03777158ca995f093884d420 [35/43] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240722/202407220535.mz1u8bJ0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220535.mz1u8bJ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220535.mz1u8bJ0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1368:32: warning: declaration of 'struct ptdesc' will not be visible outside of this function [-Wvisibility]
    1368 |                                               pmd_t *pmdp, struct ptdesc *pgtable)
         |                                                                   ^
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1371:54: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1371 |                 return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
         |                                                                    ^~~~~~~
   arch/powerpc/include/asm/book3s/64/radix.h:294:16: note: passing argument to parameter 'pgtable' here
     294 |                                         pgtable_t pgtable);
         |                                                   ^
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
   arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1372 |         return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
         |                                                           ^~~~~~~
   arch/powerpc/include/asm/book3s/64/hash-64k.h:277:17: note: passing argument to parameter 'pgtable' here
     277 |                                          pgtable_t pgtable);
         |                                                    ^
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


vim +1371 arch/powerpc/include/asm/book3s/64/pgtable.h

3dfcb315d81e66 Aneesh Kumar K.V   2015-12-01  1355  
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1356  #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1357  pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1358  				   unsigned long addr,
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1359  				   pmd_t *pmdp, int full);
75358ea359e7c0 Aneesh Kumar K.V   2020-05-05  1360  
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1361  #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1362  pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1363  				   unsigned long addr,
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1364  				   pud_t *pudp, int full);
27af67f35631ac Aneesh Kumar K.V   2023-07-25  1365  
3dfcb315d81e66 Aneesh Kumar K.V   2015-12-01  1366  #define __HAVE_ARCH_PGTABLE_DEPOSIT
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1367  static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
e164d85b0aa7cd Alex Shi (Tencent  2024-07-19 @1368) 					      pmd_t *pmdp, struct ptdesc *pgtable)
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1369  {
bde3eb6222e496 Aneesh Kumar K.V   2016-04-29  1370  	if (radix_enabled())
bde3eb6222e496 Aneesh Kumar K.V   2016-04-29 @1371  		return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1372  	return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1373  }
3df33f12be2f6f Aneesh Kumar K.V   2016-04-29  1374  

:::::: The code at line 1371 was first introduced by commit
:::::: bde3eb6222e49673d2ee9dfdc6ab6e7b6ff69e91 powerpc/mm/radix: Add radix THP callbacks

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
