Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C453E2B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157968; cv=none; b=A9gyj86F3wyTNJa8hw7eHlHa5dRGSqX+lTyTjTWzfpsJiOkk7ftOk1DnrBb52dKkuz7L3uZmI/8fq1TjVa42smxXRL/DZxCoZoiWtD2AxMUPC7Ar+zzj6uIGqCAm5c/1YMdi4In5qivn4yxKVG8D1FP81FYK9tXlbgcCHKadTC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157968; c=relaxed/simple;
	bh=+N/SqTUcuR9SKK12ZwV2WVKl0kTBGqyWJyOEcGIY+UM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErbQBXgUsQbrz2U1vZ15vi2uaofc8hEkRshpbaP7GZy13Z/pAIUK4/hYkREUQfn0XQ60Ku9Fb+uhG322DqYD0ezb2IS7rlyzhUOZIYX5pXXh5ViSSbU+1Og/Hd2njXTOxU9LJA1Ey9/9flPrBkI4RE+wqwvma2ZbhpNlRPWbOb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlpidXFo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlpidXFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717157967; x=1748693967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+N/SqTUcuR9SKK12ZwV2WVKl0kTBGqyWJyOEcGIY+UM=;
  b=IlpidXFoQohJJFW+f9WkOI74MF7eveNNpM6C6FnL7ynQj3qy/IVV2bJw
   wea+kEfHsR15OjdVVxXV9yOyAn2Efb46AGTjrUwi6wKVyPF4DdzQR5lh8
   L7O5GY5loqjpMD83U153EI3ZqWLM0Z8ZxkdmxAsKby7N6jEGUl7eFoAZg
   C2g0LBtRlpYPSroUGF+wW9xSnShd2k4Hv6OTE1CM4vWz8BfIIReWlJjNi
   dTCrFFOXlRC3p84g47EHFdV6kuu4nrgUm7sT5R6//f8ZIG9wtrPJy8OiB
   N67QYYxXr+YRnslMepYEMVaNSm/v9vr0Kg8+cvsD42rybhiS0LofzMh5e
   A==;
X-CSE-ConnectionGUID: waPgJ6jYQf2mMa7lkzFFyA==
X-CSE-MsgGUID: EXFWpfaTSBCmEZVNFazk2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13819845"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13819845"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 05:19:26 -0700
X-CSE-ConnectionGUID: 9RND7MN+RT6G2bdR/Mu4Zw==
X-CSE-MsgGUID: XMYyeAobRV2X0D6V3X4uOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36768069"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 31 May 2024 05:19:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD1EA-000H3r-0k;
	Fri, 31 May 2024 12:19:22 +0000
Date: Fri, 31 May 2024 20:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18944/22626]
 include/linux/mem_reliable.h:41:15: sparse: sparse: restricted gfp_t
 degrades to integer
Message-ID: <202405312041.sZcRQuA3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d2901c3f0ff7d121adf97d64bd2cc3789821600d
commit: 33d1f46ad98ea3a13752a6360d97732ab4e119b9 [18944/22626] mm: Introduce memory reliable
config: arm64-randconfig-r122-20240531 (https://download.01.org/0day-ci/archive/20240531/202405312041.sZcRQuA3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240531/202405312041.sZcRQuA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405312041.sZcRQuA3-lkp@intel.com/

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
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:1477:6: warning: no previous prototype for 'set_zone_contiguous' [-Wmissing-prototypes]
    1477 | void set_zone_contiguous(struct zone *zone)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1499:6: warning: no previous prototype for 'clear_zone_contiguous' [-Wmissing-prototypes]
    1499 | void clear_zone_contiguous(struct zone *zone)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from mm/page_alloc.c:70:
   mm/page_alloc.c: In function 'deferred_init_memmap':
   include/linux/ktask.h:123:35: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct deferred_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          28-      |                                   ^
   include/linux/ktask.h:139:17: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) 31-      |                 ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1718:17: note: in expansion of macro 'DEFINE_KTASK_CTL'
    1718 |                 DEFINE_KTASK_CTL(ctl, deferred_init_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~
   include/linux/ktask.h:123:35: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct deferred_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          37-      |                                   ^
   include/linux/ktask.h:139:17: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) 40-      |                 ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1734:17: note: in expansion of macro 'DEFINE_KTASK_CTL'
    1734 |                 DEFINE_KTASK_CTL(ctl, deferred_free_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 47-      |                           ^~
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 53-      |                           ^~
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 59-      |                                         ^
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 65-      |                                         ^
   mm/page_alloc.c:7377:9: note: in expansion of macro 'adj_init_size'
    7377 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 71-      |                           ^~
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 77-      |                           ^~
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 83-      |                                         ^
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 89-      |                                         ^
   mm/page_alloc.c:7379:9: note: in expansion of macro 'adj_init_size'
    7379 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 95-      |                           ^~
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7373 |                 if (start <= pos && pos < end && size > adj) 101-      |                           ^~
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'
    7380 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7373:41: warning: comparison between two arrays [-Warray-compare]
    7373 |                 if (start <= pos && pos < end && size > adj) 107-      |                                         ^
   mm/page_alloc.c:7380:9: note: in expansion of macro 'adj_init_size'

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
