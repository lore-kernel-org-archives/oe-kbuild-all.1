Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BE8223702
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 20:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776371989; cv=none; b=KwvzDsvIO9rDU7AwxGhLX4C4tcRr+tcLvliWOD2btXXKRqinp3L+1Ls3ohlpig8mia7a2rjn1TANtx9bMVvTLTT+GatEB3fMa7v2UC/KLd0/BHe/CLYJhjcQRIXYQYqttflXWuuHZkKMivZoXGeNqmG4P2lF+/NNaEnf3/5Fd80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776371989; c=relaxed/simple;
	bh=qycCr3zUkAFIW2TfizhicGlOrOvpAi76MMe/+GpIbTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iWnfmLM1ftDcd5CnFF1CLHLar1JX3U+ZwIIUUgsiiOqCCI/eM4CmuufTQz630dmDQ1o6RBOruvxQFpvbxpz1Yob8Jap7qcC05VKzAJNpCkzcucoIQpb+/dlzsCZOEhd7OumGQBBhFegGYk5R2GJhC5PWdSq/dFwnfxuiTvQB0VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjSO83oo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjSO83oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776371987; x=1807907987;
  h=date:from:to:cc:subject:message-id;
  bh=qycCr3zUkAFIW2TfizhicGlOrOvpAi76MMe/+GpIbTI=;
  b=MjSO83ooiW4EbGVt9rXbI5DIbNs5wESSunZqA6ijWTYFyWv8KxEVYAJo
   KyfmBowX/m8Qr+G8ePUhVZUQDt+l/9pXmCibLA0n2z8Dd1I2QULDMMtqn
   QopHjpp3G7+HonmQlvHQ5T751znJvLXlPPl3naaVevRYdcNlHgNDhMAvw
   xkD1MYC7+s4ZzeS6LWzDVnWKPhvd+2YNq7emdXSQXAsD9+v7L2lAxCFnJ
   B3tu48i7sqnjLL+LjGvzYHStFneQFwQt8CUmx+Q3THDEzVJnc8DAHBOlR
   01/F4MugPp9Q7xmZuP+HpeS6rzaLd5+rx4k+WDkeohGtYt4oP0tng+6Xa
   w==;
X-CSE-ConnectionGUID: jzrkEFqKRZyUfo1i9lAkuQ==
X-CSE-MsgGUID: +Anci2ylQHCoXq+T5p8fEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88085377"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="88085377"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 13:39:47 -0700
X-CSE-ConnectionGUID: bJXBaxjQRXia3b4LJS/pAg==
X-CSE-MsgGUID: cAju23CpR5erUPhmKL72jQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2026 13:39:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDTUx-0000000016P-0zEa;
	Thu, 16 Apr 2026 20:39:39 +0000
Date: Thu, 16 Apr 2026 22:39:09 +0200
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: fs/proc/task_mmu.c:2280:12: warning: 'pagemap_scan_pte_hole'
 defined but not used
Message-ID: <202604162251.kxe7eFeT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-Add-softleaf_from_pud/20260416-123625
head:   258d05b2de477745977b64b126df65257709931d
commit: 258d05b2de477745977b64b126df65257709931d mm: Make /proc/pid/pagemap use the new generic pagewalk API
date:   16 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260416/202604162251.kxe7eFeT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162251.kxe7eFeT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604162251.kxe7eFeT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/task_mmu.c:2938:21: warning: 'can_gather_numa_stats' defined but not used [-Wunused-function]
    2938 | static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
         |                     ^~~~~~~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:2280:12: warning: 'pagemap_scan_pte_hole' defined but not used [-Wunused-function]
    2280 | static int pagemap_scan_pte_hole(unsigned long addr, unsigned long end,
         |            ^~~~~~~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:2174:12: warning: 'pagemap_scan_test_walk' defined but not used [-Wunused-function]
    2174 | static int pagemap_scan_test_walk(unsigned long start, unsigned long end,
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:2106:13: warning: 'make_uffd_wp_huge_pte' defined but not used [-Wunused-function]
    2106 | static void make_uffd_wp_huge_pte(struct vm_area_struct *vma,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:2071:22: warning: 'pagemap_hugetlb_category' defined but not used [-Wunused-function]
    2071 | static unsigned long pagemap_hugetlb_category(pte_t pte)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:2009:22: warning: 'pagemap_thp_category' defined but not used [-Wunused-function]
    2009 | static unsigned long pagemap_thp_category(struct pagemap_scan_private *p,
         |                      ^~~~~~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:1923:22: warning: 'pagemap_page_category' defined but not used [-Wunused-function]
    1923 | static unsigned long pagemap_page_category(struct pagemap_scan_private *p,
         |                      ^~~~~~~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:1753:12: warning: 'pagemap_pte_hole' defined but not used [-Wunused-function]
    1753 | static int pagemap_pte_hole(unsigned long start, unsigned long end,
         |            ^~~~~~~~~~~~~~~~


vim +/pagemap_scan_pte_hole +2280 fs/proc/task_mmu.c

  2105	
> 2106	static void make_uffd_wp_huge_pte(struct vm_area_struct *vma,
  2107					  unsigned long addr, pte_t *ptep,
  2108					  pte_t ptent)
  2109	{
  2110		const unsigned long psize = huge_page_size(hstate_vma(vma));
  2111		softleaf_t entry;
  2112	
  2113		if (huge_pte_none(ptent)) {
  2114			set_huge_pte_at(vma->vm_mm, addr, ptep,
  2115					make_pte_marker(PTE_MARKER_UFFD_WP), psize);
  2116			return;
  2117		}
  2118	
  2119		entry = softleaf_from_pte(ptent);
  2120		if (softleaf_is_hwpoison(entry) || softleaf_is_marker(entry))
  2121			return;
  2122	
  2123		if (softleaf_is_migration(entry))
  2124			set_huge_pte_at(vma->vm_mm, addr, ptep,
  2125					pte_swp_mkuffd_wp(ptent), psize);
  2126		else
  2127			huge_ptep_modify_prot_commit(vma, addr, ptep, ptent,
  2128						     huge_pte_mkuffd_wp(ptent));
  2129	}
  2130	#endif /* CONFIG_HUGETLB_PAGE */
  2131	
  2132	#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLB_PAGE)
  2133	static void pagemap_scan_backout_range(struct pagemap_scan_private *p,
  2134					       unsigned long addr, unsigned long end)
  2135	{
  2136		struct page_region *cur_buf = &p->vec_buf[p->vec_buf_index];
  2137	
  2138		if (!p->vec_buf)
  2139			return;
  2140	
  2141		if (cur_buf->start != addr)
  2142			cur_buf->end = addr;
  2143		else
  2144			cur_buf->start = cur_buf->end = 0;
  2145	
  2146		p->found_pages -= (end - addr) / PAGE_SIZE;
  2147	}
  2148	#endif
  2149	
  2150	static bool pagemap_scan_is_interesting_page(unsigned long categories,
  2151						     const struct pagemap_scan_private *p)
  2152	{
  2153		categories ^= p->arg.category_inverted;
  2154		if ((categories & p->arg.category_mask) != p->arg.category_mask)
  2155			return false;
  2156		if (p->arg.category_anyof_mask && !(categories & p->arg.category_anyof_mask))
  2157			return false;
  2158	
  2159		return true;
  2160	}
  2161	
  2162	static bool pagemap_scan_is_interesting_vma(unsigned long categories,
  2163						    const struct pagemap_scan_private *p)
  2164	{
  2165		unsigned long required = p->arg.category_mask & PAGE_IS_WPALLOWED;
  2166	
  2167		categories ^= p->arg.category_inverted;
  2168		if ((categories & required) != required)
  2169			return false;
  2170	
  2171		return true;
  2172	}
  2173	
> 2174	static int pagemap_scan_test_walk(unsigned long start, unsigned long end,
  2175					  struct mm_walk *walk)
  2176	{
  2177		struct pagemap_scan_private *p = walk->private;
  2178		struct vm_area_struct *vma = walk->vma;
  2179		unsigned long vma_category = 0;
  2180		bool wp_allowed = userfaultfd_wp_async(vma) &&
  2181		    userfaultfd_wp_use_markers(vma);
  2182	
  2183		if (!wp_allowed) {
  2184			/* User requested explicit failure over wp-async capability */
  2185			if (p->arg.flags & PM_SCAN_CHECK_WPASYNC)
  2186				return -EPERM;
  2187			/*
  2188			 * User requires wr-protect, and allows silently skipping
  2189			 * unsupported vmas.
  2190			 */
  2191			if (p->arg.flags & PM_SCAN_WP_MATCHING)
  2192				return 1;
  2193			/*
  2194			 * Then the request doesn't involve wr-protects at all,
  2195			 * fall through to the rest checks, and allow vma walk.
  2196			 */
  2197		}
  2198	
  2199		if (vma->vm_flags & VM_PFNMAP)
  2200			return 1;
  2201	
  2202		if (wp_allowed)
  2203			vma_category |= PAGE_IS_WPALLOWED;
  2204	
  2205		if (vma->vm_flags & VM_SOFTDIRTY)
  2206			vma_category |= PAGE_IS_SOFT_DIRTY;
  2207	
  2208		if (!pagemap_scan_is_interesting_vma(vma_category, p))
  2209			return 1;
  2210	
  2211		p->cur_vma_category = vma_category;
  2212	
  2213		return 0;
  2214	}
  2215	
  2216	static bool pagemap_scan_push_range(unsigned long categories,
  2217					    struct pagemap_scan_private *p,
  2218					    unsigned long addr, unsigned long end)
  2219	{
  2220		struct page_region *cur_buf = &p->vec_buf[p->vec_buf_index];
  2221	
  2222		/*
  2223		 * When there is no output buffer provided at all, the sentinel values
  2224		 * won't match here. There is no other way for `cur_buf->end` to be
  2225		 * non-zero other than it being non-empty.
  2226		 */
  2227		if (addr == cur_buf->end && categories == cur_buf->categories) {
  2228			cur_buf->end = end;
  2229			return true;
  2230		}
  2231	
  2232		if (cur_buf->end) {
  2233			if (p->vec_buf_index >= p->vec_buf_len - 1)
  2234				return false;
  2235	
  2236			cur_buf = &p->vec_buf[++p->vec_buf_index];
  2237		}
  2238	
  2239		cur_buf->start = addr;
  2240		cur_buf->end = end;
  2241		cur_buf->categories = categories;
  2242	
  2243		return true;
  2244	}
  2245	
  2246	static int pagemap_scan_output(unsigned long categories,
  2247				       struct pagemap_scan_private *p,
  2248				       unsigned long addr, unsigned long *end)
  2249	{
  2250		unsigned long n_pages, total_pages;
  2251		int ret = 0;
  2252	
  2253		if (!p->vec_buf)
  2254			return 0;
  2255	
  2256		categories &= p->arg.return_mask;
  2257	
  2258		n_pages = (*end - addr) / PAGE_SIZE;
  2259		if (check_add_overflow(p->found_pages, n_pages, &total_pages) ||
  2260		    total_pages > p->arg.max_pages) {
  2261			size_t n_too_much = total_pages - p->arg.max_pages;
  2262			*end -= n_too_much * PAGE_SIZE;
  2263			n_pages -= n_too_much;
  2264			ret = -ENOSPC;
  2265		}
  2266	
  2267		if (!pagemap_scan_push_range(categories, p, addr, *end)) {
  2268			*end = addr;
  2269			n_pages = 0;
  2270			ret = -ENOSPC;
  2271		}
  2272	
  2273		p->found_pages += n_pages;
  2274		if (ret)
  2275			p->arg.walk_end = *end;
  2276	
  2277		return ret;
  2278	}
  2279	
> 2280	static int pagemap_scan_pte_hole(unsigned long addr, unsigned long end,
  2281					 int depth, struct mm_walk *walk)
  2282	{
  2283		struct pagemap_scan_private *p = walk->private;
  2284		struct vm_area_struct *vma = walk->vma;
  2285		int ret, err;
  2286	
  2287		if (!vma || !pagemap_scan_is_interesting_page(p->cur_vma_category, p))
  2288			return 0;
  2289	
  2290		ret = pagemap_scan_output(p->cur_vma_category, p, addr, &end);
  2291		if (addr == end)
  2292			return ret;
  2293	
  2294		if (~p->arg.flags & PM_SCAN_WP_MATCHING)
  2295			return ret;
  2296	
  2297		err = uffd_wp_range(vma, addr, end - addr, true);
  2298		if (err < 0)
  2299			ret = err;
  2300	
  2301		return ret;
  2302	}
  2303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
