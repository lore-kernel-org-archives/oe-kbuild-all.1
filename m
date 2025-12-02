Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724EF1F936
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764681210; cv=none; b=DvHBRIzIbEyS6fcHZMV0AS+sw6A6J3FZPLjvKGYOwCatZrkpn7qCOp/g/GRuO1X0c0wgJeve8wgMSw75Ib9Fm/kWI/Hl9DdGBeNfr2QJZHw9FvKf6tfzUPoDy7UkiszrFf5FhGumhfP9BIzokhBm6qmP6pD+eTMINllZTU094oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764681210; c=relaxed/simple;
	bh=/ta28tsivT1Ja3WdC7xp5h03cAQopret/M11TopZKb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=er3ELKxR2MHesBrx6XtBbGcoYrDqgJXV961jGHKQFHaGk3GouBNzRxj5HZgvVnik1S8dXuwvkFHhJxl5xMDkBed6gij7poHYgl3ohkYMR3TAxhRph58CrGV6nj2rvt8srZUp4KoT+53nEfAgFMoT6eIAz758Wg7GrE77xcEiU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Luvfyvnv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Luvfyvnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764681207; x=1796217207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ta28tsivT1Ja3WdC7xp5h03cAQopret/M11TopZKb0=;
  b=LuvfyvnvB3UNtxcCfyhvVwepOaSYuQiQ3ZxKuV1nivN7BIO42Y9f6bZT
   V1yxWgHxUbPWHkESH+/bMRsMrDkm44hdz5EyOn/Hqxpay01+Uzdh44mgX
   x1ttfy82IXVaRxQLB1Omih7i1W0DixHQ6kJVCGrtdjkLqmTYx0GOuKGRU
   4cDJCkLkd70JZVaOxQXheu/m4GCwAhltIrRycQSYuTeKozWQYmPYP/W8+
   MxN6+FBoAAAvLBQEyEuOLW2tc4DaXTvf3CzdzLQKteDo861BH3oBr7jFm
   LXe8vmcoKB/mUrlay/koSXcA7pzxxXFyXtSTRUFjLjUwyXvTWeM855RYS
   Q==;
X-CSE-ConnectionGUID: D3wS361xQuOG8xA2571xWQ==
X-CSE-MsgGUID: zCVn5vWWTFyWpQpgV3TGug==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65833414"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="65833414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 05:13:27 -0800
X-CSE-ConnectionGUID: YENhvVAmTFuH68ajKHhFTA==
X-CSE-MsgGUID: 8hGPOFNSQA6isTRNURk7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="199311422"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2025 05:13:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQQC3-000000009qD-37vF;
	Tue, 02 Dec 2025 13:13:23 +0000
Date: Tue, 2 Dec 2025 21:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1]
 drivers/virtio/virtio_mem.c:2213:6: warning: variable 'count_vmemmap' set
 but not used
Message-ID: <202512022005.HUdP2zxi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   fb3dc582fdefab0d6ab237b393b1e7e7f65dc78c
commit: 2916febd5bc1263c3b0d0793eab0905f54e146e3 [0/1] anolis: virtio-mem: support unplugging free memory only
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251202/202512022005.HUdP2zxi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022005.HUdP2zxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512022005.HUdP2zxi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_mem.c:2213:6: warning: variable 'count_vmemmap' set but not used [-Wunused-but-set-variable]
    2213 |         int count_vmemmap = 0;
         |             ^
>> drivers/virtio/virtio_mem.c:2347:6: warning: no previous prototype for function 'virtio_mem_sbm_unplug_any_sb_online_may_slow' [-Wmissing-prototypes]
    2347 | bool virtio_mem_sbm_unplug_any_sb_online_may_slow(struct virtio_mem *vm,
         |      ^
   drivers/virtio/virtio_mem.c:2347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2347 | bool virtio_mem_sbm_unplug_any_sb_online_may_slow(struct virtio_mem *vm,
         | ^
         | static 
   2 warnings generated.


vim +/count_vmemmap +2213 drivers/virtio/virtio_mem.c

2916febd5bc126 Yang Rong         2025-10-29  2194  
72f9525ad76b1d David Hildenbrand 2020-05-07  2195  /*
72f9525ad76b1d David Hildenbrand 2020-05-07  2196   * Unplug the desired number of plugged subblocks of an online memory block.
72f9525ad76b1d David Hildenbrand 2020-05-07  2197   * Will skip subblock that are busy.
72f9525ad76b1d David Hildenbrand 2020-05-07  2198   *
72f9525ad76b1d David Hildenbrand 2020-05-07  2199   * Will modify the state of the memory block. Might temporarily drop the
72f9525ad76b1d David Hildenbrand 2020-05-07  2200   * hotplug_mutex.
72f9525ad76b1d David Hildenbrand 2020-05-07  2201   *
72f9525ad76b1d David Hildenbrand 2020-05-07  2202   * Note: Can fail after some subblocks were successfully unplugged. Can
72f9525ad76b1d David Hildenbrand 2020-05-07  2203   *       return 0 even if subblocks were busy and could not get unplugged.
72f9525ad76b1d David Hildenbrand 2020-05-07  2204   */
6184ab6f7d0355 David Hildenbrand 2020-11-12  2205  static int virtio_mem_sbm_unplug_any_sb_online(struct virtio_mem *vm,
72f9525ad76b1d David Hildenbrand 2020-05-07  2206  					       unsigned long mb_id,
72f9525ad76b1d David Hildenbrand 2020-05-07  2207  					       uint64_t *nb_sb)
72f9525ad76b1d David Hildenbrand 2020-05-07  2208  {
72f9525ad76b1d David Hildenbrand 2020-05-07  2209  	int rc, sb_id;
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2210  	bool map = false;
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2211  	unsigned long nr_vmemmap_size = get_memory_block_vmemmap_pages(mb_id);
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2212  	unsigned long nr_vmemmap_sbs = nr_vmemmap_size / vm->sbm.sb_size;
39dbfa37de5e43 zhongjiang-ali    2024-04-09 @2213  	int count_vmemmap = 0;
72f9525ad76b1d David Hildenbrand 2020-05-07  2214  
72f9525ad76b1d David Hildenbrand 2020-05-07  2215  	/* If possible, try to unplug the complete block in one shot. */
c15996947bf8bf David Hildenbrand 2020-11-12  2216  	if (*nb_sb >= vm->sbm.sbs_per_mb &&
c15996947bf8bf David Hildenbrand 2020-11-12  2217  	    virtio_mem_sbm_test_sb_plugged(vm, mb_id, 0, vm->sbm.sbs_per_mb)) {
6184ab6f7d0355 David Hildenbrand 2020-11-12  2218  		rc = virtio_mem_sbm_unplug_sb_online(vm, mb_id, 0,
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2219  						     vm->sbm.sbs_per_mb, map);
72f9525ad76b1d David Hildenbrand 2020-05-07  2220  		if (!rc) {
c15996947bf8bf David Hildenbrand 2020-11-12  2221  			*nb_sb -= vm->sbm.sbs_per_mb;
72f9525ad76b1d David Hildenbrand 2020-05-07  2222  			goto unplugged;
72f9525ad76b1d David Hildenbrand 2020-05-07  2223  		} else if (rc != -EBUSY)
72f9525ad76b1d David Hildenbrand 2020-05-07  2224  			return rc;
72f9525ad76b1d David Hildenbrand 2020-05-07  2225  	}
72f9525ad76b1d David Hildenbrand 2020-05-07  2226  
72f9525ad76b1d David Hildenbrand 2020-05-07  2227  	/* Fallback to single subblocks. */
c15996947bf8bf David Hildenbrand 2020-11-12  2228  	for (sb_id = vm->sbm.sbs_per_mb - 1; sb_id >= 0 && *nb_sb; sb_id--) {
72f9525ad76b1d David Hildenbrand 2020-05-07  2229  		/* Find the next candidate subblock */
72f9525ad76b1d David Hildenbrand 2020-05-07  2230  		while (sb_id >= 0 &&
a1136b36f62ff6 David Hildenbrand 2020-11-12  2231  		       !virtio_mem_sbm_test_sb_plugged(vm, mb_id, sb_id, 1))
72f9525ad76b1d David Hildenbrand 2020-05-07  2232  			sb_id--;
72f9525ad76b1d David Hildenbrand 2020-05-07  2233  		if (sb_id < 0)
72f9525ad76b1d David Hildenbrand 2020-05-07  2234  			break;
72f9525ad76b1d David Hildenbrand 2020-05-07  2235  
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2236  		if (nr_vmemmap_size && sb_id < nr_vmemmap_sbs &&
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2237  			virtio_mem_sbm_test_sb_unplugged(vm, mb_id, nr_vmemmap_sbs,
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2238  			vm->sbm.sbs_per_mb - nr_vmemmap_sbs)) {
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2239  			map = true;
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2240  			count_vmemmap++;
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2241  			continue;
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2242  		}
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2243  
39dbfa37de5e43 zhongjiang-ali    2024-04-09  2244  		rc = virtio_mem_sbm_unplug_sb_online(vm, mb_id, sb_id, 1, map);
72f9525ad76b1d David Hildenbrand 2020-05-07  2245  		if (rc == -EBUSY)
72f9525ad76b1d David Hildenbrand 2020-05-07  2246  			continue;
72f9525ad76b1d David Hildenbrand 2020-05-07  2247  		else if (rc)
72f9525ad76b1d David Hildenbrand 2020-05-07  2248  			return rc;
255f5985070839 David Hildenbrand 2020-05-07  2249  		*nb_sb -= 1;
255f5985070839 David Hildenbrand 2020-05-07  2250  	}
255f5985070839 David Hildenbrand 2020-05-07  2251  
72f9525ad76b1d David Hildenbrand 2020-05-07  2252  unplugged:
255f5985070839 David Hildenbrand 2020-05-07  2253  	/*
a573238786f8f1 David Hildenbrand 2020-05-07  2254  	 * Once all subblocks of a memory block were unplugged, offline and
a573238786f8f1 David Hildenbrand 2020-05-07  2255  	 * remove it. This will usually not fail, as no memory is in use
a573238786f8f1 David Hildenbrand 2020-05-07  2256  	 * anymore - however some other notifiers might NACK the request.
255f5985070839 David Hildenbrand 2020-05-07  2257  	 */
2916febd5bc126 Yang Rong         2025-10-29  2258  	return __virtio_mem_sbm_offline_and_remove_mb(vm, mb_id, nb_sb,
2916febd5bc126 Yang Rong         2025-10-29  2259  						      nr_vmemmap_sbs, map);
2916febd5bc126 Yang Rong         2025-10-29  2260  }
2916febd5bc126 Yang Rong         2025-10-29  2261  
2916febd5bc126 Yang Rong         2025-10-29  2262  /*
2916febd5bc126 Yang Rong         2025-10-29  2263   * Similar to `virtio_mem_sbm_unplug_any_sb_offline`,
2916febd5bc126 Yang Rong         2025-10-29  2264   * but only for free memory that is above the order_per_sb.
2916febd5bc126 Yang Rong         2025-10-29  2265   */
2916febd5bc126 Yang Rong         2025-10-29  2266  static int virtio_mem_sbm_unplug_any_free_sb_online(struct virtio_mem *vm,
2916febd5bc126 Yang Rong         2025-10-29  2267  					       unsigned long mb_id, uint64_t *nb_sb)
2916febd5bc126 Yang Rong         2025-10-29  2268  {
2916febd5bc126 Yang Rong         2025-10-29  2269  	unsigned long block_addr = virtio_mem_mb_id_to_phys(mb_id);
2916febd5bc126 Yang Rong         2025-10-29  2270  	unsigned long pages_per_sb = PFN_DOWN(vm->sbm.sb_size);
2916febd5bc126 Yang Rong         2025-10-29  2271  	unsigned long order_per_sb = get_order(vm->sbm.sb_size);
2916febd5bc126 Yang Rong         2025-10-29  2272  	unsigned long nr_vmemmap_pages = PFN_DOWN(get_memory_block_vmemmap_pages(mb_id));
2916febd5bc126 Yang Rong         2025-10-29  2273  	unsigned long nr_vmemmap_sbs = nr_vmemmap_pages / pages_per_sb;
2916febd5bc126 Yang Rong         2025-10-29  2274  	unsigned long order, pfn;
2916febd5bc126 Yang Rong         2025-10-29  2275  	struct page *page;
2916febd5bc126 Yang Rong         2025-10-29  2276  	int rc, sb_id, contig_sbs = 0;
2916febd5bc126 Yang Rong         2025-10-29  2277  
2916febd5bc126 Yang Rong         2025-10-29  2278  	for (sb_id = 0; sb_id < vm->sbm.sbs_per_mb && *nb_sb; sb_id++) {
2916febd5bc126 Yang Rong         2025-10-29  2279  		/* Count the maximum contiguous free subblocks starting from the sb_id */
2916febd5bc126 Yang Rong         2025-10-29  2280  		while (sb_id + contig_sbs < vm->sbm.sbs_per_mb) {
2916febd5bc126 Yang Rong         2025-10-29  2281  			pfn = PFN_DOWN(block_addr + (sb_id + contig_sbs) * vm->sbm.sb_size);
2916febd5bc126 Yang Rong         2025-10-29  2282  			page = pfn_to_page(pfn);
2916febd5bc126 Yang Rong         2025-10-29  2283  
2916febd5bc126 Yang Rong         2025-10-29  2284  			/* If the page is not free, stop counting */
2916febd5bc126 Yang Rong         2025-10-29  2285  			if (!PageBuddy(page))
2916febd5bc126 Yang Rong         2025-10-29  2286  				break;
2916febd5bc126 Yang Rong         2025-10-29  2287  			order = READ_ONCE(page_private(page));
2916febd5bc126 Yang Rong         2025-10-29  2288  
2916febd5bc126 Yang Rong         2025-10-29  2289  			if (order < order_per_sb || order > MAX_ORDER)
2916febd5bc126 Yang Rong         2025-10-29  2290  				break;
2916febd5bc126 Yang Rong         2025-10-29  2291  
2916febd5bc126 Yang Rong         2025-10-29  2292  			contig_sbs += 1U << (order - order_per_sb);
2916febd5bc126 Yang Rong         2025-10-29  2293  
2916febd5bc126 Yang Rong         2025-10-29  2294  			if (contig_sbs > *nb_sb) {
2916febd5bc126 Yang Rong         2025-10-29  2295  				contig_sbs = *nb_sb;
2916febd5bc126 Yang Rong         2025-10-29  2296  				break;
2916febd5bc126 Yang Rong         2025-10-29  2297  			}
2916febd5bc126 Yang Rong         2025-10-29  2298  		}
2916febd5bc126 Yang Rong         2025-10-29  2299  
2916febd5bc126 Yang Rong         2025-10-29  2300  		if (contig_sbs) {
2916febd5bc126 Yang Rong         2025-10-29  2301  			/*
2916febd5bc126 Yang Rong         2025-10-29  2302  			 * No need to check if contiguous subblocks are plugged,
2916febd5bc126 Yang Rong         2025-10-29  2303  			 * their presence in the Buddy allocator confirms they are.
2916febd5bc126 Yang Rong         2025-10-29  2304  			 */
2916febd5bc126 Yang Rong         2025-10-29  2305  			rc = virtio_mem_sbm_unplug_sb_online(vm, mb_id, sb_id,
2916febd5bc126 Yang Rong         2025-10-29  2306  							     contig_sbs, false);
2916febd5bc126 Yang Rong         2025-10-29  2307  			if (!rc) {
2916febd5bc126 Yang Rong         2025-10-29  2308  				sb_id += contig_sbs;
2916febd5bc126 Yang Rong         2025-10-29  2309  				*nb_sb -= contig_sbs;
2916febd5bc126 Yang Rong         2025-10-29  2310  				contig_sbs = 0;
2916febd5bc126 Yang Rong         2025-10-29  2311  			} else if (rc == -EBUSY) {
2916febd5bc126 Yang Rong         2025-10-29  2312  				/* Fallback to single subblocks. */
2916febd5bc126 Yang Rong         2025-10-29  2313  				while (contig_sbs--) {
2916febd5bc126 Yang Rong         2025-10-29  2314  					rc = virtio_mem_sbm_unplug_sb_online(
2916febd5bc126 Yang Rong         2025-10-29  2315  						vm, mb_id, sb_id++, 1, false);
a573238786f8f1 David Hildenbrand 2020-05-07  2316  					if (!rc)
2916febd5bc126 Yang Rong         2025-10-29  2317  						*nb_sb -= 1;
2916febd5bc126 Yang Rong         2025-10-29  2318  					else if (rc != -EBUSY)
2916febd5bc126 Yang Rong         2025-10-29  2319  						return rc;
2916febd5bc126 Yang Rong         2025-10-29  2320  				}
2916febd5bc126 Yang Rong         2025-10-29  2321  			} else
2916febd5bc126 Yang Rong         2025-10-29  2322  				return rc;
2916febd5bc126 Yang Rong         2025-10-29  2323  		}
2916febd5bc126 Yang Rong         2025-10-29  2324  	}
2916febd5bc126 Yang Rong         2025-10-29  2325  
2916febd5bc126 Yang Rong         2025-10-29  2326  	/* Once all subblocks of a memory block were unplugged, offline and remove it.*/
2916febd5bc126 Yang Rong         2025-10-29  2327  	if (*nb_sb >= nr_vmemmap_sbs &&
2916febd5bc126 Yang Rong         2025-10-29  2328  	    virtio_mem_sbm_test_sb_unplugged(vm, mb_id, nr_vmemmap_sbs,
2916febd5bc126 Yang Rong         2025-10-29  2329  			vm->sbm.sbs_per_mb - nr_vmemmap_sbs)) {
2916febd5bc126 Yang Rong         2025-10-29  2330  		rc = __virtio_mem_sbm_offline_and_remove_mb(
2916febd5bc126 Yang Rong         2025-10-29  2331  			vm, mb_id, nb_sb, nr_vmemmap_sbs, true);
2916febd5bc126 Yang Rong         2025-10-29  2332  		if (rc)
2916febd5bc126 Yang Rong         2025-10-29  2333  			return rc;
a573238786f8f1 David Hildenbrand 2020-05-07  2334  	}
a573238786f8f1 David Hildenbrand 2020-05-07  2335  
255f5985070839 David Hildenbrand 2020-05-07  2336  	return 0;
255f5985070839 David Hildenbrand 2020-05-07  2337  }
255f5985070839 David Hildenbrand 2020-05-07  2338  
2916febd5bc126 Yang Rong         2025-10-29  2339  /*
2916febd5bc126 Yang Rong         2025-10-29  2340   * Pre-check if `virtio_mem_sbm_unplug_any_sb_online()` is slow.
2916febd5bc126 Yang Rong         2025-10-29  2341   * If the memory is shared by many processes, `alloc_contig_range`
2916febd5bc126 Yang Rong         2025-10-29  2342   * will be a time-consuming operation.
2916febd5bc126 Yang Rong         2025-10-29  2343   *
2916febd5bc126 Yang Rong         2025-10-29  2344   * Note: Currently, we consider it slow when the mapping count
2916febd5bc126 Yang Rong         2025-10-29  2345   * exceeds 50% of the plugged page count.
2916febd5bc126 Yang Rong         2025-10-29  2346   */
2916febd5bc126 Yang Rong         2025-10-29 @2347  bool virtio_mem_sbm_unplug_any_sb_online_may_slow(struct virtio_mem *vm,
2916febd5bc126 Yang Rong         2025-10-29  2348  						  unsigned long mb_id)
2916febd5bc126 Yang Rong         2025-10-29  2349  {
2916febd5bc126 Yang Rong         2025-10-29  2350  	unsigned long block_addr = virtio_mem_mb_id_to_phys(mb_id);
2916febd5bc126 Yang Rong         2025-10-29  2351  	unsigned long block_start_pfn = PFN_DOWN(block_addr);
2916febd5bc126 Yang Rong         2025-10-29  2352  	unsigned long pages_per_sb = PFN_DOWN(vm->sbm.sb_size);
2916febd5bc126 Yang Rong         2025-10-29  2353  	unsigned long map_counts = 0, nr_plugged_pages = 0;
2916febd5bc126 Yang Rong         2025-10-29  2354  	unsigned long pfn, pfn_end, order;
2916febd5bc126 Yang Rong         2025-10-29  2355  	struct page *page;
2916febd5bc126 Yang Rong         2025-10-29  2356  	int sb_id, count;
2916febd5bc126 Yang Rong         2025-10-29  2357  
2916febd5bc126 Yang Rong         2025-10-29  2358  	for (sb_id = 0; sb_id < vm->sbm.sbs_per_mb; sb_id++) {
2916febd5bc126 Yang Rong         2025-10-29  2359  		if (!virtio_mem_sbm_next_contig_plugged_sbs(vm, mb_id, &sb_id,
2916febd5bc126 Yang Rong         2025-10-29  2360  							    &count))
2916febd5bc126 Yang Rong         2025-10-29  2361  			break;
2916febd5bc126 Yang Rong         2025-10-29  2362  
2916febd5bc126 Yang Rong         2025-10-29  2363  		nr_plugged_pages += count * pages_per_sb;
2916febd5bc126 Yang Rong         2025-10-29  2364  		for (pfn = block_start_pfn + sb_id * pages_per_sb,
2916febd5bc126 Yang Rong         2025-10-29  2365  		    pfn_end = pfn + count * pages_per_sb;
2916febd5bc126 Yang Rong         2025-10-29  2366  		     pfn < pfn_end; pfn++) {
2916febd5bc126 Yang Rong         2025-10-29  2367  			page = pfn_to_page(pfn);
2916febd5bc126 Yang Rong         2025-10-29  2368  
2916febd5bc126 Yang Rong         2025-10-29  2369  			/* Skip free buddy pages */
2916febd5bc126 Yang Rong         2025-10-29  2370  			if (PageBuddy(page)) {
2916febd5bc126 Yang Rong         2025-10-29  2371  				order = READ_ONCE(page_private(page));
2916febd5bc126 Yang Rong         2025-10-29  2372  				if (order < MAX_ORDER) {
2916febd5bc126 Yang Rong         2025-10-29  2373  					pfn += (1UL << order) - 1;
2916febd5bc126 Yang Rong         2025-10-29  2374  					continue;
2916febd5bc126 Yang Rong         2025-10-29  2375  				}
2916febd5bc126 Yang Rong         2025-10-29  2376  			}
2916febd5bc126 Yang Rong         2025-10-29  2377  
2916febd5bc126 Yang Rong         2025-10-29  2378  			/* Only care head page of THP and hugetlb */
2916febd5bc126 Yang Rong         2025-10-29  2379  			if (PageTransHuge(page)) {
2916febd5bc126 Yang Rong         2025-10-29  2380  				order = compound_order(page);
2916febd5bc126 Yang Rong         2025-10-29  2381  				if (order < MAX_ORDER)
2916febd5bc126 Yang Rong         2025-10-29  2382  					pfn += (1UL << order) - 1;
2916febd5bc126 Yang Rong         2025-10-29  2383  			}
2916febd5bc126 Yang Rong         2025-10-29  2384  
2916febd5bc126 Yang Rong         2025-10-29  2385  			map_counts += page_mapcount(page);
2916febd5bc126 Yang Rong         2025-10-29  2386  		}
2916febd5bc126 Yang Rong         2025-10-29  2387  	}
2916febd5bc126 Yang Rong         2025-10-29  2388  
2916febd5bc126 Yang Rong         2025-10-29  2389  	return (map_counts << 1) > nr_plugged_pages;
2916febd5bc126 Yang Rong         2025-10-29  2390  }
2916febd5bc126 Yang Rong         2025-10-29  2391  

:::::: The code at line 2213 was first introduced by commit
:::::: 39dbfa37de5e4321e403a48914319dc98efa260b anolis: virtio-mem: make memmap on movable memory can be offlined

:::::: TO: zhongjiang-ali <zhongjiang-ali@linux.alibaba.com>
:::::: CC: hr567 <hr567@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
