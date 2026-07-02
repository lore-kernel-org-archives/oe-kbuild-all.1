Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54B5372EC6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783021883; cv=none; b=QwbrnXKCvBPyxBuF0wtHIokUnayVosp7jdAGup66uXzk3GBel+13oSa5w5I7wtrRT+xHiAWp9X47eW6mLH2eqWzzEmnAr3auBru6zZTgk5WQ8W2p96ZH2WjAkwXdHsp/dpQkUQrpTveihhk44odNCNwIokiwMZAyoXVnrsGMvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783021883; c=relaxed/simple;
	bh=GcoI+lGaaeOYMjQ8VcVm42EGFJkiqaKD9oQY8QqonyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g1tGCC5/UAzsAdtvnUhOah/96Au7ngG2cD/LbFpzfFvpyCxhW8kj70t2kT4pM7V/Fxd2RH6D0tTJlKnTcBLSduaNVP+yDs/M2iAnUOlQQeu/Eig9oU8wt9v2plTCANW5YGvmMBV4rjOOLt5a8dPyn+VaZR2+2FLLEFTnkbccy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T95OYYID; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T95OYYID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783021882; x=1814557882;
  h=date:from:to:cc:subject:message-id;
  bh=GcoI+lGaaeOYMjQ8VcVm42EGFJkiqaKD9oQY8QqonyU=;
  b=T95OYYIDoLP/Qr+siSfb7jbN4FQNUB7uiabFfa+kFbyynULSQ6ShqtlH
   L7Ri24v0gUhLXKER3tetr0sxid9nikNAzytTJhb7fy6UejaI7nZAJddxN
   1on2830X2PUaum1zzqMTRtkzBwZHD1JjtTKxkveXB6VoXJpJw/MiGXT0U
   ZXDN1kaIB70+rCkHIjXx1FIvD7rI4jjW3Vl4swRvN/yiYKfwNhLDIEc86
   OU4JHDRSUM5mISDNjvcLN0VxLrQSdLilcMWLiLSrojHmL9rqaFdjWMhct
   NxzPLGRyuinfn9pUVjEdhvq6ngRTlPeBbvqMZMZPhPqWTK/YbvA1wmnEH
   A==;
X-CSE-ConnectionGUID: 7uZbjXMJQISHuGVZ8EsD7A==
X-CSE-MsgGUID: Ij21xOqQT3GqxCM39TOO8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83972571"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83972571"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:51:22 -0700
X-CSE-ConnectionGUID: jRrs3xisQlO77S6U6cQ02w==
X-CSE-MsgGUID: RG6vtZSiQtGEFy/iUlid1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="257825719"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jul 2026 12:51:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfNRN-000000001HZ-3k15;
	Thu, 02 Jul 2026 19:51:17 +0000
Date: Thu, 02 Jul 2026 21:50:41 +0200
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/mm_init.c:2685:9: error: implicit declaration of function
 'sparse_memblock_present'; did you mean 'sparse_memblocks_present'?
Message-ID: <202607022142.ieHjYxhg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Muchun-Song/mm-sparse-drop-power-of-2-size-requirement-for-struct-mem_section/20260702-190519
head:   d82bcb5e8cebc61e5770c45ab420f0216bca10c4
commit: 542ac5e5a28086190a675002bd649720c5cf3296 mm/sparse: mark memory sections present earlier
date:   9 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260702/202607022142.ieHjYxhg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022142.ieHjYxhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022142.ieHjYxhg-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'mm_core_init_early':
>> mm/mm_init.c:2685:9: error: implicit declaration of function 'sparse_memblock_present'; did you mean 'sparse_memblocks_present'? [-Wimplicit-function-declaration]
    2685 |         sparse_memblock_present();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         sparse_memblocks_present


vim +2685 mm/mm_init.c

  2682	
  2683	void __init mm_core_init_early(void)
  2684	{
> 2685		sparse_memblock_present();
  2686		free_area_init();
  2687	
  2688		hugetlb_cma_reserve();
  2689		hugetlb_bootmem_alloc();
  2690	
  2691		sparse_init();
  2692		memmap_init();
  2693	}
  2694	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
