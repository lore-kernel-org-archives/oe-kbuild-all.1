Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720362;
	b=n7zbOo1Yw3vjzkLo3lZ8EUt6CBN1wQmPFIAC+tPzf6ZvVZxkvjPQhhYQWg4aFvflKhnW
	 6oUney3lPTkGGYBd02fT7bVEU4HJ36vUGBcJssnyTfViZdZ44DYUuFjRCGaRNUiB5QkuS
	 2TiE4sJCIuWl/fCdAxI+dblvt+u/ePWYq9wCYlAgPjJ4ODJig1Vh4xT6J2Fxfn0l3v3mx
	 orUlc/UZjYU2yg3gKxO/SjDv3Z6T3Qy9bUWpzTyqa8PJ6ymqBrE5FbTA5JQeOE/4cuqYh
	 zXFTT9Ce/0t267yt/cBjvcc9sG/Mff2nlYYWgpXswl5/KzzCTMPT58kNxYNXOF0ofiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720362;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yMX/WIgWWXKdWFq0loUbH9QdBxREazrXEzbmQjJFf5s=;
	b=Tayuk0L/Zn1l128V/0vY/ldUw3GDuDWyjMv0F2d8PuopUnH+nuucxMljMB+L2VAId963
	 u7ouh/HQpqheZxOGvj2t8rHDPuPGEVk/ArM8RANFzcqILBRpOkLUNpgiJZNw8c+A498Vg
	 WdqX1IbWwInCwlvUZhZTtyU+z4sOfWsbI6wZGvfE6B0Q2dYoO1Dorf1K238IKbEAu2ocm
	 hNWBsw7zOXcvGkmbVCTcN5JkfktAfvwsT661c+WZN6Qw+QYbm4xCks68JzW9X2fcNrpBD
	 Uzx0nRzGegDKpzjNjQJeiPnwihIqHNrtXR5pcJ5ZMRPKRPV27ixUOQ0LbVYEGJ0TOdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=msB+tvWY;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F57606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 19:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=msB+tvWY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795720362; x=1827256362;
  h=date:from:to:cc:subject:message-id;
  bh=EyEA8NYw2I5lCV/VMr7fHwN6g3ky5bubMNF+yC1KPm0=;
  b=msB+tvWYxiL085hWniUqN/SL2w0xhtXIdh/NtAAITyeo+S564ezAOI5W
   hFCfswghrrt2alLpuD5imBfZksYN/OYh8mp+puB1csDW3Gw7IVcFB/oOX
   osR5kf2mcIsV5fAstBWuLLIPBBDC5Lvu//1oQnQ06mIqVERt0wbPTq0e1
   fkLFrTs1ztKKCz3tEiPNTFu/Xwaue85VnVIPNRCot3GToIghZCHV/Dz4h
   ovxfJF/W2MqalCxy1RYQDkvxwQtxHGAGk/6nQl1x9ZqSMIlGyBUh2O1tQ
   IqxioRqR8Y75YVms+p3JdrDd6Kjt+t8KmMBKeK7uAlcc5NdbTCT0RXHBR
   A==;
X-CSE-ConnectionGUID: RyHeg2/5RMawMJOtUw/Yvw==
X-CSE-MsgGUID: aFpREjIGQ56MeXE76Xf51g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4644024"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4644024"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 11:12:41 -0800
X-CSE-ConnectionGUID: wYa/3BwWQlKoWuGQHZWRhA==
X-CSE-MsgGUID: B7ZI9DU9SvuRdwpz8dYPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="13915930"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 26 Nov 2026 11:12:38 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWetU-000000000A2-1F3x;
	Thu, 26 Nov 2026 19:12:32 +0000
Date: Thu, 26 Nov 2026 20:12:07 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [mm:for-test 8/10] mm/vmscan.c:6324:38: error: 'struct
 scan_control' has no member named 'nofragment'
Message-ID: <20261126200319.fbiL0kw3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git for-test
head:   36a5408f22c511a0e2a3105244b88e0f8feb772d
commit: 5cd57ec259efa2dfa64c2b7a48553febb8ab6149 [8/10] Merge https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable into for-next
config: sparc64-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126200319.fbiL0kw3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126200319.fbiL0kw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126200319.fbiL0kw3-lkp@intel.com/

Note: the mm/for-test HEAD 36a5408f22c511a0e2a3105244b88e0f8feb772d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'allocation_can_succeed':
>> mm/vmscan.c:6324:38: error: 'struct scan_control' has no member named 'nofragment'
    6324 |         unsigned int alloc_flags = sc->nofragment ? ALLOC_NOFRAGMENT : 0;
         |                                      ^~
   mm/vmscan.c: In function 'try_to_free_pages':
   mm/vmscan.c:6993:18: error: 'struct scan_control' has no member named 'nofragment'
    6993 |                 .nofragment = !!(alloc_flags & ALLOC_NOFRAGMENT),
         |                  ^~~~~~~~~~


vim +6324 mm/vmscan.c

23b9da55c5b0fe Mel Gorman             2012-05-29  6320  
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6321) static bool allocation_can_succeed(struct zone *zone, struct scan_control *sc,
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6322) 				   unsigned long mark)
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6323) {
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16 @6324) 	unsigned int alloc_flags = sc->nofragment ? ALLOC_NOFRAGMENT : 0;
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6325) 	long free_pages = zone_page_state(zone, NR_FREE_PAGES);
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6326) 	int migratetype = gfp_migratetype(sc->gfp_mask);
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6327) 
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6328) 	return __zone_watermark_ok_mt(zone, sc->order, mark, sc->reclaim_idx,
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6329) 				      alloc_flags, free_pages, migratetype);
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6330) }
dbbc5a3d50f9c0 Kiryl Shutsemau (Meta  2026-11-16  6331) 

:::::: The code at line 6324 was first introduced by commit
:::::: dbbc5a3d50f9c0404903d4ca31311175fb6aae8c mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT

:::::: TO: Kiryl Shutsemau (Meta) <kas@kernel.org>
:::::: CC: Vlastimil Babka (SUSE) <vbabka@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
