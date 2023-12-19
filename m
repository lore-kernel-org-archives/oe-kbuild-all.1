Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BAE3D0A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 22:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAwcwDa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703024430; x=1734560430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdPUxjMWcHKhULYUt22s8ICJINkZvv/gmgYFZ8f1YLA=;
  b=FAwcwDa+9eELnOVhiposHRv7xnr96OzjsbUlcTkGmPIXEV/lCaNoJ2YJ
   VIjCDA+mJYAByRReQ0H8+Fu7GCIFykCUp2n2FfmYq3XTTL+X/ObrjPvoe
   glu9wkM76oK1Cc943ud0YmLrqhZ6Wdq4vMtph8UkREtxQZDxkSmUws1xQ
   sU5BRvULejijAVnCFBX1VUwEHScvhQWma/s6PcR8qwkMUuQPghRw4hLDA
   poBl5fdP9iKTHCpepMu8nJZZ2/Kq3ME4taMPxD7Mc8qTPA9NS7dl+hvlk
   Hwj8H6g2OqaOfoXnhGNezin+A4VoRyZIjwDXtbPf37xyyAETq1bv1EOpx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2960034"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="2960034"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 14:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="776111544"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="776111544"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Dec 2023 14:20:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFiRt-00061s-0C;
	Tue, 19 Dec 2023 22:20:25 +0000
Date: Wed, 20 Dec 2023 06:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7931/9096] lib/maple_tree.c:5480:32: error:
 'struct ma_wr_state' has no member named 'node_end'
Message-ID: <202312200644.s4EN9MDN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: 74fa1576f347efb7e2b7bc37dbb30a25f08b643e [7931/9096] Merge branch 'mm-stable' into mm-unstable
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231220/202312200644.s4EN9MDN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312200644.s4EN9MDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312200644.s4EN9MDN-lkp@intel.com/

Note: the linux-next/master HEAD aa4db8324c4d0e67aa4670356df4e9fae14b4d37 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   lib/maple_tree.c: In function 'mas_preallocate':
>> lib/maple_tree.c:5480:32: error: 'struct ma_wr_state' has no member named 'node_end'
    5480 |         if (node_size == wr_mas.node_end) {
         |                                ^


vim +5480 lib/maple_tree.c

54a611b605901c Liam R. Howlett  2022-09-06  5439  
54a611b605901c Liam R. Howlett  2022-09-06  5440  /**
54a611b605901c Liam R. Howlett  2022-09-06  5441   * mas_preallocate() - Preallocate enough nodes for a store operation
54a611b605901c Liam R. Howlett  2022-09-06  5442   * @mas: The maple state
da0892547b101d Liam R. Howlett  2023-07-24  5443   * @entry: The entry that will be stored
54a611b605901c Liam R. Howlett  2022-09-06  5444   * @gfp: The GFP_FLAGS to use for allocations.
54a611b605901c Liam R. Howlett  2022-09-06  5445   *
54a611b605901c Liam R. Howlett  2022-09-06  5446   * Return: 0 on success, -ENOMEM if memory could not be allocated.
54a611b605901c Liam R. Howlett  2022-09-06  5447   */
da0892547b101d Liam R. Howlett  2023-07-24  5448  int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
54a611b605901c Liam R. Howlett  2022-09-06  5449  {
17983dc617837a Liam R. Howlett  2023-07-24  5450  	MA_WR_STATE(wr_mas, mas, entry);
17983dc617837a Liam R. Howlett  2023-07-24  5451  	unsigned char node_size;
17983dc617837a Liam R. Howlett  2023-07-24  5452  	int request = 1;
54a611b605901c Liam R. Howlett  2022-09-06  5453  	int ret;
54a611b605901c Liam R. Howlett  2022-09-06  5454  
17983dc617837a Liam R. Howlett  2023-07-24  5455  
17983dc617837a Liam R. Howlett  2023-07-24  5456  	if (unlikely(!mas->index && mas->last == ULONG_MAX))
17983dc617837a Liam R. Howlett  2023-07-24  5457  		goto ask_now;
17983dc617837a Liam R. Howlett  2023-07-24  5458  
17983dc617837a Liam R. Howlett  2023-07-24  5459  	mas_wr_store_setup(&wr_mas);
17983dc617837a Liam R. Howlett  2023-07-24  5460  	wr_mas.content = mas_start(mas);
17983dc617837a Liam R. Howlett  2023-07-24  5461  	/* Root expand */
17983dc617837a Liam R. Howlett  2023-07-24  5462  	if (unlikely(mas_is_none(mas) || mas_is_ptr(mas)))
17983dc617837a Liam R. Howlett  2023-07-24  5463  		goto ask_now;
17983dc617837a Liam R. Howlett  2023-07-24  5464  
17983dc617837a Liam R. Howlett  2023-07-24  5465  	if (unlikely(!mas_wr_walk(&wr_mas))) {
17983dc617837a Liam R. Howlett  2023-07-24  5466  		/* Spanning store, use worst case for now */
17983dc617837a Liam R. Howlett  2023-07-24  5467  		request = 1 + mas_mt_height(mas) * 3;
17983dc617837a Liam R. Howlett  2023-07-24  5468  		goto ask_now;
17983dc617837a Liam R. Howlett  2023-07-24  5469  	}
17983dc617837a Liam R. Howlett  2023-07-24  5470  
17983dc617837a Liam R. Howlett  2023-07-24  5471  	/* At this point, we are at the leaf node that needs to be altered. */
17983dc617837a Liam R. Howlett  2023-07-24  5472  	/* Exact fit, no nodes needed. */
17983dc617837a Liam R. Howlett  2023-07-24  5473  	if (wr_mas.r_min == mas->index && wr_mas.r_max == mas->last)
17983dc617837a Liam R. Howlett  2023-07-24  5474  		return 0;
17983dc617837a Liam R. Howlett  2023-07-24  5475  
17983dc617837a Liam R. Howlett  2023-07-24  5476  	mas_wr_end_piv(&wr_mas);
17983dc617837a Liam R. Howlett  2023-07-24  5477  	node_size = mas_wr_new_end(&wr_mas);
3f647819706476 Sidhartha Kumar  2023-12-13  5478  
3f647819706476 Sidhartha Kumar  2023-12-13  5479  	/* Slot store, does not require additional nodes */
3f647819706476 Sidhartha Kumar  2023-12-13 @5480  	if (node_size == wr_mas.node_end) {
3f647819706476 Sidhartha Kumar  2023-12-13  5481  		/* reuse node */
3f647819706476 Sidhartha Kumar  2023-12-13  5482  		if (!mt_in_rcu(mas->tree))
3f647819706476 Sidhartha Kumar  2023-12-13  5483  			return 0;
3f647819706476 Sidhartha Kumar  2023-12-13  5484  		/* shifting boundary */
3f647819706476 Sidhartha Kumar  2023-12-13  5485  		if (wr_mas.offset_end - mas->offset == 1)
3f647819706476 Sidhartha Kumar  2023-12-13  5486  			return 0;
3f647819706476 Sidhartha Kumar  2023-12-13  5487  	}
3f647819706476 Sidhartha Kumar  2023-12-13  5488  
17983dc617837a Liam R. Howlett  2023-07-24  5489  	if (node_size >= mt_slots[wr_mas.type]) {
17983dc617837a Liam R. Howlett  2023-07-24  5490  		/* Split, worst case for now. */
17983dc617837a Liam R. Howlett  2023-07-24  5491  		request = 1 + mas_mt_height(mas) * 2;
17983dc617837a Liam R. Howlett  2023-07-24  5492  		goto ask_now;
17983dc617837a Liam R. Howlett  2023-07-24  5493  	}
17983dc617837a Liam R. Howlett  2023-07-24  5494  
17983dc617837a Liam R. Howlett  2023-07-24  5495  	/* New root needs a singe node */
17983dc617837a Liam R. Howlett  2023-07-24  5496  	if (unlikely(mte_is_root(mas->node)))
17983dc617837a Liam R. Howlett  2023-07-24  5497  		goto ask_now;
17983dc617837a Liam R. Howlett  2023-07-24  5498  
17983dc617837a Liam R. Howlett  2023-07-24  5499  	/* Potential spanning rebalance collapsing a node, use worst-case */
17983dc617837a Liam R. Howlett  2023-07-24  5500  	if (node_size  - 1 <= mt_min_slots[wr_mas.type])
17983dc617837a Liam R. Howlett  2023-07-24  5501  		request = mas_mt_height(mas) * 2 - 1;
17983dc617837a Liam R. Howlett  2023-07-24  5502  
17983dc617837a Liam R. Howlett  2023-07-24  5503  	/* node store, slot store needs one node */
17983dc617837a Liam R. Howlett  2023-07-24  5504  ask_now:
17983dc617837a Liam R. Howlett  2023-07-24  5505  	mas_node_count_gfp(mas, request, gfp);
54a611b605901c Liam R. Howlett  2022-09-06  5506  	mas->mas_flags |= MA_STATE_PREALLOC;
54a611b605901c Liam R. Howlett  2022-09-06  5507  	if (likely(!mas_is_err(mas)))
54a611b605901c Liam R. Howlett  2022-09-06  5508  		return 0;
54a611b605901c Liam R. Howlett  2022-09-06  5509  
54a611b605901c Liam R. Howlett  2022-09-06  5510  	mas_set_alloc_req(mas, 0);
54a611b605901c Liam R. Howlett  2022-09-06  5511  	ret = xa_err(mas->node);
54a611b605901c Liam R. Howlett  2022-09-06  5512  	mas_reset(mas);
54a611b605901c Liam R. Howlett  2022-09-06  5513  	mas_destroy(mas);
54a611b605901c Liam R. Howlett  2022-09-06  5514  	mas_reset(mas);
54a611b605901c Liam R. Howlett  2022-09-06  5515  	return ret;
54a611b605901c Liam R. Howlett  2022-09-06  5516  }
5c63a7c32a94a7 Danilo Krummrich 2023-03-02  5517  EXPORT_SYMBOL_GPL(mas_preallocate);
54a611b605901c Liam R. Howlett  2022-09-06  5518  

:::::: The code at line 5480 was first introduced by commit
:::::: 3f647819706476b33f31ec0914a41fdc922f3457 maple_tree: do not preallocate nodes for slot stores

:::::: TO: Sidhartha Kumar <sidhartha.kumar@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
