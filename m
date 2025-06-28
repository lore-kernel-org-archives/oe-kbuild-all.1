Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1253B19E992
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 01:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751073067; cv=none; b=LmfupwnSp1pCE2sPy8DqDOOCSHdDsuIbw5wct0VLked1pOsvhnq/oJYntvWpqJNe/PvHBIzMJ7+B7GJm3V4Iu9LAltBG4pvxe02UqQ9LUp9dQ3Aog0pjgQKrHN6CoXn4xCrSkKK0uVyR3YcRUv2L8YzG+l6UZnRkT+/RJX2otzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751073067; c=relaxed/simple;
	bh=OMBvvUtvTwH+P0IzBULUlBFiwDxMKVP+VfBkZ/qdwks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiOvx9kNjuPCezCp6LfS41BG7aRq5hfP/QVvf1en6d8TX0RIDG/jaqD5erClJNWxyXxK7gx4ucKy1Tb3py1oHn0+M/rjzE10buULkaGxG6KS1NC97IMZwq9hHpFj/TvenT/ZqAnQ4+GpaGwUiRglx21A0xIsmixCm2y+Sj815/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3sZnq/V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3sZnq/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751073064; x=1782609064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OMBvvUtvTwH+P0IzBULUlBFiwDxMKVP+VfBkZ/qdwks=;
  b=W3sZnq/V2nCL1jcXglPZYar+xfxIJpVsBTkFnoJP95R/+mLv1eUyrJ1O
   DNWV2Hipnz2UjabRE3ecVy/pY9lVWKxMhsEwRyJw422NRMZbQxeFHk9cz
   m0GTae2+ymPXeL6bulsYtR9cDdtrFrcr5JLqujMhY52L3WzYy7PiVke6R
   vXOSdiJ1/m1Y9X1WeQ89uGEJIadSnUHpf/dchlb/+MqmrdtOtI56lGJdl
   5HyZWm7UV40mriSW++LLES23NQBk818TziNglkK3YT65yvBpXuyBdlId5
   3n11oy0Mc3HvETvZLrWKxXjVhC6/Uf2C4GP6Ylu8wNCWkMkb+4P4WO8vn
   g==;
X-CSE-ConnectionGUID: joUqwcXCS3eOPFXE68MGHg==
X-CSE-MsgGUID: Yw/7NqTySbOMUcC0UgB5Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53487485"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53487485"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 18:11:04 -0700
X-CSE-ConnectionGUID: iT4b4ZJeQxqVvZMj4rIpvw==
X-CSE-MsgGUID: N8ZCpIINQOW86bhoeR/ISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="152454199"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 18:11:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVK5s-000Wdt-0M;
	Sat, 28 Jun 2025 01:11:00 +0000
Date: Sat, 28 Jun 2025 09:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2987/2987] mm/hugetlb.c:6315:13: sparse: sparse:
 symbol 'hugetlb_alloc_hugepage_nodemask' was not declared. Should it be
 static?
Message-ID: <202506280842.pO5VelIv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ab082f7137232cc372aad2eceb59b0ec98d0d9fb
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [2987/2987] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-r133-20250628 (https://download.01.org/0day-ci/archive/20250628/202506280842.pO5VelIv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506280842.pO5VelIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280842.pO5VelIv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/hugetlb.c:6315:13: sparse: sparse: symbol 'hugetlb_alloc_hugepage_nodemask' was not declared. Should it be static?
   mm/hugetlb.c:446:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
   mm/hugetlb.c:519:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
   mm/hugetlb.c:587:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
   mm/hugetlb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:266:29: sparse: sparse: context imbalance in 'hugetlb_cow' - unexpected unlock
   mm/hugetlb.c:5402:25: sparse: sparse: context imbalance in 'follow_hugetlb_page' - different lock contexts for basic block

vim +/hugetlb_alloc_hugepage_nodemask +6315 mm/hugetlb.c

  6311	
  6312	/*
  6313	 * Allocate hugepage without reserve
  6314	 */
> 6315	struct page *hugetlb_alloc_hugepage_nodemask(int nid, int flag, nodemask_t *nodemask)
  6316	{
  6317		struct hstate *h = &default_hstate;
  6318		gfp_t gfp_mask = htlb_alloc_mask(h);
  6319		struct page *page = NULL;
  6320	
  6321		if (nid == NUMA_NO_NODE)
  6322			nid = numa_mem_id();
  6323	
  6324		if (nid < 0 || nid >= MAX_NUMNODES)
  6325			return NULL;
  6326	
  6327		if (flag & ~HUGETLB_ALLOC_MASK)
  6328			return NULL;
  6329	
  6330		if (enable_charge_mighp)
  6331			gfp_mask |= __GFP_ACCOUNT;
  6332	
  6333		if (flag & HUGETLB_ALLOC_NORECLAIM)
  6334			gfp_mask &= ~__GFP_RECLAIM;
  6335	
  6336		if (flag & HUGETLB_ALLOC_NORMAL)
  6337			page = hugetlb_alloc_hugepage_normal(h, gfp_mask, nid);
  6338		else if (flag & HUGETLB_ALLOC_BUDDY)
  6339			page = alloc_migrate_huge_page(h, gfp_mask, nid, nodemask);
  6340		else
  6341			page = alloc_huge_page_nodemask(h, nid, nodemask, gfp_mask);
  6342	
  6343		return page;
  6344	}
  6345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
