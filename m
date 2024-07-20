Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423E376E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 11:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721473513; cv=none; b=Oo+lUxon0GdSicpHyaaDHY0D92BMJFrzCNYGTNLsQwYgOrJwhcmB8QUQijqFdkc9NLML86aEZXtsNdGFjIDOxw4QW0bh4riLwLDTVRc8OgpbNo8zADe4OX7GTCNtgMy1NPyxkdqWah+/MI8YAWG/Vojw8vf/a7xwtbXaNOlr5Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721473513; c=relaxed/simple;
	bh=jKTIs039EYB/ybfCLDFM2r12wrW3fZw9gKzPgzCqDME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lINSd0nhCgmDync2QaVRs/HqSlgeL0HMGKeLdWc/XwFtkviXAhYERGhpwLZm/tN61CawEw1lKDNazZo/22tBHQxUjNt0yHA+uxQ6L90HEm8IFsH595LhILrHpy6zC4PAe4xqFJKZ9ZW78Ht/JvCumjexWOC81FpktPSa0FNYzlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AODoUBCj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AODoUBCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721473512; x=1753009512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jKTIs039EYB/ybfCLDFM2r12wrW3fZw9gKzPgzCqDME=;
  b=AODoUBCjbmfVPT2dA+2DF2QfFemzIBI4GAcoTLmeCNAtybLu3ozqnzzd
   z4JN0wRt8XNgyHEjuQrGm906bgk4BttH/hpOT5noO3nzAASFBC6pEVIwQ
   t+ILRvOiHyHPMscCnFJT7jvN/e+SQgZUau4XV2bDOXWPscKiLHIyYnMkV
   mTHrfQ1Ou1X7X4eymsIrU0PiGy0gU5eqfFeUUSOnFLPkvHKS05wDu5LeV
   pvKRrwigMO1w635OV1qw5XAYxpgsSL6IoXaFKhH5BLaPbOfk5cHNjwCRu
   L3J9bwtb3bkad2Gt3YITDz977KmURULfVpeIqmPWZjIlxbkk6MfTulL3+
   A==;
X-CSE-ConnectionGUID: 1TmMOTzjTqOMdDOf38NH6g==
X-CSE-MsgGUID: jeFuNkI0T9yoXK8j0loJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="36627197"
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="36627197"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 04:05:11 -0700
X-CSE-ConnectionGUID: Apw8hr7OS42d9uvjfXV35g==
X-CSE-MsgGUID: hjxzMaE6SSS28/WokrgjFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="82417027"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jul 2024 04:05:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV7tk-000j8Q-0x;
	Sat, 20 Jul 2024 11:05:08 +0000
Date: Sat, 20 Jul 2024 19:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 36/39] mm/mremap.c:286:35: error: implicit
 declaration of function 'pmd_ptdesc'; did you mean 'pmd_pte'?
Message-ID: <202407201900.yiChfSQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   5b4beac6bf48324f3642b506948938bb01169b77
commit: 84368e4373e673f216fd9b354366ea118ae56b0f [36/39] mm/pgtable: pass ptdesc to pmd_populate
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407201900.yiChfSQz-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201900.yiChfSQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201900.yiChfSQz-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mremap.c: In function 'move_normal_pmd':
>> mm/mremap.c:286:35: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'pmd_pte'? [-Wimplicit-function-declaration]
     286 |         pmd_populate(mm, new_pmd, pmd_ptdesc(&pmd));
         |                                   ^~~~~~~~~~
         |                                   pmd_pte
>> mm/mremap.c:286:35: error: passing argument 3 of 'pmd_populate' makes pointer from integer without a cast [-Wint-conversion]
     286 |         pmd_populate(mm, new_pmd, pmd_ptdesc(&pmd));
         |                                   ^~~~~~~~~~~~~~~~
         |                                   |
         |                                   int
   In file included from mm/mremap.c:31:
   arch/riscv/include/asm/pgalloc.h:36:31: note: expected 'pgtable_t' {aka 'struct page *'} but argument is of type 'int'
      36 |         pmd_t *pmd, pgtable_t pte)
         |                     ~~~~~~~~~~^~~


vim +286 mm/mremap.c

   234	
   235	#ifdef CONFIG_HAVE_MOVE_PMD
   236	static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
   237			  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
   238	{
   239		spinlock_t *old_ptl, *new_ptl;
   240		struct mm_struct *mm = vma->vm_mm;
   241		pmd_t pmd;
   242	
   243		if (!arch_supports_page_table_move())
   244			return false;
   245		/*
   246		 * The destination pmd shouldn't be established, free_pgtables()
   247		 * should have released it.
   248		 *
   249		 * However, there's a case during execve() where we use mremap
   250		 * to move the initial stack, and in that case the target area
   251		 * may overlap the source area (always moving down).
   252		 *
   253		 * If everything is PMD-aligned, that works fine, as moving
   254		 * each pmd down will clear the source pmd. But if we first
   255		 * have a few 4kB-only pages that get moved down, and then
   256		 * hit the "now the rest is PMD-aligned, let's do everything
   257		 * one pmd at a time", we will still have the old (now empty
   258		 * of any 4kB pages, but still there) PMD in the page table
   259		 * tree.
   260		 *
   261		 * Warn on it once - because we really should try to figure
   262		 * out how to do this better - but then say "I won't move
   263		 * this pmd".
   264		 *
   265		 * One alternative might be to just unmap the target pmd at
   266		 * this point, and verify that it really is empty. We'll see.
   267		 */
   268		if (WARN_ON_ONCE(!pmd_none(*new_pmd)))
   269			return false;
   270	
   271		/*
   272		 * We don't have to worry about the ordering of src and dst
   273		 * ptlocks because exclusive mmap_lock prevents deadlock.
   274		 */
   275		old_ptl = pmd_lock(vma->vm_mm, old_pmd);
   276		new_ptl = pmd_lockptr(mm, new_pmd);
   277		if (new_ptl != old_ptl)
   278			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
   279	
   280		/* Clear the pmd */
   281		pmd = *old_pmd;
   282		pmd_clear(old_pmd);
   283	
   284		VM_BUG_ON(!pmd_none(*new_pmd));
   285	
 > 286		pmd_populate(mm, new_pmd, pmd_ptdesc(&pmd));
   287		flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
   288		if (new_ptl != old_ptl)
   289			spin_unlock(new_ptl);
   290		spin_unlock(old_ptl);
   291	
   292		return true;
   293	}
   294	#else
   295	static inline bool move_normal_pmd(struct vm_area_struct *vma,
   296			unsigned long old_addr, unsigned long new_addr, pmd_t *old_pmd,
   297			pmd_t *new_pmd)
   298	{
   299		return false;
   300	}
   301	#endif
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
