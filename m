Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7099D33EAF3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733996; cv=none; b=rS6dgCCQdL8swou4z+o9Qi70N+EHzCi22jbkDSSXuzQt5+0qlmySI1xVdzvfkOh6PaHfIiCrTqRUjhbs9mdPy4w56ab4YaG4yadrgvnaeYqNxi09ttE5+TQ560cyAZpJLYrh53loByNr0i3GVTZB03XHnsJQGnHDqj5FQ/uY8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733996; c=relaxed/simple;
	bh=RiJFaNluTlI+c0511hC10vJko1Y3jWs2wQrIwpjs24E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTjLc4xXTr3Na8oUjMLKgAbEXpt9VzAqw/TRLA27PfNgCh3ZDw/oIyQejSGN38Ck3s8HDxDYEeQ2b8WR9m63j+q4Cha1RIfJPNdweMWLf8IqvdbCgROdcvlfio/wV87vS+ELE41BQJjgCDn7E3hZIxtKA2EhoGjbEK/SLRrY8kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czvDHYQC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czvDHYQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756733995; x=1788269995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RiJFaNluTlI+c0511hC10vJko1Y3jWs2wQrIwpjs24E=;
  b=czvDHYQCXqoGYXk9Pd6bMMoGbj2MbQ/y2KLkIUdTUy9TOcEzzakPFRfy
   Gt71HWtOOwaKLFIa2NtVxmNyixFEZnd3RKxcwiRB53SZUk9k1YBTR5MNJ
   uFfQb20kP68/ZcynyCAF36ftazrXZ9V9rC2SERcitZfKWelw6mJA34dvS
   +TaM9wJwdlvXsESPzVDO/DbyaDifC0Cfkx5HKcJIIoma+RnjK4wNxzasY
   zR60i4CYAK/8jjNcLLbeWbx/AwLcaxJbqPdakAWlH4M0lstO7IUIC1MpY
   c6Dg25m8LWvZVPqktEGiD8yPAxOtPOIPKpqzeWnMVv0s5MyV/7N2W8k1l
   w==;
X-CSE-ConnectionGUID: hHU06GPETC6e0gey+YmiqA==
X-CSE-MsgGUID: p9GLTJv6RWaMPcEkJZhYWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58020851"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58020851"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 06:39:54 -0700
X-CSE-ConnectionGUID: nG+nZiGdSquVLTap8UY2Lw==
X-CSE-MsgGUID: PTY/2Q77Q/2AMHiYwLdCYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170303241"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2025 06:39:52 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut4k7-0000fJ-0l;
	Mon, 01 Sep 2025 13:39:10 +0000
Date: Mon, 1 Sep 2025 21:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740]
 include/linux/mem_reliable.h:41:15: sparse: sparse: restricted gfp_t
 degrades to integer
Message-ID: <202509012150.u8RYNbiq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   291b31b5afcf0c223cd3305c734a298f3193f9d3
commit: 33d1f46ad98ea3a13752a6360d97732ab4e119b9 [1740/1740] mm: Introduce memory reliable
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250901/202509012150.u8RYNbiq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250901/202509012150.u8RYNbiq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509012150.u8RYNbiq-lkp@intel.com/

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
