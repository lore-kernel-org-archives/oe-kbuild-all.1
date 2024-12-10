Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1B3522A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 00:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733790276; cv=none; b=p1MU02FROkkc+TL/Jfu8bbKwp6UpzOaWzZELKYEVVroRIW/rdWoEAx8merCqZKQHoepE8a9g2ikUFU2QL48trZLcup4lLH96LclAGeB/Jr9eEUeFsRnyGeH0qq6/Etc2cRXPWT8/Si3rPFjVNpAubvvfh835tm3ILGE6Ibttlvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733790276; c=relaxed/simple;
	bh=Pc1Gs7fNB+wMBsFexlQ37q55EF6uTO5z4TbYvdAneos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDCqXvnGhOV8pkXHp3OOpFNTqGg0AVeeu641HP1iL/uW0IUvoCBQQMaAX/cPJh9A2LS8w/l4j/kFJ7fPWVrPcJIoKSz0cNrIjSLeAVG7e9LswMA+IEpJdSxXgO8+9lVX+ZPlT4GKtXi7adrMcb7kqNJfF3d4et5YqC5X3LJsYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4kiw7+E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4kiw7+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733790273; x=1765326273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pc1Gs7fNB+wMBsFexlQ37q55EF6uTO5z4TbYvdAneos=;
  b=j4kiw7+EB+WciOYtUSoLilFowdspSRge5zS6dDdJe1Ewm1q904+ulEVD
   DJtEqHO7MW966fTndlB8E6L5+P8rrNjbGDItIeF5K678pvI2v8zCRtFy/
   9ZVze9ScPoAtuxSpT2QUGi9ML+byZOTESEz+bDCJMze8I8pCAneUNkPR2
   pZLONRkpPjQebgnQdQuDKq71iG0zKtNsyTKYPXLHuqXrkZZP1dQ0otAxW
   gExc4aTVyQliIze7ORDB927dYFtkxEzmMIyvnwvK13rIRiB0A35UXYF6f
   +J9hxweu+KXZPyJNYXWAYLkl1NxcN08K57DCjiMcUa2yzXjumLOfRAHoP
   A==;
X-CSE-ConnectionGUID: qL78HgTmRHeYET3Tu1jWGA==
X-CSE-MsgGUID: 3wlC29ReSz6qWt2+KIykaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44717221"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="44717221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 16:24:33 -0800
X-CSE-ConnectionGUID: PI20LDWVRhWaUpEStlBJ4g==
X-CSE-MsgGUID: UdgbmwSyRqSKiF0Tk1TJpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95104120"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Dec 2024 16:24:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKo3B-0004yD-1Q;
	Tue, 10 Dec 2024 00:24:29 +0000
Date: Tue, 10 Dec 2024 08:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 1/2]
 drivers/misc/vmw_balloon.c:681:40: error: too few arguments to function
 'balloon_page_alloc'
Message-ID: <202412100816.ZFdYKlu7-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241210/202412100816.ZFdYKlu7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100816.ZFdYKlu7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100816.ZFdYKlu7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/vmw_balloon.c: In function 'vmballoon_alloc_page_list':
>> drivers/misc/vmw_balloon.c:681:40: error: too few arguments to function 'balloon_page_alloc'
     681 |                                 page = balloon_page_alloc();
         |                                        ^~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/vmw_balloon.c:32:
   include/linux/balloon_compaction.h:63:21: note: declared here
      63 | extern struct page *balloon_page_alloc(int order);
         |                     ^~~~~~~~~~~~~~~~~~


vim +/balloon_page_alloc +681 drivers/misc/vmw_balloon.c

453dc65931915ab drivers/misc/vmware_balloon.c Dmitry Torokhov    2010-04-23  646  
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  647  /**
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  648   * vmballoon_alloc_page_list - allocates a list of pages.
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  649   *
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  650   * @b: pointer to the balloon.
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  651   * @ctl: pointer for the %struct vmballoon_ctl, which defines the operation.
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  652   * @req_n_pages: the number of requested pages.
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  653   *
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  654   * Tries to allocate @req_n_pages. Add them to the list of balloon pages in
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  655   * @ctl.pages and updates @ctl.n_pages to reflect the number of pages.
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  656   *
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  657   * Return: zero on success or error code otherwise.
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  658   */
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  659  static int vmballoon_alloc_page_list(struct vmballoon *b,
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  660  				     struct vmballoon_ctl *ctl,
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  661  				     unsigned int req_n_pages)
365bd7ef7ec8eb9 drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  662  {
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  663  	struct page *page;
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  664  	unsigned int i;
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  665  
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  666  	for (i = 0; i < req_n_pages; i++) {
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  667  		/*
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  668  		 * First check if we happen to have pages that were allocated
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  669  		 * before. This happens when 2MB page rejected during inflation
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  670  		 * by the hypervisor, and then split into 4KB pages.
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  671  		 */
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  672  		if (!list_empty(&ctl->prealloc_pages)) {
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  673  			page = list_first_entry(&ctl->prealloc_pages,
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  674  						struct page, lru);
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  675  			list_del(&page->lru);
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  676  		} else {
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  677  			if (ctl->page_size == VMW_BALLOON_2M_PAGE)
83a8afa72e9c0a2 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  678  				page = alloc_pages(__GFP_HIGHMEM|__GFP_NOWARN|
83a8afa72e9c0a2 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  679  					__GFP_NOMEMALLOC, VMW_BALLOON_2M_ORDER);
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  680  			else
83a8afa72e9c0a2 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25 @681  				page = balloon_page_alloc();
365bd7ef7ec8eb9 drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  682  
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  683  			vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT_ALLOC,
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  684  						 ctl->page_size);
ae29783d3333b82 drivers/misc/vmw_balloon.c    Nadav Amit         2019-04-25  685  		}
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  686  
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  687  		if (page) {
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  688  			/* Success. Add the page to the list and continue. */
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  689  			list_add(&page->lru, &ctl->pages);
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  690  			continue;
365bd7ef7ec8eb9 drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  691  		}
365bd7ef7ec8eb9 drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  692  
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  693  		/* Allocation failed. Update statistics and stop. */
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  694  		vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT_ALLOC_FAIL,
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  695  					 ctl->page_size);
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  696  		break;
365bd7ef7ec8eb9 drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  697  	}
365bd7ef7ec8eb9 drivers/misc/vmw_balloon.c    Philip P. Moltmann 2015-08-06  698  
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  699  	ctl->n_pages = i;
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  700  
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  701  	return req_n_pages == ctl->n_pages ? 0 : -ENOMEM;
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  702  }
6e4453b3211d144 drivers/misc/vmw_balloon.c    Nadav Amit         2018-09-20  703  

:::::: The code at line 681 was first introduced by commit
:::::: 83a8afa72e9c0a200d9d400ce83a0cb5193b0e3d vmw_balloon: Compaction support

:::::: TO: Nadav Amit <namit@vmware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
