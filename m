Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097D62E3EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718864322; cv=none; b=nU09p6cmExUBV9iwjPr05xhRThfpn5vteYyGxdbyQlkOA25mzK2KGkVEIfq7AVIyGV+NAMYKn7HDt+Y6iuAdDqIYeDmnqtkunxJuAfoszKeqSI94RF/X7VJ7YDgCNzGovXSIdUidZwr+PZ9VzVHglYFUKNsm4+4AxvfsoA+ij1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718864322; c=relaxed/simple;
	bh=ExMfLKOmqvkL0OzMzp+wbKrpAT4G1HEzo364M45hwrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtHGU1k1d+lMPn3Tqf7064kAtR/a125ulGzaVnIN7YHTwvyqi642R+N83TjJSdp6EV/treCGuOUFgahG9AQjsRu3CvfPgx7YpQpHZUPELZ0KY04WfKQ2oUwJJCoWhOV/xdXuKdzZ3NFVP7ar2NMLspQsdXZF82Xnrhx6pDCNDIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPfEp7DP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPfEp7DP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718864321; x=1750400321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ExMfLKOmqvkL0OzMzp+wbKrpAT4G1HEzo364M45hwrw=;
  b=NPfEp7DPjLj81JThgJi5Bq6pRA59CD66EMBMhg2f561+/KqMnxAi0+AE
   3v3LTw7lWiQV8tGQ6NWgnObcY1CzfZNpuwI0TcpSfzJpOjPEskTMP4DYn
   uHQzyO8bqFLqmZ1fU615uNigmwWYsTEreMLJXeUPvkZ3jvJfe47rnoeWW
   2JGtd/KpLqixa9DUAdIngLpe6fC/SruQdEjyDCNnYedHS0x/vpMDBLC46
   3UdpV0Ej7SG3bVMpx3Jjmle6ki7AjOED0rYmg8Pdn6/NBdUkFBlyta507
   EAo0+/i2xDie2Ms5WlcPqD4HcOIHe5imAw0XsSAWghmWzS4JJVCxO6AjI
   A==;
X-CSE-ConnectionGUID: CpCfuuP2R7GdSbbLEf7msQ==
X-CSE-MsgGUID: 5T5UWfyHSQ29RXKPRVG+zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="41225653"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="41225653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 23:18:37 -0700
X-CSE-ConnectionGUID: fthYWf3KQeebnUeJkl8iFw==
X-CSE-MsgGUID: 0dom3OedTRq4fvgaxHuGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42249613"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jun 2024 23:18:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKB7x-0007NU-1o;
	Thu, 20 Jun 2024 06:18:33 +0000
Date: Thu, 20 Jun 2024 14:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/next-20240618/kmem_buckets-v5 3/6] mm/util.c:614: warning:
 Excess function parameter 'size' description in '__kvmalloc_node'
Message-ID: <202406201631.5E0Dfzma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20240618/kmem_buckets-v5
head:   c823e15736071e9b694fc62be0c80cbda6a4e344
commit: c69b01349ace4e0a92fc0f019668cd696776bbce [3/6] mm/slab: Introduce kvmalloc_buckets_node() that can take kmem_buckets argument
config: m68k-randconfig-r081-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201631.5E0Dfzma-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201631.5E0Dfzma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201631.5E0Dfzma-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/util.c:614: warning: Excess function parameter 'size' description in '__kvmalloc_node'


vim +614 mm/util.c

eb36c5873b96e8c Al Viro          2012-05-30  595  
a7c3e901a46ff54 Michal Hocko     2017-05-08  596  /**
c69b01349ace4e0 Kees Cook        2024-05-31  597   * __kvmalloc_node - attempt to allocate physically contiguous memory, but upon
a7c3e901a46ff54 Michal Hocko     2017-05-08  598   * failure, fall back to non-contiguous (vmalloc) allocation.
a7c3e901a46ff54 Michal Hocko     2017-05-08  599   * @size: size of the request.
c69b01349ace4e0 Kees Cook        2024-05-31  600   * @b: which set of kmalloc buckets to allocate from.
a7c3e901a46ff54 Michal Hocko     2017-05-08  601   * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
a7c3e901a46ff54 Michal Hocko     2017-05-08  602   * @node: numa node to allocate from
a7c3e901a46ff54 Michal Hocko     2017-05-08  603   *
a7c3e901a46ff54 Michal Hocko     2017-05-08  604   * Uses kmalloc to get the memory but if the allocation fails then falls back
a7c3e901a46ff54 Michal Hocko     2017-05-08  605   * to the vmalloc allocator. Use kvfree for freeing the memory.
a7c3e901a46ff54 Michal Hocko     2017-05-08  606   *
a421ef303008b0c Michal Hocko     2022-01-14  607   * GFP_NOWAIT and GFP_ATOMIC are not supported, neither is the __GFP_NORETRY modifier.
cc965a29db172c2 Michal Hocko     2017-07-12  608   * __GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
cc965a29db172c2 Michal Hocko     2017-07-12  609   * preferable to the vmalloc fallback, due to visible performance drawbacks.
a7c3e901a46ff54 Michal Hocko     2017-05-08  610   *
a862f68a8b36008 Mike Rapoport    2019-03-05  611   * Return: pointer to the allocated memory of %NULL in case of failure
a7c3e901a46ff54 Michal Hocko     2017-05-08  612   */
c69b01349ace4e0 Kees Cook        2024-05-31  613  void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
a7c3e901a46ff54 Michal Hocko     2017-05-08 @614  {
a7c3e901a46ff54 Michal Hocko     2017-05-08  615  	gfp_t kmalloc_flags = flags;
a7c3e901a46ff54 Michal Hocko     2017-05-08  616  	void *ret;
a7c3e901a46ff54 Michal Hocko     2017-05-08  617  
a7c3e901a46ff54 Michal Hocko     2017-05-08  618  	/*
4f4f2ba9c531b3d Michal Hocko     2017-06-02  619  	 * We want to attempt a large physically contiguous block first because
4f4f2ba9c531b3d Michal Hocko     2017-06-02  620  	 * it is less likely to fragment multiple larger blocks and therefore
4f4f2ba9c531b3d Michal Hocko     2017-06-02  621  	 * contribute to a long term fragmentation less than vmalloc fallback.
4f4f2ba9c531b3d Michal Hocko     2017-06-02  622  	 * However make sure that larger requests are not too disruptive - no
4f4f2ba9c531b3d Michal Hocko     2017-06-02  623  	 * OOM killer and no allocation failure warnings as we have a fallback.
a7c3e901a46ff54 Michal Hocko     2017-05-08  624  	 */
6c5ab6511f718c3 Michal Hocko     2017-05-08  625  	if (size > PAGE_SIZE) {
6c5ab6511f718c3 Michal Hocko     2017-05-08  626  		kmalloc_flags |= __GFP_NOWARN;
6c5ab6511f718c3 Michal Hocko     2017-05-08  627  
cc965a29db172c2 Michal Hocko     2017-07-12  628  		if (!(kmalloc_flags & __GFP_RETRY_MAYFAIL))
6c5ab6511f718c3 Michal Hocko     2017-05-08  629  			kmalloc_flags |= __GFP_NORETRY;
a421ef303008b0c Michal Hocko     2022-01-14  630  
a421ef303008b0c Michal Hocko     2022-01-14  631  		/* nofail semantic is implemented by the vmalloc fallback */
a421ef303008b0c Michal Hocko     2022-01-14  632  		kmalloc_flags &= ~__GFP_NOFAIL;
6c5ab6511f718c3 Michal Hocko     2017-05-08  633  	}
a7c3e901a46ff54 Michal Hocko     2017-05-08  634  
c69b01349ace4e0 Kees Cook        2024-05-31  635  	ret = __kmalloc_node_noprof(PASS_BUCKET_PARAMS(size, b), kmalloc_flags, node);
a7c3e901a46ff54 Michal Hocko     2017-05-08  636  
a7c3e901a46ff54 Michal Hocko     2017-05-08  637  	/*
a7c3e901a46ff54 Michal Hocko     2017-05-08  638  	 * It doesn't really make sense to fallback to vmalloc for sub page
a7c3e901a46ff54 Michal Hocko     2017-05-08  639  	 * requests
a7c3e901a46ff54 Michal Hocko     2017-05-08  640  	 */
a7c3e901a46ff54 Michal Hocko     2017-05-08  641  	if (ret || size <= PAGE_SIZE)
a7c3e901a46ff54 Michal Hocko     2017-05-08  642  		return ret;
a7c3e901a46ff54 Michal Hocko     2017-05-08  643  
30c19366636f725 Florian Westphal 2022-09-26  644  	/* non-sleeping allocations are not supported by vmalloc */
30c19366636f725 Florian Westphal 2022-09-26  645  	if (!gfpflags_allow_blocking(flags))
30c19366636f725 Florian Westphal 2022-09-26  646  		return NULL;
30c19366636f725 Florian Westphal 2022-09-26  647  
7661809d493b426 Linus Torvalds   2021-07-14  648  	/* Don't even allow crazy sizes */
0708a0afe291bdf Daniel Borkmann  2022-03-04  649  	if (unlikely(size > INT_MAX)) {
0708a0afe291bdf Daniel Borkmann  2022-03-04  650  		WARN_ON_ONCE(!(flags & __GFP_NOWARN));
7661809d493b426 Linus Torvalds   2021-07-14  651  		return NULL;
0708a0afe291bdf Daniel Borkmann  2022-03-04  652  	}
7661809d493b426 Linus Torvalds   2021-07-14  653  
9becb6889130231 Linus Torvalds   2022-04-22  654  	/*
9becb6889130231 Linus Torvalds   2022-04-22  655  	 * kvmalloc() can always use VM_ALLOW_HUGE_VMAP,
9becb6889130231 Linus Torvalds   2022-04-22  656  	 * since the callers already cannot assume anything
9becb6889130231 Linus Torvalds   2022-04-22  657  	 * about the resulting pointer, and cannot play
9becb6889130231 Linus Torvalds   2022-04-22  658  	 * protection games.
9becb6889130231 Linus Torvalds   2022-04-22  659  	 */
88ae5fb755b0d45 Kent Overstreet  2024-03-21  660  	return __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
9becb6889130231 Linus Torvalds   2022-04-22  661  			flags, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
9becb6889130231 Linus Torvalds   2022-04-22  662  			node, __builtin_return_address(0));
a7c3e901a46ff54 Michal Hocko     2017-05-08  663  }
c69b01349ace4e0 Kees Cook        2024-05-31  664  EXPORT_SYMBOL(__kvmalloc_node_noprof);
a7c3e901a46ff54 Michal Hocko     2017-05-08  665  

:::::: The code at line 614 was first introduced by commit
:::::: a7c3e901a46ff54c016d040847eda598a9e3e653 mm: introduce kv[mz]alloc helpers

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
