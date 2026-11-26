Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721020;
	b=Bd/j2uV8ExOIUGBLJ9o8hDe/JPyHfM/Bfg09eN5yHeB6YS3R5z29H5UCAN8tF4DwZR+n
	 qNuMRj+o0s4XojfLcklJ2ySqnM5VE7tKoyQyZ/ozpw5PyIEwZeZfA43xAmdSrrzR3vxDV
	 e334ngv+nJJdiOiWjLts33xOGg4RRtwnN35nhV7TEix+warDO5PXxbfCat+acKEYsOJze
	 EDHX/tj0+yuNzq6kDPVPeoz2II9gQgxp4gE2el2qoHg/o7DrP+3+/r+q0kOp2XM7qhJhp
	 UAtB3nKxoI6dbBfbQObQNGh4tlJa/cBOD91s3+KBq877eKiXStwT97qYGFaLM8wQ1+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721020;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=reZx33itXesoqpLVrB5YcOMc1lHHTizPKhzfToZFD5c=;
	b=tlk9VDhIRRU7TSZnL/w9lmWFxvtuxMc27Gz9NA9XwfX0wBxO2HMr0XPBvLO98nprksU3
	 WtT/ArMj3EevpqfuI19UFgqKOfNWfuSBlYyH4OZTT6Gh0NJrZ8umC/oO5Hr4bXsPzDLGY
	 aeuNtTxVMZtjmODDrF6qaAJH5BkGzh5ZGIhRS2MPXAJWFJx2nMmKubtiYbZd/VxZXz0nJ
	 R/EJ+ej53gcxmcvYqdp44OmR+GggkWxCZTnqoWjBdLbPVGR5nwgT3zW3TK6ACpDA0T8SM
	 ohYj4mWuON3w+XRE7lrct9e7UfCb2GegHaID5lPPY0ZjcmUp1kSQhPss4+Z5bGeoRKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="gjfTU/dK";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77119606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77119606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjfTU/dK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795721019; x=1827257019;
  h=date:from:to:cc:subject:message-id;
  bh=LZwtRVPVNQ2nUITxTNK1eMCihSKO8HeFLYAh9JB3L7o=;
  b=gjfTU/dKTbKWLLKzfHkSSl3FquG8THXMYQoUpHehL88nvukvq6PejXWr
   w6wHZBMvJfGcgtvC54CYAMHHhj+hCfH8KIkBuMoHg6lyeT/cKlPNxgH2+
   vEQvdTGu2hudQ2vNwIcHla5aZnOKYP0J1/VGNJ32iJk54Q3sjl5Vu8Sx8
   UeKlldnQHUYsmAjs2fX7iBtx4RKo9OdBJMCd+K476RAS9ieKwg4MHxNW+
   g6urdL+TPeUeLW8c7kvgUaY1KmGB8PJtbykdIZ5eWDjLkKMCIuWdNiNue
   4+8JqD5DGTiCuleOK4K4R0hVGlLQst2keIY2RwiL3GimLy+45C4W8lFGX
   g==;
X-CSE-ConnectionGUID: F9lkWWTrRuW9T6ibCQWpag==
X-CSE-MsgGUID: TIIw9dIbSn+MLYXeuBSpbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4546409"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4546409"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 11:23:39 -0800
X-CSE-ConnectionGUID: sZGTmspiRaua58rsFZcf2A==
X-CSE-MsgGUID: xD7piIEORZ+3BBD+O+YLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="14275948"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 11:23:37 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWf4B-000000000AK-1nFF;
	Thu, 26 Nov 2026 19:23:35 +0000
Date: Thu, 26 Nov 2026 20:22:49 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [mm:for-test 8/10] mm/vmscan.c:6324:33: error: no member
 named 'nofragment' in 'struct scan_control'
Message-ID: <20261126202045.MhMXQxU2-lkp@intel.com>
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
config: hexagon-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126202045.MhMXQxU2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126202045.MhMXQxU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126202045.MhMXQxU2-lkp@intel.com/

Note: the mm/for-test HEAD 36a5408f22c511a0e2a3105244b88e0f8feb772d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> mm/vmscan.c:6324:33: error: no member named 'nofragment' in 'struct scan_control'
    6324 |         unsigned int alloc_flags = sc->nofragment ? ALLOC_NOFRAGMENT : 0;
         |                                    ~~  ^
>> mm/vmscan.c:6993:4: error: field designator 'nofragment' does not refer to any field in type 'struct scan_control'
    6993 |                 .nofragment = !!(alloc_flags & ALLOC_NOFRAGMENT),
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


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
