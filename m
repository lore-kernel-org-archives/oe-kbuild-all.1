Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3409810942
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 01:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748396876; cv=none; b=qn37KOqaw7zzB92/7Hj/qL7Yz9an6fZhGR8QyacrL+gDszBYqJbkwoOcB6QVt8VKyJOPr4xClGVViFNYV8PgVkvUePuQarJXCB9atzP3BrzQll1gsWQdpLg8HN0lziVqsMjcwar5d7tSG1lzEXIMbwHZ6QqaopKSy2bPsfpHU04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748396876; c=relaxed/simple;
	bh=+DEonCUMKOQqPPHXBNST1rV53SX9h/h5SDa8kI8Tco4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jHQMhKxaVYcXU66inn/PW7pEVXuA6MG0fFnEgVgYodSUe+4ptWRDJn6cvzDOp2b/qrbzJ5v1WMx7coTiLFoRKkkz/AaMeYCOuZUSMWR4VWEHnt10bttZPqObHULgILOKduBbgPdKwFpiKnXifjch+B48CeMIsXQVzJ2X4HScsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGbCEhZU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGbCEhZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748396875; x=1779932875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+DEonCUMKOQqPPHXBNST1rV53SX9h/h5SDa8kI8Tco4=;
  b=dGbCEhZUEPQpiSSydemnYXBlDPGPzQadXBPd5x9I4b3WT7txuYI1neUJ
   IoO607D8roqB2YQrCM390WrDAnkGKvf909idQFtSNFdTRkhBlnCCPceg5
   MD1rIsseiDgxoWvcdIdKaqVM5UwkaukcRFqaYypO/350MfYMtq9L2zpHC
   7ZEnXQe0AYMmYkLGNHP8nCaqBgSnUyg0VyhFXK7jovVVs8/OtCV/3RulZ
   D2kHIs62URaA/DoAWDipxCQcAFKzyvsrNr9JBlZXDC2aw5Zf0bths1CKN
   FlXEotobELsPXiJ6Y3kLpmQJ+kOYULfHeBDbqigB3aZ/KYvG5XSHzs5f4
   g==;
X-CSE-ConnectionGUID: 10cTbxtzTIWwlzlhgdxSJg==
X-CSE-MsgGUID: /x5vGoTrTUupBp3tLoVbIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="53032875"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="53032875"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 18:47:54 -0700
X-CSE-ConnectionGUID: +IL+nqh9Sf2O0GoxXEfpJA==
X-CSE-MsgGUID: VZL3CYG8SAyMH/nlq7fjXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="173948638"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2025 18:47:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK5tX-000VAS-1o;
	Wed, 28 May 2025 01:47:51 +0000
Date: Wed, 28 May 2025 09:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/385] mm/mmap.c:2413:34:
 warning: variable 'e' set but not used
Message-ID: <202505280915.tZDxMrH5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ed91d589b2844cb67999b23119f18a01d3c1cedc
commit: e9fdabfc2aeb273168e60795e68896dfdeed6fdd [0/385] FROMLIST: BACKPORT: mm: Change do_vmi_align_munmap() side tree index
config: x86_64-buildonly-randconfig-003-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280915.tZDxMrH5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280915.tZDxMrH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280915.tZDxMrH5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mmap.c: In function 'do_mas_align_munmap':
>> mm/mmap.c:2413:34: warning: variable 'e' set but not used [-Wunused-but-set-variable]
    2413 |                 unsigned long s, e;
         |                                  ^
>> mm/mmap.c:2413:31: warning: variable 's' set but not used [-Wunused-but-set-variable]
    2413 |                 unsigned long s, e;
         |                               ^
--
>> mm/memory.c:1709: warning: Function parameter or member 'start_t' not described in 'unmap_vmas'
>> mm/memory.c:1709: warning: Function parameter or member 'end_t' not described in 'unmap_vmas'


vim +/e +2413 mm/mmap.c

  2291	
  2292	/*
  2293	 * do_mas_align_munmap() - munmap the aligned region from @start to @end.
  2294	 * @mas: The maple_state, ideally set up to alter the correct tree location.
  2295	 * @vma: The starting vm_area_struct
  2296	 * @mm: The mm_struct
  2297	 * @start: The aligned start address to munmap.
  2298	 * @end: The aligned end address to munmap.
  2299	 * @uf: The userfaultfd list_head
  2300	 * @downgrade: Set to true to attempt a write downgrade of the mmap_sem
  2301	 *
  2302	 * If @downgrade is true, check return code for potential release of the lock.
  2303	 */
  2304	static int
  2305	do_mas_align_munmap(struct ma_state *mas, struct vm_area_struct *vma,
  2306			    struct mm_struct *mm, unsigned long start,
  2307			    unsigned long end, struct list_head *uf, bool downgrade)
  2308	{
  2309		struct vm_area_struct *prev, *next = NULL;
  2310		struct maple_tree mt_detach;
  2311		int count = 0;
  2312		int error = -ENOMEM;
  2313		MA_STATE(mas_detach, &mt_detach, 0, 0);
  2314		mt_init_flags(&mt_detach, mas->tree->ma_flags & MT_FLAGS_LOCK_MASK);
  2315		mt_set_external_lock(&mt_detach, &mm->mmap_lock);
  2316	
  2317		mas->last = end - 1;
  2318		/*
  2319		 * If we need to split any vma, do it now to save pain later.
  2320		 *
  2321		 * Note: mremap's move_vma VM_ACCOUNT handling assumes a partially
  2322		 * unmapped vm_area_struct will remain in use: so lower split_vma
  2323		 * places tmp vma above, and higher split_vma places tmp vma below.
  2324		 */
  2325	
  2326		/* Does it split the first one? */
  2327		if (start > vma->vm_start) {
  2328	
  2329			/*
  2330			 * Make sure that map_count on return from munmap() will
  2331			 * not exceed its limit; but let map_count go just above
  2332			 * its limit temporarily, to help free resources as expected.
  2333			 */
  2334			if (end < vma->vm_end && mm->map_count >= sysctl_max_map_count)
  2335				goto map_count_exceeded;
  2336	
  2337			/*
  2338			 * mas_pause() is not needed since mas->index needs to be set
  2339			 * differently than vma->vm_end anyways.
  2340			 */
  2341			error = __split_vma(mm, vma, start, 0);
  2342			if (error)
  2343				goto start_split_failed;
  2344	
  2345			mas_set(mas, start);
  2346			vma = mas_walk(mas);
  2347		}
  2348	
  2349		prev = mas_prev(mas, 0);
  2350		if (unlikely((!prev)))
  2351			mas_set(mas, start);
  2352	
  2353		/*
  2354		 * Detach a range of VMAs from the mm. Using next as a temp variable as
  2355		 * it is always overwritten.
  2356		 */
  2357		mas_for_each(mas, next, end - 1) {
  2358			/* Does it split the end? */
  2359			if (next->vm_end > end) {
  2360				struct vm_area_struct *split;
  2361	
  2362				error = __split_vma(mm, next, end, 1);
  2363				if (error)
  2364					goto end_split_failed;
  2365	
  2366				mas_set(mas, end);
  2367				split = mas_prev(mas, 0);
  2368				error = munmap_sidetree(split, count, &mas_detach);
  2369				if (error)
  2370					goto munmap_sidetree_failed;
  2371	
  2372				count++;
  2373				if (vma == next)
  2374					vma = split;
  2375				break;
  2376			}
  2377			error = munmap_sidetree(next, count, &mas_detach);
  2378			if (error)
  2379				goto munmap_sidetree_failed;
  2380	
  2381			count++;
  2382	#ifdef CONFIG_DEBUG_VM_MAPLE_TREE
  2383			BUG_ON(next->vm_start < start);
  2384			BUG_ON(next->vm_start > end);
  2385	#endif
  2386		}
  2387	
  2388		if (!next)
  2389			next = mas_next(mas, ULONG_MAX);
  2390	
  2391		if (unlikely(uf)) {
  2392			/*
  2393			 * If userfaultfd_unmap_prep returns an error the vmas
  2394			 * will remain split, but userland will get a
  2395			 * highly unexpected error anyway. This is no
  2396			 * different than the case where the first of the two
  2397			 * __split_vma fails, but we don't undo the first
  2398			 * split, despite we could. This is unlikely enough
  2399			 * failure that it's not worth optimizing it for.
  2400			 */
  2401			error = userfaultfd_unmap_prep(mm, start, end, uf);
  2402	
  2403			if (error)
  2404				goto userfaultfd_error;
  2405		}
  2406	
  2407	#if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
  2408		/* Make sure no VMAs are about to be lost. */
  2409		{
  2410			MA_STATE(test, &mt_detach, 0, 0);
  2411			struct vm_area_struct *vma_mas, *vma_test;
  2412			int test_count = 0;
> 2413			unsigned long s, e;
  2414	
  2415			mas_set_range(mas, start, end - 1);
  2416			rcu_read_lock();
  2417			vma_test = mas_find(&test, count - 1);
  2418			mas_for_each(mas, vma_mas, end - 1) {
  2419				if (!test_count)
  2420					s = vma_mas->vm_start;
  2421				BUG_ON(vma_mas != vma_test);
  2422				test_count++;
  2423				if (test_count == count)
  2424					e = vma_mas->vm_end;
  2425				vma_test = mas_next(&test, count - 1);
  2426			}
  2427			rcu_read_unlock();
  2428			BUG_ON(count != test_count);
  2429		}
  2430	#endif
  2431		/* Point of no return */
  2432		mas_set_range(mas, start, end - 1);
  2433		if (mas_store_gfp(mas, NULL, GFP_KERNEL))
  2434			return -ENOMEM;
  2435	
  2436		mm->map_count -= count;
  2437		/*
  2438		 * Do not downgrade mmap_lock if we are next to VM_GROWSDOWN or
  2439		 * VM_GROWSUP VMA. Such VMAs can change their size under
  2440		 * down_read(mmap_lock) and collide with the VMA we are about to unmap.
  2441		 */
  2442		if (downgrade) {
  2443			if (next && (next->vm_flags & VM_GROWSDOWN))
  2444				downgrade = false;
  2445			else if (prev && (prev->vm_flags & VM_GROWSUP))
  2446				downgrade = false;
  2447			else
  2448				mmap_write_downgrade(mm);
  2449		}
  2450	
  2451		unmap_region(mm, &mt_detach, vma, prev, next, start, end, 1, count);
  2452		/* Statistics and freeing VMAs */
  2453		mas_set(&mas_detach, 0);
  2454		remove_mt(mm, &mas_detach);
  2455		__mt_destroy(&mt_detach);
  2456	
  2457	
  2458		validate_mm(mm);
  2459		return downgrade ? 1 : 0;
  2460	
  2461	userfaultfd_error:
  2462	munmap_sidetree_failed:
  2463	end_split_failed:
  2464		__mt_destroy(&mt_detach);
  2465	start_split_failed:
  2466	map_count_exceeded:
  2467		return error;
  2468	}
  2469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
