Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1716D9C2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763284774; cv=none; b=Kj7OTh1O1BUgcCrhnExb9wWk3Tp9aAFjkJEDfOMZt4qqR1Q773hffTNCuG/lCFXFzzWeprCvNV/pzNh5dbd1JopX8PkknIwra4UYvAT8T6GRRAsvhPO7Q4VQ3Dug1WumXa6lYQRc1M9ngIA+KIjOQg9DcvcwLsNu2JwLXR4KAYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763284774; c=relaxed/simple;
	bh=pXk/hJ9tDET4ZWIl7wY8RYhKYUaoRKuXhnahhq/oKxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtTanpAfzTWRjwWMEGCEpS7cHd3TzN8wB2I6dcS0GU5Kq+2Ak7o2CkbB59+r20LWCAs8UwwAoQChw87OuPn9rZ5UHOctWW7psf1gRara+G0fJa6S8/mDSRMxAl5ClmeX0QE5OFVpt9HnVt7WyFoQO5RsYPuJ/DFd6pj4IFe0Bfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJIaHSrF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJIaHSrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763284773; x=1794820773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pXk/hJ9tDET4ZWIl7wY8RYhKYUaoRKuXhnahhq/oKxs=;
  b=dJIaHSrFq8NRqJQQ1fbm19/LA8hMwl3VKMIlKX+8Ngz4Xv0EEdvrezRL
   7UTTTBoowMi4tXuiuj7S+NoP9/CMc175kYNp8MjGXmViIulz5M/9Z5e32
   v4zLGH67ACY8K4av8kz7Pc605OkT84TXXM7fxp9kiNtbbepKrUK+w6yQy
   DjKAcE7x46fOW4asvId4LBjfCf9kjXeWGK4IYZvETnCWd0PrE/WKPTrLt
   YvDHG9WBMyjJKA9mvqYi8aqRKjloRilaATFLtYV3MitA7ygzEZDB06g8b
   f7/MhDWbxTCurqBJyE6FS5hk3TQFBpwU7dbBf5cH30wbPhrHZt9mkh0ZI
   A==;
X-CSE-ConnectionGUID: rPRcWkLbQ0m0Z2ze3wKZig==
X-CSE-MsgGUID: 1jSjbkGjRqWz97t1gblBaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="75915570"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="75915570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 01:19:32 -0800
X-CSE-ConnectionGUID: I2ekpvImSCKo59VVadHZcg==
X-CSE-MsgGUID: ulAcNBWZS4iAIyvKV2JSJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="190351566"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2025 01:19:31 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKYuu-0008e3-1B;
	Sun, 16 Nov 2025 09:19:28 +0000
Date: Sun, 16 Nov 2025 17:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 drivers/virtio/virtio_mem.c:2347:6: warning: no previous prototype for
 'virtio_mem_sbm_unplug_any_sb_online_may_slow'
Message-ID: <202511161744.HyR3AxRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ad3132d9450fb83553e3cee3961a4b5eb75dd355
commit: 2916febd5bc1263c3b0d0793eab0905f54e146e3 [1/1] anolis: virtio-mem: support unplugging free memory only
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20251116/202511161744.HyR3AxRq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161744.HyR3AxRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161744.HyR3AxRq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_mem.c:2347:6: warning: no previous prototype for 'virtio_mem_sbm_unplug_any_sb_online_may_slow' [-Wmissing-prototypes]
    2347 | bool virtio_mem_sbm_unplug_any_sb_online_may_slow(struct virtio_mem *vm,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtio_mem_sbm_unplug_any_sb_online_may_slow +2347 drivers/virtio/virtio_mem.c

  2338	
  2339	/*
  2340	 * Pre-check if `virtio_mem_sbm_unplug_any_sb_online()` is slow.
  2341	 * If the memory is shared by many processes, `alloc_contig_range`
  2342	 * will be a time-consuming operation.
  2343	 *
  2344	 * Note: Currently, we consider it slow when the mapping count
  2345	 * exceeds 50% of the plugged page count.
  2346	 */
> 2347	bool virtio_mem_sbm_unplug_any_sb_online_may_slow(struct virtio_mem *vm,
  2348							  unsigned long mb_id)
  2349	{
  2350		unsigned long block_addr = virtio_mem_mb_id_to_phys(mb_id);
  2351		unsigned long block_start_pfn = PFN_DOWN(block_addr);
  2352		unsigned long pages_per_sb = PFN_DOWN(vm->sbm.sb_size);
  2353		unsigned long map_counts = 0, nr_plugged_pages = 0;
  2354		unsigned long pfn, pfn_end, order;
  2355		struct page *page;
  2356		int sb_id, count;
  2357	
  2358		for (sb_id = 0; sb_id < vm->sbm.sbs_per_mb; sb_id++) {
  2359			if (!virtio_mem_sbm_next_contig_plugged_sbs(vm, mb_id, &sb_id,
  2360								    &count))
  2361				break;
  2362	
  2363			nr_plugged_pages += count * pages_per_sb;
  2364			for (pfn = block_start_pfn + sb_id * pages_per_sb,
  2365			    pfn_end = pfn + count * pages_per_sb;
  2366			     pfn < pfn_end; pfn++) {
  2367				page = pfn_to_page(pfn);
  2368	
  2369				/* Skip free buddy pages */
  2370				if (PageBuddy(page)) {
  2371					order = READ_ONCE(page_private(page));
  2372					if (order < MAX_ORDER) {
  2373						pfn += (1UL << order) - 1;
  2374						continue;
  2375					}
  2376				}
  2377	
  2378				/* Only care head page of THP and hugetlb */
  2379				if (PageTransHuge(page)) {
  2380					order = compound_order(page);
  2381					if (order < MAX_ORDER)
  2382						pfn += (1UL << order) - 1;
  2383				}
  2384	
  2385				map_counts += page_mapcount(page);
  2386			}
  2387		}
  2388	
  2389		return (map_counts << 1) > nr_plugged_pages;
  2390	}
  2391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
