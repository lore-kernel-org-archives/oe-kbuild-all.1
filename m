Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2B1552E4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733774403; cv=none; b=Zuk4hVSSlB6H9dvVCX2h6ZpMmSxxy7AnXZHFaj0MyOHcZGqKSiwrrOLBFFAOvZs0bsPzOSPuDIVhZ6NoD5clCM+1C6l1MUTFnQMqp/u1X7Npa2x7OprbmuECsMl0Jax0rS9KpupQfH/Yw36cz2Hfo7sVTiLSuVuMGYpqtBB51Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733774403; c=relaxed/simple;
	bh=eQBveyN1pHC75gstsx0yKUpsTLYd/lJualW+vXfS+2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FIF97v88qBtKEfTdJc+njahHANJKClWt8uSZ4Xq0oyAEeyQLCDpC8IwC2SvxelZxNJARY5dUhp7e0yCwSaKwT1A+Pt/6S6SlJ11btorFU/3T/1eCu5GovwTUF6wkTXnq/Joe0Tsh1jMZwy1Q7kW8qSv95MOYgRIjidGMEvODAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heaRTV0y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heaRTV0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733774401; x=1765310401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQBveyN1pHC75gstsx0yKUpsTLYd/lJualW+vXfS+2M=;
  b=heaRTV0y15DAK2BqUSwMJt+iWmuLwfs+1oP6mEE6KrQsaghjQSt+hnYs
   /NSodYRTsAPXrwWbJfracrVhB7gJGfJKZRjpPf21hkL2zbUnr0vyemwdN
   XSvofC4sDX+xg37AU4nE8BGB24TH4q2LJEgv09GS3gLD+M5CNKn+CTN0Y
   d/MQ1ERnA2VsacyZ95IAbPGGLhNlQ8FX7jJT8tZdTvKGmTOzhwZ4rGHJF
   CVG2izZE7H6z5M0aiSAtPjtDrRObINBFuJfyWdWp4GTbc7ra5pbVGv4xU
   HLbGd9AvIB35vxPhFy8RlQoXzDmDZNRNtKwci9FvQxuBJRsy+DGEBzFI0
   w==;
X-CSE-ConnectionGUID: 6EUj59qzTAiHstLTrL1FSQ==
X-CSE-MsgGUID: hqjE9fUwTxG3scipY5OGQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56572825"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="56572825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 12:00:00 -0800
X-CSE-ConnectionGUID: 14fLcE4CQyyvZPsTD3caQQ==
X-CSE-MsgGUID: HrzNSA+7QG+77IT2VnsttQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="100125041"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Dec 2024 11:59:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKjvA-0004mD-30;
	Mon, 09 Dec 2024 19:59:56 +0000
Date: Tue, 10 Dec 2024 03:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 1/2]
 drivers/misc/vmw_balloon.c:681:31: error: too few arguments to function
 call, single argument 'order' was not specified
Message-ID: <202412100358.XLPRAaLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   4332228773d8f5cd3b07c96d0aa41095be5b0446
commit: 12748383a4ceb5771ff4034cff6685953d00c6b1 [1/2] ANDROID: virtio-balloon: Allow pagesize configuration
config: i386-buildonly-randconfig-004-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100358.XLPRAaLK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100358.XLPRAaLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100358.XLPRAaLK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/misc/vmw_balloon.c:22:
   In file included from include/linux/mm.h:2030:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/misc/vmw_balloon.c:681:31: error: too few arguments to function call, single argument 'order' was not specified
     681 |                                 page = balloon_page_alloc();
         |                                        ~~~~~~~~~~~~~~~~~~ ^
   include/linux/balloon_compaction.h:63:21: note: 'balloon_page_alloc' declared here
      63 | extern struct page *balloon_page_alloc(int order);
         |                     ^                  ~~~~~~~~~
   1 warning and 1 error generated.


vim +/order +681 drivers/misc/vmw_balloon.c

453dc65931915a drivers/misc/vmware_balloon.c Dmitry Torokhov    2010-04-23  646  
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  647  /**
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  648   * vmballoon_alloc_page_list - allocates a list of pages.
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  649   *
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  650   * @b: pointer to the balloon.
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  651   * @ctl: pointer for the %struct vmballoon_ctl, which defines the operation.
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  652   * @req_n_pages: the number of requested pages.
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  653   *
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  654   * Tries to allocate @req_n_pages. Add them to the list of balloon pages in
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  655   * @ctl.pages and updates @ctl.n_pages to reflect the number of pages.
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  656   *
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  657   * Return: zero on success or error code otherwise.
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  658   */
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  659  static int vmballoon_alloc_page_list(struct vmballoon *b,
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  660  				     struct vmballoon_ctl *ctl,
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  661  				     unsigned int req_n_pages)
365bd7ef7ec8eb drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  662  {
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  663  	struct page *page;
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  664  	unsigned int i;
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  665  
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  666  	for (i = 0; i < req_n_pages; i++) {
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  667  		/*
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  668  		 * First check if we happen to have pages that were allocated
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  669  		 * before. This happens when 2MB page rejected during inflation
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  670  		 * by the hypervisor, and then split into 4KB pages.
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  671  		 */
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  672  		if (!list_empty(&ctl->prealloc_pages)) {
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  673  			page = list_first_entry(&ctl->prealloc_pages,
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  674  						struct page, lru);
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  675  			list_del(&page->lru);
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  676  		} else {
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  677  			if (ctl->page_size == VMW_BALLOON_2M_PAGE)
83a8afa72e9c0a drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  678  				page = alloc_pages(__GFP_HIGHMEM|__GFP_NOWARN|
83a8afa72e9c0a drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  679  					__GFP_NOMEMALLOC, VMW_BALLOON_2M_ORDER);
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  680  			else
83a8afa72e9c0a drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25 @681  				page = balloon_page_alloc();
365bd7ef7ec8eb drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  682  
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  683  			vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT_ALLOC,
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  684  						 ctl->page_size);
ae29783d3333b8 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  685  		}
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  686  
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  687  		if (page) {
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  688  			/* Success. Add the page to the list and continue. */
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  689  			list_add(&page->lru, &ctl->pages);
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  690  			continue;
365bd7ef7ec8eb drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  691  		}
365bd7ef7ec8eb drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  692  
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  693  		/* Allocation failed. Update statistics and stop. */
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  694  		vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT_ALLOC_FAIL,
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  695  					 ctl->page_size);
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  696  		break;
365bd7ef7ec8eb drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  697  	}
365bd7ef7ec8eb drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  698  
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  699  	ctl->n_pages = i;
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  700  
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  701  	return req_n_pages == ctl->n_pages ? 0 : -ENOMEM;
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  702  }
6e4453b3211d14 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  703  

:::::: The code at line 681 was first introduced by commit
:::::: 83a8afa72e9c0a200d9d400ce83a0cb5193b0e3d vmw_balloon: Compaction support

:::::: TO: Nadav Amit <namit@vmware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
