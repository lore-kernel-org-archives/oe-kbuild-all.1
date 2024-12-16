Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE0157469
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 05:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734328181; cv=none; b=ChouaWGd8FfvorLMJ0t6Y8AW97HIuBcPCc+PIYXeC6WPVjUpJp/omXQHg1bpzIeu1B7yaRqW/qqFvYlRBy3q2Bx11eBmK90u9No2Jn0BuSg9TRZktz+/BFxQ53raeKy3o5DB1LSZ3/8Qvuz2tvsbXxKTIZ/nX2suIA04lFWNJXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734328181; c=relaxed/simple;
	bh=FXzbqVDlG36CsofirsOyvcJa2dhQ91qGzFdEKfy1MsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ua7XOgRsp2m2Kbwe/8/irsSjs9mFZomTOfPMspOZlAL8KAxQTgHfxfb0HneC98pMeDIzms/tGA6Hg7UXGFvKqOY8JZVYImZPCN6/CIY4CrBgOpiLFO1kPz/y3P3JuoG50NgFSDmGy9kNDwdJv77ikz6YPhDI8qVn7dQn+PKNgPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krco8CFC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krco8CFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734328179; x=1765864179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FXzbqVDlG36CsofirsOyvcJa2dhQ91qGzFdEKfy1MsI=;
  b=krco8CFCljMx8WLw41uF856emg4UgKgf2X82NVzQ1MSzBotC4e041y1/
   tbTEATISQPaoqU0TjWblmG0C5FukmMQfaY2mppruRsflCHrcVDHpma3b1
   Pg7WdF/Du+rdrbFKsWeuuV/z0BdM7+NjxTAOhWFHIekavz51vPtEqKuA+
   f2yu7T0wPLYHKrN+5HzkSs4HxcOj/bYPRP5337FK7HGguBD4gYAtWCgqF
   970o4PL9843fwiF9b0jEQfsw1SOscgwzSbX4t2RReb3uc72vzTgg7ze0W
   jA4CCXnPV6qTuADxh2RzYB07nMmXU8cPLAj31vzI8Wxc0FN36MzaXbPMh
   A==;
X-CSE-ConnectionGUID: siMY3K5ETi+ghaCgsKK3VQ==
X-CSE-MsgGUID: ZzyhwPFVScyednXD4X3lEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="45309442"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="45309442"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 21:49:38 -0800
X-CSE-ConnectionGUID: kHTcd1QKR62cMrJH+Jd7sQ==
X-CSE-MsgGUID: FvAy2R8/TjuOR2/Fwyy5Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102074925"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Dec 2024 21:49:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN3z4-000E3Q-2o;
	Mon, 16 Dec 2024 05:49:34 +0000
Date: Mon, 16 Dec 2024 13:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/memory.c:1546:24: error:
 implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did
 you mean 'hugetlb_insert__hugepage_pte_by_pa'?
Message-ID: <202412161346.WAg6a7B0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   098a595b2caf96f57cda68f082b4dc0019d7814d
commit: 18f49509eef01d1ee6ed81899298994f2f88dd2a [1327/1327] ascend: share_pool: Use remap_pfn_range to share kva to uva
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241216/202412161346.WAg6a7B0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161346.WAg6a7B0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161346.WAg6a7B0-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'vm_insert_page':
>> mm/memory.c:1546:24: error: implicit declaration of function 'hugetlb_insert_hugepage_pte_by_pa'; did you mean 'hugetlb_insert__hugepage_pte_by_pa'? [-Werror=implicit-function-declaration]
    1546 |                 return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        hugetlb_insert__hugepage_pte_by_pa
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/smp.h:12,
                    from include/linux/kernel_stat.h:5,
                    from mm/memory.c:41:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'copy_one_pte' at mm/memory.c:731:5,
       inlined from 'copy_pte_range' at mm/memory.c:869:15:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   In file included from mm/memory.c:46:
   include/linux/sched/task.h: In function 'copy_pte_range':
   include/linux/sched/task.h:23:19: note: object 'mmlist_lock' of size 4
      23 | extern spinlock_t mmlist_lock;
         |                   ^~~~~~~~~~~
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'copy_one_pte' at mm/memory.c:731:5,
       inlined from 'copy_pte_range' at mm/memory.c:869:15:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:283:1: note: in expansion of macro '__CMPXCHG_CASE'
     283 | __CMPXCHG_CASE(w,  , acq_4,        , a,  , "memory")
         | ^~~~~~~~~~~~~~
   include/linux/sched/task.h: In function 'copy_pte_range':
   include/linux/sched/task.h:23:19: note: object 'mmlist_lock' of size 4
      23 | extern spinlock_t mmlist_lock;
         |                   ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1546 mm/memory.c

  1504	
  1505	/**
  1506	 * vm_insert_page - insert single page into user vma
  1507	 * @vma: user vma to map to
  1508	 * @addr: target user address of this page
  1509	 * @page: source kernel page
  1510	 *
  1511	 * This allows drivers to insert individual pages they've allocated
  1512	 * into a user vma.
  1513	 *
  1514	 * The page has to be a nice clean _individual_ kernel allocation.
  1515	 * If you allocate a compound page, you need to have marked it as
  1516	 * such (__GFP_COMP), or manually just split the page up yourself
  1517	 * (see split_page()).
  1518	 *
  1519	 * NOTE! Traditionally this was done with "remap_pfn_range()" which
  1520	 * took an arbitrary page protection parameter. This doesn't allow
  1521	 * that. Your vma protection will have to be set up correctly, which
  1522	 * means that if you want a shared writable mapping, you'd better
  1523	 * ask for a shared writable mapping!
  1524	 *
  1525	 * The page does not need to be reserved.
  1526	 *
  1527	 * Usually this function is called from f_op->mmap() handler
  1528	 * under mm->mmap_sem write-lock, so it can change vma->vm_flags.
  1529	 * Caller must set VM_MIXEDMAP on vma if it wants to call this
  1530	 * function from other places, for example from page-fault handler.
  1531	 */
  1532	int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
  1533				struct page *page)
  1534	{
  1535		if (addr < vma->vm_start || addr >= vma->vm_end)
  1536			return -EFAULT;
  1537		if (!page_count(page))
  1538			return -EINVAL;
  1539		if (!(vma->vm_flags & VM_MIXEDMAP)) {
  1540			BUG_ON(down_read_trylock(&vma->vm_mm->mmap_sem));
  1541			BUG_ON(vma->vm_flags & VM_PFNMAP);
  1542			vma->vm_flags |= VM_MIXEDMAP;
  1543		}
  1544	
  1545		if (sp_check_hugepage(page))
> 1546			return hugetlb_insert_hugepage_pte_by_pa(vma->vm_mm, addr,
  1547						vma->vm_page_prot, page_to_phys(page));
  1548		else
  1549			return insert_page(vma, addr, page, vma->vm_page_prot);
  1550	}
  1551	EXPORT_SYMBOL(vm_insert_page);
  1552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
