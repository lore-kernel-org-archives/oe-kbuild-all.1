Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C42285404
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091565; cv=none; b=ElJKPpsNkgEgHP847LE3x+njap4FTDy+yu1sRptcQXePLkH2SF8749pIfTk0OMt0d7K+3XmzrUh4+FRpfq4O7r+W5c3qwRVYxHSrrvWFCuuGiqQ/ORvMbW4bix2MpHrT5SYbLcelhHCceSbWsc10QeeMThz3/6BusK5dNnS0sZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091565; c=relaxed/simple;
	bh=/Cs1zQDzvm73EGsaVwU60xhoAaXBdOYQbQ+fA7dZq24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/DSn0hoQ+Nhkvo13cx0YhdOo16RtumiJ8iyRuWmgDqyvGRSZp5yixNqLGTZd91oReIQ8uX80IoBWCVuP0NtwaYfzp2lUIhMhh16yMTJ7obKGA6Bb81mBAd9WTY/OUbh3hOLU9nsoTr9DX7hEk+Vgp+uvBFvSKZGpEQaUjhICbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lu6vrM4S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lu6vrM4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760091562; x=1791627562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Cs1zQDzvm73EGsaVwU60xhoAaXBdOYQbQ+fA7dZq24=;
  b=lu6vrM4SFJpRd0TfQu0Ndi9dcbpCxZKtbQ4gkVnZDWFZsHYMxCbUxqtG
   Guhuy3Du29C8jijcQhbPFH3eaQm6DDtRB4csfkN1j+4Q379ydlDkifoYW
   cV0JazFi0JKpnhV4B83P8ew2M6khAXB0FPNg4NfG8ZUs0XS79B9sGBUI6
   tzWdwFe8OWrXAOuq2IK5fPM+Wf1njeE02cau9Vp1h09nLUAJ9kvtl3j78
   62dY7VPO565Upmo7hEOeDMyUMbazTHWyf17RR+xpSZzxGiXTs3WkZEyJ5
   /B4GieQkkl8R6QtL91aiMVvuq6lanL6BTOUxXC0ZgBPjyBKRqTTug23W6
   A==;
X-CSE-ConnectionGUID: VY4Z7dgEQKKB1koki6sTiA==
X-CSE-MsgGUID: AlVAPNtBTga8OeEIFxw3nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73411852"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="73411852"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 03:19:21 -0700
X-CSE-ConnectionGUID: 9rE+QlIQR0qj8TZ+wY+13w==
X-CSE-MsgGUID: GCW+iB+ZR06YdSePlIBpCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="184977478"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Oct 2025 03:19:20 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7ADV-0002Xv-1k;
	Fri, 10 Oct 2025 10:19:17 +0000
Date: Fri, 10 Oct 2025 18:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740]
 include/linux/mem_reliable.h:41:15: sparse: sparse: restricted gfp_t
 degrades to integer
Message-ID: <202510101858.zuN3Y3pP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0e7e343932646d9a28d9b5f8b025d781051fa52a
commit: 33d1f46ad98ea3a13752a6360d97732ab4e119b9 [1740/1740] mm: Introduce memory reliable
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251010/202510101858.zuN3Y3pP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101858.zuN3Y3pP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101858.zuN3Y3pP-lkp@intel.com/

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
