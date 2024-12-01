Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879F33F6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733038577; cv=none; b=IHN399PAysLeskwBA7ccOuxVjpdRRld+4Iyi/cXGUNs+7PUldxkBbZI4NTmTnLwsbE0KTFjSxuYua/ONiZZ+8ikDveCigbA2VwufThsWAZfR+XlPgWtwr9qp/MvnlcLqtq1yxeIA496bt/eciYMQGrlLsn1/ZsnrYZSVKTm/9PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733038577; c=relaxed/simple;
	bh=iZP9sM/U+P7yuRZXhDH2qAJBCiOxr54P05QEZw+cBWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eaaA5jALi/TCvlwx9J9AKCnj2NhU23z46jXrPDPVNyTTo+4cNCAzv5vufXvPJtOw7rLJN+n3IyCfSl44yUlQLOuD0udIBfElTVolKNgJWg/lXCybEZhjT6Af7902vQgxCIRePAGfvSVqGFMHIr/rt6HEboVM3hJnEsyhM2dIGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+AHDmod; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+AHDmod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733038575; x=1764574575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZP9sM/U+P7yuRZXhDH2qAJBCiOxr54P05QEZw+cBWM=;
  b=S+AHDmodr36X00DNjwR6k/RkClyQQ2gsDImXkyAQr2WxLhdsGViawhMh
   MOnQit5JWzEpxHdwnjvZ7eL0AkRSIPTaUkCrQa6MjMpv/gnIivpq8odWS
   zUMbn80cGgUsSTOeQ65JCu9EgBEgTG4QQILZrrjULNwCELFa1R109TQpJ
   yN0yoNdX1uQ+/GXbeD3noLlo6+hEKnu+NyaZLv/88cQLxSyph/Ut5xxuh
   k8vhs8rOW7xL6GGrWNjxWHA9sNFVDWa8KVoLH4o5DsL69qXAw7I9A7se5
   pIuSyUbFz/IZvtgdnbGbFhGAYxBTiMDndZFbh/vy9oAb7QQyPEA0Uc4IV
   w==;
X-CSE-ConnectionGUID: vEdFg3UuSVKeJ5F8NxfY1A==
X-CSE-MsgGUID: MVW6N7CuRcS3psQTyk/r8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33459419"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="33459419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 23:36:14 -0800
X-CSE-ConnectionGUID: wOta2QS9ScmuaumczXrXMA==
X-CSE-MsgGUID: jfaqBu1YTou6MjYMysiB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="97927467"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Nov 2024 23:36:13 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHeUS-0001LN-2A;
	Sun, 01 Dec 2024 07:35:47 +0000
Date: Sun, 1 Dec 2024 15:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2430/2430] mm/hugetlb.c:6315:14: warning: no
 previous prototype for 'hugetlb_alloc_hugepage_nodemask'
Message-ID: <202412011502.CoFCt6aY-lkp@intel.com>
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
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [2430/2430] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241201/202412011502.CoFCt6aY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011502.CoFCt6aY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011502.CoFCt6aY-lkp@intel.com/

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
