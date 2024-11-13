Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DB20966F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731527613; cv=none; b=cVigph6L/5eZr6rZ7fa6hyDBofS+qeJFs3NnEzOBQs3wjoO2ySenvNQonx11X3l44GV+EwvcYkKU0DJdCA/gghUgdOI5fgPcKajkOfA0PJ0FCUtyrn+DXLWANWMAjlLawKOzXDai74Hp1i0zhmvF+tcqs1Z9BO2u5qPepJPkR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731527613; c=relaxed/simple;
	bh=mYkzJ6x/N1hFGXh49//BzHKNrwqpEvavbCTabq4IUWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bEkmFLVXK/fd2P3cq0+FBDIrHc/d59vpnQZF1CuvIBYCsaVipA2m/9bXwe3UH6pTrZDEWpc6FgT+zFLl9SqOFwtIrBa5VZQZeDBFuV1svjN7zDMnlFbtApQcV3YbiF54t6uDVtsyXZMX2gGs67NTBHkMML7RRb6U4ttMJF1PszM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGLy1ro3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGLy1ro3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731527611; x=1763063611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYkzJ6x/N1hFGXh49//BzHKNrwqpEvavbCTabq4IUWk=;
  b=XGLy1ro3T4Cdv5g5K7FVP/oWnpYMdED/fMyZXIol47hHvr3gJDhB+oFP
   jo/3BitUMn4wYtuuJjz4nGFMY6Vj/RhDu0lk4WEzAESc8rQuBMxi4+k25
   I0rVOwe0l4K/fflLSIZEZpqttLvnoZkyQWtHuno9V03ICsFQDudW2YICh
   u2FY4FLzKypth4p7d1suecSGO8PRD2dQIcj4WEJb9OeJro7T5S0SSQ7fJ
   nCM6BE32P+9/HMev1Cq/MF9GuMgZhfIreSBXpDGnwvSrGYsbsiyIYvQ/m
   ZlAd+VYVrTSV/CDmLYe+DGUMrgGgUk2ch3WH+fR5iKv5+Lp0+4X2ULBH/
   g==;
X-CSE-ConnectionGUID: NFnH9daoSSO3Ntyjf07K2g==
X-CSE-MsgGUID: mGPxDYTIQrO13xjydELxfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30829684"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="30829684"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 11:53:30 -0800
X-CSE-ConnectionGUID: Mt9Ay1OMSt6YxLg2H0xkbA==
X-CSE-MsgGUID: kfwXFjMSTda1kPW+ZNSisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88779559"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2024 11:53:29 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBJQc-0000ft-32;
	Wed, 13 Nov 2024 19:53:26 +0000
Date: Thu, 14 Nov 2024 03:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2430/2430] mm/hugetlb.c:6315:14: warning: no
 previous prototype for 'hugetlb_alloc_hugepage_nodemask'
Message-ID: <202411140304.ZAc2Yg25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   53677a494016919c9c6715a90a425dc771e5ae26
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [2430/2430] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140304.ZAc2Yg25-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140304.ZAc2Yg25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140304.ZAc2Yg25-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:6315:14: warning: no previous prototype for 'hugetlb_alloc_hugepage_nodemask' [-Wmissing-prototypes]
    6315 | struct page *hugetlb_alloc_hugepage_nodemask(int nid, int flag, nodemask_t *nodemask)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
