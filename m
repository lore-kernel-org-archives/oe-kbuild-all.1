Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429F9313059
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 23:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746489127; cv=none; b=CnhDChxXiRms6huMaTlJnCPpZf2DpSAc6iGiLeTJDtddLqsIhVcLLUG769wDENLDpysxrJIswU81yjZ7gf5hYNj1rlBUAHq9cxPPSyMK+1xtcHnKHqQ/h7ckUij3MbjaGNHT9152I9g2iVdGCPjO5QQdsJumNcaqF5Xg0jCLAag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746489127; c=relaxed/simple;
	bh=X6gn+/UVfsqq0aVEXKyd/maW1X0ajkuOx7R3EpSoPik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJ854TULCeCgAMS/u0PVaHPDVv9nwXcYtgoB1KHMerIhXcjOz8mo4leXjRkrBrHMfUYPPGmvHMoBHK7QC2MmTg7LT4ESkbV3SGPvwNx6RQO+kMnt4xXsqLw0yqQPIWS3UL2HkAIPpwFK3HflewUte58WXCOEZO/6ESQGOzgsDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQAVazZa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQAVazZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746489125; x=1778025125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X6gn+/UVfsqq0aVEXKyd/maW1X0ajkuOx7R3EpSoPik=;
  b=mQAVazZat2JmLIBTG2CT5nDVfmJj7XM9uZMNibkMRavQ8is81ejChv7c
   7BeD0sBAs6rSd0VAc8E+vusWUZmgEwL2Qw6TLHLkRWVD6vnjvS82iqhoC
   /h3cb5JQgE0fBvOyI6R87xQu6Tu00TLGQ2OCHFKNPCGiPCtwJOfezrG1V
   tHe9vGuY/IS4WyEVEEZs47rLpEIEiO9bhsaiPRJDPkEoXdwAL/TEID17w
   ftqFkH09JiFL4rVAohcU6o/LnFCO0GuxlXwN92oB+YwTcsPt0ObwP17io
   btOOfQ8R9jUnna0sJu5qy7zlYnTn8NoOdvU9ZB2viBEZYXmNn4ylX6+TG
   w==;
X-CSE-ConnectionGUID: I0VoCaYtTUC/45MWPm7pag==
X-CSE-MsgGUID: PvU7XZXmQbK60qdzbB8BbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59479985"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="59479985"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 16:52:04 -0700
X-CSE-ConnectionGUID: Ybz65NclSEiqsLJ7howB4g==
X-CSE-MsgGUID: klwZT4oDTJ6YbK5jnz5+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="135923194"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2025 16:52:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC5bN-00068P-0w;
	Mon, 05 May 2025 23:52:01 +0000
Date: Tue, 6 May 2025 07:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [akpm-mm:mm-new 279/316] mm/zblock.c:126: warning: Excess function
 parameter 'ops' description in 'zblock_create_pool'
Message-ID: <202505060720.ClN2d7w7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   0a7288c8a39a20b3bf12485dffa90d0ceebe96ab
commit: d003bacb573258e40d630fe7e5b8ba8f4bd0b851 [279/316] mm-add-zblock-allocator-fix
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250506/202505060720.ClN2d7w7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060720.ClN2d7w7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505060720.ClN2d7w7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zblock.c:126: warning: Excess function parameter 'ops' description in 'zblock_create_pool'


vim +126 mm/zblock.c

0822617662c8b1 Vitaly Wool 2025-04-12  113  
0822617662c8b1 Vitaly Wool 2025-04-12  114  /*****************
0822617662c8b1 Vitaly Wool 2025-04-12  115   * API Functions
0822617662c8b1 Vitaly Wool 2025-04-12  116   *****************/
0822617662c8b1 Vitaly Wool 2025-04-12  117  /**
0822617662c8b1 Vitaly Wool 2025-04-12  118   * zblock_create_pool() - create a new zblock pool
0822617662c8b1 Vitaly Wool 2025-04-12  119   * @gfp:	gfp flags when allocating the zblock pool structure
0822617662c8b1 Vitaly Wool 2025-04-12  120   * @ops:	user-defined operations for the zblock pool
0822617662c8b1 Vitaly Wool 2025-04-12  121   *
0822617662c8b1 Vitaly Wool 2025-04-12  122   * Return: pointer to the new zblock pool or NULL if the metadata allocation
0822617662c8b1 Vitaly Wool 2025-04-12  123   * failed.
0822617662c8b1 Vitaly Wool 2025-04-12  124   */
0822617662c8b1 Vitaly Wool 2025-04-12  125  static struct zblock_pool *zblock_create_pool(gfp_t gfp)
0822617662c8b1 Vitaly Wool 2025-04-12 @126  {
0822617662c8b1 Vitaly Wool 2025-04-12  127  	struct zblock_pool *pool;
0822617662c8b1 Vitaly Wool 2025-04-12  128  	struct block_list *block_list;
0822617662c8b1 Vitaly Wool 2025-04-12  129  	int i;
0822617662c8b1 Vitaly Wool 2025-04-12  130  
0822617662c8b1 Vitaly Wool 2025-04-12  131  	pool = kmalloc(sizeof(struct zblock_pool), gfp);
0822617662c8b1 Vitaly Wool 2025-04-12  132  	if (!pool)
0822617662c8b1 Vitaly Wool 2025-04-12  133  		return NULL;
0822617662c8b1 Vitaly Wool 2025-04-12  134  
0822617662c8b1 Vitaly Wool 2025-04-12  135  	/* init each block list */
0822617662c8b1 Vitaly Wool 2025-04-12  136  	for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
0822617662c8b1 Vitaly Wool 2025-04-12  137  		block_list = &pool->block_lists[i];
0822617662c8b1 Vitaly Wool 2025-04-12  138  		spin_lock_init(&block_list->lock);
0822617662c8b1 Vitaly Wool 2025-04-12  139  		INIT_LIST_HEAD(&block_list->full_list);
0822617662c8b1 Vitaly Wool 2025-04-12  140  		INIT_LIST_HEAD(&block_list->active_list);
0822617662c8b1 Vitaly Wool 2025-04-12  141  		block_list->block_count = 0;
0822617662c8b1 Vitaly Wool 2025-04-12  142  	}
0822617662c8b1 Vitaly Wool 2025-04-12  143  	return pool;
0822617662c8b1 Vitaly Wool 2025-04-12  144  }
0822617662c8b1 Vitaly Wool 2025-04-12  145  

:::::: The code at line 126 was first introduced by commit
:::::: 0822617662c8b165cc21923f22028976945d316a mm: add zblock allocator

:::::: TO: Vitaly Wool <vitaly.wool@konsulko.se>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
