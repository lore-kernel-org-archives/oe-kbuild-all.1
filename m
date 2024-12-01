Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153962AF12
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733088389; cv=none; b=Gtp1NAJMJVaxuU53qsKk6wtEauHxYJPVQkOUhXOSZ2DxXsNo6ldciru0gWXjumng62eZjA4UWL+20d5Rr9EP2XGxWKNle80dYotm0z3scV0ZuQnt9jKqB9IdIgWWkxB7grZ+qv//xDEBP9vIi96M5cuSKe3tjoFZZanbJixDRrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733088389; c=relaxed/simple;
	bh=Hrg00VHhOf13CYjCXNyKST7YDhBwCoZIV+6bgXUHa2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mj7D+/bfJYgMzuVANDIF/eRFYn0SANK6V2rJn3mT6hCZMOdgBQBjpY52sONQXENvHHhazmRHwweKZYXvntLGH4mgVnt7iHehymhwJ+KF0WCuxV10g8XONRGf5pEYrjSW+lAFOMvHeGyD1/W+JfcfZ1sdUgp7jIsih89INoHEabM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpPcxTyC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpPcxTyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733088387; x=1764624387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hrg00VHhOf13CYjCXNyKST7YDhBwCoZIV+6bgXUHa2E=;
  b=dpPcxTyCF8l98ITIg3mGiNJuOL0cWq+0xw2o4echDvSw6FgSzoxgmZ2H
   1Ixf0scg0OcNqqJIeGs/W6k6fL+DkPDgr9JyHoaxPBXQuyGWA/cYUbBqz
   wcAgO3YVw5KiZXTlqJeCFZ8tBSoECWtoQCnzw4z8gjfj0KaYY7Zuh+TH+
   lyqsNdWKd9zGbb674XBYYzk2akrRHXrwlewIv7FF7VBfA6z/5jun4z4BR
   J0P694PwiutuBpOXY8A1ZLvL1proINCukk6uxM/A+fZK7A3+ntowNAj6q
   HfXZXVwJNsDKnH7+rUuN5dir23oV/OBJJ0VSIKTVbTb0EkQRi1muBL1ng
   A==;
X-CSE-ConnectionGUID: Tbsa1wT5SR+sjBrmDjlO5w==
X-CSE-MsgGUID: XK2eNTjYRJib4xatIptVgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="37021404"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="37021404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 13:26:26 -0800
X-CSE-ConnectionGUID: K2dQO174R6u26F42WP6drA==
X-CSE-MsgGUID: DZbVyOS3QICYsHWBkN4Xbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93248816"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Dec 2024 13:26:25 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHrSR-0001rH-0Q;
	Sun, 01 Dec 2024 21:26:23 +0000
Date: Mon, 2 Dec 2024 05:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <yunshenglin0825@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:pcp_prototype_241117 1/1] mm/memory-failure.c:181:17:
 error: implicit declaration of function 'drain_all_pages'; did you mean
 'drain_local_pages'?
Message-ID: <202412020516.HKyPiDrZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git pcp_prototype_241117
head:   0bd7954c9b0be944e9c39400721255546f1624d8
commit: 0bd7954c9b0be944e9c39400721255546f1624d8 [1/1] mm: split out per cpu page
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20241202/202412020516.HKyPiDrZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020516.HKyPiDrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020516.HKyPiDrZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory-failure.c: In function '__page_handle_poison':
>> mm/memory-failure.c:181:17: error: implicit declaration of function 'drain_all_pages'; did you mean 'drain_local_pages'? [-Wimplicit-function-declaration]
     181 |                 drain_all_pages(page_zone(page));
         |                 ^~~~~~~~~~~~~~~
         |                 drain_local_pages


vim +181 mm/memory-failure.c

8cbc82f3ec0d58 Kefeng Wang     2023-03-20  156  
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  157  /*
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  158   * Return values:
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  159   *   1:   the page is dissolved (if needed) and taken off from buddy,
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  160   *   0:   the page is dissolved (if needed) and not taken off from buddy,
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  161   *   < 0: failed to dissolve.
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  162   */
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  163  static int __page_handle_poison(struct page *page)
510d25c92ec4ac Naoya Horiguchi 2021-06-30  164  {
f87060d345232c Michael Wang    2021-09-02  165  	int ret;
510d25c92ec4ac Naoya Horiguchi 2021-06-30  166  
1983184c22dd84 Miaohe Lin      2024-04-07  167  	/*
1983184c22dd84 Miaohe Lin      2024-04-07  168  	 * zone_pcp_disable() can't be used here. It will
54fa49b2e0ef3a Sidhartha Kumar 2024-04-11  169  	 * hold pcp_batch_high_lock and dissolve_free_hugetlb_folio() might hold
1983184c22dd84 Miaohe Lin      2024-04-07  170  	 * cpu_hotplug_lock via static_key_slow_dec() when hugetlb vmemmap
1983184c22dd84 Miaohe Lin      2024-04-07  171  	 * optimization is enabled. This will break current lock dependency
1983184c22dd84 Miaohe Lin      2024-04-07  172  	 * chain and leads to deadlock.
1983184c22dd84 Miaohe Lin      2024-04-07  173  	 * Disabling pcp before dissolving the page was a deterministic
1983184c22dd84 Miaohe Lin      2024-04-07  174  	 * approach because we made sure that those pages cannot end up in any
1983184c22dd84 Miaohe Lin      2024-04-07  175  	 * PCP list. Draining PCP lists expels those pages to the buddy system,
1983184c22dd84 Miaohe Lin      2024-04-07  176  	 * but nothing guarantees that those pages do not get back to a PCP
1983184c22dd84 Miaohe Lin      2024-04-07  177  	 * queue if we need to refill those.
1983184c22dd84 Miaohe Lin      2024-04-07  178  	 */
54fa49b2e0ef3a Sidhartha Kumar 2024-04-11  179  	ret = dissolve_free_hugetlb_folio(page_folio(page));
1983184c22dd84 Miaohe Lin      2024-04-07  180  	if (!ret) {
1983184c22dd84 Miaohe Lin      2024-04-07 @181  		drain_all_pages(page_zone(page));
510d25c92ec4ac Naoya Horiguchi 2021-06-30  182  		ret = take_page_off_buddy(page);
1983184c22dd84 Miaohe Lin      2024-04-07  183  	}
510d25c92ec4ac Naoya Horiguchi 2021-06-30  184  
7453bf621cfaf0 Naoya Horiguchi 2022-07-14  185  	return ret;
510d25c92ec4ac Naoya Horiguchi 2021-06-30  186  }
510d25c92ec4ac Naoya Horiguchi 2021-06-30  187  

:::::: The code at line 181 was first introduced by commit
:::::: 1983184c22dd84a4d95a71e5c6775c2638557dc7 mm/memory-failure: fix deadlock when hugetlb_optimize_vmemmap is enabled

:::::: TO: Miaohe Lin <linmiaohe@huawei.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
