Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8E2F22
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739123241; cv=none; b=DW6gKenIBW3RhSkEwKdDFsTv/eZzPla6ANGbT//kW3ViX/5QvCgidA974xEIpXsC/NVWlOhlz/7npKs5jpwAsE/FsLGm3a2LAFL2duU0VXmnEseisDlFceWo12yBF+esRaK03qUH4jS1m4HpJA0K2JXQ42IUOIGQ06qj7pyoYPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739123241; c=relaxed/simple;
	bh=f5NAyyTITPczFwMfQp+zpTeECzpUwIuR4PlH2jq3p8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMi6U2PjVjZZNLOfDRhVOpqLihesH7WqMEJ2mIDV0I1itD2gq4UpS9yWYUywb+8SYvp78FcQ9Rg+UuR+gCykVBq4xwZh0htZTwE2k1P3szxT/OZ6i2aFYPV3jBYHyPrkrwAO1YxI8yLVyO9+LSKYyf2eChX8gsl+amtzVwwpD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I05DWLTB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I05DWLTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739123239; x=1770659239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f5NAyyTITPczFwMfQp+zpTeECzpUwIuR4PlH2jq3p8o=;
  b=I05DWLTBwWhuhqJmne4/XaPUm/Gt76fYnum+2XnuhdHO17yPqUHJUK/9
   4WLlsKPn2dyHX6R+9BpwfRlyncAXg+l5/i/6kYUnkPrLqALpL1GXYgfCl
   sgJwkn1XYC9LDLvKTiIs5xQTsPqzmQWWP1vvZecjOHmrRNB0HYOKDADhy
   tiXCO8rp0wD8WueSG0n/wf5OzkyjHVhbofjbQWDhGC53rfOeCBvVDg9cO
   bhU7GpudxhFavlAXu6jsIaLmbKR6A72I9S7BW/wPEBAMkIUEvNnsXLSvO
   uIlU+Z8+FvgvOxnJ8C+4KIyRE/qixYXnHEYooSyGyfawGHcjR7mPRCrfW
   w==;
X-CSE-ConnectionGUID: fYoGkTN0SUi9sckXGjcF2g==
X-CSE-MsgGUID: 4eHLB6lySKSkTI1l93yQwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39394782"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39394782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 09:47:19 -0800
X-CSE-ConnectionGUID: aOBa3gWBSeWYX+pW92ihkg==
X-CSE-MsgGUID: xSNMn/hZRESYnFFwxUluSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="117003748"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2025 09:47:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thBOl-0011kV-13;
	Sun, 09 Feb 2025 17:47:15 +0000
Date: Mon, 10 Feb 2025 01:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Laibin Qiu <qiulaibin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1420/1420] mm/page_alloc.c:3684:54:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202502100112.IwK7UXyM-lkp@intel.com>
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
commit: 9b6c51cd780588813c5d327e2a6d677d010a2b6f [1420/1420] mm: fix zoneref mapping problem in memory reliable
config: arm64-randconfig-r131-20250208 (https://download.01.org/0day-ci/archive/20250210/202502100112.IwK7UXyM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250210/202502100112.IwK7UXyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100112.IwK7UXyM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:140:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c:141:1: sparse: sparse: symbol '__pcpu_scope_pcpu_drain' was not declared. Should it be static?
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
