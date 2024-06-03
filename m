Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2502135A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 21:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717450381; cv=none; b=ArEM9rPMEfbu3isqVR9TE4VQa4S4L4ISIrFCQ3ylxTF/Tk95RwtoeK/TBKVKU66zti5UrCXFv38TsCq4EywqVLOTPGHg07n6TH2l15CE55gFlqAhPRvUuXUHe1wNaOGInSNJ0lZFH7iYsKQDF5KEfHICvVrKrUd9869KaRApEdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717450381; c=relaxed/simple;
	bh=57lO4ykxjzo6Ix0Va0XLbjOxiHqLfFJ3e36HyTXkzC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfmTaXyJQ0hsmeSvEe2YXz7CrmcTtbDtTLHqpWVCX9Y1y8Jr/kfLpeY6P3dJnl0QYs+cbRegF8RXbT3hbcBgeYLxpxLS/x1QO09u/W5+iC0IjCzpKJxdjx0MN+xf1xfS/Y3cgxkcmGSh7seZKjAsKznZAftsswlIswwk23o1cDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKnZjFDR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKnZjFDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717450380; x=1748986380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57lO4ykxjzo6Ix0Va0XLbjOxiHqLfFJ3e36HyTXkzC8=;
  b=nKnZjFDR4DF9C8W7joBAFQOEn8bQsPHfhnGJEBlW+8JsVvcGsLL1KXPa
   5D9g9iqMK7+l7eB0vvNTkrVcar4R6Amxy5GntUZMeRAeijIDxLG/sedE4
   R1ap0ZSEeIsaFv3e9FzufoQ1mTv31ra+84964P/HiZLC4pm/OiJLyObpE
   tgVcHLtDgVgwVNUM5nuGAFIcJbPjjT6WzJF/3ZQieFmwcixm5SxNJ4tCZ
   A0FLXbZQGxzj5yjUVgQKBO8Fy3sy48w5ZdhJGk/1dZY92kwmcT3QZd4kO
   x3pFsGmpcpkJCbk5L0p7o2KJMLoeYAqEJDMeBTTvisRnphgiN7ynd9lSv
   Q==;
X-CSE-ConnectionGUID: xCBVuqY6T4WH5/MDBJqITA==
X-CSE-MsgGUID: iUmUZnaVTCWtlEH7EY1aqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13841419"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="13841419"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 14:32:59 -0700
X-CSE-ConnectionGUID: M6Y17zF6RLqfqaQf4rE5lg==
X-CSE-MsgGUID: PSBw/1tnSE+QBakTR8sHAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37030750"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jun 2024 14:32:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEFIW-000MDV-0N;
	Mon, 03 Jun 2024 21:32:56 +0000
Date: Tue, 4 Jun 2024 05:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka:slab-buckets-v4-rewrite 5/8] mm/util.c:614: warning:
 expecting prototype for __kvmalloc_node_noprof(). Prototype was for
 __kvmalloc_node() instead
Message-ID: <202406040519.164lIC3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-buckets-v4-rewrite
head:   3731d98ef08061123835629d05f02ea2d248bdb0
commit: 8478b4e1b0af15ad8ee98cdbf2ef11e0137f7bb2 [5/8] mm/slab: Introduce kvmalloc_buckets_node() that can take kmem_buckets argument
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240604/202406040519.164lIC3X-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040519.164lIC3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040519.164lIC3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/util.c:614: warning: expecting prototype for __kvmalloc_node_noprof(). Prototype was for __kvmalloc_node() instead


vim +614 mm/util.c

eb36c5873b96e8 Al Viro          2012-05-30  595  
a7c3e901a46ff5 Michal Hocko     2017-05-08  596  /**
8478b4e1b0af15 Kees Cook        2024-05-31  597   * __kvmalloc_node_noprof - attempt to allocate physically contiguous memory, but upon
a7c3e901a46ff5 Michal Hocko     2017-05-08  598   * failure, fall back to non-contiguous (vmalloc) allocation.
8478b4e1b0af15 Kees Cook        2024-05-31  599   * @b: which set of kmalloc buckets to allocate from.
a7c3e901a46ff5 Michal Hocko     2017-05-08  600   * @size: size of the request.
a7c3e901a46ff5 Michal Hocko     2017-05-08  601   * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
a7c3e901a46ff5 Michal Hocko     2017-05-08  602   * @node: numa node to allocate from
a7c3e901a46ff5 Michal Hocko     2017-05-08  603   *
a7c3e901a46ff5 Michal Hocko     2017-05-08  604   * Uses kmalloc to get the memory but if the allocation fails then falls back
a7c3e901a46ff5 Michal Hocko     2017-05-08  605   * to the vmalloc allocator. Use kvfree for freeing the memory.
a7c3e901a46ff5 Michal Hocko     2017-05-08  606   *
a421ef303008b0 Michal Hocko     2022-01-14  607   * GFP_NOWAIT and GFP_ATOMIC are not supported, neither is the __GFP_NORETRY modifier.
cc965a29db172c Michal Hocko     2017-07-12  608   * __GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
cc965a29db172c Michal Hocko     2017-07-12  609   * preferable to the vmalloc fallback, due to visible performance drawbacks.
a7c3e901a46ff5 Michal Hocko     2017-05-08  610   *
a862f68a8b3600 Mike Rapoport    2019-03-05  611   * Return: pointer to the allocated memory of %NULL in case of failure
a7c3e901a46ff5 Michal Hocko     2017-05-08  612   */
8478b4e1b0af15 Kees Cook        2024-05-31  613  void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
a7c3e901a46ff5 Michal Hocko     2017-05-08 @614  {
a7c3e901a46ff5 Michal Hocko     2017-05-08  615  	gfp_t kmalloc_flags = flags;
a7c3e901a46ff5 Michal Hocko     2017-05-08  616  	void *ret;
a7c3e901a46ff5 Michal Hocko     2017-05-08  617  
a7c3e901a46ff5 Michal Hocko     2017-05-08  618  	/*
4f4f2ba9c531b3 Michal Hocko     2017-06-02  619  	 * We want to attempt a large physically contiguous block first because
4f4f2ba9c531b3 Michal Hocko     2017-06-02  620  	 * it is less likely to fragment multiple larger blocks and therefore
4f4f2ba9c531b3 Michal Hocko     2017-06-02  621  	 * contribute to a long term fragmentation less than vmalloc fallback.
4f4f2ba9c531b3 Michal Hocko     2017-06-02  622  	 * However make sure that larger requests are not too disruptive - no
4f4f2ba9c531b3 Michal Hocko     2017-06-02  623  	 * OOM killer and no allocation failure warnings as we have a fallback.
a7c3e901a46ff5 Michal Hocko     2017-05-08  624  	 */
6c5ab6511f718c Michal Hocko     2017-05-08  625  	if (size > PAGE_SIZE) {
6c5ab6511f718c Michal Hocko     2017-05-08  626  		kmalloc_flags |= __GFP_NOWARN;
6c5ab6511f718c Michal Hocko     2017-05-08  627  
cc965a29db172c Michal Hocko     2017-07-12  628  		if (!(kmalloc_flags & __GFP_RETRY_MAYFAIL))
6c5ab6511f718c Michal Hocko     2017-05-08  629  			kmalloc_flags |= __GFP_NORETRY;
a421ef303008b0 Michal Hocko     2022-01-14  630  
a421ef303008b0 Michal Hocko     2022-01-14  631  		/* nofail semantic is implemented by the vmalloc fallback */
a421ef303008b0 Michal Hocko     2022-01-14  632  		kmalloc_flags &= ~__GFP_NOFAIL;
6c5ab6511f718c Michal Hocko     2017-05-08  633  	}
a7c3e901a46ff5 Michal Hocko     2017-05-08  634  
8478b4e1b0af15 Kees Cook        2024-05-31  635  	ret = __kmalloc_node_noprof(PASS_BUCKET_PARAMS(size, b), kmalloc_flags, node);
a7c3e901a46ff5 Michal Hocko     2017-05-08  636  
a7c3e901a46ff5 Michal Hocko     2017-05-08  637  	/*
a7c3e901a46ff5 Michal Hocko     2017-05-08  638  	 * It doesn't really make sense to fallback to vmalloc for sub page
a7c3e901a46ff5 Michal Hocko     2017-05-08  639  	 * requests
a7c3e901a46ff5 Michal Hocko     2017-05-08  640  	 */
a7c3e901a46ff5 Michal Hocko     2017-05-08  641  	if (ret || size <= PAGE_SIZE)
a7c3e901a46ff5 Michal Hocko     2017-05-08  642  		return ret;
a7c3e901a46ff5 Michal Hocko     2017-05-08  643  
30c19366636f72 Florian Westphal 2022-09-26  644  	/* non-sleeping allocations are not supported by vmalloc */
30c19366636f72 Florian Westphal 2022-09-26  645  	if (!gfpflags_allow_blocking(flags))
30c19366636f72 Florian Westphal 2022-09-26  646  		return NULL;
30c19366636f72 Florian Westphal 2022-09-26  647  
7661809d493b42 Linus Torvalds   2021-07-14  648  	/* Don't even allow crazy sizes */
0708a0afe291bd Daniel Borkmann  2022-03-04  649  	if (unlikely(size > INT_MAX)) {
0708a0afe291bd Daniel Borkmann  2022-03-04  650  		WARN_ON_ONCE(!(flags & __GFP_NOWARN));
7661809d493b42 Linus Torvalds   2021-07-14  651  		return NULL;
0708a0afe291bd Daniel Borkmann  2022-03-04  652  	}
7661809d493b42 Linus Torvalds   2021-07-14  653  
9becb688913023 Linus Torvalds   2022-04-22  654  	/*
9becb688913023 Linus Torvalds   2022-04-22  655  	 * kvmalloc() can always use VM_ALLOW_HUGE_VMAP,
9becb688913023 Linus Torvalds   2022-04-22  656  	 * since the callers already cannot assume anything
9becb688913023 Linus Torvalds   2022-04-22  657  	 * about the resulting pointer, and cannot play
9becb688913023 Linus Torvalds   2022-04-22  658  	 * protection games.
9becb688913023 Linus Torvalds   2022-04-22  659  	 */
88ae5fb755b0d4 Kent Overstreet  2024-03-21  660  	return __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
9becb688913023 Linus Torvalds   2022-04-22  661  			flags, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
9becb688913023 Linus Torvalds   2022-04-22  662  			node, __builtin_return_address(0));
a7c3e901a46ff5 Michal Hocko     2017-05-08  663  }
8478b4e1b0af15 Kees Cook        2024-05-31  664  EXPORT_SYMBOL(__kvmalloc_node_noprof);
a7c3e901a46ff5 Michal Hocko     2017-05-08  665  

:::::: The code at line 614 was first introduced by commit
:::::: a7c3e901a46ff54c016d040847eda598a9e3e653 mm: introduce kv[mz]alloc helpers

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
