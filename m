Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA767235355
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754045040; cv=none; b=OddGMX+Zxr8lgvQkf2gUdCZoa4VfO3nXq3ttAqyk46w6J01NjP6TPzwp8/33zgsar5oD353MVondQqj4jahNEM0aZ99b2VsrF03grPfXL2eZI4wu31KH6OM2Ezgp5MB6pDva1hpbfwtW9f0S3boPd2MWngC88ioMYi7T3KXT5lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754045040; c=relaxed/simple;
	bh=W0zYqA+DRLzvHoztjlEYRVVp9WMO5Esf8mCxLp3hKcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKXg20bLWNn2wcsGkOz7DZdsptgxl2ervbpFFm5RiyybK4rBtx8CPTsTjKtcgeC4zli/GVKZPkCesUgL6K+7qDX/LeHVYH5G3iP/YCGGpWjIenWZHybI2mNDR3SV2jPFOXUpf1eJYb7F00tPf3hSvrYRkcnoXxArjpsY5/6Hxrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwseJrq2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwseJrq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754045037; x=1785581037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W0zYqA+DRLzvHoztjlEYRVVp9WMO5Esf8mCxLp3hKcs=;
  b=UwseJrq2eHIJv3sXupTHE5d2hXZpJj4a/vzfyQ6BIGkPBpIbFB5mwP8b
   y5jzTCL/dYKc0RDJh80wEud/9e7zj5RTf1BikHfOW9g7CDnrJVkalko8A
   /ofnFaJWkN0dNDkvvqv7K8DZg4pINt80XveCQjxCiQIiCMR0/TqIVyLJD
   jElSGCnxMqZYNkEbI5B46tsJemYjL97TGX6uHpD0+sOi7nEnMy0ehVJ1R
   BV6Ob3DvJdZKgI3iWdnq+U21lRtbdFqiROBDvVzp0X8LwJuZpCdpsuowT
   DTmEEJgxN5pb43XV8+L6o5QBRaDFMYFFEugBlXqANRl3Bu6Zc0raH/d6S
   w==;
X-CSE-ConnectionGUID: IY+1jn8iRyyIIpcT2Cp20w==
X-CSE-MsgGUID: flOxQo5yTMeKXoVpl4wOyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60219792"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="60219792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 03:43:56 -0700
X-CSE-ConnectionGUID: BVhPRunITHyfYCD8d4Qidg==
X-CSE-MsgGUID: Skd0mDvVQua5otZcNozheA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167745312"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Aug 2025 03:43:55 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhnEu-0004Yi-2G;
	Fri, 01 Aug 2025 10:43:52 +0000
Date: Fri, 1 Aug 2025 18:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Laibin Qiu <qiulaibin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/page_alloc.c:3684:54:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202508011847.rOz6VFTy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   50f79538c3031890b9ca9755ccf596a73ecb0a0a
commit: 9b6c51cd780588813c5d327e2a6d677d010a2b6f [1740/1740] mm: fix zoneref mapping problem in memory reliable
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250801/202508011847.rOz6VFTy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508011847.rOz6VFTy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011847.rOz6VFTy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:140:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/mem_reliable.h:68:15: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:4656:13: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:4661:35: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4661:35: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4661:35: sparse:    right side has type unsigned int
   mm/page_alloc.c:4677:35: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4677:35: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4677:35: sparse:    right side has type unsigned int
   mm/page_alloc.c:4683:35: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4683:35: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4683:35: sparse:    right side has type unsigned int
   mm/page_alloc.c:4698:35: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4698:35: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4698:35: sparse:    right side has type unsigned int
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:3683:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:3684:45: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:3684:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int @@
   mm/page_alloc.c:3684:54: sparse:     expected restricted gfp_t [usertype] flags
   mm/page_alloc.c:3684:54: sparse:     got unsigned int
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:3701:14: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7512:27: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 36-      |                           ^~
   mm/page_alloc.c:7516:9: note: in expansion of macro 'adj_init_size'
    7516 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 42-      |                           ^~
   mm/page_alloc.c:7516:9: note: in expansion of macro 'adj_init_size'
    7516 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 48-      |                                         ^
   mm/page_alloc.c:7516:9: note: in expansion of macro 'adj_init_size'
    7516 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 54-      |                                         ^
   mm/page_alloc.c:7516:9: note: in expansion of macro 'adj_init_size'
    7516 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 60-      |                           ^~
   mm/page_alloc.c:7518:9: note: in expansion of macro 'adj_init_size'
    7518 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 66-      |                           ^~
   mm/page_alloc.c:7518:9: note: in expansion of macro 'adj_init_size'
    7518 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 72-      |                                         ^
   mm/page_alloc.c:7518:9: note: in expansion of macro 'adj_init_size'
    7518 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 78-      |                                         ^
   mm/page_alloc.c:7518:9: note: in expansion of macro 'adj_init_size'
    7518 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 84-      |                           ^~
   mm/page_alloc.c:7519:9: note: in expansion of macro 'adj_init_size'
    7519 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 90-      |                           ^~
   mm/page_alloc.c:7519:9: note: in expansion of macro 'adj_init_size'
    7519 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 96-      |                                         ^
   mm/page_alloc.c:7519:9: note: in expansion of macro 'adj_init_size'
    7519 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 102-      |                                         ^
   mm/page_alloc.c:7519:9: note: in expansion of macro 'adj_init_size'
    7519 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 108-      |                           ^~
   mm/page_alloc.c:7520:9: note: in expansion of macro 'adj_init_size'
    7520 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 114-      |                           ^~
   mm/page_alloc.c:7520:9: note: in expansion of macro 'adj_init_size'
    7520 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: warning: comparison between two arrays [-Warray-compare]
    7512 |                 if (start <= pos && pos < end && size > adj) 120-      |                                         ^
   mm/page_alloc.c:7520:9: note: in expansion of macro 'adj_init_size'
    7520 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7512:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7512 |                 if (start <= pos && pos < end && size > adj) 126-      |                                         ^

vim +3684 mm/page_alloc.c

  3673	
  3674	#ifdef CONFIG_MEMORY_RELIABLE
  3675	static inline void reliable_fb_find_zone(gfp_t gfp_mask,
  3676						 struct alloc_context *ac)
  3677	{
  3678		if (!reliable_allow_fb_enabled())
  3679			return;
  3680	
  3681		/* dst node don't have zone we want, fallback here */
  3682		if ((gfp_mask & __GFP_THISNODE) && (ac->high_zoneidx == ZONE_NORMAL) &&
  3683		    (gfp_mask & ___GFP_RELIABILITY)) {
> 3684			ac->high_zoneidx = gfp_zone(gfp_mask & ~___GFP_RELIABILITY);
  3685			ac->preferred_zoneref = first_zones_zonelist(
  3686				ac->zonelist, ac->high_zoneidx, ac->nodemask);
  3687		}
  3688	
  3689		return;
  3690	}
  3691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
