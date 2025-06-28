Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E83E19DF7D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751119909; cv=none; b=VYRcj1Bx6966S0xhpCojYfpBt5ETArvnyz9kuxkAbKnhcK73aQRFvzhJmL344nB2x1deFBwcIjvK1wDbEbrJpRiCyjKkNYgr7121DayXLiQElR0Dixc8ZK9PqlVZxbfuZ4da2cKSd7j2Ve+0AOz3IkXJslrsleJRUkskhZZNgqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751119909; c=relaxed/simple;
	bh=gX2y0AaXCxvsAPghNhMWWBZnbU2HpDkw7r7PG+uY1/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAIigPh2J//ScBipywE2CO6uoCxvK8j5NFFT6VWivgx+XULaOJA5B3KA2URxP+0difjMqkFWX6W4UrKQ29ZfnHYyxLY9kqxNXmclQt3//ilC2DCa7Boo39cSskPNEFKljsiCuhv8p0W6iPPJDRoJNv5ZW8hU57qpPIZbyEi/y3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDZ5jeKE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDZ5jeKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751119907; x=1782655907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gX2y0AaXCxvsAPghNhMWWBZnbU2HpDkw7r7PG+uY1/k=;
  b=EDZ5jeKE3whYZaHSYzJha2Qkq+mHXG0nLofgGGs/JB3jfmkjCqh9f2k/
   r/xDzh2uiO2WzjLbhYwY+fnVgqCopy7EqFYO5nAsPpg25Zp3ZFk4oXcCz
   HJr11qCYN8YegNrfHoHlNpjrAKIjvRKcEw3spF6kWHhRxwtDHL50bqExg
   qTJBiLEX7P+yjsk70TlDoHsvYHb/bz+gxPLhwFqjNVOE2g/LGH24Get3Q
   CwfelcFVu+Dpw6eQefcICqhwsQ7ZzzoQses6EANxJizmO2tQo3Zwzss4a
   6/+aqvhj0FYdBlWjcHQEtJd7OVuaTqugdgqOVUHhh+K5uf+rZDNMFteLl
   w==;
X-CSE-ConnectionGUID: qCIuDxxJTvOkoieyWAaYVw==
X-CSE-MsgGUID: 1pwGKJkwTLyTTgIOqzxZ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52637258"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52637258"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:11:47 -0700
X-CSE-ConnectionGUID: xDoY4tSyTnqztC+qvlpVNQ==
X-CSE-MsgGUID: gCJabYYaSoK+RR2ymzWCQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153134919"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jun 2025 07:11:46 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVWHP-0000lH-2b;
	Sat, 28 Jun 2025 14:11:43 +0000
Date: Sat, 28 Jun 2025 16:11:34 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] mm/vmscan.c:4613:6: warning: no
 previous prototype for 'isolate_page'
Message-ID: <202506281618.TnjFMGcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a62b6eac4760ffdd39f6a7f102edf51fad6628b8
commit: 54677afc8eb1da47f2eebb6f5c810cd4b6db23dc [1/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: i386-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250628/202506281618.TnjFMGcz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281618.TnjFMGcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281618.TnjFMGcz-lkp@intel.com/

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
