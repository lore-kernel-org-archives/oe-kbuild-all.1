Received: from mgamail.intel.com (unknown [134.134.136.100])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B22B171AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690465479; x=1722001479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cetE0OBLwB3oQ/u0oP0c3N+jwUPJPIWL+H26fXQFnnQ=;
  b=hq6OjUlW7g3OhPnMycgLK1219s+Vc3klusG+l4vWMdtQKfWmeEX5ESHw
   y1sUN4o2LMnew7v4jVl8+mdE8vUbphzvUS9p7cAsvFKKnPw9XnSTn60F6
   lnkhY3g4HlMc6Ju+EkGQW/ZrPrOa4MRTxy5kPJNdPGn0MwzIUs1j2kUAY
   oE7J1P4MccZSnavASXnMrk729LQ63NoLrsUaXC5YDQqPnTZqbuo6K99fM
   sxhyVEMIbUJcrULl7D9NQrDF2GfFTERytlar0fx435QHHfSwEarK9+i/b
   ROaLaDe90UzYIxwyrFpcKub3riLkST2HUN3kpBcAYpLG7fcA5LJ+uq293
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434594324"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="434594324"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 06:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730268288"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="730268288"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2023 06:29:50 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP13u-0002IV-00;
	Thu, 27 Jul 2023 13:29:50 +0000
Date: Thu, 27 Jul 2023 21:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 16/16] fs/proc/task_mmu.c:2157:44: error:
 positional initialization of field in 'struct' declared with
 'designated_init' attribute
Message-ID: <202307272145.jHYgTDnh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   7f5486d52f9fc22d52d0ee923f91971713ebc57e
commit: 7f5486d52f9fc22d52d0ee923f91971713ebc57e [16/16] FIXUP: mm: don't initialize `reclaim_walk.pmd_entry`
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230727/202307272145.jHYgTDnh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307272145.jHYgTDnh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307272145.jHYgTDnh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'reclaim_mm':
>> fs/proc/task_mmu.c:2157:44: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    2157 |         struct mm_walk_ops reclaim_walk = {0};
         |                                            ^
   fs/proc/task_mmu.c:2157:44: note: (near initialization for 'reclaim_walk')
>> fs/proc/task_mmu.c:2157:44: error: invalid initializer
   fs/proc/task_mmu.c:2157:44: note: (near initialization for 'reclaim_walk.<anonymous>')
   cc1: some warnings being treated as errors


vim +2157 fs/proc/task_mmu.c

  2153	
  2154	static void reclaim_mm(struct mm_struct *mm, enum reclaim_type type, unsigned long nr_to_try)
  2155	{
  2156		struct vm_area_struct *start, *vma;
> 2157		struct mm_walk_ops reclaim_walk = {0};
  2158		struct walk_data reclaim_data = {
  2159			.type = type,
  2160			.nr_to_try = nr_to_try,
  2161		};
  2162	
  2163		mmap_read_lock(mm);
  2164	
  2165		start = find_vma(mm, 0);
  2166		if (nr_to_try != ULONG_MAX) {
  2167			unsigned int start_idx;
  2168	
  2169			/*
  2170			 * Try to start at a random VMA to avoid always
  2171			 * reclaiming the same pages.
  2172			 */
  2173			start_idx = get_random_u32() % mm->map_count;
  2174			for (; start_idx && start; start_idx--)
  2175				start = find_vma(mm, start->vm_end);
  2176		}
  2177		BUG_ON(!start);
  2178	
  2179		vma = start;
  2180		while (reclaim_data.nr_to_try) {
  2181			if (is_vm_hugetlb_page(vma))
  2182				goto next;
  2183	
  2184			if (vma->vm_flags & VM_LOCKED)
  2185				goto next;
  2186	
  2187			if (type == RECLAIM_ANON && !vma_is_anonymous(vma))
  2188				goto next;
  2189			if ((type == RECLAIM_FILE || type == RECLAIM_SHMEM)
  2190					&& vma_is_anonymous(vma)) {
  2191				goto next;
  2192			}
  2193	
  2194			if (vma_is_anonymous(vma) || shmem_file(vma->vm_file)) {
  2195				if (get_nr_swap_pages() <= 0 ||
  2196					get_mm_counter(mm, MM_ANONPAGES) == 0) {
  2197					if (type == RECLAIM_ALL)
  2198						goto next;
  2199					else
  2200						break;
  2201				}
  2202	
  2203				if (shmem_file(vma->vm_file) && type != RECLAIM_SHMEM)
  2204					goto next;
  2205	
  2206				reclaim_walk.pmd_entry = reclaim_pte_range;
  2207			} else {
  2208				reclaim_walk.pmd_entry = deactivate_pte_range;
  2209			}
  2210	
  2211			/*
  2212			 * Use a random start address if we are limited in order
  2213			 * to avoid always hitting the same pages when we only
  2214			 * have a few eligible mappings.
  2215			 */
  2216			if (nr_to_try != ULONG_MAX) {
  2217				unsigned long idx, start;
  2218	
  2219				idx = (vma->vm_end - vma->vm_start) / PAGE_SIZE;
  2220				idx = idx ? (get_random_u32() % idx) : 0;
  2221				start = vma->vm_start + PAGE_SIZE * idx;
  2222	
  2223				walk_page_range(mm, start, vma->vm_end,
  2224				    &reclaim_walk, (void *)&reclaim_data);
  2225				if (start != vma->vm_start)
  2226					walk_page_range(mm, vma->vm_start,
  2227					    start, &reclaim_walk,
  2228					    (void *)&reclaim_data);
  2229			} else {
  2230				walk_page_range(mm, vma->vm_start, vma->vm_end,
  2231				    &reclaim_walk, (void *)&reclaim_data);
  2232			}
  2233	
  2234	next:
  2235			vma = find_vma(mm, vma->vm_end);
  2236			if (!vma)
  2237				vma = find_vma(mm, 0);
  2238	
  2239			/* Already walked through all of them. */
  2240			if (vma == start)
  2241				break;
  2242		}
  2243	
  2244		flush_tlb_mm(mm);
  2245		mmap_read_unlock(mm);
  2246	}
  2247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
