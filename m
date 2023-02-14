Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974FC0BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676392647; x=1707928647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hltHvg9LKpCfjMIFh3wfWac+r8l8fBCODJhF08GqNBI=;
  b=kOCPZY18UhlOiVMvZ7ocgr2zoi6Ht6fSEwfQyY9LSl5M2paUUvGeKzer
   o2jDlPPgOVjph7OqKYkMWzw0xTblMVjyDpAND6Fhgvy+2hOwOSJOVpZSC
   PJHqlrEtoz6iMwiMUiO22oWXbZaGu/XFgULSwYrFGG5b291cS6C5CGOKG
   kF6jNn5D5IWOir4V3nrQAs2ijxiAHOQt7JEqf3i7OR542II8Pgl5+uQ55
   BB2PufShVDNBrREgizOay35jRVl0uhZkF9CpYxb1+vQHbywsJ817vBrmN
   VDOqRCsLaAbPYNTkJ6GOeAqDmxU2UcR12cn6S5pRJjqbXr4MW9Bsw6eZD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="310834132"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="310834132"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 08:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="669238882"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="669238882"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Feb 2023 08:35:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRyGx-0008e3-30;
	Tue, 14 Feb 2023 16:35:15 +0000
Date: Wed, 15 Feb 2023 00:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>,
	Kent Overstreet <kmo@daterainc.com>
Subject: [rppt:kmo_codetags_v1 19/53] mm/util.c:560: warning: expecting
 prototype for kvmalloc_node(). Prototype was for _kvmalloc_node() instead
Message-ID: <202302150034.7yWbVV7E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kmo_codetags_v1
head:   509acf710b1445f183ccb7aabc1ecedce6ca8ddb
commit: 1abada2611947258f7c52cc8421662ae341d8dce [19/53] mm: enable slab allocation tagging for kmalloc and friends
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230215/202302150034.7yWbVV7E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=1abada2611947258f7c52cc8421662ae341d8dce
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt kmo_codetags_v1
        git checkout 1abada2611947258f7c52cc8421662ae341d8dce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150034.7yWbVV7E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/util.c:560: warning: expecting prototype for kvmalloc_node(). Prototype was for _kvmalloc_node() instead
--
>> mm/slab_common.c:1439: warning: expecting prototype for krealloc(). Prototype was for _krealloc() instead


vim +560 mm/util.c

eb36c5873b96e8 Al Viro            2012-05-30  542  
a7c3e901a46ff5 Michal Hocko       2017-05-08  543  /**
a7c3e901a46ff5 Michal Hocko       2017-05-08  544   * kvmalloc_node - attempt to allocate physically contiguous memory, but upon
a7c3e901a46ff5 Michal Hocko       2017-05-08  545   * failure, fall back to non-contiguous (vmalloc) allocation.
a7c3e901a46ff5 Michal Hocko       2017-05-08  546   * @size: size of the request.
a7c3e901a46ff5 Michal Hocko       2017-05-08  547   * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
a7c3e901a46ff5 Michal Hocko       2017-05-08  548   * @node: numa node to allocate from
a7c3e901a46ff5 Michal Hocko       2017-05-08  549   *
a7c3e901a46ff5 Michal Hocko       2017-05-08  550   * Uses kmalloc to get the memory but if the allocation fails then falls back
a7c3e901a46ff5 Michal Hocko       2017-05-08  551   * to the vmalloc allocator. Use kvfree for freeing the memory.
a7c3e901a46ff5 Michal Hocko       2017-05-08  552   *
a421ef303008b0 Michal Hocko       2022-01-14  553   * GFP_NOWAIT and GFP_ATOMIC are not supported, neither is the __GFP_NORETRY modifier.
cc965a29db172c Michal Hocko       2017-07-12  554   * __GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
cc965a29db172c Michal Hocko       2017-07-12  555   * preferable to the vmalloc fallback, due to visible performance drawbacks.
a7c3e901a46ff5 Michal Hocko       2017-05-08  556   *
a862f68a8b3600 Mike Rapoport      2019-03-05  557   * Return: pointer to the allocated memory of %NULL in case of failure
a7c3e901a46ff5 Michal Hocko       2017-05-08  558   */
1abada26119472 Suren Baghdasaryan 2023-02-02  559  void *_kvmalloc_node(size_t size, gfp_t flags, int node)
a7c3e901a46ff5 Michal Hocko       2017-05-08 @560  {
a7c3e901a46ff5 Michal Hocko       2017-05-08  561  	gfp_t kmalloc_flags = flags;
a7c3e901a46ff5 Michal Hocko       2017-05-08  562  	void *ret;
a7c3e901a46ff5 Michal Hocko       2017-05-08  563  
a7c3e901a46ff5 Michal Hocko       2017-05-08  564  	/*
4f4f2ba9c531b3 Michal Hocko       2017-06-02  565  	 * We want to attempt a large physically contiguous block first because
4f4f2ba9c531b3 Michal Hocko       2017-06-02  566  	 * it is less likely to fragment multiple larger blocks and therefore
4f4f2ba9c531b3 Michal Hocko       2017-06-02  567  	 * contribute to a long term fragmentation less than vmalloc fallback.
4f4f2ba9c531b3 Michal Hocko       2017-06-02  568  	 * However make sure that larger requests are not too disruptive - no
4f4f2ba9c531b3 Michal Hocko       2017-06-02  569  	 * OOM killer and no allocation failure warnings as we have a fallback.
a7c3e901a46ff5 Michal Hocko       2017-05-08  570  	 */
6c5ab6511f718c Michal Hocko       2017-05-08  571  	if (size > PAGE_SIZE) {
6c5ab6511f718c Michal Hocko       2017-05-08  572  		kmalloc_flags |= __GFP_NOWARN;
6c5ab6511f718c Michal Hocko       2017-05-08  573  
cc965a29db172c Michal Hocko       2017-07-12  574  		if (!(kmalloc_flags & __GFP_RETRY_MAYFAIL))
6c5ab6511f718c Michal Hocko       2017-05-08  575  			kmalloc_flags |= __GFP_NORETRY;
a421ef303008b0 Michal Hocko       2022-01-14  576  
a421ef303008b0 Michal Hocko       2022-01-14  577  		/* nofail semantic is implemented by the vmalloc fallback */
a421ef303008b0 Michal Hocko       2022-01-14  578  		kmalloc_flags &= ~__GFP_NOFAIL;
6c5ab6511f718c Michal Hocko       2017-05-08  579  	}
a7c3e901a46ff5 Michal Hocko       2017-05-08  580  
1abada26119472 Suren Baghdasaryan 2023-02-02  581  	ret = _kmalloc_node(size, kmalloc_flags, node);
a7c3e901a46ff5 Michal Hocko       2017-05-08  582  
a7c3e901a46ff5 Michal Hocko       2017-05-08  583  	/*
a7c3e901a46ff5 Michal Hocko       2017-05-08  584  	 * It doesn't really make sense to fallback to vmalloc for sub page
a7c3e901a46ff5 Michal Hocko       2017-05-08  585  	 * requests
a7c3e901a46ff5 Michal Hocko       2017-05-08  586  	 */
a7c3e901a46ff5 Michal Hocko       2017-05-08  587  	if (ret || size <= PAGE_SIZE)
a7c3e901a46ff5 Michal Hocko       2017-05-08  588  		return ret;
a7c3e901a46ff5 Michal Hocko       2017-05-08  589  
30c19366636f72 Florian Westphal   2022-09-26  590  	/* non-sleeping allocations are not supported by vmalloc */
30c19366636f72 Florian Westphal   2022-09-26  591  	if (!gfpflags_allow_blocking(flags))
30c19366636f72 Florian Westphal   2022-09-26  592  		return NULL;
30c19366636f72 Florian Westphal   2022-09-26  593  
7661809d493b42 Linus Torvalds     2021-07-14  594  	/* Don't even allow crazy sizes */
0708a0afe291bd Daniel Borkmann    2022-03-04  595  	if (unlikely(size > INT_MAX)) {
0708a0afe291bd Daniel Borkmann    2022-03-04  596  		WARN_ON_ONCE(!(flags & __GFP_NOWARN));
7661809d493b42 Linus Torvalds     2021-07-14  597  		return NULL;
0708a0afe291bd Daniel Borkmann    2022-03-04  598  	}
7661809d493b42 Linus Torvalds     2021-07-14  599  
9becb688913023 Linus Torvalds     2022-04-22  600  	/*
9becb688913023 Linus Torvalds     2022-04-22  601  	 * kvmalloc() can always use VM_ALLOW_HUGE_VMAP,
9becb688913023 Linus Torvalds     2022-04-22  602  	 * since the callers already cannot assume anything
9becb688913023 Linus Torvalds     2022-04-22  603  	 * about the resulting pointer, and cannot play
9becb688913023 Linus Torvalds     2022-04-22  604  	 * protection games.
9becb688913023 Linus Torvalds     2022-04-22  605  	 */
9becb688913023 Linus Torvalds     2022-04-22  606  	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
9becb688913023 Linus Torvalds     2022-04-22  607  			flags, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
9becb688913023 Linus Torvalds     2022-04-22  608  			node, __builtin_return_address(0));
a7c3e901a46ff5 Michal Hocko       2017-05-08  609  }
1abada26119472 Suren Baghdasaryan 2023-02-02  610  EXPORT_SYMBOL(_kvmalloc_node);
a7c3e901a46ff5 Michal Hocko       2017-05-08  611  

:::::: The code at line 560 was first introduced by commit
:::::: a7c3e901a46ff54c016d040847eda598a9e3e653 mm: introduce kv[mz]alloc helpers

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
