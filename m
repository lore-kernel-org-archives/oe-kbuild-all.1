Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73536B04E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777673702; cv=none; b=NJyjxfINM/hT9WL623FA05R02n3OUoe6VN3/cPt3J5cmg9v+Zqr6Jy3Dr9NVRJLooaU6qUzENkDagAkmhJmEGBeztMaGIUVZJMJyhpB0TRQQqsrtNMJ8FJRoHmP2fW+N2IaSSDLqwXybbvvIEOvVjN8txueBMJxRpcwkK/1zEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777673702; c=relaxed/simple;
	bh=Vym5EpOPRmdeVEuQRPr8ojXfyAierx2wF97UU52pzL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDBAZZ6MlpEdJpZy4RcMS7eHzhqCRdvYgXRwZpns3Ky1MgTgM6Kxt8Yqs503dFiuWwFO0xDXyQSxWCfTr/f7feFojXPF5u6SXGUHt1RTRGeWyfQBqhR6UAF97676060yYtvr27tW9CWOaBAfNrqmTpgNsNNN4dvn0zZSv96xyQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeUY2Xc9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeUY2Xc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777673699; x=1809209699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vym5EpOPRmdeVEuQRPr8ojXfyAierx2wF97UU52pzL8=;
  b=CeUY2Xc9mSGYO3m608fZHYSlvQk2I2pdfoRc5koYSzRLJ/GhUy7JGpV6
   F0mnn1KTmk7dZ6UCR+M3qsi0tGn3EQWzqD0tIyt/QTT3YwvmYItZjIp91
   4ERDUJO6fOg2AABK4DepalrnOVKTKnBxXKnmOZLf4opT0S9JxlIeZN9Vj
   B40LDkB3SAUPHIYvC60WWYnC3cBkd57qtoJ0VtVhHXUEUXP4Q1DOAa7vV
   5pL/ZkxyUq3s5q2/p+NuXnOBjAPYMzOuxLVzVJVf9FJlbL4gLrSKBetGU
   TnNlTLH+8dwfAi/wzsHlwfX9RyFICtHo92lgJ+BXuuMYftntUJ/NvajDt
   w==;
X-CSE-ConnectionGUID: FIxJ6TqiQD6t5doP4XqPXA==
X-CSE-MsgGUID: llmY4eLeQHy+M0hiSqqosg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78687046"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78687046"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 15:14:59 -0700
X-CSE-ConnectionGUID: UmcSV/8fS+Obs0RoKg/pyw==
X-CSE-MsgGUID: +An0TqmcSrS7beiUavDlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="236755530"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2026 15:14:58 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIw8O-000000000tx-0S2O;
	Fri, 01 May 2026 22:14:56 +0000
Date: Sat, 2 May 2026 06:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyu Wang <25181214217@stu.xidian.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm/hugetlb: fix resv_map memory leak in
 __mmap_region error path
Message-ID: <202605020656.9mdM8VGh-lkp@intel.com>
References: <20260425070700.562229-1-25181214217@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425070700.562229-1-25181214217@stu.xidian.edu.cn>

Hi Mingyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyu-Wang/mm-hugetlb-fix-resv_map-memory-leak-in-__mmap_region-error-path/20260425-203812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260425070700.562229-1-25181214217%40stu.xidian.edu.cn
patch subject: [RFC PATCH] mm/hugetlb: fix resv_map memory leak in __mmap_region error path
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605020656.9mdM8VGh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020656.9mdM8VGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020656.9mdM8VGh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/sched/signal.h:14,
                    from include/linux/ptrace.h:7,
                    from arch/alpha/kernel/asm-offsets.c:12:
>> include/linux/mm_types.h:865:35: warning: 'struct vm_area_desc' declared inside parameter list will not be visible outside of this definition or declaration
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^~~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/backing-dev.h:13,
                    from mm/vma_internal.h:12,
                    from mm/vma.c:7:
>> include/linux/mm_types.h:865:35: warning: 'struct vm_area_desc' declared inside parameter list will not be visible outside of this definition or declaration
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^~~~~~~~~~~~
   mm/vma.c: In function '__mmap_region':
>> mm/vma.c:2805:40: error: passing argument 1 of 'desc.action.abort_hook' from incompatible pointer type [-Wincompatible-pointer-types]
    2805 |                 desc.action.abort_hook(&desc);
         |                                        ^~~~~
         |                                        |
         |                                        struct vm_area_desc *
   mm/vma.c:2805:40: note: expected 'struct vm_area_desc *' but argument is of type 'struct vm_area_desc *'
--
   In file included from include/linux/sched/signal.h:14,
                    from include/linux/ptrace.h:7,
                    from arch/alpha/kernel/asm-offsets.c:12:
>> include/linux/mm_types.h:865:35: warning: 'struct vm_area_desc' declared inside parameter list will not be visible outside of this definition or declaration
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^~~~~~~~~~~~
   In file included from include/linux/sched/mm.h:8,
                    from kernel/sched/sched.h:15,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/mm_types.h:865:35: warning: 'struct vm_area_desc' declared inside parameter list will not be visible outside of this definition or declaration
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^~~~~~~~~~~~


vim +2805 mm/vma.c

  2731	
  2732	static unsigned long __mmap_region(struct file *file, unsigned long addr,
  2733			unsigned long len, vma_flags_t vma_flags,
  2734			unsigned long pgoff, struct list_head *uf)
  2735	{
  2736		struct mm_struct *mm = current->mm;
  2737		struct vm_area_struct *vma = NULL;
  2738		bool have_mmap_prepare = file && file->f_op->mmap_prepare;
  2739		VMA_ITERATOR(vmi, mm, addr);
  2740		MMAP_STATE(map, mm, &vmi, addr, len, pgoff, vma_flags, file);
  2741		struct vm_area_desc desc = {
  2742			.mm = mm,
  2743			.file = file,
  2744			.action = {
  2745				.type = MMAP_NOTHING, /* Default to no further action. */
  2746			},
  2747		};
  2748		bool allocated_new = false;
  2749		int error;
  2750	
  2751		map.check_ksm_early = can_set_ksm_flags_early(&map);
  2752	
  2753		error = __mmap_setup(&map, &desc, uf);
  2754		if (!error && have_mmap_prepare)
  2755			error = call_mmap_prepare(&map, &desc);
  2756		if (error)
  2757			goto abort_munmap;
  2758	
  2759		if (map.check_ksm_early)
  2760			update_ksm_flags(&map);
  2761	
  2762		/* Attempt to merge with adjacent VMAs... */
  2763		if (map.prev || map.next) {
  2764			VMG_MMAP_STATE(vmg, &map, /* vma = */ NULL);
  2765	
  2766			vma = vma_merge_new_range(&vmg);
  2767		}
  2768	
  2769		/* ...but if we can't, allocate a new VMA. */
  2770		if (!vma) {
  2771			error = __mmap_new_vma(&map, &vma, &desc.action);
  2772			if (error)
  2773				goto unacct_error;
  2774			allocated_new = true;
  2775		}
  2776	
  2777		if (have_mmap_prepare)
  2778			set_vma_user_defined_fields(vma, &map);
  2779	
  2780		__mmap_complete(&map, vma);
  2781	
  2782		if (have_mmap_prepare && allocated_new) {
  2783			error = mmap_action_complete(vma, &desc.action,
  2784						     /*is_compat=*/false);
  2785			if (error)
  2786				return error;
  2787		}
  2788	
  2789		return addr;
  2790	
  2791		/* Accounting was done by __mmap_setup(). */
  2792	unacct_error:
  2793		if (map.charged)
  2794			vm_unacct_memory(map.charged);
  2795	abort_munmap:
  2796		/*
  2797		 * This indicates that .mmap_prepare has set a new file, differing from
  2798		 * desc->vm_file. But since we're aborting the operation, only the
  2799		 * original file will be cleaned up. Ensure we clean up both.
  2800		 */
  2801		if (map.file_doesnt_need_get)
  2802			fput(map.file);
  2803		
  2804		if (have_mmap_prepare && desc.action.abort_hook)
> 2805			desc.action.abort_hook(&desc);
  2806		
  2807		vms_abort_munmap_vmas(&map.vms, &map.mas_detach);
  2808		return error;
  2809	}
  2810	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
