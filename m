Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61283E0C59
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538018; cv=none; b=YD+1jQSnSEsGkuMj9rfoMV8DTg9cA8gcPAQiuU9pH5bCgCs0lph4tkZ/RPbWZOkztSb3bss4ENMaa6Ip6LYd7a5knOXa9u1r3sBD+WK47CDHFfCah5Htrqkpdj+3VDxb4uUAWjA2SqpTWsNQ/f+m6JUjYM/2BuCaSbnusPYsL+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538018; c=relaxed/simple;
	bh=7hmoGqUahey0pAIsTkotU/J7BTdu6GBTAU/xamZycOw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NPTBK/WH7DkGOtVAvq5ef41MBMOiL+t/8FIPSIFxiYhXgZwdeO5d/hIC1GuWTdRuuB6loFBo+kz+GFynNWJNh5Qno8ImsS2SHKd1g0SjdbZdm7QZpPuBmWZx5zkwHtMdl2yFOT1Ead7UnDT7AYEfCkAt6oCzDvCkHFZP33bId3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfioNHds; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfioNHds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777538016; x=1809074016;
  h=date:from:to:cc:subject:message-id;
  bh=7hmoGqUahey0pAIsTkotU/J7BTdu6GBTAU/xamZycOw=;
  b=hfioNHdsnQuw27jfM+oZ5HHznHpPnqrLNkyO7pRox9itLxjOzaedlDdk
   sfhcVP9pAJ8amJXhV3AEKDka6Y1RzW7iICgkA4aQknSlKbmGw80vLcUn8
   LeBpioBz3KOxHy3BgqT31iTkRwCuA4pmkZ9X1CJJV3/+ZjUzLrHjK+PHe
   WmSUs6xI5uIJmKyhPAXNgj0zMLkkArCIvEDkKkDbOtwM3y0y+gyV+sY9J
   GEe9k/nkb/KRxFsnA23QYb8sJmtg8QOnl/aMDkBj+khM45PSFTNk2AFrG
   u0zu7h2Fqx0nhgalS3C88+iaOeRV/sIQ2YE57TyhMJCxeOV+aKPkL9kOi
   w==;
X-CSE-ConnectionGUID: 1S5ow735TyuXB2RMhrL8xg==
X-CSE-MsgGUID: rTJ5myomQ2GnzsZ46T3Gxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88793840"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="88793840"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 01:33:35 -0700
X-CSE-ConnectionGUID: ziPlE5hKSFOZaWbQ0hKURQ==
X-CSE-MsgGUID: QjDZdBsETrSNBWIo22B5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="228015978"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Apr 2026 01:33:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIMpv-000000004mf-3gUq;
	Thu, 30 Apr 2026 08:33:31 +0000
Date: Thu, 30 Apr 2026 10:32:38 +0200
From: kernel test robot <lkp@intel.com>
To: "Pratyush Yadav (Google)" <pratyush@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/mm_init.c:2691:9: error: implicit declaration of function
 'kho_extend_scratch'
Message-ID: <202604301013.tv5cs8XT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260430-095605
head:   a586b345757dd389b6a3981b387cc4b39c538fab
commit: a29db33861c799b78a6469b22301aace345ad455 kho: extended scratch
date:   6 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260430/202604301013.tv5cs8XT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301013.tv5cs8XT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301013.tv5cs8XT-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'mm_core_init_early':
>> mm/mm_init.c:2691:9: error: implicit declaration of function 'kho_extend_scratch' [-Wimplicit-function-declaration]
    2691 |         kho_extend_scratch();
         |         ^~~~~~~~~~~~~~~~~~


vim +/kho_extend_scratch +2691 mm/mm_init.c

  2688	
  2689	void __init mm_core_init_early(void)
  2690	{
> 2691		kho_extend_scratch();
  2692		hugetlb_cma_reserve();
  2693		hugetlb_bootmem_alloc();
  2694	
  2695		free_area_init();
  2696	}
  2697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
