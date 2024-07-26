Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AC14A09D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 23:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037634; cv=none; b=Puf2BYran47+NsO0PE5TFytLrI/Etr5k2aNaTdieuZtbhpnfuckCWaDligSw/f0MzKIMyLXcVAa6tVCaPlt1WfZe54M8NRvlwsCK1SiH4tJnRvB7ST0jKeZ36W/G1a4ot7WesNdTzgiVs/4rSOfFskakqMqzpgQ+uuYxjfUVhuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037634; c=relaxed/simple;
	bh=X8qxvHf5GJfSvL8bSjh/8b9o1WKyFJxsLmtDW2xCoB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fvsw/xHE9DdNJIn8kSeorKiMi4xpJP2rGzYzl0q7A3iQ1URo2FjZXkSZicVUB9qWdYRxTM/qkgnJoD28aUkbSx9EjC4tuHC5mO1Ci8LeFuHaNrVcv44lMmdfA3vwdON8qvmZi22tBnFyONGHBqzlQYZ/mRYngiciomKbvKTALHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4qzhI+N; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4qzhI+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722037632; x=1753573632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8qxvHf5GJfSvL8bSjh/8b9o1WKyFJxsLmtDW2xCoB8=;
  b=I4qzhI+NvfFU3V1NvhKpMnVsS14l564sdPKuWOk/7SRmBVke6IKqMAVR
   QFMnEmNNiBBG+iEnEnt+bYX7yf6CswFNSClXEJUAUHCLXVlRbxs3dMo9/
   bzEQt6WKSmE1qCaxMx53zlmwlX1+1G1JqzFhdTaKYn5cHF3w2DjrNQexI
   cG+RCeR5s/SomZM80jeKEUHBkbDaHw0jj/GvUwE55gqUyzB6YqVE64M+U
   7c3iGCrYpK5M7/NySNg34jPIT3xBMD6w3krKEpVjX4WKzAV2niy4eusTl
   dRL49znMeHxveAHMtKjX9xH0RsRUQAv4Jxq46tka7I4eFrEGXNIUPZxRr
   g==;
X-CSE-ConnectionGUID: nuCJERFATOmbaUbtTdbLJw==
X-CSE-MsgGUID: XXH61+wQTca1Q9aLZDlvfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19991707"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="19991707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 16:47:11 -0700
X-CSE-ConnectionGUID: zroEQ+VOTsucyKqT0cUEIg==
X-CSE-MsgGUID: 1zAGI61NRIuRkUfZbYTa7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="53085833"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2024 16:47:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXUeS-000pVU-0q;
	Fri, 26 Jul 2024 23:47:08 +0000
Date: Sat, 27 Jul 2024 07:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 24/25]
 drivers/iommu/generic_pt/fmt/amdv1.h:65:59: warning: comparison between
 'enum <anonymous>' and 'enum <anonymous>'
Message-ID: <202407270720.8cxQ1sAM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   ea5c6d0c8914861c8e337228c4880001bf40f7c4
commit: b513c48bbcacbdb68430971afdb347afb574df3d [24/25] iommupt: Add the AMD IOMM v1 page table format
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240727/202407270720.8cxQ1sAM-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407270720.8cxQ1sAM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407270720.8cxQ1sAM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from drivers/iommu/generic_pt/fmt/../pt_defs.h:17,
                    from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:10:
   drivers/iommu/generic_pt/fmt/../pt_defs.h: In function 'pt_table_install64':
   include/linux/atomic/atomic-arch-fallback.h:295:14: error: void value not ignored as it ought to be
     295 |         ___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4937:9: note: in expansion of macro 'raw_try_cmpxchg64_release'
    4937 |         raw_try_cmpxchg64_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_defs.h:111:16: note: in expansion of macro 'try_cmpxchg64_release'
     111 |         return try_cmpxchg64_release(entryp, &old_entry, table_entry);
         |                ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:11:
   drivers/iommu/generic_pt/fmt/amdv1.h: In function 'amdv1pt_entry_oa':
>> drivers/iommu/generic_pt/fmt/amdv1.h:65:59: warning: comparison between 'enum <anonymous>' and 'enum <anonymous>' [-Wenum-compare]
      65 |         if (FIELD_GET(AMDV1PT_FMT_NEXT_LEVEL, pts->entry) ==
         |                                                           ^~
   In file included from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from drivers/iommu/generic_pt/fmt/../pt_defs.h:20:
   drivers/iommu/generic_pt/fmt/amdv1.h:69:77: warning: comparison between 'enum <anonymous>' and 'enum <anonymous>' [-Wenum-compare]
      69 |         } else if (PT_WARN_ON(FIELD_GET(AMDV1PT_FMT_NEXT_LEVEL, pts->entry) !=
         |                                                                             ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:69:20: note: in expansion of macro 'PT_WARN_ON'
      69 |         } else if (PT_WARN_ON(FIELD_GET(AMDV1PT_FMT_NEXT_LEVEL, pts->entry) !=
         |                    ^~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h: In function 'amdv1pt_entry_num_contig_lg2':
   drivers/iommu/generic_pt/fmt/amdv1.h:95:59: warning: comparison between 'enum <anonymous>' and 'enum <anonymous>' [-Wenum-compare]
      95 |         if (FIELD_GET(AMDV1PT_FMT_NEXT_LEVEL, pts->entry) ==
         |                                                           ^~
   drivers/iommu/generic_pt/fmt/amdv1.h:99:70: warning: comparison between 'enum <anonymous>' and 'enum <anonymous>' [-Wenum-compare]
      99 |         if (PT_WARN_ON(FIELD_GET(AMDV1PT_FMT_NEXT_LEVEL, pts->entry) !=
         |                                                                      ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:99:13: note: in expansion of macro 'PT_WARN_ON'
      99 |         if (PT_WARN_ON(FIELD_GET(AMDV1PT_FMT_NEXT_LEVEL, pts->entry) !=
         |             ^~~~~~~~~~


vim +65 drivers/iommu/generic_pt/fmt/amdv1.h

    60	
    61	static inline pt_oaddr_t amdv1pt_entry_oa(const struct pt_state *pts)
    62	{
    63		pt_oaddr_t oa = FIELD_GET(AMDV1PT_FMT_OA, pts->entry);
    64	
  > 65		if (FIELD_GET(AMDV1PT_FMT_NEXT_LEVEL, pts->entry) ==
    66		    AMDV1PT_FMT_NL_SIZE) {
    67			unsigned int sz_bits = ffz(oa);
    68			oa = log2_set_mod(oa, 0, sz_bits);
    69		} else if (PT_WARN_ON(FIELD_GET(AMDV1PT_FMT_NEXT_LEVEL, pts->entry) !=
    70				      AMDV1PT_FMT_NL_DEFAULT))
    71			return 0;
    72		return log2_mul(oa, PT_GRANUAL_LG2SZ);
    73	}
    74	#define pt_entry_oa amdv1pt_entry_oa
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
