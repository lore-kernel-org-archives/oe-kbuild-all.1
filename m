Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C59DDCD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721557338; cv=none; b=ltr9sm58+Tb7TQwGNTJVAExd7c4k2tc6E/rDI3NQAlrB9Day/FJynOiS8XFFHyiKX6M9d6lLtOKVnRRARYHQVgwBBzzO6r/360u/5qkRf23/bzNuF/Ql1t6UA16O/287j5gWEU5qJTw3NMz9ed90Rft+qKRrCwLy2urVmrBw94Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721557338; c=relaxed/simple;
	bh=rHoYRrVvbwZJYaclrQU/z8/oOLa2kSBcAV+5eeWkqbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ls5WA04xjwIlN9p9nD9I6E2duUGg38F4X9jpsrbfWKi41eYsRPj6h6KXocimymeCieDskTStlptHerSdOytSF9cs9g2cNdYUIVGUwO95tRtBd1en5iSVvQcMLfplgMMbNLtYlC4sPaMOjiCOv9xKN/8nDMEYhpyutNy1cJMMsGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ye+TNHC9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ye+TNHC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721557336; x=1753093336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rHoYRrVvbwZJYaclrQU/z8/oOLa2kSBcAV+5eeWkqbo=;
  b=Ye+TNHC9+Op0K79t71VGs9lcVCBXX5sBmzNc8dgDOcEPVNV1W4VgaJmA
   NPBuTnHio1dpmtVvsqG3X6LNsV6r5CyAMAD0UurH7yZD/Dz/0BVHHzx5x
   Y+gexkQ3uYGHNGS5wwr+loiIMGblx8/t7MfRApRfEAsLXXHwJI4ZZW8KQ
   BUO6jwvyO3TXZB9GdjMFcY7aLxCgXFuykF12tH4QcKG0Z7e6Dn4Pe5BHx
   gmmiWirQOIaALp+hP3cC90kGKk4iISeeuiuEy3stRLZFAoZCbMmMy3aSA
   V+LLd3lQ/Fv63LHEFwA36A116r7sCjFYtN38D/sAtFtoyl3LuFhIO1hce
   g==;
X-CSE-ConnectionGUID: gA4/vYj8Rg6HdzSSYOqzsw==
X-CSE-MsgGUID: ZMZx3bwDTk+rYwbuxjAZEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19262132"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="19262132"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 03:22:16 -0700
X-CSE-ConnectionGUID: FQUbVnAfQ2ibHOoTI6HqwA==
X-CSE-MsgGUID: uZJdvIFxSUijeMVkX7psbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51466097"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jul 2024 03:22:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVThk-000kBi-29;
	Sun, 21 Jul 2024 10:22:12 +0000
Date: Sun, 21 Jul 2024 18:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 38/42] mm/memory.c:4689:61: error: passing
 argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type
Message-ID: <202407211846.czaUfFyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: f4c4f25d6f74bc03fe3e095de591c9a78735d6d2 [38/42] mm: convert vmf.prealloc_pte to struct ptdesc pointer
config: powerpc64-randconfig-001-20240721 (https://download.01.org/0day-ci/archive/20240721/202407211846.czaUfFyF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211846.czaUfFyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211846.czaUfFyF-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'pmd_install':
   mm/memory.c:440:39: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
         |                                       |
         |                                       struct ptdesc *
   In file included from arch/powerpc/include/asm/book3s/pgalloc.h:10,
                    from arch/powerpc/include/asm/pgalloc.h:72,
                    from mm/memory.c:86:
   arch/powerpc/include/asm/book3s/64/pgalloc.h:165:43: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
     165 |                                 pgtable_t pte_page)
         |                                 ~~~~~~~~~~^~~~~~~~
   mm/memory.c: In function '__pte_alloc':
   mm/memory.c:454:30: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     454 |                 pte_free(mm, ptdesc);
         |                              ^~~~~~
         |                              |
         |                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/memory.c: In function 'deposit_prealloc_pte':
>> mm/memory.c:4689:61: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    4689 |         pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
         |                                                          ~~~^~~~~~~~~~~~~~
         |                                                             |
         |                                                             struct ptdesc *
   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from arch/powerpc/include/asm/mmu.h:385,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/smp.h:116,
                    from include/linux/kernel_stat.h:5,
                    from mm/memory.c:43:
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   mm/memory.c: In function 'do_fault':
   mm/memory.c:5199:36: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    5199 |                 pte_free(vm_mm, vmf->prealloc_pte);
         |                                 ~~~^~~~~~~~~~~~~~
         |                                    |
         |                                    struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~


vim +/pgtable_trans_huge_deposit +4689 mm/memory.c

  4683	
  4684	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  4685	static void deposit_prealloc_pte(struct vm_fault *vmf)
  4686	{
  4687		struct vm_area_struct *vma = vmf->vma;
  4688	
> 4689		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
  4690		/*
  4691		 * We are going to consume the prealloc table,
  4692		 * count that as nr_ptes.
  4693		 */
  4694		mm_inc_nr_ptes(vma->vm_mm);
  4695		vmf->prealloc_pte = NULL;
  4696	}
  4697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
