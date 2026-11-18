Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030954;
	b=4T4aZ6N2ynNUx2CELmR+MwlWzx/GbrKMWjfPf/kv//SQ7soDCmssrJz5osdvYTdiVWMD
	 Y5+wi/bMut4X8bUTM6/fVH433QFP+uyhMAB+UyRSg9VvzEcBX53cpplB0LkEB2q9e+qKq
	 Opghr5tZsXl5qT7DN37MVFf4xIYu+l4AYF5D6hq46218OWHE53lapNszMCoZLrKODErYT
	 Xrq+wQL5oZL7OBcWawQtA1Ux/lYk6j1Kb+pBvrGN4Tw1fOQJd5gbjYQ3fGDfpxX+47QXc
	 ERFPuJ14L+PQec4KKlA+5ICwC619BaXGjaejJvd/IuTTvtJyWpBvRSOBBjpCKlODB4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030954;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GDUCqGJTwyCp0Do+1Y6R5QyfK74UGHuBD8eHu1IUAvk=;
	b=kAlehV4xB2+mJddb/09U3nGodssDzqHfn2l6jGNMa/+aA8Z8MfFiXMmYWMNXBgmJTJxd
	 ewhPsXMBSGDM0v6lG9+75WtoOpPcn3uK8uz9dXvYY4xUMfwV1LwP5j/ixi8G4x/6rSuzB
	 7ZyMpFVxHKnAfT4bsBuyBZ1Mgi9Iru9kHf0XtKm6u7pEh032GQTIsaryVgL2KCbIC+iaU
	 h86B26uiPRrJXzFrlsKhQ0AhnhcQnQjG5KbJPPhwhRslG62NdXW+Oi/2cfqD0phK3gdoT
	 RfNSF06Qspz/3PEBLyyb4JqCdTqb1kt31fQpDR/s4/0i2WkIpuf47LP9I11ZvtdXpsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bvnft6pO;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9A606A90E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 19:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF9A606A90E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bvnft6pO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795030953; x=1826566953;
  h=date:from:to:cc:subject:message-id;
  bh=JuTn8srZA7Q0T065m5zrwTM3FfSaTg6iJGEub3H1x/4=;
  b=Bvnft6pOC+1gqkLqQBG4cR+LSdQ0Mk/eCockV+nr/Akf52Zg3XcK3PRo
   Qsw6eAcoTkZONO3UJ9n3KjfMyCkp6aByrJPGduyH8CtCd7ilQu1oaCO+O
   yvZ11oxx03iWo6m6QrHgnfoN/lcMnwMINfjeAnG08yoUDbg1sbWm39Fs5
   DBsIZCoNUieWtQjmsFuxtjbk7g5Rh/ah9eS+43RV5fYy99AdavCMtpLTL
   Ghd7p+FPalyEXFaRvy5ZtqTt/vo5TxFoe05+n9ETCFy+HYEI2n/APgBiu
   wNdxfQ1450EDBYi+fb75cApxFhWco+0ZM6xhvAja9ycppGFT/beVa/yzE
   Q==;
X-CSE-ConnectionGUID: yfpOc//bRoGNq4IEC65Dng==
X-CSE-MsgGUID: 0yFCGIONQHm9hH9VSY/Y+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3743833"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3743833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 11:42:33 -0800
X-CSE-ConnectionGUID: 09ztYPVLQpys4iDJwSo/4Q==
X-CSE-MsgGUID: VAVK/31mRoyV0Z06PST3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10026780"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Nov 2026 11:42:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTlY5-000000003SL-1L57;
	Wed, 18 Nov 2026 19:42:29 +0000
Date: Wed, 18 Nov 2026 20:42:13 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 200/200]
 mm/huge_memory.c:2702 split_huge_page_to_list() warn: inconsistent indenting
Message-ID: <20261118203810.XznsnmuL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   32c8e7bb8f634f61dd3c764ccd86ac57794bb9f5
commit: be167981c33bf75d72fd867227406ef0b438114b [200/200] mm/huge_memory: use folio's memcg inside __folio_split()
config: i386-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118203810.XznsnmuL-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118203810.XznsnmuL-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:2702 split_huge_page_to_list() warn: inconsistent indenting

vim +2702 mm/huge_memory.c

  2654	
  2655	/*
  2656	 * This function splits huge page into normal pages. @page can point to any
  2657	 * subpage of huge page to split. Split doesn't change the position of @page.
  2658	 *
  2659	 * Only caller must hold pin on the @page, otherwise split fails with -EBUSY.
  2660	 * The huge page must be locked.
  2661	 *
  2662	 * If @list is null, tail pages will be added to LRU list, otherwise, to @list.
  2663	 *
  2664	 * Both head page and tail pages will inherit mapping, flags, and so on from
  2665	 * the hugepage.
  2666	 *
  2667	 * GUP pin and PG_locked transferred to @page. Rest subpages can be freed if
  2668	 * they are not mapped.
  2669	 *
  2670	 * Returns 0 if the hugepage is split successfully.
  2671	 * Returns -EBUSY if the page is pinned or if anon_vma disappeared from under
  2672	 * us.
  2673	 */
  2674	int split_huge_page_to_list(struct page *page, struct list_head *list)
  2675	{
  2676		struct folio *folio = page_folio(page);
  2677		struct deferred_split *ds_queue = get_deferred_split_queue(&folio->page);
  2678		XA_STATE(xas, &folio->mapping->i_pages, folio->index);
  2679		struct mem_cgroup *memcg, *old_memcg;
  2680		struct anon_vma *anon_vma = NULL;
  2681		struct address_space *mapping = NULL;
  2682		int extra_pins, ret;
  2683		pgoff_t end;
  2684		bool is_hzp;
  2685	
  2686		VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
  2687		VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
  2688	
  2689		is_hzp = is_huge_zero_page(&folio->page);
  2690		if (is_hzp) {
  2691			pr_warn_ratelimited("Called split_huge_page for huge zero page\n");
  2692			return -EBUSY;
  2693		}
  2694	
  2695		if (folio_test_writeback(folio))
  2696			return -EBUSY;
  2697	
  2698		/*
  2699		 * switch to folio's memcg as xarray node allocation can happen and
  2700		 * needs to charge to it.
  2701		 */
> 2702	    memcg = folio_memcg(folio);
  2703	    old_memcg = set_active_memcg(memcg);
  2704	
  2705		if (folio_test_anon(folio)) {
  2706			/*
  2707			 * The caller does not necessarily hold an mmap_lock that would
  2708			 * prevent the anon_vma disappearing so we first we take a
  2709			 * reference to it and then lock the anon_vma for write. This
  2710			 * is similar to folio_lock_anon_vma_read except the write lock
  2711			 * is taken to serialise against parallel split or collapse
  2712			 * operations.
  2713			 */
  2714			anon_vma = folio_get_anon_vma(folio);
  2715			if (!anon_vma) {
  2716				ret = -EBUSY;
  2717				goto out;
  2718			}
  2719			end = -1;
  2720			mapping = NULL;
  2721			anon_vma_lock_write(anon_vma);
  2722		} else {
  2723			gfp_t gfp;
  2724	
  2725			mapping = folio->mapping;
  2726	
  2727			/* Truncated ? */
  2728			if (!mapping) {
  2729				ret = -EBUSY;
  2730				goto out;
  2731			}
  2732	
  2733			gfp = current_gfp_context(mapping_gfp_mask(mapping) &
  2734								GFP_RECLAIM_MASK);
  2735	
  2736			if (!filemap_release_folio(folio, gfp)) {
  2737				ret = -EBUSY;
  2738				goto out;
  2739			}
  2740	
  2741			xas_split_alloc(&xas, folio, folio_order(folio), gfp);
  2742			if (xas_error(&xas)) {
  2743				ret = xas_error(&xas);
  2744				goto out;
  2745			}
  2746	
  2747			anon_vma = NULL;
  2748			i_mmap_lock_read(mapping);
  2749	
  2750			/*
  2751			 *__split_huge_page() may need to trim off pages beyond EOF:
  2752			 * but on 32-bit, i_size_read() takes an irq-unsafe seqlock,
  2753			 * which cannot be nested inside the page tree lock. So note
  2754			 * end now: i_size itself may be changed at any moment, but
  2755			 * folio lock is good enough to serialize the trimming.
  2756			 */
  2757			end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
  2758			if (shmem_mapping(mapping))
  2759				end = shmem_fallocend(mapping->host, end);
  2760		}
  2761	
  2762		/*
  2763		 * Racy check if we can split the page, before unmap_folio() will
  2764		 * split PMDs
  2765		 */
  2766		if (!can_split_folio(folio, &extra_pins)) {
  2767			ret = -EAGAIN;
  2768			goto out_unlock;
  2769		}
  2770	
  2771		unmap_folio(folio);
  2772	
  2773		/* block interrupt reentry in xa_lock and spinlock */
  2774		local_irq_disable();
  2775		if (mapping) {
  2776			/*
  2777			 * Check if the folio is present in page cache.
  2778			 * We assume all tail are present too, if folio is there.
  2779			 */
  2780			xas_lock(&xas);
  2781			xas_reset(&xas);
  2782			if (xas_load(&xas) != folio)
  2783				goto fail;
  2784		}
  2785	
  2786		/* Prevent deferred_split_scan() touching ->_refcount */
  2787		spin_lock(&ds_queue->split_queue_lock);
  2788		if (folio_ref_freeze(folio, 1 + extra_pins)) {
  2789			if (!list_empty(page_deferred_list(&folio->page))) {
  2790				ds_queue->split_queue_len--;
  2791				list_del(page_deferred_list(&folio->page));
  2792			}
  2793			spin_unlock(&ds_queue->split_queue_lock);
  2794			if (mapping) {
  2795				int nr = folio_nr_pages(folio);
  2796	
  2797				xas_split(&xas, folio, folio_order(folio));
  2798				if (folio_test_pmd_mappable(folio)) {
  2799					if (folio_test_swapbacked(folio)) {
  2800						__lruvec_stat_mod_folio(folio,
  2801								NR_SHMEM_THPS, -nr);
  2802					} else {
  2803						__lruvec_stat_mod_folio(folio,
  2804								NR_FILE_THPS, -nr);
  2805						filemap_nr_thps_dec(mapping);
  2806					}
  2807				}
  2808			}
  2809	
  2810			__split_huge_page(page, list, end, mapping);
  2811			/* __split_huge_page() dropped the i_mmap lock */
  2812			mapping = NULL;
  2813			ret = 0;
  2814		} else {
  2815			spin_unlock(&ds_queue->split_queue_lock);
  2816	fail:
  2817			if (mapping)
  2818				xas_unlock(&xas);
  2819			local_irq_enable();
  2820			remap_page(folio, folio_nr_pages(folio));
  2821			ret = -EAGAIN;
  2822		}
  2823	
  2824	out_unlock:
  2825		if (anon_vma) {
  2826			anon_vma_unlock_write(anon_vma);
  2827			put_anon_vma(anon_vma);
  2828		}
  2829		if (mapping)
  2830			i_mmap_unlock_read(mapping);
  2831	out:
  2832		/* restore to caller's old_memcg */
  2833		set_active_memcg(old_memcg);
  2834		xas_destroy(&xas);
  2835		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
  2836		return ret;
  2837	}
  2838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
