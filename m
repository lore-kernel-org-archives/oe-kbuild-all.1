Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B1748F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 23:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739748852; cv=none; b=GMcsQrHwPH4Tro67kUjb0u3mOrjEHV5F9Hza9W4rHAPhnpZ1uooL18Ds0rRNoW9pSP456bKuWyFd9ywpweRM1pB9fDSGd+y4rLFGJuud2i1vlUqEUL8Pb8nt7wi/E5QsCiQxaazHBFKgQhTaiMeSCTJnXeIyFFvJ9FNOjjt2TFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739748852; c=relaxed/simple;
	bh=sh6WEbsdK8zf+wZP9pFNhR2iC7q/uHWv/nFIBA2UouI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/Ihp84rehh2iN1/tZXi2GMnrKXD0VGJdmjpyx91NXaINXOIYlsfvkhkpVXgVmVZRb/kGEU1F+pYnZPLbspqBdi5Dl08RVNW1LFowKeUuibN/s4dhp68tlgmHTqM4aJlLiha/U04sb2NXy+yvqgUnV2GEn75Hg92n1XNsG1TP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=To+YzTLf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="To+YzTLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739748850; x=1771284850;
  h=date:from:cc:subject:message-id:mime-version;
  bh=sh6WEbsdK8zf+wZP9pFNhR2iC7q/uHWv/nFIBA2UouI=;
  b=To+YzTLfqY90FsOnRcY1Hq29mmD0jQSfw0zxYJSEgE2VjiPOK6AfSKu6
   w19t+DmfYn2K8MIgtHlXH+jZzlaqRfGtUpMc/BdVSkRBzk3jJmOjSdBN1
   RAF2FZlk4+yurcpw1CCVtPPlN5ux+0+qEz2IMYDBOlm9Zmk5TLVIRITdF
   q5yHVitk4ItvONZCRWv2CgLHQ8ncmWpz9Hc9Y1Be4cTbEknv5xmTbdHr2
   apTY1fNTEqaeKvZMv5Wb1qvVhkpuF2EHcIAErqmV+IBACZHtpvJdu6SER
   89KV0UyiVtVDuQunrSqtpsq4xBLY3CskVCEt3GPZAzk9rT1r2FiPCNVDi
   A==;
X-CSE-ConnectionGUID: p+dKd4f+R5WMGjX33d3lWA==
X-CSE-MsgGUID: ByTqClwjRcOstK7fWU0kig==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="28024830"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="28024830"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 15:34:09 -0800
X-CSE-ConnectionGUID: FAqOyoRNQaqx7UGQhQC2iA==
X-CSE-MsgGUID: hrAqDzrxSqiHzaKqe2URzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="113705427"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Feb 2025 15:34:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjo9G-001CN1-2O
	for oe-kbuild-all@lists.linux.dev;
	Sun, 16 Feb 2025 23:34:06 +0000
Date: Mon, 17 Feb 2025 07:33:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] mm/vmalloc.c:888:25: warning: 'lva' may be
 used uninitialized
Message-ID: <202502170746.gAVcWzwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 68ad4a3304335358f95a417f2a2b0c909e5119c4 [1/1] mm/vmalloc.c: keep track of free blocks for vmap allocation
config: parisc-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250217/202502170746.gAVcWzwc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170746.gAVcWzwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170746.gAVcWzwc-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:99,
                    from mm/vmalloc.c:12:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:90:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      90 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:319:34: note: in expansion of macro 'set_pte_at'
     319 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:90:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      90 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   mm/vmalloc.c: In function 'vmap_pte_range':
   arch/parisc/include/asm/pgtable.h:90:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      90 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   mm/vmalloc.c:156:17: note: in expansion of macro 'set_pte_at'
     156 |                 set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
         |                 ^~~~~~~~~~
   mm/vmalloc.c: At top level:
   mm/vmalloc.c:1103:6: warning: no previous prototype for 'set_iounmap_nonlazy' [-Wmissing-prototypes]
    1103 | void set_iounmap_nonlazy(void)
         |      ^~~~~~~~~~~~~~~~~~~
   In function 'adjust_va_to_fit_type',
       inlined from 'pcpu_get_vm_areas' at mm/vmalloc.c:3181:9:
>> mm/vmalloc.c:888:25: warning: 'lva' may be used uninitialized [-Wmaybe-uninitialized]
     888 |                         insert_vmap_area_augment(lva, &va->rb_node,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     889 |                                 &free_vmap_area_root, &free_vmap_area_list);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c: In function 'pcpu_get_vm_areas':
   mm/vmalloc.c:828:27: note: 'lva' was declared here
     828 |         struct vmap_area *lva;
         |                           ^~~


vim +/lva +888 mm/vmalloc.c

   822	
   823	static __always_inline int
   824	adjust_va_to_fit_type(struct vmap_area *va,
   825		unsigned long nva_start_addr, unsigned long size,
   826		enum fit_type type)
   827	{
   828		struct vmap_area *lva;
   829	
   830		if (type == FL_FIT_TYPE) {
   831			/*
   832			 * No need to split VA, it fully fits.
   833			 *
   834			 * |               |
   835			 * V      NVA      V
   836			 * |---------------|
   837			 */
   838			unlink_va(va, &free_vmap_area_root);
   839			kmem_cache_free(vmap_area_cachep, va);
   840		} else if (type == LE_FIT_TYPE) {
   841			/*
   842			 * Split left edge of fit VA.
   843			 *
   844			 * |       |
   845			 * V  NVA  V   R
   846			 * |-------|-------|
   847			 */
   848			va->va_start += size;
   849		} else if (type == RE_FIT_TYPE) {
   850			/*
   851			 * Split right edge of fit VA.
   852			 *
   853			 *         |       |
   854			 *     L   V  NVA  V
   855			 * |-------|-------|
   856			 */
   857			va->va_end = nva_start_addr;
   858		} else if (type == NE_FIT_TYPE) {
   859			/*
   860			 * Split no edge of fit VA.
   861			 *
   862			 *     |       |
   863			 *   L V  NVA  V R
   864			 * |---|-------|---|
   865			 */
   866			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
   867			if (unlikely(!lva))
   868				return -1;
   869	
   870			/*
   871			 * Build the remainder.
   872			 */
   873			lva->va_start = va->va_start;
   874			lva->va_end = nva_start_addr;
   875	
   876			/*
   877			 * Shrink this VA to remaining size.
   878			 */
   879			va->va_start = nva_start_addr + size;
   880		} else {
   881			return -1;
   882		}
   883	
   884		if (type != FL_FIT_TYPE) {
   885			augment_tree_propagate_from(va);
   886	
   887			if (type == NE_FIT_TYPE)
 > 888				insert_vmap_area_augment(lva, &va->rb_node,
   889					&free_vmap_area_root, &free_vmap_area_list);
   890		}
   891	
   892		return 0;
   893	}
   894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
