Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E56227BB9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 06:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621901; cv=none; b=uIwbG4msNgirWFbvQKMyOlG8xk1vjT0iedUzOh+4UKLc16lT0f9Dh/NSrWtI5PgbRmZih8yvWjdlXejdyQVlewB67NWUYNNY5LmD+eY+ydqJNyko3VAwADrAaBRBSpenoFU7ojFtO/gZGPRvEFniavG9e7QS+CXGuvIgYYw+ap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621901; c=relaxed/simple;
	bh=Sys6VM+lWAHaekCUsYykz31GCs+KR5VR6NzqWOi3RX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RrJ5ZkfkAeddutWMR+AVnoG7bEZ2VSah49IbV3e0vVrK9MR9lGj4fpArRr+kVUCdYiJR2cKM28/4CLxyfdnFvxmI1v9TtifJM/sS3OZeBYmedtSzu4uqjmvArstwtaDx4FlGlu2qvCXzvQ8wcSyWpezn59moDmR6wIyeKe5v/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAydcxPJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAydcxPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749621900; x=1781157900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sys6VM+lWAHaekCUsYykz31GCs+KR5VR6NzqWOi3RX8=;
  b=bAydcxPJLrBKIdYOPrLvXqYpIZx9e9icrNbnEi8004MHV5YSrBawHlF8
   BBIoSoG6HwHccLQdfHz6kj33xguhlIqJP9mv8thlrByNgqt4uCD9ECQX5
   YRCgsuEB3Ye0jOS5C4lmsKDwBGTJpM41q5wq/xBrth6V2M4xCfA3ON4Sv
   F0NgKWB9SVQgn2YzFcon3vpwtUbz88BzdTA03JjUSgn2oHbR7g8vU+QhP
   9FMNYPCyvlZ0KSvu6jd/hHGhs04NhEUNkn0MciS+ybccNtkespdyJQGfj
   T+7zFEZQUH3rtoyIs6DaV+fch6X70JS7SK2otEclvLXDNHTaiQUURsjf+
   Q==;
X-CSE-ConnectionGUID: X1oqCekNTvacp1IHa0RQDw==
X-CSE-MsgGUID: hcYKQ4mOT82l6xEP46dOPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51741873"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51741873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 23:04:56 -0700
X-CSE-ConnectionGUID: MoF31iqrTZmE5pOom4TF3A==
X-CSE-MsgGUID: HXRIuNsXRPCoViJpKoUCrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147634859"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2025 23:04:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPEZx-000A3c-0Q;
	Wed, 11 Jun 2025 06:04:53 +0000
Date: Wed, 11 Jun 2025 14:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 7/7] mm/vmscan.c:4613:6: warning: no
 previous prototype for 'isolate_page'
Message-ID: <202506111304.AH0XEq47-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   2f9eb8ebfbd27c571c1d3712c7c629227317b2b2
commit: 54677afc8eb1da47f2eebb6f5c810cd4b6db23dc [7/7] ANDROID: mm: export isolate_folio and reclaim_pages
config: arm-randconfig-004-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111304.AH0XEq47-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111304.AH0XEq47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111304.AH0XEq47-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:917:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     917 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1391:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1391 |         int err;
         |             ^~~
   mm/vmscan.c: At top level:
>> mm/vmscan.c:4613:6: warning: no previous prototype for 'isolate_page' [-Wmissing-prototypes]
    4613 | bool isolate_page(struct lruvec *lruvec, struct page *page, struct scan_control *sc)
         |      ^~~~~~~~~~~~


vim +/isolate_page +4613 mm/vmscan.c

  4612	
> 4613	bool isolate_page(struct lruvec *lruvec, struct page *page, struct scan_control *sc)
  4614	{
  4615		bool success;
  4616	
  4617		/* unmapping inhibited */
  4618		if (!sc->may_unmap && page_mapped(page))
  4619			return false;
  4620	
  4621		/* swapping inhibited */
  4622		if (!(sc->may_writepage && (sc->gfp_mask & __GFP_IO)) &&
  4623		    (PageDirty(page) ||
  4624		     (PageAnon(page) && !PageSwapCache(page))))
  4625			return false;
  4626	
  4627		/* raced with release_pages() */
  4628		if (!get_page_unless_zero(page))
  4629			return false;
  4630	
  4631		/* raced with another isolation */
  4632		if (!TestClearPageLRU(page)) {
  4633			put_page(page);
  4634			return false;
  4635		}
  4636	
  4637		/* see the comment on MAX_NR_TIERS */
  4638		if (!PageReferenced(page))
  4639			set_mask_bits(&page->flags, LRU_REFS_MASK | LRU_REFS_FLAGS, 0);
  4640	
  4641		/* for shrink_page_list() */
  4642		ClearPageReclaim(page);
  4643		ClearPageReferenced(page);
  4644	
  4645		success = lru_gen_del_page(lruvec, page, true);
  4646		VM_WARN_ON_ONCE_PAGE(!success, page);
  4647	
  4648		return true;
  4649	}
  4650	EXPORT_SYMBOL_GPL(isolate_page);
  4651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
