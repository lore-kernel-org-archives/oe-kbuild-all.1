Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D78B1B3B27
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725030319; cv=none; b=TVqNmoDleSYmp7lBjlARntjlOCY6zH9AeSSIQOSwCCkIRhiMtHt2SlhT/Zd6b+9Z5+fUj81MKUny8jDN43XBMHFxSQ2geN6J49pxly6pUCG34uvyjwaeYDIMQibQx8gAgF5zwswOXTbK+rdYfPewt/42vwIVp61FbpfadtLHtCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725030319; c=relaxed/simple;
	bh=uOlKTfNFXgtArf+5u05IZoqjTFFGrEumqeZA8OCNdYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=acU0yeNUMTwqWug41KYJEfrH7BcLdZzSlpGrtU+hcnWKAqydxl+lzugcEMdSYR3rEVZmI3R8WgbqHC+78xLr2FOzVkDT4Fn3XFO8KRmEH0A8LwY/Uzz4JdHVbO22CqNGj4PnskzAf3hHUJqjUx55VQVtOsdD8MBvobvNyrhspUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMCg+xNv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMCg+xNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725030318; x=1756566318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uOlKTfNFXgtArf+5u05IZoqjTFFGrEumqeZA8OCNdYo=;
  b=CMCg+xNvGtKc0Mj8L+mjuCZLWbpFbzzKH2otLBFhAtDZOzeaBkRxvk0v
   NgJSrsF3PUaHcF4euv9HY+9oghVJRm/i5+ktKNucL/LSEDie48uGzT9Fv
   fwWIUoQ5tT7Tc72+0yoXKjAzGdbFRjNqcZivV12tkgdG9/ru8zV516qFz
   P7jHLZYoSqeOB1wAjGvFypNe0gXhvT17DFl8HeGRYFYh8bUYFHMjPfvhW
   ncuUpH+4uXCF/7CbrYkbB+7ctCQ3pQyVzxH/XR2/8pley7tDeKEf0gRSX
   6qhLAlPHKJBgCbSrxu5gA8iOF7KmmU/3xK2siaw0jpb76UE7TMvp9FCtE
   g==;
X-CSE-ConnectionGUID: veZhia2+TjeeJ/daB4zz6A==
X-CSE-MsgGUID: r6VrbNuMSC2jxS7AnpXEIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="13298938"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="13298938"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:05:16 -0700
X-CSE-ConnectionGUID: MsvI8WFxSzGorFe7yYP6rg==
X-CSE-MsgGUID: uYmBZmXVTQyg9J7fb8lGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63937009"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Aug 2024 08:05:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk3BY-0001Ye-0y;
	Fri, 30 Aug 2024 15:05:12 +0000
Date: Fri, 30 Aug 2024 23:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [linux-next:master 7320/8126] mm/vma.h:173:22: error: implicit
 declaration of function 'vma_iter_store_gfp'; did you mean
 'vma_iter_clear_gfp'?
Message-ID: <202408302337.xJn0kaJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 59f8f23d91921f023428e34c061e8ee88b7670c7 [7320/8126] mm: change failure of MAP_FIXED to restoring the gap on failure
config: x86_64-randconfig-x005-20230818 (https://download.01.org/0day-ci/archive/20240830/202408302337.xJn0kaJN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302337.xJn0kaJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302337.xJn0kaJN-lkp@intel.com/

Note: the linux-next/master HEAD 985bf40edf4343dcb04c33f58b40b4a85c1776d4 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from mm/filemap.c:13:
   mm/vma.h: In function 'vms_abort_munmap_vmas':
>> mm/vma.h:173:22: error: implicit declaration of function 'vma_iter_store_gfp'; did you mean 'vma_iter_clear_gfp'? [-Werror=implicit-function-declaration]
     173 |         if (unlikely(vma_iter_store_gfp(vms->vmi, NULL, GFP_KERNEL))) {
         |                      ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from mm/internal.h:22,
                    from mm/filemap.c:52:
   mm/vma.h: At top level:
>> mm/vma.h:336:19: error: static declaration of 'vma_iter_store_gfp' follows non-static declaration
     336 | static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
         |                   ^~~~~~~~~~~~~~~~~~
   mm/vma.h:173:22: note: previous implicit declaration of 'vma_iter_store_gfp' with type 'int()'
     173 |         if (unlikely(vma_iter_store_gfp(vms->vmi, NULL, GFP_KERNEL))) {
         |                      ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   cc1: some warnings being treated as errors


vim +173 mm/vma.h

   147	
   148	/*
   149	 * vms_abort_munmap_vmas() - Undo as much as possible from an aborted munmap()
   150	 * operation.
   151	 * @vms: The vma unmap structure
   152	 * @mas_detach: The maple state with the detached maple tree
   153	 *
   154	 * Reattach any detached vmas, free up the maple tree used to track the vmas.
   155	 * If that's not possible because the ptes are cleared (and vm_ops->closed() may
   156	 * have been called), then a NULL is written over the vmas and the vmas are
   157	 * removed (munmap() completed).
   158	 */
   159	static inline void vms_abort_munmap_vmas(struct vma_munmap_struct *vms,
   160			struct ma_state *mas_detach)
   161	{
   162		if (!vms->nr_pages)
   163			return;
   164	
   165		if (vms->clear_ptes)
   166			return reattach_vmas(mas_detach);
   167	
   168		/*
   169		 * Aborting cannot just call the vm_ops open() because they are often
   170		 * not symmetrical and state data has been lost.  Resort to the old
   171		 * failure method of leaving a gap where the MAP_FIXED mapping failed.
   172		 */
 > 173		if (unlikely(vma_iter_store_gfp(vms->vmi, NULL, GFP_KERNEL))) {
   174			pr_warn_once("%s: (%d) Unable to abort munmap() operation\n",
   175				     current->comm, current->pid);
   176			/* Leaving vmas detached and in-tree may hamper recovery */
   177			reattach_vmas(mas_detach);
   178		} else {
   179			/* Clean up the insertion of unfortunate the gap */
   180			vms_complete_munmap_vmas(vms, mas_detach);
   181		}
   182	}
   183	
   184	int
   185	do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
   186			    struct mm_struct *mm, unsigned long start,
   187			    unsigned long end, struct list_head *uf, bool unlock);
   188	
   189	int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
   190			  unsigned long start, size_t len, struct list_head *uf,
   191			  bool unlock);
   192	
   193	void remove_vma(struct vm_area_struct *vma, bool unreachable, bool closed);
   194	
   195	void unmap_region(struct ma_state *mas, struct vm_area_struct *vma,
   196			struct vm_area_struct *prev, struct vm_area_struct *next);
   197	
   198	/* Required by mmap_region(). */
   199	bool
   200	can_vma_merge_before(struct vm_area_struct *vma, unsigned long vm_flags,
   201			struct anon_vma *anon_vma, struct file *file,
   202			pgoff_t vm_pgoff, struct vm_userfaultfd_ctx vm_userfaultfd_ctx,
   203			struct anon_vma_name *anon_name);
   204	
   205	/* Required by mmap_region() and do_brk_flags(). */
   206	bool
   207	can_vma_merge_after(struct vm_area_struct *vma, unsigned long vm_flags,
   208			struct anon_vma *anon_vma, struct file *file,
   209			pgoff_t vm_pgoff, struct vm_userfaultfd_ctx vm_userfaultfd_ctx,
   210			struct anon_vma_name *anon_name);
   211	
   212	struct vm_area_struct *vma_modify(struct vma_iterator *vmi,
   213					  struct vm_area_struct *prev,
   214					  struct vm_area_struct *vma,
   215					  unsigned long start, unsigned long end,
   216					  unsigned long vm_flags,
   217					  struct mempolicy *policy,
   218					  struct vm_userfaultfd_ctx uffd_ctx,
   219					  struct anon_vma_name *anon_name);
   220	
   221	/* We are about to modify the VMA's flags. */
   222	static inline struct vm_area_struct
   223	*vma_modify_flags(struct vma_iterator *vmi,
   224			  struct vm_area_struct *prev,
   225			  struct vm_area_struct *vma,
   226			  unsigned long start, unsigned long end,
   227			  unsigned long new_flags)
   228	{
   229		return vma_modify(vmi, prev, vma, start, end, new_flags,
   230				  vma_policy(vma), vma->vm_userfaultfd_ctx,
   231				  anon_vma_name(vma));
   232	}
   233	
   234	/* We are about to modify the VMA's flags and/or anon_name. */
   235	static inline struct vm_area_struct
   236	*vma_modify_flags_name(struct vma_iterator *vmi,
   237			       struct vm_area_struct *prev,
   238			       struct vm_area_struct *vma,
   239			       unsigned long start,
   240			       unsigned long end,
   241			       unsigned long new_flags,
   242			       struct anon_vma_name *new_name)
   243	{
   244		return vma_modify(vmi, prev, vma, start, end, new_flags,
   245				  vma_policy(vma), vma->vm_userfaultfd_ctx, new_name);
   246	}
   247	
   248	/* We are about to modify the VMA's memory policy. */
   249	static inline struct vm_area_struct
   250	*vma_modify_policy(struct vma_iterator *vmi,
   251			   struct vm_area_struct *prev,
   252			   struct vm_area_struct *vma,
   253			   unsigned long start, unsigned long end,
   254			   struct mempolicy *new_pol)
   255	{
   256		return vma_modify(vmi, prev, vma, start, end, vma->vm_flags,
   257				  new_pol, vma->vm_userfaultfd_ctx, anon_vma_name(vma));
   258	}
   259	
   260	/* We are about to modify the VMA's flags and/or uffd context. */
   261	static inline struct vm_area_struct
   262	*vma_modify_flags_uffd(struct vma_iterator *vmi,
   263			       struct vm_area_struct *prev,
   264			       struct vm_area_struct *vma,
   265			       unsigned long start, unsigned long end,
   266			       unsigned long new_flags,
   267			       struct vm_userfaultfd_ctx new_ctx)
   268	{
   269		return vma_modify(vmi, prev, vma, start, end, new_flags,
   270				  vma_policy(vma), new_ctx, anon_vma_name(vma));
   271	}
   272	
   273	struct vm_area_struct
   274	*vma_merge_new_vma(struct vma_iterator *vmi, struct vm_area_struct *prev,
   275			   struct vm_area_struct *vma, unsigned long start,
   276			   unsigned long end, pgoff_t pgoff);
   277	
   278	struct vm_area_struct *vma_merge_extend(struct vma_iterator *vmi,
   279						struct vm_area_struct *vma,
   280						unsigned long delta);
   281	
   282	void unlink_file_vma_batch_init(struct unlink_vma_file_batch *vb);
   283	
   284	void unlink_file_vma_batch_final(struct unlink_vma_file_batch *vb);
   285	
   286	void unlink_file_vma_batch_add(struct unlink_vma_file_batch *vb,
   287				       struct vm_area_struct *vma);
   288	
   289	void unlink_file_vma(struct vm_area_struct *vma);
   290	
   291	void vma_link_file(struct vm_area_struct *vma);
   292	
   293	int vma_link(struct mm_struct *mm, struct vm_area_struct *vma);
   294	
   295	struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
   296		unsigned long addr, unsigned long len, pgoff_t pgoff,
   297		bool *need_rmap_locks);
   298	
   299	struct anon_vma *find_mergeable_anon_vma(struct vm_area_struct *vma);
   300	
   301	bool vma_needs_dirty_tracking(struct vm_area_struct *vma);
   302	bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
   303	
   304	int mm_take_all_locks(struct mm_struct *mm);
   305	void mm_drop_all_locks(struct mm_struct *mm);
   306	unsigned long count_vma_pages_range(struct mm_struct *mm,
   307					    unsigned long addr, unsigned long end,
   308					    unsigned long *nr_accounted);
   309	
   310	static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_struct *vma)
   311	{
   312		/*
   313		 * We want to check manually if we can change individual PTEs writable
   314		 * if we can't do that automatically for all PTEs in a mapping. For
   315		 * private mappings, that's always the case when we have write
   316		 * permissions as we properly have to handle COW.
   317		 */
   318		if (vma->vm_flags & VM_SHARED)
   319			return vma_wants_writenotify(vma, vma->vm_page_prot);
   320		return !!(vma->vm_flags & VM_WRITE);
   321	}
   322	
   323	#ifdef CONFIG_MMU
   324	static inline pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
   325	{
   326		return pgprot_modify(oldprot, vm_get_page_prot(vm_flags));
   327	}
   328	#endif
   329	
   330	static inline struct vm_area_struct *vma_prev_limit(struct vma_iterator *vmi,
   331							    unsigned long min)
   332	{
   333		return mas_prev(&vmi->mas, min);
   334	}
   335	
 > 336	static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
   337				struct vm_area_struct *vma, gfp_t gfp)
   338	{
   339		if (vmi->mas.status != ma_start &&
   340		    ((vmi->mas.index > vma->vm_start) || (vmi->mas.last < vma->vm_start)))
   341			vma_iter_invalidate(vmi);
   342	
   343		__mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
   344		mas_store_gfp(&vmi->mas, vma, gfp);
   345		if (unlikely(mas_is_err(&vmi->mas)))
   346			return -ENOMEM;
   347	
   348		return 0;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
