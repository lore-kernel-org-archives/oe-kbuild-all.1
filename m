Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963BE244EBF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739050629; cv=none; b=Un9Ehicnri/uc00foJ/eW9rUPy/w3eZiDCVwPfxtKCFNt2z6WzBvRPdzTiocwPqhFy1yG/ldyGJVZxrqDZ7eNTe3efnoqM+0toWY3PeztoBF5A0bCjotN2nMSPS+pTzfUUB20NM6ybD5C14vAJFZ1FOdF1XMm/Ya6UK8kFU40ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739050629; c=relaxed/simple;
	bh=RS3i0PiOPaXEsEqlfNvrNvZ8iX8o2JAxcVSXk4lZxdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jkZ6TJrusIeEqRETWiYNqN5Rk1Vkc6IkCp7lZXpDK1V/IIlXtfusfOouSiVyaaAlHdbTcfzh1p4SLUoUoKiXxKuX6i8cPzkjIaISi/8KYonzGvI/IEyr6cjyjHNIMu6r7IXIufi7n2PXhxGbh8LiG9krofK4p1dpLOyHG4w5MQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fB712lJ1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fB712lJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739050627; x=1770586627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RS3i0PiOPaXEsEqlfNvrNvZ8iX8o2JAxcVSXk4lZxdY=;
  b=fB712lJ1oqqFk+tXYWOCVvLbeO8Q6JlIfBS+LDCLnj1jOI6NZMpZeNls
   n5+nOTOGz65G1iCJNm/lYT7PRUk/Ls4xIPVcXp50mP0Z8bCOgXDT9zEAT
   UBTJS+roQpnMndeg3NO/CsDY18ldSk80agOixXMifeA2OO+Ee1gksqb7F
   MkP8GfdV+0Os0MizDABmqj74WFB2BNODt02zqG79QKL5G0VxN46X9p/p8
   KG9aMv3PDBTKsfs/Ji0L1ZwjxeB4yWjZbtbaPYc0lP9CpeR+DDsX51aVA
   7k98RgzsUB7FTc2ZaGRqS/KtEVUd2+d2uWJA9glN16bujHZWb6cMuru2Q
   g==;
X-CSE-ConnectionGUID: wQGOypjvSXm7CJWBBfq/UQ==
X-CSE-MsgGUID: Pm2Fgx6oSQGbberwxHYIKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="38868691"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="38868691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 13:37:06 -0800
X-CSE-ConnectionGUID: WUlrLgmaRGelY8fkG1VFqw==
X-CSE-MsgGUID: 3VelkQJsRp6EAxHUrxeXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="111661762"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 13:37:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgsVa-0010f5-33;
	Sat, 08 Feb 2025 21:37:02 +0000
Date: Sun, 9 Feb 2025 05:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2729/2729] mm/hugetlb.c:2216:9: warning:
 variable 'gfp' set but not used
Message-ID: <202502090535.KiiKAKub-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   263072f655dcd6fd63f7d5dd1f9c5553134982fa
commit: 27a782f719fdab073c5b0e19764fad1f93cddd00 [2729/2729] mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY
config: x86_64-buildonly-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090535.KiiKAKub-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090535.KiiKAKub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090535.KiiKAKub-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/hugetlb.c:8:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/hugetlb.c:2216:9: warning: variable 'gfp' set but not used [-Wunused-but-set-variable]
    2216 |                 gfp_t gfp = gfp_mask | __GFP_NOWARN;
         |                       ^
   2 warnings generated.


vim +/gfp +2216 mm/hugetlb.c

  2200	
  2201	/*
  2202	 * Use the VMA's mpolicy to allocate a huge page from the buddy.
  2203	 */
  2204	static
  2205	struct page *alloc_buddy_huge_page_with_mpol(struct hstate *h,
  2206			struct vm_area_struct *vma, unsigned long addr)
  2207	{
  2208		struct page *page = NULL;
  2209		struct mempolicy *mpol;
  2210		gfp_t gfp_mask = htlb_alloc_mask(h);
  2211		int nid;
  2212		nodemask_t *nodemask;
  2213	
  2214		nid = huge_node(vma, addr, gfp_mask, &mpol, &nodemask);
  2215		if (mpol_is_preferred_many(mpol)) {
> 2216			gfp_t gfp = gfp_mask | __GFP_NOWARN;
  2217	
  2218			gfp &=  ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
  2219			page = alloc_surplus_huge_page(h, gfp_mask, nid, nodemask);
  2220	
  2221			/* Fallback to all nodes if page==NULL */
  2222			nodemask = NULL;
  2223		}
  2224	
  2225		if (!page)
  2226			page = alloc_surplus_huge_page(h, gfp_mask, nid, nodemask);
  2227		mpol_cond_put(mpol);
  2228		return page;
  2229	}
  2230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
