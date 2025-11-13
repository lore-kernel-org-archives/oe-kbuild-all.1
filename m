Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF0B33372D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030280; cv=none; b=Ssw9s1kmMkEYLzVMdrF9uyI39DQnePqlKRiupZqmbdMbpkqc7oVVJyiXrt4oqeJzSYbVkUmfPooBCk0sqoVB4olIarTJIcdoF49kwKSMhW9dXiKxJbZ3njLT7sq4UgsyBAaJJbaOW0kESNxOoj5URnqFiG3TfjSG1ZbH1BHZRO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030280; c=relaxed/simple;
	bh=hHr1I4S/12EFt6OZzY544YFd+qaiHb35HObCAWvCiN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OYzkC7x2L5qosGhubIDbCh3p3rjoCDRuFca4cHQNuPxsWMxdtUQMgTijLHJraFH+YNwP8XROMadZ5rJbIrWJoY52WtFBVv+/noejmfL4Deg5V8CbBY/n1nIXh9vE22iTCBAEQyKn5d8bpswu+q/Ar2+HBoSbIignRsPjWA24Pog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bb+eKj9e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bb+eKj9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763030278; x=1794566278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHr1I4S/12EFt6OZzY544YFd+qaiHb35HObCAWvCiN8=;
  b=Bb+eKj9eYbP//ZHDCldtyvPQzpUa59RUd+j0qTTmD8Lztat/UXixKL1I
   V3pT6Chw1lPRwOmzoUImMQY5x44szD+k+BjLs3VaIxJufKM5rVK6UR7Zi
   7RrLVSeDdqq14uKe6eg3GTZxmNLOnSM1yqTDDeh0MTNqPEp/+aPs+YUtC
   VqmpJZJDodDxPsIF7Mtl3VjHeJKKPMZhivoabecl5iNZJtZQZ8Y7UIeef
   A42tcvhQ7wt8uIohSrDH1FzV7QSDfuNt86bynn0CNRYN3tkJ+Xl+m9GDu
   719YirIIyERFG+W3cWlMPtkisHhvNmc0IqXu9iU10wv/KAGGQ5OY+23ZB
   w==;
X-CSE-ConnectionGUID: MbqBLZWeT2uutBSukrlR4Q==
X-CSE-MsgGUID: +VXQ1RGvSW6rHrKyb/kCMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68956841"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="68956841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 02:37:58 -0800
X-CSE-ConnectionGUID: GqzLSoVrT6eiA5GGUfXHIQ==
X-CSE-MsgGUID: xS+oONvnR+eKsHnLKO3GRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189901908"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 02:37:56 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJUiA-0005Ak-08;
	Thu, 13 Nov 2025 10:37:54 +0000
Date: Thu, 13 Nov 2025 18:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3182/3182] include/linux/migrate.h:102:2: error:
 expected identifier or '('
Message-ID: <202511131826.yzKdVxQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c9750f803899fe67a8d281d2d283e8d75d08d4d
commit: 2a212a2a044ed85140cdf66e516f6bde7da08e9d [3182/3182] mm: migrate: add isolate_and_migrate_folios()
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131826.yzKdVxQW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131826.yzKdVxQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131826.yzKdVxQW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:45:
>> include/linux/migrate.h:102:2: error: expected identifier or '('
     102 |         { return -EINVAL; }
         |         ^
   1 error generated.
--
   In file included from mm/shmem.c:72:
>> include/linux/migrate.h:102:2: error: expected identifier or '('
     102 |         { return -EINVAL; }
         |         ^
   mm/shmem.c:1699:50: error: too many arguments to function call, expected 3, have 4
    1699 |         folio = swap_cluster_readahead(swap, gfp, mpol, ilx);
         |                 ~~~~~~~~~~~~~~~~~~~~~~                  ^~~
   mm/swap.h:101:29: note: 'swap_cluster_readahead' declared here
     101 | static inline struct folio *swap_cluster_readahead(swp_entry_t entry,
         |                             ^                      ~~~~~~~~~~~~~~~~~~
     102 |                                 gfp_t gfp_mask, struct vm_fault *vmf)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
   In file included from mm/memory.c:68:
>> include/linux/migrate.h:102:2: error: expected identifier or '('
     102 |         { return -EINVAL; }
         |         ^
   In file included from mm/memory.c:89:
   In file included from arch/loongarch/include/asm/tlb.h:140:
   include/asm-generic/tlb.h:632:10: warning: parameter 'ptep' set but not used [-Wunused-but-set-parameter]
     632 |                 pte_t *ptep, unsigned int nr, unsigned long address)
         |                        ^
   In file included from mm/memory.c:89:
   arch/loongarch/include/asm/tlb.h:144:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     144 |         struct vm_area_struct vma;
         |                               ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
   mm/memory.c:5538:17: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
    5538 |         int flags = 0, nr_pages;
         |                        ^
   3 warnings and 1 error generated.
--
   In file included from mm/mprotect.c:25:
>> include/linux/migrate.h:102:2: error: expected identifier or '('
     102 |         { return -EINVAL; }
         |         ^
   In file included from mm/mprotect.c:38:
   In file included from arch/loongarch/include/asm/tlb.h:140:
   include/asm-generic/tlb.h:632:10: warning: parameter 'ptep' set but not used [-Wunused-but-set-parameter]
     632 |                 pte_t *ptep, unsigned int nr, unsigned long address)
         |                        ^
   In file included from mm/mprotect.c:38:
   arch/loongarch/include/asm/tlb.h:144:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     144 |         struct vm_area_struct vma;
         |                               ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
   2 warnings and 1 error generated.


vim +102 include/linux/migrate.h

    89	
    90	static inline void putback_movable_pages(struct list_head *l) {}
    91	static inline int migrate_pages(struct list_head *l, new_folio_t new,
    92			free_folio_t free, unsigned long private,
    93			enum migrate_mode mode, int reason, unsigned int *ret_succeeded)
    94		{ return -ENOSYS; }
    95	static inline struct folio *alloc_migration_target(struct folio *src,
    96			unsigned long private)
    97		{ return NULL; }
    98	static inline int isolate_and_migrate_folios(struct folio **folios, unsigned int nr_folios,
    99			new_folio_t get_new_folio, free_folio_t put_new_folio,
   100			unsigned long private, enum migrate_mode mode,
   101			unsigned int *nr_succeeded);
 > 102		{ return -EINVAL; }
   103	static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
   104		{ return false; }
   105	static inline bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
   106		{ return false; }
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
