Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2FD2D662D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882780; cv=none; b=ix/bwxLzqhG0f3X+gsHfYlJXJpO0BgLOb7Ufp0bdotLXN+476YhtdBp7ycTauzDrgKMPiMGjYpSyfbX94bazQR4+jhDNvglusGiEzms/CX9bk9Gj4Bv5y7OQZbuLDBaCxMX5IH0SXbc3ACXbITbdJcPkePHOqIOl58n844SWPyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882780; c=relaxed/simple;
	bh=Z4lpIZc5cWh2VLyyx8fhkIpE0KQMmIiJQrTcQ02mPfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6pTmSLfSf09jUKpvknHiaa0OGJHUuhF4pfhB/d4v4QcxlHbzIA+61V9DFkWmMxWsRkDPROwoo9pt7zEg7OuzvgR3GxpYTDSO+5eu0k10OtYTKIW5x+DFlyuwtBVLNyzWQ2hBblmQsILUI2yKowX6HqMkW2xvw64kF+S2tDDv1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heMtcd7O; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heMtcd7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753882775; x=1785418775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4lpIZc5cWh2VLyyx8fhkIpE0KQMmIiJQrTcQ02mPfg=;
  b=heMtcd7OoLdetAr2Ab1azbw64lp8na9ig7mPYHdF/aIMf6kBvWZcyHYQ
   b6Ja+mYD1xg5mNC4p7OK7tPopySBE/c9Wz+IgFfQJFAAXIvsMVwk2ENt8
   tOY9XpanAfgK4Kiji0eGy02MRoHg3rXu2KwjzUDlragZsqpUf6to/Kty4
   dCjpoy+ryPbW4o9MDK9bP4lP2sIejPCp5xseHIsrp9AZ5OQsNeeXH4Mzc
   qKKlKe72Ne0l/Gjb90oTuEmigWjzoq1/Lucllo4X8NDi8QJJczb51OscT
   OA4H2AS2cP1+Trss3gK8idMcpYcHuyGcEAdpga1b833vLd2mMDEHeUV7O
   Q==;
X-CSE-ConnectionGUID: UnGXln2DS+qCeo/fIOT43A==
X-CSE-MsgGUID: 0SFcO5jQQm25HDHEFl0VyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66750856"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="66750856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 06:39:27 -0700
X-CSE-ConnectionGUID: 2R+7LOcjTeKImMltEgpsxQ==
X-CSE-MsgGUID: 4zaYALMiRUe6277UZOhi1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163770027"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2025 06:39:26 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh71f-0002n4-3A;
	Wed, 30 Jul 2025 13:39:23 +0000
Date: Wed, 30 Jul 2025 21:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740]
 include/linux/mem_reliable.h:41:15: sparse: sparse: restricted gfp_t
 degrades to integer
Message-ID: <202507302110.c40p4uEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   859de5033e15abefcf19935429e6478be97d889a
commit: 33d1f46ad98ea3a13752a6360d97732ab4e119b9 [1740/1740] mm: Introduce memory reliable
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250730/202507302110.c40p4uEx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250730/202507302110.c40p4uEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507302110.c40p4uEx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:140:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
>> include/linux/mem_reliable.h:41:15: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:4572:13: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:4573:27: sparse: sparse: invalid assignment: |=
   mm/page_alloc.c:4573:27: sparse:    left side has type restricted gfp_t
   mm/page_alloc.c:4573:27: sparse:    right side has type unsigned int
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:324:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 20-      |                           ^~
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 26-      |                           ^~
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 32-      |                                         ^
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 38-      |                                         ^
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 44-      |                           ^~
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 50-      |                           ^~
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 56-      |                                         ^
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 62-      |                                         ^
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 68-      |                           ^~
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 74-      |                           ^~
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 80-      |                                         ^
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 86-      |                                         ^
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 92-      |                           ^~
   mm/page_alloc.c:7381:9: note: in expansion of macro 'adj_init_size'
    7381 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 98-      |                           ^~
   mm/page_alloc.c:7381:9: note: in expansion of macro 'adj_init_size'
    7381 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 104-      |                                         ^
   mm/page_alloc.c:7381:9: note: in expansion of macro 'adj_init_size'
    7381 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);

vim +41 include/linux/mem_reliable.h

    31	
    32	static inline bool skip_none_movable_zone(gfp_t gfp, struct zoneref *z)
    33	{
    34		if (!mem_reliable_is_enabled())
    35			return false;
    36	
    37		if (!current->mm || (current->flags & PF_KTHREAD))
    38			return false;
    39	
    40		/* user tasks can only alloc memory from non-mirrored region */
  > 41		if (!(gfp & ___GFP_RELIABILITY) && (gfp & __GFP_HIGHMEM) &&
    42		    (gfp & __GFP_MOVABLE)) {
    43			if (zonelist_zone_idx(z) < ZONE_MOVABLE)
    44				return true;
    45		}
    46	
    47		return false;
    48	}
    49	#else
    50	#define reliable_enabled 0
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
