Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30D307AE4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 04:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769400261; cv=none; b=PEuH7CKfefm8RSbZWdaUqutmsSedprcFIf8oAER7JzeTjKb8l1oAXXgpD9ODLqlt0WNkQqAX3PhpRfi+iTi26jdBruu3dleQcUuSIJm4ZXrB/5QO+KWdnO2uKDRTygo5OlOLKDn25bXk+VICURfIHouoLbJv4PiBOHqhAsxlaeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769400261; c=relaxed/simple;
	bh=a3iNMLit+kMe8I/F8jE2AjXgR+027BbglltsU6VKmIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVa3RkoWnScw4re8U7KJdMniZYZycNeUT18Iu8IcShSqtekwBBlfKjCRRkV5ro5zPYkvDEHwOsiFVVK6YxyeuAv5ag8ydQtRpptzBmy53Pb8cSrtZhcP3mny1wWJrqael7THv/1tjrY+0Z0y2at4TGWZAqcwQzHOSpDNkVdI0bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTXrgMMV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTXrgMMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769400259; x=1800936259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a3iNMLit+kMe8I/F8jE2AjXgR+027BbglltsU6VKmIY=;
  b=FTXrgMMVug68SxACw+bCPxdNrwauc5x0VlS5KhCCr/h7u/mhUcLtlpet
   /SkfNQmgRtRwIkht/986hKl7erI6fqL36Vz0S3jgrhRZjf5vL5sOKK7wX
   oTvXvI/LrvCUgoCj4kbIvt4bTnhh1H3afEkD5i/efL1K23XFpUNkqZwfA
   RoyW6XXvYeQGZUFBsNhj9x7K3nNYuOuieMy0UOZztuU6i1hArl38TONeA
   actsWZOedy4NmnSfkVC6q2oFUZ0dQInkO9RhoB5SB/J/VHLFRJOYXayKT
   SQqw1UO+Bu1F/MJ3RdqCH4bRt241JSvEPQBhhxzYSGq8zDiztZr4Yov/J
   A==;
X-CSE-ConnectionGUID: 0AB1641sRVWu6mAiChQe2A==
X-CSE-MsgGUID: pyZs9SMjSzWJjASl2Dlv5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74419161"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74419161"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 20:04:19 -0800
X-CSE-ConnectionGUID: UBFIBXBgSiqj3cvyZeQyPQ==
X-CSE-MsgGUID: W4KPQ00FRW2czCeSyjnQdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="206814354"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2026 20:04:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkDpl-000000001Pp-1XbH;
	Mon, 26 Jan 2026 04:04:13 +0000
Date: Mon, 26 Jan 2026 05:04:04 +0100
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 09/12] mm, swap: use the swap table to track the swap
 count
Message-ID: <202601260524.qYN30lLA-lkp@intel.com>
References: <20260126-swap-table-p3-v1-9-a74155fab9b0@tencent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-swap-table-p3-v1-9-a74155fab9b0@tencent.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 10de4550639e9df9242e32e9affc90ed75a27c7d]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-protect-si-swap_file-properly-and-use-as-a-mount-indicator/20260126-020149
base:   10de4550639e9df9242e32e9affc90ed75a27c7d
patch link:    https://lore.kernel.org/r/20260126-swap-table-p3-v1-9-a74155fab9b0%40tencent.com
patch subject: [PATCH 09/12] mm, swap: use the swap table to track the swap count
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260126/202601260524.qYN30lLA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260524.qYN30lLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260524.qYN30lLA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/swapfile.c: In function 'unuse_pte_range':
>> mm/swapfile.c:2351:31: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
    2351 |                 unsigned long offset;
         |                               ^~~~~~
>> mm/swapfile.c:2346:34: warning: variable 'si' set but not used [-Wunused-but-set-variable]
    2346 |         struct swap_info_struct *si;
         |                                  ^~


vim +/offset +2351 mm/swapfile.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  2340  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2341  static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
^1da177e4c3f41 Linus Torvalds          2005-04-16  2342  			unsigned long addr, unsigned long end,
10a9c496789fe2 Christoph Hellwig       2022-01-21  2343  			unsigned int type)
^1da177e4c3f41 Linus Torvalds          2005-04-16  2344  {
d850fa72987378 Hugh Dickins            2023-06-08  2345  	pte_t *pte = NULL;
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05 @2346  	struct swap_info_struct *si;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2347  
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2348  	si = swap_info[type];
^1da177e4c3f41 Linus Torvalds          2005-04-16  2349  	do {
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2350) 		struct folio *folio;
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02 @2351) 		unsigned long offset;
0177fe675b3916 Kairui Song             2026-01-26  2352  		unsigned long swp_tb;
3f79b187ad2f67 Kairui Song             2022-12-20  2353  		unsigned char swp_count;
06fb61462bdea3 Lorenzo Stoakes         2025-11-10  2354  		softleaf_t entry;
d850fa72987378 Hugh Dickins            2023-06-08  2355  		int ret;
c33c794828f212 Ryan Roberts            2023-06-12  2356  		pte_t ptent;
d850fa72987378 Hugh Dickins            2023-06-08  2357  
d850fa72987378 Hugh Dickins            2023-06-08  2358  		if (!pte++) {
d850fa72987378 Hugh Dickins            2023-06-08  2359  			pte = pte_offset_map(pmd, addr);
d850fa72987378 Hugh Dickins            2023-06-08  2360  			if (!pte)
d850fa72987378 Hugh Dickins            2023-06-08  2361  				break;
d850fa72987378 Hugh Dickins            2023-06-08  2362  		}
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2363) 
c33c794828f212 Ryan Roberts            2023-06-12  2364  		ptent = ptep_get_lockless(pte);
06fb61462bdea3 Lorenzo Stoakes         2025-11-10  2365  		entry = softleaf_from_pte(ptent);
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2366) 
06fb61462bdea3 Lorenzo Stoakes         2025-11-10  2367  		if (!softleaf_is_swap(entry))
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2368  			continue;
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2369  		if (swp_type(entry) != type)
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2370  			continue;
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2371  
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2372  		offset = swp_offset(entry);
044d66c1d2b1c5 Hugh Dickins            2008-02-07  2373  		pte_unmap(pte);
d850fa72987378 Hugh Dickins            2023-06-08  2374  		pte = NULL;
d850fa72987378 Hugh Dickins            2023-06-08  2375  
f28124617f3415 Kairui Song             2025-09-17  2376  		folio = swap_cache_get_folio(entry);
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2377) 		if (!folio) {
8c63ca5bc3e19f Will Deacon             2021-01-14  2378  			struct vm_fault vmf = {
8c63ca5bc3e19f Will Deacon             2021-01-14  2379  				.vma = vma,
8c63ca5bc3e19f Will Deacon             2021-01-14  2380  				.address = addr,
824ddc601adc2c Nadav Amit              2022-03-22  2381  				.real_address = addr,
8c63ca5bc3e19f Will Deacon             2021-01-14  2382  				.pmd = pmd,
8c63ca5bc3e19f Will Deacon             2021-01-14  2383  			};
8c63ca5bc3e19f Will Deacon             2021-01-14  2384  
94dc8bffd8b7fe Matthew Wilcox (Oracle  2024-08-07  2385) 			folio = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE,
ebc5951eea4993 Andrea Righi            2020-06-01  2386  						&vmf);
ebc5951eea4993 Andrea Righi            2020-06-01  2387  		}
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2388) 		if (!folio) {
0177fe675b3916 Kairui Song             2026-01-26  2389  			swp_tb = swap_table_get(__swap_entry_to_cluster(entry),
0177fe675b3916 Kairui Song             2026-01-26  2390  						  swp_cluster_offset(entry));
0177fe675b3916 Kairui Song             2026-01-26  2391  			swp_count = swp_tb_get_count(swp_tb);
0177fe675b3916 Kairui Song             2026-01-26  2392  			if (swp_count <= 0)
d850fa72987378 Hugh Dickins            2023-06-08  2393  				continue;
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2394  			return -ENOMEM;
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2395  		}
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2396  
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2397) 		folio_lock(folio);
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2398) 		folio_wait_writeback(folio);
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2399) 		ret = unuse_pte(vma, pmd, addr, entry, folio);
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2400  		if (ret < 0) {
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2401) 			folio_unlock(folio);
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2402) 			folio_put(folio);
d850fa72987378 Hugh Dickins            2023-06-08  2403  			return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2404  		}
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2405  
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2406) 		folio_free_swap(folio);
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2407) 		folio_unlock(folio);
f102cd8b173e06 Matthew Wilcox (Oracle  2022-09-02  2408) 		folio_put(folio);
d850fa72987378 Hugh Dickins            2023-06-08  2409  	} while (addr += PAGE_SIZE, addr != end);
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  2410  
d850fa72987378 Hugh Dickins            2023-06-08  2411  	if (pte)
d850fa72987378 Hugh Dickins            2023-06-08  2412  		pte_unmap(pte);
d850fa72987378 Hugh Dickins            2023-06-08  2413  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2414  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  2415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
