Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF25F9D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 23:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735343826; cv=none; b=VL3g1feN4v1pPg66yDeMHBBjZPdh5VESBrDkBvZ/mcPDRK8GfhxyCtk4wU4FP6UXm2nqYyU5SidvOYcnc8mvohpG9C0z6/MmNVSkc+X9/0Wtja7wDBCK8Y8mK245ujamlP5q8gLZ/pm4oZFw/+MjH61CCqtumhVaoV9bRxyY/r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735343826; c=relaxed/simple;
	bh=isWu5fQqE4z4UnsWSaFFix41KeRTkSSc1bSqHKahW2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oS4Ih+VZoeoF4IovAj5ZAgEqqCE0NbcfBpapPqrpt5/1tzM6SOAF4TMeRafBMOgn+Ick/DeVEMzUyi2HqckFlMljHtrxGbNlDW0FPVWnzr9gHkbZ1XzwuKbsf1hqn9Xr3BVZOYEdZLrPglVfTPZhvHGBN0Y3TNYS2opABoL8XvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezZmvFmd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezZmvFmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735343824; x=1766879824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=isWu5fQqE4z4UnsWSaFFix41KeRTkSSc1bSqHKahW2k=;
  b=ezZmvFmdWPdTntgMtS/D+gv2kbiT3ZVo6HAN1jD12lKQKYflMFznNtQv
   gwOBZ9+/0mXhWXw4v5EPPw7NCv29UdoZ1OSDQmxkF/bYNj1EkyvmhDjOx
   ymt5+eQgAbgLKi0QklEy47yFegS9yWY/bU5swsKGjCT+As6dQqLsNu0Nb
   UoIXo1zYRpIBOVgmB4rjQou+ytRWtUg2GjcePI+0wRJ8ol/BI77FMM1Cd
   70jvTSfI7dzEyMpCVrjsnvamArljGuXTAWid8NsyMlpp3U66C7lYxQWkP
   I+LAKF/09IuYnpzHfxjjxIZgFAwDwoih9bDruUzh/AvjZ9mRqb3RdyOB0
   Q==;
X-CSE-ConnectionGUID: xkimNdbbQ7WZRBRMJlA5Pg==
X-CSE-MsgGUID: Z+/F9a79T12mVcF0f6PSaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35896665"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35896665"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 15:57:03 -0800
X-CSE-ConnectionGUID: IDLj03RLTmqvRMotq+v+Lw==
X-CSE-MsgGUID: 9GErmZYYRO68ivSOSu4C3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104879269"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 15:57:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRKCS-0003k0-1N;
	Fri, 27 Dec 2024 23:57:00 +0000
Date: Sat, 28 Dec 2024 07:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600] mm/hugetlb.c:6315:13: sparse: sparse:
 symbol 'hugetlb_alloc_hugepage_nodemask' was not declared. Should it be
 static?
Message-ID: <202412280705.ftg9AAMV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [2600/2600] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280705.ftg9AAMV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280705.ftg9AAMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280705.ftg9AAMV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/hugetlb.c:6315:13: sparse: sparse: symbol 'hugetlb_alloc_hugepage_nodemask' was not declared. Should it be static?
   mm/hugetlb.c:446:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
   mm/hugetlb.c:519:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
   mm/hugetlb.c:587:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
   mm/hugetlb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   mm/hugetlb.c: note: in included file:
   include/linux/mm.h:1232:21: sparse: sparse: context imbalance in 'hugetlb_cow' - unexpected unlock
   mm/hugetlb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   mm/hugetlb.c:5402:25: sparse: sparse: context imbalance in 'follow_hugetlb_page' - different lock contexts for basic block
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:263:46: sparse: sparse: self-comparison always evaluates to false

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
