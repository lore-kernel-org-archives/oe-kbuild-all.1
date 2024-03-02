Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A284441C87
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709414102; cv=none; b=CGfqPWEcssVemXWkADDWAZggrHSMakRHMhsZUqBBXFDmpGt+eziG1O/vigpqRyRyfhSLuIaHEKQUW+Mus9R+FLoIBo0pQ2l3f4r+D9H7yRYmn9bCE2/FVuSE61jujCdhqFL5Ai/YXUOvNnpg+MQvP8m3y1CI+kyH6NNhRh+s/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709414102; c=relaxed/simple;
	bh=POfJ+NQcUNy/4SZOsLNovtVLqpWHBXTydf0Al3YvRUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T6MsqVnkoyao5MkdwlCTA6QesAEIGNXOfZcjrmV/J2695bJriRItIlTPs1+O1wXcb09d/4QIel4a5NEiqCmy/3DsWVPsajAa3J73z8Gk0lNSV/GAbnjHUTxPK9L3WQhW7Gp1b4KWVscuPsO4pppruIm5bbx+QlCdwawO8nRDxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lr62xAgN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lr62xAgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709414100; x=1740950100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=POfJ+NQcUNy/4SZOsLNovtVLqpWHBXTydf0Al3YvRUo=;
  b=Lr62xAgNpD3C15LHobJUOtj+M8Chn6VqccxLjOFfiD0guCW1Hq1jNsqf
   qYCYAsyz7QvIRl9wXHJuj+V6KQhdIWGAPFv1UC8m/uX7UPScYFO7+Bgh3
   C9M0VfAZQj6EawlboRwFsrzEaG6J0B51Nr1QTF1V/fRrmGUlX/8anqu+P
   i9DZNp0PU6h3TVUjqDHnpa/aDX5PErVn4sbtDAS4ZRDhYBI1jkMB2zUAf
   UClHzNlJg/h5G7MAlcawWlvJFOmkiKvlW6u/BpQTXCGF9KpgcHNj6kUrm
   NtG/5Yo61Vx81oIzNiM6GO+kVp8YsIghhp6jDZ8TeUF6Ec+9zWFa2FhrJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14514827"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="14514827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 13:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="9128991"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2024 13:14:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgWh6-0000Iy-2P;
	Sat, 02 Mar 2024 21:14:56 +0000
Date: Sun, 3 Mar 2024 05:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 23439/30000] mm/hugetlb.c:6315:14: warning: no
 previous prototype for 'hugetlb_alloc_hugepage_nodemask'
Message-ID: <202403030519.VqzwjhSV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6adee00913b51cd59245584085cdaca64f74465c
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [23439/30000] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-001-20240302 (https://download.01.org/0day-ci/archive/20240303/202403030519.VqzwjhSV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030519.VqzwjhSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030519.VqzwjhSV-lkp@intel.com/

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
