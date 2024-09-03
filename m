Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4769F17C9B3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358020; cv=none; b=XW0kWHiy3UgqpG3bm9hVIKiiCM1IV1he0Hx0VfMvd9ZvkixqJgM1WEc9nLlBtv04f4ARZu56bbaPJyTWa3yzmpwtiJE4CIG6gcER9sKyiCBbgwTRH1BKiruOJ2ASj2VeDz3GZUFUdpRLrwWIZ0/PwVatkGLUeKq5oNye/KXASe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358020; c=relaxed/simple;
	bh=GFPhJYPwjrz9dWGAjwo4FiR0zaJdmimicE4yOmm4gzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVeyB6UqKRng4YkXCZKvmWECWFMfZD1+yrNHTiEpPskXnb6kW9ieH+gnQu38YF+9WSGR+6S7MSEtSgg3HBBuQ3woT4wvQn4JS5YnkOdZOG1kWHA3K9UwsBcpCnDInkm7oZ0Y+UET+xoAqZwfhevtxnQvgsi7KKAmyI7bmal6f8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnZeCp0e; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnZeCp0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725358018; x=1756894018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GFPhJYPwjrz9dWGAjwo4FiR0zaJdmimicE4yOmm4gzI=;
  b=hnZeCp0eT1gQMzi7Ur1W435qBFf9Mmd2N16mE8xD5ukmVUG9sVhKnDWR
   +Iu3Sze5FP+u9ge+GKSOMNczO57KoRk4MtwPFV0+XBE5gKWcL99JoEVip
   4hLh8wt6XfMwtz2FDKLcnq+QxSjHjzE0Z/3r7GifPelo10gRhkAUpnFj1
   c27Dy+HURYymDk1inhXYsW9FYt3cuBx7IfQh4Y+3mjNGN9A+COTLvi6tg
   VrzBRu7xkvlKlF/yChx7GIsN9pXM2zfvruES81tGvJ3YOL+MoOPH7V5Wx
   v0KWbET/DpOKqEzzi65JJGzr0DonYTNFiOyCL5MRL79Zxxu4gv62ICVGL
   A==;
X-CSE-ConnectionGUID: p+AGxXzrSCiWPyOJJtS6Xw==
X-CSE-MsgGUID: eGzCnhg6RqG1JUmVC06N8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35336796"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="35336796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 03:06:57 -0700
X-CSE-ConnectionGUID: 5jDZbYhER/CupbaYL7VQOw==
X-CSE-MsgGUID: lyJCPOeSRPyYzDuZCBjXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="65584407"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 03:06:57 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slQR4-0006U2-1P;
	Tue, 03 Sep 2024 10:06:54 +0000
Date: Tue, 3 Sep 2024 18:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] mm: entirely reuse the whole anon mTHP in do_wp_page
Message-ID: <202409031705.QP1K65Su-lkp@intel.com>
References: <20240831092339.66085-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831092339.66085-1-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-entirely-reuse-the-whole-anon-mTHP-in-do_wp_page/20240831-172425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240831092339.66085-1-21cnbao%40gmail.com
patch subject: [PATCH RFC] mm: entirely reuse the whole anon mTHP in do_wp_page
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240903/202409031705.QP1K65Su-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031705.QP1K65Su-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031705.QP1K65Su-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/parisc/include/asm/io.h:6,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from mm/memory.c:43:
   mm/memory.c: In function 'wp_folio_reuse':
>> mm/memory.c:3251:70: error: invalid operands to binary + (have 'pte_t' and 'int')
    3251 |                         update_mmu_cache_range(vmf, vma, start, ptep + i, 1);
         |                                                                      ^
   arch/parisc/include/asm/pgtable.h:406:74: note: in definition of macro 'update_mmu_cache_range'
     406 | #define update_mmu_cache_range(vmf, vma, addr, ptep, nr) __update_cache(*ptep)
         |                                                                          ^~~~


vim +3251 mm/memory.c

  3207	
  3208	 /*
  3209	 * Handle write page faults for pages that can be reused in the current vma
  3210	 *
  3211	 * This can happen either due to the mapping being with the VM_SHARED flag,
  3212	 * or due to us being the last reference standing to the page. In either
  3213	 * case, all we need to do here is to mark the page as writable and update
  3214	 * any related book-keeping.
  3215	 * If entirely_reuse is true, we are reusing the whole large folio; otherwise,
  3216	 * we are reusing a subpage even though folio might be large one.
  3217	 */
  3218	static inline void wp_folio_reuse(struct vm_fault *vmf, struct folio *folio,
  3219					  bool entirely_reuse)
  3220		__releases(vmf->ptl)
  3221	{
  3222		unsigned long idx = entirely_reuse ? folio_page_idx(folio, vmf->page) : 0;
  3223		int nr = entirely_reuse ? folio_nr_pages(folio) : 1;
  3224		unsigned long start = vmf->address - idx * PAGE_SIZE;
  3225		unsigned long end = start + nr * PAGE_SIZE;
  3226		struct vm_area_struct *vma = vmf->vma;
  3227		pte_t *ptep = vmf->pte - idx;
  3228		pte_t entry;
  3229	
  3230		VM_BUG_ON(!(vmf->flags & FAULT_FLAG_WRITE));
  3231		VM_WARN_ON(is_zero_pfn(pte_pfn(vmf->orig_pte)));
  3232	
  3233		if (folio) {
  3234			VM_BUG_ON(folio_test_anon(folio) &&
  3235				  !PageAnonExclusive(vmf->page));
  3236			/*
  3237			 * Clear the folio's cpupid information as the existing
  3238			 * information potentially belongs to a now completely
  3239			 * unrelated process.
  3240			 */
  3241			folio_xchg_last_cpupid(folio, (1 << LAST_CPUPID_SHIFT) - 1);
  3242		}
  3243	
  3244		flush_cache_range(vma, start, end);
  3245		for (int i = 0; i < nr; i++) {
  3246			entry = ptep_get(ptep + i);
  3247			entry = pte_mkyoung(entry);
  3248			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
  3249			if (ptep_set_access_flags(vma, start + i * PAGE_SIZE,
  3250					ptep + i, entry, 1))
> 3251				update_mmu_cache_range(vmf, vma, start, ptep + i, 1);
  3252		}
  3253		pte_unmap_unlock(vmf->pte, vmf->ptl);
  3254		count_vm_event(PGREUSE);
  3255	}
  3256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
