Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFD186A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 03:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876743; cv=none; b=CwKIO8W19ljHKKbjai+0Xxa65WfyGA7iGsvNSO3yQynBFpY5YSgAUZzgVy6V6tGmk/z9JrUVArEfDLR+Z419rq45ClPZoRm/U9gzrVy48UfAZk5N1LMcPuYJASaNNtIrjbG+EvCUyzwHpWsH4wOPvIlB+MUJYASPkZeseGO1gHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876743; c=relaxed/simple;
	bh=ek3bSeh0SG35R5INcrsnOC6zZh5Jw07qsOsMlE/10q0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0UFlQ5fU9VFhIsBjH63IHwGOL4MAha9bkac3bio7mTWbvow2/NIhRHB2mE1F+nvVERTRm7jn2mUXDIGi0U7j5/An6mpWcRuz4ZR18uZMof387VSnw4y4zl6lej/1Rd0Vrgd8xkPVH9Prewf5XR2SNEvLGZsSqZe0j+xOnckvz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5dmbszM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5dmbszM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735876742; x=1767412742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ek3bSeh0SG35R5INcrsnOC6zZh5Jw07qsOsMlE/10q0=;
  b=L5dmbszMmkk4TOcj0JtI5aZzjM/d8Is5NRMlfzO57Kq9BINBAyvyLgIL
   9kf3Gb1M5jAVHVDMuGkiuVsLw6tc6e98dGiBziA/9KHoUfbDJex7PooBn
   vQm3SjtXvy4QnjqrK6QWcUkpWTzjoSN/QwaaQ0UZntuNoxnQr8holev/R
   /liL+AMRravsJHTfNTY+AUdLxfV82A0rGl0ODDXceoSax1CF0LMmBHlSl
   9qIEy2nfV5xK1TKnQcjUJtv0UnZO6R6yjOlpjGqzVdNo/tcSRFduOiEW/
   fimzM39wizQB7ONZFAmIzbL01seR3rFcACNPajfei1ZsOrIZr8ThI9yeO
   w==;
X-CSE-ConnectionGUID: mQVRP/0STyq8rR3HKIeD/w==
X-CSE-MsgGUID: wt8Xc8xNSUKqeJD9zjhxQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35826898"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35826898"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 19:59:01 -0800
X-CSE-ConnectionGUID: cLnkVbE8Qh2VMjntsyXGuQ==
X-CSE-MsgGUID: yWJ/ky6vSNOz4jnnXxymow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="106544089"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jan 2025 19:58:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTYpt-0009Aj-2F;
	Fri, 03 Jan 2025 03:58:57 +0000
Date: Fri, 3 Jan 2025 11:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v10-wip 14/26] include/net/page_pool/helpers.h:509:1:
 warning: non-void function does not return a value
Message-ID: <202501031138.i2yur0l9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v10-wip
head:   1e1214d152c4b21b5bc3e9b37e26cd60ed14632b
commit: afd4f768b9c9b770da047bc8b829c4845da1c420 [14/26] net: page pool: export page_pool_set_dma_addr_netmem()
config: riscv-randconfig-001-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031138.i2yur0l9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031138.i2yur0l9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031138.i2yur0l9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/xdp.c:6:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/core/xdp.c:17:
>> include/net/page_pool/helpers.h:509:1: warning: non-void function does not return a value [-Wreturn-type]
     509 | }
         | ^
   2 warnings generated.
--
   In file included from net/core/dev.c:80:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/core/dev.c:159:
>> include/net/page_pool/helpers.h:509:1: warning: non-void function does not return a value [-Wreturn-type]
     509 | }
         | ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:169:8: error: 'inline' can only appear on functions
     169 | static inline bool
         |        ^
   include/linux/compiler_types.h:236:16: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:169:8: warning: '__gnu_inline__' attribute only applies to functions [-Wignored-attributes]
   include/linux/compiler_types.h:236:23: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:169:8: warning: '__no_instrument_function__' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/compiler_types.h:236:58: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   include/linux/compiler_types.h:218:34: note: expanded from macro 'notrace'
     218 | #define notrace                 __attribute__((__no_instrument_function__))
         |                                                ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:170:1: error: redefinition of 'bool' as different kind of symbol
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         | ^
   include/linux/types.h:35:17: note: previous definition is here
      35 | typedef _Bool                   bool;
         |                                 ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:170:5: error: expected ';' after top level declarator
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |     ^
         |     ;
   4 warnings and 3 errors generated.


vim +509 include/net/page_pool/helpers.h

   499	
   500	void page_pool_mp_return_in_cache(struct page_pool *pool, netmem_ref netmem);
   501	#else
   502	static inline void page_pool_set_pp_info(struct page_pool *pool,
   503						 netmem_ref netmem)
   504	{
   505	}
   506	static inline bool page_pool_set_dma_addr_netmem(netmem_ref netmem,
   507							 dma_addr_t addr)
   508	{
 > 509	}
   510	static inline void page_pool_clear_pp_info(netmem_ref netmem)
   511	{
   512	}
   513	#endif
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
