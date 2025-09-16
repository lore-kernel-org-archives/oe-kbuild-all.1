Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FB8143756
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758047692; cv=none; b=hk0Hjj5Vzd2V9hKvRKgoWaccdVUJZ03W6dsyWWtpI5cU6Dp/TMD13WKLfA40icmoyrY6MZL4cX9Sxk7r/g7c1Hxvt92h2hnvK2sF7md22+YpAWQw0tXnWf8AqA5Ez8FDcjS8Me7EFW40LOfLPZMIUOhrApwkGzxQMoZrXx0UoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758047692; c=relaxed/simple;
	bh=cH/6dpHwJzRyk/viCZKaoE4Wwo2vX8t50UV5fz7u/70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjRigGCGivqI//nq7bonYQWzs5fNHXLjaFXvbL9tRt551jht3kz3AapHqN54alxgdqygu+3ziSa6c6lXj31QVn2uFGs2Au7ylSyrK0u12cBnv0bddXErTfO3qiM/2WOmOJnZMoDHCtJbDIiyKVz1VvJiP7MS/nIinx5DotzKIMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnD1vkBj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnD1vkBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758047690; x=1789583690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cH/6dpHwJzRyk/viCZKaoE4Wwo2vX8t50UV5fz7u/70=;
  b=ZnD1vkBjeteJgoromCNt6/mQZHzaesO6ySEF7KdckGq0ZUnUCt8zM+8a
   DIVT4IiIlbNnPvGh5HO18p5wzRrB1C1kgruAvjwvzYAqgUqdqbR+kAzS5
   +egn2mVdMsZlgNnooxBmoOkQi1C6bnQdo5cqSZHSs1FXuODtFdGUjxQZQ
   +MjBIXjeqxifo31an0g1ZeuMLUfxgG+RHRyp6zFArA6yH0Vo2H39fEnam
   fWzjysuKeD59QVtYpYD0UPAujsJs0VJm0lzDfPFeMBjl99/SZiqDEZRv9
   7yy0KF8Zf/ouw54lbJa0qPn8jRGNAligDSxPq1zsHYJzyDqwvNLqc6UgF
   A==;
X-CSE-ConnectionGUID: bKk4oJc+SWSTTOqlZLwrGQ==
X-CSE-MsgGUID: 7euErLkDQRyMCa5QDgU2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60033969"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="60033969"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 11:34:48 -0700
X-CSE-ConnectionGUID: Mxq3dBSkSK+IrXUO70WvRQ==
X-CSE-MsgGUID: h2bk8kWHQ0+NZHjwEjnCmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174119793"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Sep 2025 11:34:40 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyaVh-0000eh-26;
	Tue, 16 Sep 2025 18:34:37 +0000
Date: Wed, 17 Sep 2025 02:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
	minchan@kernel.org, lorenzo.stoakes@oracle.com, david@redhat.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, pfalcato@suse.de
Cc: oe-kbuild-all@lists.linux.dev, kernel-team@android.com,
	android-mm@google.com, Kalesh Singh <kaleshsingh@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Jann Horn <jannh@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] mm: introduce vma_count_remaining()
Message-ID: <202509170238.NUURxWPI-lkp@intel.com>
References: <20250915163838.631445-4-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915163838.631445-4-kaleshsingh@google.com>

Hi Kalesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on f83ec76bf285bea5727f478a68b894f5543ca76e]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-fix-off-by-one-error-in-VMA-count-limit-checks/20250916-005018
base:   f83ec76bf285bea5727f478a68b894f5543ca76e
patch link:    https://lore.kernel.org/r/20250915163838.631445-4-kaleshsingh%40google.com
patch subject: [PATCH v2 3/7] mm: introduce vma_count_remaining()
config: s390-randconfig-r122-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170238.NUURxWPI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170238.NUURxWPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170238.NUURxWPI-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/mmap.o: in function `do_mmap':
>> mm/mmap.c:377:(.text+0x6566): undefined reference to `vma_count_remaining'
   s390-linux-ld: mm/mremap.o: in function `prep_move_vma':
>> mm/mremap.c:1043:(.text+0x199a): undefined reference to `vma_count_remaining'
   s390-linux-ld: mm/mremap.o: in function `check_mremap_params':
   mm/mremap.c:1820:(.text+0x4044): undefined reference to `vma_count_remaining'
   s390-linux-ld: mm/vma.o: in function `vms_gather_munmap_vmas':
>> mm/vma.c:1348:(.text+0x8ebc): undefined reference to `vma_count_remaining'
   s390-linux-ld: mm/vma.o: in function `split_vma':
   mm/vma.c:595:(.text+0xa2a2): undefined reference to `vma_count_remaining'
   s390-linux-ld: mm/vma.o:mm/vma.c:2775: more undefined references to `vma_count_remaining' follow


vim +377 mm/mmap.c

   276	
   277	/**
   278	 * do_mmap() - Perform a userland memory mapping into the current process
   279	 * address space of length @len with protection bits @prot, mmap flags @flags
   280	 * (from which VMA flags will be inferred), and any additional VMA flags to
   281	 * apply @vm_flags. If this is a file-backed mapping then the file is specified
   282	 * in @file and page offset into the file via @pgoff.
   283	 *
   284	 * This function does not perform security checks on the file and assumes, if
   285	 * @uf is non-NULL, the caller has provided a list head to track unmap events
   286	 * for userfaultfd @uf.
   287	 *
   288	 * It also simply indicates whether memory population is required by setting
   289	 * @populate, which must be non-NULL, expecting the caller to actually perform
   290	 * this task itself if appropriate.
   291	 *
   292	 * This function will invoke architecture-specific (and if provided and
   293	 * relevant, file system-specific) logic to determine the most appropriate
   294	 * unmapped area in which to place the mapping if not MAP_FIXED.
   295	 *
   296	 * Callers which require userland mmap() behaviour should invoke vm_mmap(),
   297	 * which is also exported for module use.
   298	 *
   299	 * Those which require this behaviour less security checks, userfaultfd and
   300	 * populate behaviour, and who handle the mmap write lock themselves, should
   301	 * call this function.
   302	 *
   303	 * Note that the returned address may reside within a merged VMA if an
   304	 * appropriate merge were to take place, so it doesn't necessarily specify the
   305	 * start of a VMA, rather only the start of a valid mapped range of length
   306	 * @len bytes, rounded down to the nearest page size.
   307	 *
   308	 * The caller must write-lock current->mm->mmap_lock.
   309	 *
   310	 * @file: An optional struct file pointer describing the file which is to be
   311	 * mapped, if a file-backed mapping.
   312	 * @addr: If non-zero, hints at (or if @flags has MAP_FIXED set, specifies) the
   313	 * address at which to perform this mapping. See mmap (2) for details. Must be
   314	 * page-aligned.
   315	 * @len: The length of the mapping. Will be page-aligned and must be at least 1
   316	 * page in size.
   317	 * @prot: Protection bits describing access required to the mapping. See mmap
   318	 * (2) for details.
   319	 * @flags: Flags specifying how the mapping should be performed, see mmap (2)
   320	 * for details.
   321	 * @vm_flags: VMA flags which should be set by default, or 0 otherwise.
   322	 * @pgoff: Page offset into the @file if file-backed, should be 0 otherwise.
   323	 * @populate: A pointer to a value which will be set to 0 if no population of
   324	 * the range is required, or the number of bytes to populate if it is. Must be
   325	 * non-NULL. See mmap (2) for details as to under what circumstances population
   326	 * of the range occurs.
   327	 * @uf: An optional pointer to a list head to track userfaultfd unmap events
   328	 * should unmapping events arise. If provided, it is up to the caller to manage
   329	 * this.
   330	 *
   331	 * Returns: Either an error, or the address at which the requested mapping has
   332	 * been performed.
   333	 */
   334	unsigned long do_mmap(struct file *file, unsigned long addr,
   335				unsigned long len, unsigned long prot,
   336				unsigned long flags, vm_flags_t vm_flags,
   337				unsigned long pgoff, unsigned long *populate,
   338				struct list_head *uf)
   339	{
   340		struct mm_struct *mm = current->mm;
   341		int pkey = 0;
   342	
   343		*populate = 0;
   344	
   345		mmap_assert_write_locked(mm);
   346	
   347		if (!len)
   348			return -EINVAL;
   349	
   350		/*
   351		 * Does the application expect PROT_READ to imply PROT_EXEC?
   352		 *
   353		 * (the exception is when the underlying filesystem is noexec
   354		 *  mounted, in which case we don't add PROT_EXEC.)
   355		 */
   356		if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
   357			if (!(file && path_noexec(&file->f_path)))
   358				prot |= PROT_EXEC;
   359	
   360		/* force arch specific MAP_FIXED handling in get_unmapped_area */
   361		if (flags & MAP_FIXED_NOREPLACE)
   362			flags |= MAP_FIXED;
   363	
   364		if (!(flags & MAP_FIXED))
   365			addr = round_hint_to_min(addr);
   366	
   367		/* Careful about overflows.. */
   368		len = PAGE_ALIGN(len);
   369		if (!len)
   370			return -ENOMEM;
   371	
   372		/* offset overflow? */
   373		if ((pgoff + (len >> PAGE_SHIFT)) < pgoff)
   374			return -EOVERFLOW;
   375	
   376		/* Too many mappings? */
 > 377		if (!vma_count_remaining(mm))
   378			return -ENOMEM;
   379	
   380		/*
   381		 * addr is returned from get_unmapped_area,
   382		 * There are two cases:
   383		 * 1> MAP_FIXED == false
   384		 *	unallocated memory, no need to check sealing.
   385		 * 1> MAP_FIXED == true
   386		 *	sealing is checked inside mmap_region when
   387		 *	do_vmi_munmap is called.
   388		 */
   389	
   390		if (prot == PROT_EXEC) {
   391			pkey = execute_only_pkey(mm);
   392			if (pkey < 0)
   393				pkey = 0;
   394		}
   395	
   396		/* Do simple checking here so the lower-level routines won't have
   397		 * to. we assume access permissions have been handled by the open
   398		 * of the memory object, so we don't do any here.
   399		 */
   400		vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(file, flags) |
   401				mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
   402	
   403		/* Obtain the address to map to. we verify (or select) it and ensure
   404		 * that it represents a valid section of the address space.
   405		 */
   406		addr = __get_unmapped_area(file, addr, len, pgoff, flags, vm_flags);
   407		if (IS_ERR_VALUE(addr))
   408			return addr;
   409	
   410		if (flags & MAP_FIXED_NOREPLACE) {
   411			if (find_vma_intersection(mm, addr, addr + len))
   412				return -EEXIST;
   413		}
   414	
   415		if (flags & MAP_LOCKED)
   416			if (!can_do_mlock())
   417				return -EPERM;
   418	
   419		if (!mlock_future_ok(mm, vm_flags, len))
   420			return -EAGAIN;
   421	
   422		if (file) {
   423			struct inode *inode = file_inode(file);
   424			unsigned long flags_mask;
   425			int err;
   426	
   427			if (!file_mmap_ok(file, inode, pgoff, len))
   428				return -EOVERFLOW;
   429	
   430			flags_mask = LEGACY_MAP_MASK;
   431			if (file->f_op->fop_flags & FOP_MMAP_SYNC)
   432				flags_mask |= MAP_SYNC;
   433	
   434			switch (flags & MAP_TYPE) {
   435			case MAP_SHARED:
   436				/*
   437				 * Force use of MAP_SHARED_VALIDATE with non-legacy
   438				 * flags. E.g. MAP_SYNC is dangerous to use with
   439				 * MAP_SHARED as you don't know which consistency model
   440				 * you will get. We silently ignore unsupported flags
   441				 * with MAP_SHARED to preserve backward compatibility.
   442				 */
   443				flags &= LEGACY_MAP_MASK;
   444				fallthrough;
   445			case MAP_SHARED_VALIDATE:
   446				if (flags & ~flags_mask)
   447					return -EOPNOTSUPP;
   448				if (prot & PROT_WRITE) {
   449					if (!(file->f_mode & FMODE_WRITE))
   450						return -EACCES;
   451					if (IS_SWAPFILE(file->f_mapping->host))
   452						return -ETXTBSY;
   453				}
   454	
   455				/*
   456				 * Make sure we don't allow writing to an append-only
   457				 * file..
   458				 */
   459				if (IS_APPEND(inode) && (file->f_mode & FMODE_WRITE))
   460					return -EACCES;
   461	
   462				vm_flags |= VM_SHARED | VM_MAYSHARE;
   463				if (!(file->f_mode & FMODE_WRITE))
   464					vm_flags &= ~(VM_MAYWRITE | VM_SHARED);
   465				fallthrough;
   466			case MAP_PRIVATE:
   467				if (!(file->f_mode & FMODE_READ))
   468					return -EACCES;
   469				if (path_noexec(&file->f_path)) {
   470					if (vm_flags & VM_EXEC)
   471						return -EPERM;
   472					vm_flags &= ~VM_MAYEXEC;
   473				}
   474	
   475				if (!can_mmap_file(file))
   476					return -ENODEV;
   477				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
   478					return -EINVAL;
   479				break;
   480	
   481			default:
   482				return -EINVAL;
   483			}
   484	
   485			/*
   486			 * Check to see if we are violating any seals and update VMA
   487			 * flags if necessary to avoid future seal violations.
   488			 */
   489			err = memfd_check_seals_mmap(file, &vm_flags);
   490			if (err)
   491				return (unsigned long)err;
   492		} else {
   493			switch (flags & MAP_TYPE) {
   494			case MAP_SHARED:
   495				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
   496					return -EINVAL;
   497				/*
   498				 * Ignore pgoff.
   499				 */
   500				pgoff = 0;
   501				vm_flags |= VM_SHARED | VM_MAYSHARE;
   502				break;
   503			case MAP_DROPPABLE:
   504				if (VM_DROPPABLE == VM_NONE)
   505					return -ENOTSUPP;
   506				/*
   507				 * A locked or stack area makes no sense to be droppable.
   508				 *
   509				 * Also, since droppable pages can just go away at any time
   510				 * it makes no sense to copy them on fork or dump them.
   511				 *
   512				 * And don't attempt to combine with hugetlb for now.
   513				 */
   514				if (flags & (MAP_LOCKED | MAP_HUGETLB))
   515				        return -EINVAL;
   516				if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
   517				        return -EINVAL;
   518	
   519				vm_flags |= VM_DROPPABLE;
   520	
   521				/*
   522				 * If the pages can be dropped, then it doesn't make
   523				 * sense to reserve them.
   524				 */
   525				vm_flags |= VM_NORESERVE;
   526	
   527				/*
   528				 * Likewise, they're volatile enough that they
   529				 * shouldn't survive forks or coredumps.
   530				 */
   531				vm_flags |= VM_WIPEONFORK | VM_DONTDUMP;
   532				fallthrough;
   533			case MAP_PRIVATE:
   534				/*
   535				 * Set pgoff according to addr for anon_vma.
   536				 */
   537				pgoff = addr >> PAGE_SHIFT;
   538				break;
   539			default:
   540				return -EINVAL;
   541			}
   542		}
   543	
   544		/*
   545		 * Set 'VM_NORESERVE' if we should not account for the
   546		 * memory use of this mapping.
   547		 */
   548		if (flags & MAP_NORESERVE) {
   549			/* We honor MAP_NORESERVE if allowed to overcommit */
   550			if (sysctl_overcommit_memory != OVERCOMMIT_NEVER)
   551				vm_flags |= VM_NORESERVE;
   552	
   553			/* hugetlb applies strict overcommit unless MAP_NORESERVE */
   554			if (file && is_file_hugepages(file))
   555				vm_flags |= VM_NORESERVE;
   556		}
   557	
   558		addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
   559		if (!IS_ERR_VALUE(addr) &&
   560		    ((vm_flags & VM_LOCKED) ||
   561		     (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE))
   562			*populate = len;
   563		return addr;
   564	}
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
