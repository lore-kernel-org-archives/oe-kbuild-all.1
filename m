Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756441AAE13
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757078301; cv=none; b=pQrAsFJd412Q5jJOGsSswR7/fNRocjf5XnyPE0HOhhD/OKVNazEQ8p7KA70inKvHuEsWC3FgMJskKemCWjc4HvEvl4t2pzgUTslk6BMcBhW/Ikk+0pxln/VsX9aA0rRI9MorGrIcR/zv6I0p6P/5BRCmrg3u6J084Q00WcKFOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757078301; c=relaxed/simple;
	bh=OkVdsaPLDuj/YMRtKkEvWZH8OMtqZHc5MexRbvKcphQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R0wqTYHEc8ea1H5Xx+u6IWtyDFURa9BIMVTz4b+ac7LQlyfLgvGNrBbqTxgdD8XKEXERKnbE4NtTb6yOJmzQZk6DyN3JusWdGCktA6MI7XADo/0ZDz82YEziIrpVX4lTAfqdtBzeBd7PsmTWjr0UIceVvIS8mhClMMVw5F2aSV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZaAPIfY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZaAPIfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757078299; x=1788614299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OkVdsaPLDuj/YMRtKkEvWZH8OMtqZHc5MexRbvKcphQ=;
  b=IZaAPIfYgg4UrSp7x1M0feGYXyZGp7BeNA5wDXrisk2WJ9HVIY7T92Cf
   OggEJjBAUvmEKUGYFNDMU3t+g/hcJwc4ypIA01YWTKCPpDJbGUZD6Y7p3
   jvhs6sq+F3Rl9QRuVI96HWAfiPkchEp+ZmL4eoQa13F8PlRvShUDH5ZE+
   GHrY2dCCY9KExwSMZX6yQU7c/wyjCRelI/B9kD9qeTcB2D5n21Bum0yZ/
   bEsDCVmZhQz8TQ8/KUnLx9jD13ThDVZt5+lQMLtAOt4yH7VrRSchGN0Wz
   uGyeNkgOZqaR7b2YCmFEKDrG2G2M+QQ+XN4HsRSXIZJTz/H4r/o3nKBiM
   Q==;
X-CSE-ConnectionGUID: dnXcQf0wRea09PHOt/42dw==
X-CSE-MsgGUID: vDNJwrqrQP6i4ltqQuvX2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59127214"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="59127214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 06:18:19 -0700
X-CSE-ConnectionGUID: efFotD3tSsC4v9aqju2xyQ==
X-CSE-MsgGUID: YkA/Z71xRX+30FU2OsQFcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="202979697"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Sep 2025 06:18:18 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuWKV-0000RZ-1r;
	Fri, 05 Sep 2025 13:18:15 +0000
Date: Fri, 5 Sep 2025 21:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Laibin Qiu <qiulaibin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/page_alloc.c:3684:54:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202509052100.LAoxUFGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e0480ba0432569e9691f36270fde74a39a59fb0c
commit: 9b6c51cd780588813c5d327e2a6d677d010a2b6f [1740/1740] mm: fix zoneref mapping problem in memory reliable
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250905/202509052100.LAoxUFGM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250905/202509052100.LAoxUFGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509052100.LAoxUFGM-lkp@intel.com/

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
