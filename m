Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94DC28B7E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357115; cv=none; b=sVW66QzM1XnMIZUHB5uXjggxeAy8RK/z5iniNSRN2RHTXhIi5ugtGEXgcwHltGCbDDNUIxbnnfp3l6yzGbviUmUN/g2fTqxwarh3NuOSOWH600tbqPEUBkyeFxoT9cZuk6KcH3tEtaB8ViRKRXKIojBzyvLTEOQjLP9GzJ6b16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357115; c=relaxed/simple;
	bh=zb+Nv0sAc6giAlSM77zVj/I0Ai6Z2EKKBeRbCiNOt70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=al/3xKepoGkZmjmRMC3U9kbGADTm54ndWqak/LEozeIuEhrzAHxnWbMUndbbxm7VhbLEamE1FeBOjKaZJp8SNYKEwOsYvTcQwq8Mgfa+ikUG8AxDqJnkeLNV6k4Uto1z82iOyXDPP+RrGkk8NQTsYQvlcsIdsdDvxChj7lMluWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjGaG7pa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjGaG7pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750357111; x=1781893111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zb+Nv0sAc6giAlSM77zVj/I0Ai6Z2EKKBeRbCiNOt70=;
  b=LjGaG7paZpRNaQ0dIjAk+lDrv1yNxJKFEbgWcXRBfai29XMk3ryJqwim
   PoRiiG+v6tX0c7so7L2ms4WgLQ9PP8UKt2WDozkDd6WP/jPnvf2walJbc
   tQgzbAaOutvtiUioeG+Pi7NNhExuvfREToIfHZmru7uEqo9huV+vImIgf
   CzsrdFXtmvdC4QY++n6Yqd3Yho8m1bt4uoRCxo6xd2ZYG2wbBzNGGHDbw
   2Z2wcpCpmXQnmszy9FIFvwPTdaYed5eJyh0WsWwBND+Vvt292ZeVQx+uq
   Wct5vut0tcDm403RozsbcAHQ/wSdRTcOpTDO3xth/yJob6klAiRDRs/5a
   g==;
X-CSE-ConnectionGUID: 2NH6kBU9SZ+ZbkZElRmwug==
X-CSE-MsgGUID: cTAlpRelQT+jJ8SN3rZxSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70055011"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70055011"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:18:30 -0700
X-CSE-ConnectionGUID: swoYP4kFSaGlMC8umY0Djg==
X-CSE-MsgGUID: XBx4Mi6OQZi/wrtO6HC7Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150204390"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jun 2025 11:18:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSJqE-000L0Q-38;
	Thu, 19 Jun 2025 18:18:26 +0000
Date: Fri, 20 Jun 2025 02:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2974/2974] mm/hugetlb.c:6315:14: warning: no
 previous prototype for 'hugetlb_alloc_hugepage_nodemask'
Message-ID: <202506200232.vO3LrsSJ-lkp@intel.com>
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
head:   0bb9efd4883938dec34f710bce07ec3ecf5a04bd
commit: 8deff3a60ce1a9dffb552210f065fc9ed6a55f84 [2974/2974] mm/sharepool: Add mg_sp_alloc_nodemask
config: arm64-randconfig-003-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200232.vO3LrsSJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200232.vO3LrsSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200232.vO3LrsSJ-lkp@intel.com/

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
