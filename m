Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693B1876
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735281255; cv=none; b=Q3HBnP9CjUSxyi6fEhcRTOoH1x0vyT9pcKMovUIPKZHPKBDLtjvlw6j8+arSSHiUMBKkpa3o5DhzlPEdWqm/SBgw+GLL0ixMKM+o0rZoXYK/RuCgVCUnK9sUuM/9zwE5hAePkhl3m2PMbi/VhOU4k6Cl8FrM9XmCSKWot6VCvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735281255; c=relaxed/simple;
	bh=9um4YWFHVJs43HJZTiKssg0fBKJDcqjBT4miqVpGIqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdLFYCJfLL4hEwP4DM7zHVlqDIJ8BoyatWleUY8NZKlTXXa5kJmFh7zSIp5v+zCKNsdmDg6/q8nY6Hj/XOWigpRZDRi/EgHsT8dcP1mTfyhxh/jCP1IJ/aSyvPbK4p8RpSpoPdVvwgQtCt42hH5wUsTF1RMy6HWbxPfL9PdL8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLijQIW9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLijQIW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735281253; x=1766817253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9um4YWFHVJs43HJZTiKssg0fBKJDcqjBT4miqVpGIqI=;
  b=lLijQIW9vyOvNkd0L+KQgNlFu73ZCWIXq6DxgYqDspMlCzPBK1LW3b2T
   PjW5/fVbIuYzLFIq155KP+2vNNxK3R/yEYGPn+CGnMbaw7TOaZRzdwP3e
   +MBcSA0HfLDV3H/oR+S3I9ry4O851SFKH+CV4qRdk/vIRT8gojouttHp+
   siTEx+3Bwru7EbYdK4TBG/TX8MoMdjsxKrTamSbmkvtdhAvCvP0F+ohEn
   5qp/CWF3WkXX2K+fHBxLcfX0FFr/n21F6MqLwybScaOSdg9/zmqFkwJvy
   BzGi+yuTnZuiMCdydcibF05DvAHgrBuqOulZdJ7Bia9LLd1QnlI6H64rO
   w==;
X-CSE-ConnectionGUID: dsrAXke0TTWjS5/EXxqBwQ==
X-CSE-MsgGUID: S7icfaySS4qAGSriymGWhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35809227"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="35809227"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 22:34:12 -0800
X-CSE-ConnectionGUID: edF/2/ccQ3qCPX73ov0ADQ==
X-CSE-MsgGUID: VuYY+eafQJCnYVsx/pFKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="130938993"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Dec 2024 22:34:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR3v9-00031m-2l;
	Fri, 27 Dec 2024 06:34:03 +0000
Date: Fri, 27 Dec 2024 14:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600] mm/hugetlb.c:6315:13: sparse: sparse:
 symbol 'hugetlb_alloc_hugepage_nodemask' was not declared. Should it be
 static?
Message-ID: <202412271456.Cm4dJ23V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   951151c7a27bc2a9436c2c49ae12510c82137ec1
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [2600/2600] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271456.Cm4dJ23V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412271456.Cm4dJ23V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412271456.Cm4dJ23V-lkp@intel.com/

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
