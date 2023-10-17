Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582A1946A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3Ou6Uc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697544534; x=1729080534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kKNOmFwo2MWhJmMkRmfKVzuBlB4tZHXQ/Ci/l+2y4U8=;
  b=V3Ou6Uc/DP4b205IyxB7UH1slYRVnJjFcnKF+iylfrrm8aTM84Xucr8b
   u4AZCzbVP6yjfCltkeRF1GoC9iiZXjyrGtTiOk7GFazQm5gywLt9i/0qZ
   5lzOp9fYhaDwq/UuscR0jXQ9rhyquAqQYsEPbZ8l9nRi2zMgDfojGJpej
   EzjHDW59jNOEspRbdxYyZBs57scExkdXQexY/i3maRpoove4YRpCmZ+aK
   LmHAnA4PswF36I+V2gaNVY4iLSo9Fm/pJV7C37iSJ4wHoTjx8uiTN9N9z
   uFSrkH0G6442xjy32rBqx2uONfvu5GXGZ+59SQxtX7q4vXQUWJM7/aNIy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="385601494"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="385601494"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 05:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785462052"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="785462052"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Oct 2023 05:08:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsisU-0009Zm-1W;
	Tue, 17 Oct 2023 12:08:50 +0000
Date: Tue, 17 Oct 2023 20:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: mm/mmap.c:2039 expand_downwards() warn: unsigned 'address' is never
 less than zero.
Message-ID: <202310172018.ZaSUwNss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 8b35ca3e45e35a26a21427f35d4093606e93ad0a arm/mm: Convert to using lock_mm_and_find_vma()
date:   4 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310172018.ZaSUwNss-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310172018.ZaSUwNss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172018.ZaSUwNss-lkp@intel.com/

smatch warnings:
mm/mmap.c:2039 expand_downwards() warn: unsigned 'address' is never less than zero.

vim +/address +2039 mm/mmap.c

  2027	
  2028	/*
  2029	 * vma is the first one with address < vma->vm_start.  Have to extend vma.
  2030	 */
  2031	int expand_downwards(struct vm_area_struct *vma, unsigned long address)
  2032	{
  2033		struct mm_struct *mm = vma->vm_mm;
  2034		MA_STATE(mas, &mm->mm_mt, vma->vm_start, vma->vm_start);
  2035		struct vm_area_struct *prev;
  2036		int error = 0;
  2037	
  2038		address &= PAGE_MASK;
> 2039		if (address < mmap_min_addr || address < FIRST_USER_ADDRESS)
  2040			return -EPERM;
  2041	
  2042		/* Enforce stack_guard_gap */
  2043		prev = mas_prev(&mas, 0);
  2044		/* Check that both stack segments have the same anon_vma? */
  2045		if (prev && !(prev->vm_flags & VM_GROWSDOWN) &&
  2046				vma_is_accessible(prev)) {
  2047			if (address - prev->vm_end < stack_guard_gap)
  2048				return -ENOMEM;
  2049		}
  2050	
  2051		if (mas_preallocate(&mas, GFP_KERNEL))
  2052			return -ENOMEM;
  2053	
  2054		/* We must make sure the anon_vma is allocated. */
  2055		if (unlikely(anon_vma_prepare(vma))) {
  2056			mas_destroy(&mas);
  2057			return -ENOMEM;
  2058		}
  2059	
  2060		/*
  2061		 * vma->vm_start/vm_end cannot change under us because the caller
  2062		 * is required to hold the mmap_lock in read mode.  We need the
  2063		 * anon_vma lock to serialize against concurrent expand_stacks.
  2064		 */
  2065		anon_vma_lock_write(vma->anon_vma);
  2066	
  2067		/* Somebody else might have raced and expanded it already */
  2068		if (address < vma->vm_start) {
  2069			unsigned long size, grow;
  2070	
  2071			size = vma->vm_end - address;
  2072			grow = (vma->vm_start - address) >> PAGE_SHIFT;
  2073	
  2074			error = -ENOMEM;
  2075			if (grow <= vma->vm_pgoff) {
  2076				error = acct_stack_growth(vma, size, grow);
  2077				if (!error) {
  2078					/*
  2079					 * We only hold a shared mmap_lock lock here, so
  2080					 * we need to protect against concurrent vma
  2081					 * expansions.  anon_vma_lock_write() doesn't
  2082					 * help here, as we don't guarantee that all
  2083					 * growable vmas in a mm share the same root
  2084					 * anon vma.  So, we reuse mm->page_table_lock
  2085					 * to guard against concurrent vma expansions.
  2086					 */
  2087					spin_lock(&mm->page_table_lock);
  2088					if (vma->vm_flags & VM_LOCKED)
  2089						mm->locked_vm += grow;
  2090					vm_stat_account(mm, vma->vm_flags, grow);
  2091					anon_vma_interval_tree_pre_update_vma(vma);
  2092					vma->vm_start = address;
  2093					vma->vm_pgoff -= grow;
  2094					/* Overwrite old entry in mtree. */
  2095					mas_set_range(&mas, address, vma->vm_end - 1);
  2096					mas_store_prealloc(&mas, vma);
  2097					anon_vma_interval_tree_post_update_vma(vma);
  2098					spin_unlock(&mm->page_table_lock);
  2099	
  2100					perf_event_mmap(vma);
  2101				}
  2102			}
  2103		}
  2104		anon_vma_unlock_write(vma->anon_vma);
  2105		khugepaged_enter_vma(vma, vma->vm_flags);
  2106		mas_destroy(&mas);
  2107		return error;
  2108	}
  2109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
