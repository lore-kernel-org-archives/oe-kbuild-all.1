Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA03D1A8F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787122483; cv=none; b=biObBPHhxoaFfMrxS+ysceXfTyrLLuHo5s3GHp0Nh730MPr01axpMhdVdIyoJDOKC/t0GZnDd0xTKHMH0DzWLVJ1PQigh8MP3FC620llNjAS8cyyunTWiTW/OVM1dwwV0KyMt2W/vgtR9WE7s/5B24n+gEhyzwpmZMQ3xb437F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787122483; c=relaxed/simple;
	bh=gxmFSHxL4FWMmPSyqMhu9ya1XXyDu9l8mH17WPdhuvQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NmXm+JGheB1YVQoBmCK+G5pGCBndMG14Mu/6lkmTv3RfVrAFgKkwQXAl1SybbzgIGOelh79rlhYpkoD+rn0T2djHvJs1jtiPAMbMds3jXEhesgefJUgaNvKnuu9ILStVihJE4aCS0+MucHQ8YrNuVub2YCSiG726X/BP7B79CnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvTUtFaD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvTUtFaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787122481; x=1818658481;
  h=date:from:to:cc:subject:message-id;
  bh=gxmFSHxL4FWMmPSyqMhu9ya1XXyDu9l8mH17WPdhuvQ=;
  b=KvTUtFaDj8GHDkDjXfPe7YqI64pYS2J4B0F3ulAdYxAaisW3RGGuOftj
   ITAt4xEhDPeTrfj4ZekXAsMIRo3RG9IdLorIZXkXwrzNCUn4ZJTAT8UfX
   AjtJtsBrHEBq35jyQ1VjlOr69ryP41ZYLKAK9RD+EvNJ672FREXyAYTQB
   iJ6+k+gzuZ1c0Vrs8Hyxd4BLANLI34d3k9ZmDWqEK4lEUkf88ox7km384
   VDvJAfoH1CWknSTVC361TfBln5JcbCt44vEIaD+UhFoKd99PZEc8BpwIn
   V0neDa+YMi63hik9yWUb8YP7Nw8s4i/cwZlSgoLCID1ydSaz8pPcrKP5r
   Q==;
X-CSE-ConnectionGUID: /v1lzyDtTounUHNM6uC34w==
X-CSE-MsgGUID: 8A5oaGvGTqKt6chx8dnkOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87388042"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87388042"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:54:40 -0700
X-CSE-ConnectionGUID: mHvODLE9Rs6/4+c8Dmi5pg==
X-CSE-MsgGUID: n6HbtjwoTk+M+F/xVUn3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269295937"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 23:54:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwaC4-00000000exK-0tXO;
	Wed, 19 Aug 2026 06:54:36 +0000
Date: Wed, 19 Aug 2026 14:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/cache 11/13] fs/f2fs/cache.c:179:23: sparse:
 sparse: restricted gfp_t degrades to integer
Message-ID: <202608191446.3rO5PGag-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/cache
head:   cc6a23d8c232f588f3a5415d1b10a19e1e4ce860
commit: 59d0b83765584877d5f352f0a600fff033d7d4af [11/13] f2fs: cache: support fault injection
config: sparc64-randconfig-r112-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191446.3rO5PGag-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191446.3rO5PGag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191446.3rO5PGag-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/cache.c:179:23: sparse: sparse: restricted gfp_t degrades to integer
   fs/f2fs/cache.c:182:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flags @@
   fs/f2fs/cache.c:182:16: sparse:     expected restricted gfp_t [usertype] gfp
   fs/f2fs/cache.c:182:16: sparse:     got unsigned int flags
   fs/f2fs/cache.c:182:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flags @@
   fs/f2fs/cache.c:182:16: sparse:     expected restricted gfp_t [usertype] gfp
   fs/f2fs/cache.c:182:16: sparse:     got unsigned int flags
   fs/f2fs/cache.c:182:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flags @@
   fs/f2fs/cache.c:182:16: sparse:     expected restricted gfp_t [usertype] gfp
   fs/f2fs/cache.c:182:16: sparse:     got unsigned int flags
   fs/f2fs/cache.c:192:30: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   fs/f2fs/cache.c:192:30: sparse:     expected unsigned int flags
   fs/f2fs/cache.c:192:30: sparse:     got restricted gfp_t
   fs/f2fs/cache.c:195:23: sparse: sparse: invalid assignment: |=
   fs/f2fs/cache.c:195:23: sparse:    left side has type unsigned int
   fs/f2fs/cache.c:195:23: sparse:    right side has type restricted gfp_t
   fs/f2fs/cache.c:196:25: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int flags @@
   fs/f2fs/cache.c:196:25: sparse:     expected restricted gfp_t [usertype] flags
   fs/f2fs/cache.c:196:25: sparse:     got unsigned int flags
   fs/f2fs/cache.c:196:25: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int flags @@
   fs/f2fs/cache.c:196:25: sparse:     expected restricted gfp_t [usertype] flags
   fs/f2fs/cache.c:196:25: sparse:     got unsigned int flags
   fs/f2fs/cache.c:196:25: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int flags @@
   fs/f2fs/cache.c:196:25: sparse:     expected restricted gfp_t [usertype] flags
   fs/f2fs/cache.c:196:25: sparse:     got unsigned int flags
   fs/f2fs/cache.c:198:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int flags @@
   fs/f2fs/cache.c:198:59: sparse:     expected restricted gfp_t [usertype] flags
   fs/f2fs/cache.c:198:59: sparse:     got unsigned int flags

vim +179 fs/f2fs/cache.c

   175	
   176	static struct folio *f2fs_cache_folio_alloc(struct f2fs_sb_info *sbi,
   177							unsigned int flags)
   178	{
 > 179		if (!(flags & __GFP_NOFAIL) &&
   180				time_to_inject(sbi, FAULT_PAGE_ALLOC))
   181			return NULL;
   182		return folio_alloc(flags, 0);
   183	}
   184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
