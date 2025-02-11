Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A266B26BDBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 01:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739238534; cv=none; b=JhxUnIBF3TJ3O1x49/+clOJu5Dh+8TJk77fnO0qF3v8EVKf1ssW+NQulohuJUey4ZpvBfFiPVzT9m9QD7yZUQ6pIBG4p142BmWhLgS0/xbxR4Y0LKFsUS/hYpmGPkYMdNC6LhLiM/RRLvd9q9+gN9VOZRihGiLzNyy24vqo34QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739238534; c=relaxed/simple;
	bh=F2L0+ge4sBD5azysZTzb8eJhKhvV5btU/QfYjhE/rnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L78hNcBmw7LGZZtKeAtAwOarJrFqTrNrKhGfcvKdlQXtx/pPyF0T9KwcltvD5sFL1MWXN7ARztxkBdzF/jZvATARxIlh6oyTG17LADhmEqycAphIaXaUoaERXLGlPkoas7l5zDptX/AtX27NMYsM1Boyfo9/xP9G14pJdgs3bT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTGAAxCG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTGAAxCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739238532; x=1770774532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F2L0+ge4sBD5azysZTzb8eJhKhvV5btU/QfYjhE/rnQ=;
  b=iTGAAxCGDw7oNGzAxebtK1ClrA9ThQ5E5VaX2sqcDJnMniL2phSeCVj6
   OX0ZUeY0MG4UN1If6pJeVvC9wUdafu9N7xHkWHLDPeAHw41mrdHNmwokQ
   1Fl5ZTiRgbg2J3hTWRdctNZ7fa6fhbnGA7/7tbijnQDHBGfsqx1/fcGaJ
   KqGkdGtbOBoemUxIyPjHxNejV0eRMTcOmwl17MKaZByclZmF9Q/SWsGj7
   jHKyqEANIiIHfL7HbuxnASc5UYeKZroF4JJdE21VvEs9jnVv3NuyxdjrH
   ZR+duXuhYLw/cyE1e+30i5s7/K+Dqn5cT+KkHhTUH2kHpCHr/Xu5M/AHM
   A==;
X-CSE-ConnectionGUID: TY4/QVh2QU6gsGTsikx9gw==
X-CSE-MsgGUID: q+JwwxlXTZCtLYW0sFVk+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27444009"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="27444009"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 17:48:52 -0800
X-CSE-ConnectionGUID: +NThBKKeT26uA7E5G+fPVw==
X-CSE-MsgGUID: kkVlz5mSTi+8ryJyW3kvSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149544970"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2025 17:48:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thfOK-0013dd-03;
	Tue, 11 Feb 2025 01:48:48 +0000
Date: Tue, 11 Feb 2025 09:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka:maple-tree-sheaves-v3-hack 18/21] lib/maple_tree.c:5378:16:
 error: 'struct ma_state' has no member named 'allocated'
Message-ID: <202502110957.iiMvzj60-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git maple-tree-sheaves-v3-hack
head:   9b7a825f40a76d8502c0e96c19cfd47c53d8bd4d
commit: 02e4d9a4f08ff51fd302c0acda54c176d6912178 [18/21] maple_tree: Add single node allocation support to maple state
config: x86_64-randconfig-103-20250208 (https://download.01.org/0day-ci/archive/20250211/202502110957.iiMvzj60-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110957.iiMvzj60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110957.iiMvzj60-lkp@intel.com/

Note: the vbabka/maple-tree-sheaves-v3-hack HEAD 9b7a825f40a76d8502c0e96c19cfd47c53d8bd4d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   lib/maple_tree.c: In function 'mas_destroy':
>> lib/maple_tree.c:5378:16: error: 'struct ma_state' has no member named 'allocated'
    5378 |         if (mas->allocated) {
         |                ^~
   lib/maple_tree.c:5379:59: error: 'struct ma_state' has no member named 'allocated'
    5379 |                 kmem_cache_free_bulk(maple_node_cache, mas->allocated,
         |                                                           ^~
   lib/maple_tree.c:5381:20: error: 'struct ma_state' has no member named 'allocated'
    5381 |                 mas->allocated = 0;
         |                    ^~


vim +5378 lib/maple_tree.c

  5343	
  5344	/*
  5345	 * mas_destroy() - destroy a maple state.
  5346	 * @mas: The maple state
  5347	 *
  5348	 * Upon completion, check the left-most node and rebalance against the node to
  5349	 * the right if necessary.  Frees any allocated nodes associated with this maple
  5350	 * state.
  5351	 */
  5352	void mas_destroy(struct ma_state *mas)
  5353	{
  5354		/*
  5355		 * When using mas_for_each() to insert an expected number of elements,
  5356		 * it is possible that the number inserted is less than the expected
  5357		 * number.  To fix an invalid final node, a check is performed here to
  5358		 * rebalance the previous node with the final node.
  5359		 */
  5360		if (mas->mas_flags & MA_STATE_REBALANCE) {
  5361			unsigned char end;
  5362			if (mas_is_err(mas))
  5363				mas_reset(mas);
  5364			mas_start(mas);
  5365			mtree_range_walk(mas);
  5366			end = mas->end + 1;
  5367			if (end < mt_min_slot_count(mas->node) - 1)
  5368				mas_destroy_rebalance(mas, end);
  5369	
  5370			mas->mas_flags &= ~MA_STATE_REBALANCE;
  5371		}
  5372		mas->mas_flags &= ~(MA_STATE_BULK|MA_STATE_PREALLOC);
  5373	
  5374		mas->node_request = 0;
  5375		if (mas->sheaf)
  5376			kmem_cache_return_sheaf(maple_node_cache, GFP_KERNEL,
  5377						mas->sheaf);
> 5378		if (mas->allocated) {
  5379			kmem_cache_free_bulk(maple_node_cache, mas->allocated,
  5380					     (void **)mas->alloc);
  5381			mas->allocated = 0;
  5382		}
  5383		mas->sheaf = NULL;
  5384	}
  5385	EXPORT_SYMBOL_GPL(mas_destroy);
  5386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
