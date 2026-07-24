Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39709434E30
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919463; cv=none; b=Bqg0rTwdqFa5Jer4zRwPHikIjmzm8bB0Yadi5MS5/0wfOjbfvtkYxS9FkvU7z0YA5LQtlzfUJjLOzPomzTjjpTHnbdFDyDngY7PBxCQcx7/KgopRHa8sGQXddyZ4TBafKZC08I0qobeWKzZOJELFtttmejiV8JK5LL2nlsJzqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919463; c=relaxed/simple;
	bh=SKCdcw2zWVGjAqj74n5UZUa057CU4QJhMCsD6T3FN08=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SaGuQuxf1at7vTCHBLjV++QsenuDVFNqX/TSYTf6RuF9xpS74F4ajUAeJyrG5BG1QsC1uH+LeqITgsoM0cuZ05yM617yvkhl0UB5wTWuDgvSjEU9ShVMvV+/6yfmARCl6THGZg7uBw5qlT52eC/9VB5h2AW7jZ0S5jbFifs+9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WumVFhtx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WumVFhtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784919460; x=1816455460;
  h=date:from:to:cc:subject:message-id;
  bh=SKCdcw2zWVGjAqj74n5UZUa057CU4QJhMCsD6T3FN08=;
  b=WumVFhtxlKPZdp/g2nUAK7iPFR28mJzY0sr8aQWneOKhm1rUEuFepnLu
   e8Kq6Dsm//cpx4MmJ5jIzh/U4LaeKfUTAMZhfsi7vOhYnuh8xv+G78L50
   psXP64c8eAEJ+DZ7L/XdVZ0R3fx+yWekOm0Cid4k+9hpaZ8o7INTpSOoT
   BKfi1YbdFbjn2yg2SNMhUQG7VyALg4yhN2QZK5VGcW6dpJT59lhvBp6Io
   inPw5oqCiekCgBFiVacQBFRKgytX5f10GpIGxhJ6nLg/odMhUuzobOz1e
   cQYzAzhR3AFNJ+k/ZDHMpp0g0ocru4gV+uYfDTdg0VVO+S8UCeikaRIX5
   w==;
X-CSE-ConnectionGUID: mtnauUC8SKqL/5CqxkC/8Q==
X-CSE-MsgGUID: twhauF/WRiqwLNusiPeC+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89264013"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="89264013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 11:57:38 -0700
X-CSE-ConnectionGUID: 2VBOm8iJTxGlVnxibJRPkQ==
X-CSE-MsgGUID: tbIaejRhQLOwSPwAUb/w/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="288766391"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Jul 2026 11:57:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnL5S-00000000106-01ZI;
	Fri, 24 Jul 2026 18:57:34 +0000
Date: Fri, 24 Jul 2026 20:57:24 +0200
From: kernel test robot <lkp@intel.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/filemap.c:3518:49: warning: passing argument 1 of
 'ptep_get' discards 'const' qualifier from pointer target type
Message-ID: <202607242033.hwaNwd9f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pedro-Falcato/mm-constify-generic-pte_get/20260724-184321
head:   06cbf73db932e6dbb5910dc4ec0bc7e2c43bfec6
commit: 06cbf73db932e6dbb5910dc4ec0bc7e2c43bfec6 mm: constify the pte_offset_map_ro_nolock() return value
date:   8 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260724/202607242033.hwaNwd9f-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607242033.hwaNwd9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607242033.hwaNwd9f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/s390/include/asm/uaccess.h:16,
                    from ./include/linux/uaccess.h:13,
                    from ./include/linux/sched/task.h:13,
                    from ./include/linux/sched/signal.h:9,
                    from ./include/linux/rcuwait.h:6,
                    from ./include/linux/percpu-rwsem.h:7,
                    from ./include/linux/fs/super_types.h:13,
                    from ./include/linux/fs/super.h:5,
                    from ./include/linux/fs.h:5,
                    from ./include/linux/dax.h:5,
                    from mm/filemap.c:15:
   ./include/linux/pgtable.h: In function 'ptep_get_lockless':
   ./include/linux/pgtable.h:782:25: warning: passing argument 1 of 'ptep_get' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     782 |         return ptep_get(ptep);
         |                         ^~~~
   In file included from ./include/linux/pgtable.h:6:
   ./arch/s390/include/asm/pgtable.h:989:37: note: expected 'pte_t *' {aka 'long unsigned int *'} but argument is of type 'const pte_t *' {aka 'const long unsigned int *'}
     989 | static inline pte_t ptep_get(pte_t *ptep)
         |                              ~~~~~~~^~~~
   In file included from ./include/linux/export.h:5,
                    from mm/filemap.c:13:
   mm/filemap.c: In function 'filemap_fault_recheck_pte_none':
>> mm/filemap.c:3518:49: warning: passing argument 1 of 'ptep_get' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3518 |                 if (unlikely(!pte_none(ptep_get(ptep))))
         |                                                 ^~~~
   ./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   ./arch/s390/include/asm/pgtable.h:989:37: note: expected 'pte_t *' {aka 'long unsigned int *'} but argument is of type 'const pte_t *' {aka 'const long unsigned int *'}
     989 | static inline pte_t ptep_get(pte_t *ptep)
         |                              ~~~~~~~^~~~


vim +3518 mm/filemap.c

ef00e08e26dd5d Linus Torvalds 2009-06-16  3482  
58f327f2ce80f9 ZhangPeng      2024-03-06  3483  static vm_fault_t filemap_fault_recheck_pte_none(struct vm_fault *vmf)
58f327f2ce80f9 ZhangPeng      2024-03-06  3484  {
58f327f2ce80f9 ZhangPeng      2024-03-06  3485  	struct vm_area_struct *vma = vmf->vma;
58f327f2ce80f9 ZhangPeng      2024-03-06  3486  	vm_fault_t ret = 0;
06cbf73db932e6 Pedro Falcato  2026-07-24  3487  	const pte_t *ptep;
58f327f2ce80f9 ZhangPeng      2024-03-06  3488  
58f327f2ce80f9 ZhangPeng      2024-03-06  3489  	/*
58f327f2ce80f9 ZhangPeng      2024-03-06  3490  	 * We might have COW'ed a pagecache folio and might now have an mlocked
58f327f2ce80f9 ZhangPeng      2024-03-06  3491  	 * anon folio mapped. The original pagecache folio is not mlocked and
58f327f2ce80f9 ZhangPeng      2024-03-06  3492  	 * might have been evicted. During a read+clear/modify/write update of
58f327f2ce80f9 ZhangPeng      2024-03-06  3493  	 * the PTE, such as done in do_numa_page()/change_pte_range(), we
58f327f2ce80f9 ZhangPeng      2024-03-06  3494  	 * temporarily clear the PTE under PT lock and might detect it here as
58f327f2ce80f9 ZhangPeng      2024-03-06  3495  	 * "none" when not holding the PT lock.
58f327f2ce80f9 ZhangPeng      2024-03-06  3496  	 *
58f327f2ce80f9 ZhangPeng      2024-03-06  3497  	 * Not rechecking the PTE under PT lock could result in an unexpected
58f327f2ce80f9 ZhangPeng      2024-03-06  3498  	 * major fault in an mlock'ed region. Recheck only for this special
58f327f2ce80f9 ZhangPeng      2024-03-06  3499  	 * scenario while holding the PT lock, to not degrade non-mlocked
58f327f2ce80f9 ZhangPeng      2024-03-06  3500  	 * scenarios. Recheck the PTE without PT lock firstly, thereby reducing
58f327f2ce80f9 ZhangPeng      2024-03-06  3501  	 * the number of times we hold PT lock.
58f327f2ce80f9 ZhangPeng      2024-03-06  3502  	 */
58f327f2ce80f9 ZhangPeng      2024-03-06  3503  	if (!(vma->vm_flags & VM_LOCKED))
58f327f2ce80f9 ZhangPeng      2024-03-06  3504  		return 0;
58f327f2ce80f9 ZhangPeng      2024-03-06  3505  
58f327f2ce80f9 ZhangPeng      2024-03-06  3506  	if (!(vmf->flags & FAULT_FLAG_ORIG_PTE_VALID))
58f327f2ce80f9 ZhangPeng      2024-03-06  3507  		return 0;
58f327f2ce80f9 ZhangPeng      2024-03-06  3508  
bd6ad65ddcbb2d Qi Zheng       2024-09-26  3509  	ptep = pte_offset_map_ro_nolock(vma->vm_mm, vmf->pmd, vmf->address,
24be02a42181f0 ZhangPeng      2024-03-13  3510  					&vmf->ptl);
58f327f2ce80f9 ZhangPeng      2024-03-06  3511  	if (unlikely(!ptep))
58f327f2ce80f9 ZhangPeng      2024-03-06  3512  		return VM_FAULT_NOPAGE;
58f327f2ce80f9 ZhangPeng      2024-03-06  3513  
58f327f2ce80f9 ZhangPeng      2024-03-06  3514  	if (unlikely(!pte_none(ptep_get_lockless(ptep)))) {
58f327f2ce80f9 ZhangPeng      2024-03-06  3515  		ret = VM_FAULT_NOPAGE;
58f327f2ce80f9 ZhangPeng      2024-03-06  3516  	} else {
58f327f2ce80f9 ZhangPeng      2024-03-06  3517  		spin_lock(vmf->ptl);
58f327f2ce80f9 ZhangPeng      2024-03-06 @3518  		if (unlikely(!pte_none(ptep_get(ptep))))
58f327f2ce80f9 ZhangPeng      2024-03-06  3519  			ret = VM_FAULT_NOPAGE;
58f327f2ce80f9 ZhangPeng      2024-03-06  3520  		spin_unlock(vmf->ptl);
58f327f2ce80f9 ZhangPeng      2024-03-06  3521  	}
58f327f2ce80f9 ZhangPeng      2024-03-06  3522  	pte_unmap(ptep);
58f327f2ce80f9 ZhangPeng      2024-03-06  3523  	return ret;
58f327f2ce80f9 ZhangPeng      2024-03-06  3524  }
58f327f2ce80f9 ZhangPeng      2024-03-06  3525  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
