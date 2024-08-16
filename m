Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FE1BB68D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723825989; cv=none; b=ZLzsRdfR2dDN2PNzNjrSQaA9MTk7LZZ4wgbfdY6HjdAPZ7syqPbZkEkFWaC8G8f7rak0T79m0rsOswqhNSmDiD77F3/6C4E4EN+aoF/FijCYvYe1O0H+/2hAULvNv8VZCpABfKUBNe3TUNNBggtMiOoag6r+K5DOIaj65Halqlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723825989; c=relaxed/simple;
	bh=oZtexGhi4TnH2641/34zp9aOjrFej0bloZ/pNOMLwuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOC7yZfIbPvs3rR3wWiNdkerdbpeL9nInxE1Ya9fraiXAC8Wt6jITZHxzctJV8FFz6l5mT3489dRZHntnirxbvEV3QmUTmK2r+AvLKBOgMcFVPAvbhPS6gd7wp81CPSO17vFpBiWGqg5Lg8ZaKq6WvEJXJVbbb3TMoStoJG9Ak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFLPZo5s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFLPZo5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723825988; x=1755361988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oZtexGhi4TnH2641/34zp9aOjrFej0bloZ/pNOMLwuc=;
  b=XFLPZo5sOnX+GFmkMre+e4sWt78vfJSOgjGfNS9dJFv+QA3VdkSP0Wf2
   pCtUpsFSrDzsu4QK/5uV3Upwmqsv3mh7qvaZPAtHIJf6qP0CH9zYGg63c
   l/kpJsBb6NIlfci5LRb62b4taZVmcyBw0Imo3grxcpzAHsUCsM3WWhvRG
   yvoqr1+evOiIcK+497sRCpc7HRQ/IgkXIEyQCrXc9+m9wAVgAgQw2XDuI
   nXxYMNVO2Pemv2GYb+39KDfXxAxblyYKl72q501MUhYyCeQRU5qhr5wsv
   qUXU3aDYq++QRNIOphPf6m6FetT8FOCWJpyWdEM4PUhuwRuN5ZNjhSOuB
   w==;
X-CSE-ConnectionGUID: /92B3e1BSpmBYDsZYLOYPA==
X-CSE-MsgGUID: 2CVt5/2URi2Rwp3TLHlLGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39582282"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="39582282"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 09:33:07 -0700
X-CSE-ConnectionGUID: 18Wy2WDETDOWRvFU/LjP8g==
X-CSE-MsgGUID: g5WNZOI/Q3auuuF9Bus3ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="60001779"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Aug 2024 09:33:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sezss-0006e8-0f;
	Fri, 16 Aug 2024 16:33:02 +0000
Date: Sat, 17 Aug 2024 00:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v8 3/6] drm/ttm: Use fault-injection to test error paths
Message-ID: <202408170041.l5SO7IpQ-lkp@intel.com>
References: <20240816133717.3102-4-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816133717.3102-4-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240816]
[also build test ERROR on v6.11-rc3]
[cannot apply to drm-xe/drm-xe-next linus/master v6.11-rc3 v6.11-rc2 v6.11-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Add-a-virtual-base-class-for-graphics-memory-backup/20240816-213947
base:   next-20240816
patch link:    https://lore.kernel.org/r/20240816133717.3102-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v8 3/6] drm/ttm: Use fault-injection to test error paths
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240817/202408170041.l5SO7IpQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170041.l5SO7IpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170041.l5SO7IpQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_restore_tt':
>> drivers/gpu/drm/ttm/ttm_pool.c:456:29: error: implicit declaration of function 'should_fail'; did you mean 'schedule_tail'? [-Werror=implicit-function-declaration]
     456 |                             should_fail(&backup_fault_inject, 1)) {
         |                             ^~~~~~~~~~~
         |                             schedule_tail
>> drivers/gpu/drm/ttm/ttm_pool.c:456:42: error: 'backup_fault_inject' undeclared (first use in this function)
     456 |                             should_fail(&backup_fault_inject, 1)) {
         |                                          ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:456:42: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_backup_tt':
   drivers/gpu/drm/ttm/ttm_pool.c:908:64: error: 'backup_fault_inject' undeclared (first use in this function)
     908 |         if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
         |                                                                ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +456 drivers/gpu/drm/ttm/ttm_pool.c

   434	
   435	static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
   436				       struct ttm_backup *backup,
   437				       struct ttm_operation_ctx *ctx)
   438	{
   439		static unsigned long __maybe_unused swappedin;
   440		unsigned int i, nr = 1 << restore->order;
   441		int ret = 0;
   442	
   443		if (!ttm_pool_restore_valid(restore))
   444			return 0;
   445	
   446		for (i = restore->restored_pages; i < nr; ++i) {
   447			struct page *p = restore->old_pages[i];
   448	
   449			if (ttm_backup_page_ptr_is_handle(p)) {
   450				unsigned long handle = ttm_backup_page_ptr_to_handle(p);
   451	
   452				if (handle == 0)
   453					continue;
   454	
   455				if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
 > 456				    should_fail(&backup_fault_inject, 1)) {
   457					ret = -EINTR;
   458					break;
   459				}
   460	
   461				ret = backup->ops->copy_backed_up_page
   462					(backup, restore->first_page[i],
   463					 handle, ctx->interruptible);
   464				if (ret)
   465					break;
   466	
   467				backup->ops->drop(backup, handle);
   468			} else if (p) {
   469				/*
   470				 * We could probably avoid splitting the old page
   471				 * using clever logic, but ATM we don't care.
   472				 */
   473				ttm_pool_split_for_swap(restore->pool, p);
   474				copy_highpage(restore->first_page[i], p);
   475				__free_pages(p, 0);
   476			}
   477	
   478			restore->restored_pages++;
   479			restore->old_pages[i] = NULL;
   480			cond_resched();
   481		}
   482	
   483		return ret;
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
