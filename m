Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C46619A28F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723016877; cv=none; b=jVsx3770nR4thUK3PnnD7xDEQ3jqkwZfL/uzKb9h4hDRTT+brYA28bGnjmFzuVntU2vr9H/O5QoU8neMXcUM/tk2uijFMI7QtAFOY/bFPfkgEg0I+GCmTf0SINuVmX/26YxwuZL842q8KGOz6829gvnIxDvofjF53qpKsErL/zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723016877; c=relaxed/simple;
	bh=/n2B96EWlDyjImW74Q56AloJHyqkIXjKZLDUQDstOOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWbUn3ir605xDaAXbv5tqfjd9uzOSJdqIHHzFN13zghJbQw/+AnnaO7K2XA8AE+NJkeLdEGiBZQsWS4XacMeJ8Xgjp+UOFHCitOMn5HH/7ahprkYYs85R/FKQWVRIwlzPkL7Gx4UEAFhFhBj90CiYZa1uMRO7pbb3aYqM9i37IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xikjil+k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xikjil+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723016876; x=1754552876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/n2B96EWlDyjImW74Q56AloJHyqkIXjKZLDUQDstOOM=;
  b=Xikjil+klPPtH8DUCFiHFDScaiY++B8DzgRFJ4ymt3PvZZodMgN9GY/1
   vpMIplLSvypbKr+rAJdXf2zWb93xXVFzupGXVE+sG8w9zlxLdtRIOP2ZF
   ADQdZw4Nn84aVSgov89cVCqqIH/KhllPU7ilebxzR1AZp7Tq2hspAddZk
   Wl/ElzlZmzox67Zk3USBDbASGJYSnQ7VSrYb9og7sS6osfl4nFLOTPDuk
   jqDcbYrYBM8GeFyRd95cF7D9lrmFolePpnNxK8XCDhmHL7x4Qq8hzkiUc
   9wTAEPzKrWmM8he7zK1UxEXHj49CKQplgnrtTZpOccUbVPuCkDxl5IEFy
   w==;
X-CSE-ConnectionGUID: iZ97lW8zRQSXmBjuFTMVyw==
X-CSE-MsgGUID: DOqBJDQoRSOIx4r0hKVFXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20948812"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="20948812"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 00:47:55 -0700
X-CSE-ConnectionGUID: c1MdE1URQpK3P21q+JS3ig==
X-CSE-MsgGUID: VGAG1D2FSkCRvtihdK+W2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56845080"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2024 00:47:54 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbbOi-0005Dc-1J;
	Wed, 07 Aug 2024 07:47:52 +0000
Date: Wed, 7 Aug 2024 15:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 15/18] mm/mremap.c:286:35: error: passing argument 3
 of 'pmd_populate' from incompatible pointer type
Message-ID: <202408071510.WGnJYtsu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   b64e1fb9716bbce7d2527252d8138cfb5bbb38c2
commit: 88a0f2a1182f58bd4e05ad4c8efd4d7824f4a225 [15/18] mm/pgtable: pass ptdesc to pmd_populate
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240807/202408071510.WGnJYtsu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071510.WGnJYtsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071510.WGnJYtsu-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mremap.c: In function 'move_normal_pmd':
>> mm/mremap.c:286:35: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     286 |         pmd_populate(mm, new_pmd, (struct ptdesc *)pmd_pgtable(pmd));
   In file included from mm/mremap.c:31:
   arch/riscv/include/asm/pgalloc.h:36:31: note: expected 'pgtable_t' {aka 'struct page *'} but argument is of type 'struct ptdesc *'
      36 |         pmd_t *pmd, pgtable_t pte)
         |                     ~~~~~~~~~~^~~


vim +/pmd_populate +286 mm/mremap.c

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
 > 286		pmd_populate(mm, new_pmd, (struct ptdesc *)pmd_pgtable(pmd));
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
