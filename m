Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA38339A8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739084533; cv=none; b=CObsKuUOCazuYjF3k4GDoaYBWaD3Rn/dUBcBE6lXzYyoJ1pXODp6f9rnTizM4oTz1wcD7VBvT3t2eqcxZjbJ3GBFzuQFIJmMsogh2O8wjKXN6kEJJYRaLG9CW3nF+tv+fzfOwVFjM6kxJzKQ+cEmP85HUs5W2BumogNIGxe21a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739084533; c=relaxed/simple;
	bh=Zm3TKJ3VKHOEMg8n5zyTDqrjNLHCmtRWmrznyIrkmVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NF29RPJyNpIBQxTT9NYiYfdwL+KHH5hyz/q7UfPH0h9V54QTYyIDJmKEGBSb4Y0WwSRf5tUpom8NZLeuX/zKtHjzmw/3pFG5T1zrmesfpEs7MeKy78dgDaDrB2XteZwmWOVjmxRPotF2g69E1DYucYmkfsJGvDYJsPRLAZUkxKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+ba3iVR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+ba3iVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739084532; x=1770620532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zm3TKJ3VKHOEMg8n5zyTDqrjNLHCmtRWmrznyIrkmVI=;
  b=d+ba3iVRmLN/dgca6x+xYG4uZ4mXGaHgiz3fvSSOMa3+c2Wn+tjMvrHw
   f8nJqstzJ3U2Fa8NMU/OBYFmsO7stQSvXcq6agc1nIizrMxMrFHHba3Rc
   34PeW0gCAxLQOTWJ8mtaQSpIai/thbMK39atJW9oadEOKhkWD9UvLnCkN
   g6JTQZWzrJMakdJzULgLk0u14n5hzZeFeZgKkY8iCmNgnuTdLRpqjIFuG
   xPObAAy/CDMOYyuycZfpc3CltEx4t9Z0CEYa1/wPTHIgDmzxSIVXyAx/T
   khP9JGQ+17JbP0hg1fPKIG1Di+prKBlRsk5DkGWEHdIYoVnJE9cBb5dZ/
   g==;
X-CSE-ConnectionGUID: iX8vukdjTTSCjhtEqfQXXw==
X-CSE-MsgGUID: J/SH7EWkTFatt23Vx6G8wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39705324"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="39705324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 23:02:12 -0800
X-CSE-ConnectionGUID: o1rk8s/9QJyLOmleHYZHwg==
X-CSE-MsgGUID: UGQVpyhYQ5y85kL4yrQ5hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116497607"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 23:02:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th1KR-0011Be-2F;
	Sun, 09 Feb 2025 07:02:07 +0000
Date: Sun, 9 Feb 2025 15:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1420/1420]
 include/linux/mem_reliable.h:41:15: sparse: sparse: restricted gfp_t
 degrades to integer
Message-ID: <202502091527.Cexj3y4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 33d1f46ad98ea3a13752a6360d97732ab4e119b9 [1420/1420] mm: Introduce memory reliable
config: arm64-randconfig-r131-20250208 (https://download.01.org/0day-ci/archive/20250209/202502091527.Cexj3y4I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502091527.Cexj3y4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091527.Cexj3y4I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:140:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c:141:1: sparse: sparse: symbol '__pcpu_scope_pcpu_drain' was not declared. Should it be static?
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
