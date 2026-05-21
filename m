Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BBF385D82
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335990; cv=none; b=bk+MbCnfq2jCQMGG5mkG8BqIRVZWhJo2XctCgesXx5IhdSF/ZucOgw8pOdLyyG9vrbF++x5X5nnTdag8VXsW0z99ll1FBmZYiKQ9NMWUlp4Nbmfnbtp/NiyEGMcfZCio9Gx3LihnJFzG/nYRBlgfDzdZ6eaw+xZ6+6fUkaLoFHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335990; c=relaxed/simple;
	bh=oc9bu6X7zf4ILGaMgZ1yMABEZF/3HqhGOoyy3ytzAzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TgZEL8N9KQ181nNF0W0ClJ/XiguPzqJ1JEk7+bpUHy+yrWvNHu3NlX9gvoVfaCzXm8BEdQfCwEn4eP8w38f+qnR4i6hpyysAPKqwbQoqy6h7xuyyMV/OYSy+v5W4z/fnbFJksUfilRYV0ImF5dNWPdmoBiu8Mnx94iTq0Az2fpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgytPCrS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgytPCrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779335988; x=1810871988;
  h=date:from:to:cc:subject:message-id;
  bh=oc9bu6X7zf4ILGaMgZ1yMABEZF/3HqhGOoyy3ytzAzY=;
  b=HgytPCrSMo6iVJpQJ3QovH5Wbt6okDkxjcMB3eIsOYhWzk244ahrxYb0
   n4BAVfruYjrjX0SB+i3ailI7mdyRWsdxQ1bgerCLi4vo2JYzl1uKIU24a
   lzybgmwXzdHpytEi7uQ4WIPr3ov/xGdU2nR5KN3F2Yv1SqWIbd05CeuOo
   wTZRSwcrtYr8/ksK7yzEYPS2ci6tVblCu4vOWtKn+C6l8callVADy+yXD
   QJBbod2B2K6t+eJcSkb3EBMr9dD17tSq0ryGeGYP7ews+ZfmEo1sfuSb0
   2dGvYcXbU7t4b6IBMIAIYDanKN+CFBjch58AiBf9KxHBo9uqoZbkLjzF4
   Q==;
X-CSE-ConnectionGUID: ciX6YewfQ6aLJcQt9gxN5g==
X-CSE-MsgGUID: fluNNf2hRKeOxm/97K0ltQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80425356"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80425356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 20:59:48 -0700
X-CSE-ConnectionGUID: 6wuuYHQLQ7CMjDBY+Ci/Gg==
X-CSE-MsgGUID: heL6MH9KQNOe3ryL+wX8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263928483"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 20:59:45 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPuZT-000000004Ls-2IGH;
	Thu, 21 May 2026 03:59:43 +0000
Date: Thu, 21 May 2026 11:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Markus Schneider-Pargmann (The Capable Hub)" <msp@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1/3]
 mm/mmap.c:407:29: error: 'PROT_CAP' undeclared
Message-ID: <202605211135.J4P6mLfT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: a930c4a21ccd537fdaf4c2ff6e18172fc0d626a8 [1/3] mm/mmap: Support mmap PROT_CAP/PROT_NO_CAP
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211135.J4P6mLfT-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211135.J4P6mLfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211135.J4P6mLfT-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mmap.c: In function 'do_mmap':
>> mm/mmap.c:407:29: error: 'PROT_CAP' undeclared (first use in this function)
     407 |                 if ((prot & PROT_CAP) && (prot & PROT_NO_CAP))
         |                             ^~~~~~~~
   mm/mmap.c:407:29: note: each undeclared identifier is reported only once for each function it appears in
>> mm/mmap.c:407:50: error: 'PROT_NO_CAP' undeclared (first use in this function); did you mean 'PROT_NONE'?
     407 |                 if ((prot & PROT_CAP) && (prot & PROT_NO_CAP))
         |                                                  ^~~~~~~~~~~
         |                                                  PROT_NONE
   mm/mmap.c: In function 'ksys_mmap_pgoff':
   mm/mmap.c:669:22: error: implicit declaration of function 'PROT_MAX_EXTRACT' [-Wimplicit-function-declaration]
     669 |                 if ((PROT_MAX_EXTRACT(prot) != 0) &&
         |                      ^~~~~~~~~~~~~~~~
   mm/mmap.c:670:23: error: implicit declaration of function 'PROT_EXTRACT'; did you mean 'PROT_EXEC'? [-Wimplicit-function-declaration]
     670 |                     ((PROT_EXTRACT(prot) & PROT_MAX_EXTRACT(prot)) != PROT_EXTRACT(prot)))
         |                       ^~~~~~~~~~~~
         |                       PROT_EXEC


vim +/PROT_CAP +407 mm/mmap.c

   282	
   283	/**
   284	 * do_mmap() - Perform a userland memory mapping into the current process
   285	 * address space of length @len with protection bits @prot, mmap flags @flags
   286	 * (from which VMA flags will be inferred), and any additional VMA flags to
   287	 * apply @vm_flags. If this is a file-backed mapping then the file is specified
   288	 * in @file and page offset into the file via @pgoff.
   289	 *
   290	 * This function does not perform security checks on the file and assumes, if
   291	 * @uf is non-NULL, the caller has provided a list head to track unmap events
   292	 * for userfaultfd @uf.
   293	 *
   294	 * It also simply indicates whether memory population is required by setting
   295	 * @populate, which must be non-NULL, expecting the caller to actually perform
   296	 * this task itself if appropriate.
   297	 *
   298	 * This function will invoke architecture-specific (and if provided and
   299	 * relevant, file system-specific) logic to determine the most appropriate
   300	 * unmapped area in which to place the mapping if not MAP_FIXED.
   301	 *
   302	 * Callers which require userland mmap() behaviour should invoke vm_mmap(),
   303	 * which is also exported for module use.
   304	 *
   305	 * Those which require this behaviour less security checks, userfaultfd and
   306	 * populate behaviour, and who handle the mmap write lock themselves, should
   307	 * call this function.
   308	 *
   309	 * Note that the returned address may reside within a merged VMA if an
   310	 * appropriate merge were to take place, so it doesn't necessarily specify the
   311	 * start of a VMA, rather only the start of a valid mapped range of length
   312	 * @len bytes, rounded down to the nearest page size.
   313	 *
   314	 * The caller must write-lock current->mm->mmap_lock.
   315	 *
   316	 * @file: An optional struct file pointer describing the file which is to be
   317	 * mapped, if a file-backed mapping.
   318	 * @addr: If non-zero, hints at (or if @flags has MAP_FIXED set, specifies) the
   319	 * address at which to perform this mapping. See mmap (2) for details. Must be
   320	 * page-aligned.
   321	 * @len: The length of the mapping. Will be page-aligned and must be at least 1
   322	 * page in size.
   323	 * @prot: Protection bits describing access required to the mapping. See mmap
   324	 * (2) for details.
   325	 * @flags: Flags specifying how the mapping should be performed, see mmap (2)
   326	 * for details.
   327	 * @vm_flags: VMA flags which should be set by default, or 0 otherwise.
   328	 * @pgoff: Page offset into the @file if file-backed, should be 0 otherwise.
   329	 * @populate: A pointer to a value which will be set to 0 if no population of
   330	 * the range is required, or the number of bytes to populate if it is. Must be
   331	 * non-NULL. See mmap (2) for details as to under what circumstances population
   332	 * of the range occurs.
   333	 * @uf: An optional pointer to a list head to track userfaultfd unmap events
   334	 * should unmapping events arise. If provided, it is up to the caller to manage
   335	 * this.
   336	 *
   337	 * Returns: Either an error, or the address at which the requested mapping has
   338	 * been performed.
   339	 */
   340	unsigned long do_mmap(struct file *file, unsigned long addr,
   341				unsigned long len, unsigned long prot,
   342				unsigned long flags, vm_flags_t vm_flags,
   343				unsigned long pgoff, unsigned long *populate,
   344				struct list_head *uf)
   345	{
   346		struct mm_struct *mm = current->mm;
   347		int pkey = 0;
   348	
   349		*populate = 0;
   350	
   351		mmap_assert_write_locked(mm);
   352	
   353		if (!len)
   354			return -EINVAL;
   355	
   356		/*
   357		 * Does the application expect PROT_READ to imply PROT_EXEC?
   358		 *
   359		 * (the exception is when the underlying filesystem is noexec
   360		 *  mounted, in which case we don't add PROT_EXEC.)
   361		 */
   362		if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
   363			if (!(file && path_noexec(&file->f_path)))
   364				prot |= PROT_EXEC;
   365	
   366		/* force arch specific MAP_FIXED handling in get_unmapped_area */
   367		if (flags & MAP_FIXED_NOREPLACE)
   368			flags |= MAP_FIXED;
   369	
   370		if (!(flags & MAP_FIXED))
   371			addr = round_hint_to_min(addr);
   372	
   373		/* Careful about overflows.. */
   374		len = PAGE_ALIGN(len);
   375		if (!len)
   376			return -ENOMEM;
   377	
   378		/* offset overflow? */
   379		if ((pgoff + (len >> PAGE_SHIFT)) < pgoff)
   380			return -EOVERFLOW;
   381	
   382		/* Too many mappings? */
   383		if (mm->map_count > sysctl_max_map_count)
   384			return -ENOMEM;
   385	
   386		/*
   387		 * addr is returned from get_unmapped_area,
   388		 * There are two cases:
   389		 * 1> MAP_FIXED == false
   390		 *	unallocated memory, no need to check sealing.
   391		 * 1> MAP_FIXED == true
   392		 *	sealing is checked inside mmap_region when
   393		 *	do_vmi_munmap is called.
   394		 */
   395	
   396		if (prot == PROT_EXEC) {
   397			pkey = execute_only_pkey(mm);
   398			if (pkey < 0)
   399				pkey = 0;
   400		}
   401	
   402		/* Do simple checking here so the lower-level routines won't have
   403		 * to. we assume access permissions have been handled by the open
   404		 * of the memory object, so we don't do any here.
   405		 */
   406		if (IS_ENABLED(CONFIG_CHERI_PURECAP_UABI)) {
 > 407			if ((prot & PROT_CAP) && (prot & PROT_NO_CAP))
   408				return -EINVAL;
   409			/*
   410			 * PROT_CAP is not supported with file-backed MAP_SHARED mapping
   411			 */
   412			if ((prot & PROT_CAP) && file && (flags & MAP_SHARED))
   413				return -EINVAL;
   414		}
   415	
   416		vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(file, flags) |
   417				mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
   418	
   419		if (IS_ENABLED(CONFIG_CHERI_PURECAP_UABI)) {
   420			if (prot & PROT_CAP)
   421				vm_flags |= VM_READ_CAPS | VM_WRITE_CAPS;
   422			else if (prot & PROT_NO_CAP)
   423				vm_flags &= ~(VM_READ_CAPS | VM_WRITE_CAPS);
   424		}
   425	
   426		/* Obtain the address to map to. we verify (or select) it and ensure
   427		 * that it represents a valid section of the address space.
   428		 */
   429		addr = __get_unmapped_area(file, addr, len, pgoff, flags, vm_flags);
   430		if (IS_ERR_VALUE(addr))
   431			return addr;
   432	
   433		if (flags & MAP_FIXED_NOREPLACE) {
   434			if (find_vma_intersection(mm, addr, addr + len))
   435				return -EEXIST;
   436		}
   437	
   438		if (flags & MAP_LOCKED)
   439			if (!can_do_mlock())
   440				return -EPERM;
   441	
   442		if (!mlock_future_ok(mm, vm_flags, len))
   443			return -EAGAIN;
   444	
   445		if (file) {
   446			struct inode *inode = file_inode(file);
   447			unsigned long flags_mask;
   448			int err;
   449	
   450			if (!file_mmap_ok(file, inode, pgoff, len))
   451				return -EOVERFLOW;
   452	
   453			flags_mask = LEGACY_MAP_MASK;
   454			if (file->f_op->fop_flags & FOP_MMAP_SYNC)
   455				flags_mask |= MAP_SYNC;
   456	
   457			switch (flags & MAP_TYPE) {
   458			case MAP_SHARED:
   459				/*
   460				 * Force use of MAP_SHARED_VALIDATE with non-legacy
   461				 * flags. E.g. MAP_SYNC is dangerous to use with
   462				 * MAP_SHARED as you don't know which consistency model
   463				 * you will get. We silently ignore unsupported flags
   464				 * with MAP_SHARED to preserve backward compatibility.
   465				 */
   466				flags &= LEGACY_MAP_MASK;
   467				fallthrough;
   468			case MAP_SHARED_VALIDATE:
   469				if (flags & ~flags_mask)
   470					return -EOPNOTSUPP;
   471				if (prot & PROT_WRITE) {
   472					if (!(file->f_mode & FMODE_WRITE))
   473						return -EACCES;
   474					if (IS_SWAPFILE(file->f_mapping->host))
   475						return -ETXTBSY;
   476				}
   477	
   478				/*
   479				 * Make sure we don't allow writing to an append-only
   480				 * file..
   481				 */
   482				if (IS_APPEND(inode) && (file->f_mode & FMODE_WRITE))
   483					return -EACCES;
   484	
   485				vm_flags |= VM_SHARED | VM_MAYSHARE;
   486				if (!(file->f_mode & FMODE_WRITE))
   487					vm_flags &= ~(VM_MAYWRITE | VM_SHARED);
   488				fallthrough;
   489			case MAP_PRIVATE:
   490				if (!(file->f_mode & FMODE_READ))
   491					return -EACCES;
   492				if (path_noexec(&file->f_path)) {
   493					if (vm_flags & VM_EXEC)
   494						return -EPERM;
   495					vm_flags &= ~VM_MAYEXEC;
   496				}
   497	
   498				if (!can_mmap_file(file))
   499					return -ENODEV;
   500				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
   501					return -EINVAL;
   502				break;
   503	
   504			default:
   505				return -EINVAL;
   506			}
   507	
   508			/*
   509			 * Check to see if we are violating any seals and update VMA
   510			 * flags if necessary to avoid future seal violations.
   511			 */
   512			err = memfd_check_seals_mmap(file, &vm_flags);
   513			if (err)
   514				return (unsigned long)err;
   515		} else {
   516			switch (flags & MAP_TYPE) {
   517			case MAP_SHARED:
   518				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
   519					return -EINVAL;
   520				/*
   521				 * Ignore pgoff.
   522				 */
   523				pgoff = 0;
   524				vm_flags |= VM_SHARED | VM_MAYSHARE;
   525				break;
   526			case MAP_DROPPABLE:
   527				if (VM_DROPPABLE == VM_NONE)
   528					return -ENOTSUPP;
   529				/*
   530				 * A locked or stack area makes no sense to be droppable.
   531				 *
   532				 * Also, since droppable pages can just go away at any time
   533				 * it makes no sense to copy them on fork or dump them.
   534				 *
   535				 * And don't attempt to combine with hugetlb for now.
   536				 */
   537				if (flags & (MAP_LOCKED | MAP_HUGETLB))
   538				        return -EINVAL;
   539				if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
   540				        return -EINVAL;
   541	
   542				vm_flags |= VM_DROPPABLE;
   543	
   544				/*
   545				 * If the pages can be dropped, then it doesn't make
   546				 * sense to reserve them.
   547				 */
   548				vm_flags |= VM_NORESERVE;
   549	
   550				/*
   551				 * Likewise, they're volatile enough that they
   552				 * shouldn't survive forks or coredumps.
   553				 */
   554				vm_flags |= VM_WIPEONFORK | VM_DONTDUMP;
   555				fallthrough;
   556			case MAP_PRIVATE:
   557				/*
   558				 * Set pgoff according to addr for anon_vma.
   559				 */
   560				pgoff = addr >> PAGE_SHIFT;
   561				break;
   562			default:
   563				return -EINVAL;
   564			}
   565		}
   566	
   567		/*
   568		 * Set 'VM_NORESERVE' if we should not account for the
   569		 * memory use of this mapping.
   570		 */
   571		if (flags & MAP_NORESERVE) {
   572			/* We honor MAP_NORESERVE if allowed to overcommit */
   573			if (sysctl_overcommit_memory != OVERCOMMIT_NEVER)
   574				vm_flags |= VM_NORESERVE;
   575	
   576			/* hugetlb applies strict overcommit unless MAP_NORESERVE */
   577			if (file && is_file_hugepages(file))
   578				vm_flags |= VM_NORESERVE;
   579		}
   580	
   581		addr = mmap_region(file, addr, len, vm_flags, pgoff, uf, prot);
   582		if (!IS_ERR_VALUE(addr) &&
   583		    ((vm_flags & VM_LOCKED) ||
   584		     (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE))
   585			*populate = len;
   586		return addr;
   587	}
   588	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
