Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4221DF27F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 03:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843112; cv=none; b=dNYD/2LrPzvCy4LFIi9dLn16p9KaPX8B1n7ghSLZY2OlEbdsRUteqMeZreObvXYUu4BwlWgjazkyFOTi/0v9nNtVFU5uq5yhWWzRkoft/DLazLaCAZWaSXeDCgbm8qvb+CRtLsagaeNQssnGBE1LpeXs7tBunVAPdruisS1GBAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843112; c=relaxed/simple;
	bh=VOHL08zl6SRckADChc5l4f589MPrlQGE9zOBE4xzNZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NDK3hdBd4tvXA97LbWHkBKtS7apHzJzR1CsUULGDRuJ2PWq1LISSV/bV7OtLHZ50Lnrk31Rsj2xG7vsQ929r2aeUzJ98xMFj3Y03uL+GmrEHrdx7ommW5+ausEGDVP58jd+5i49dDHlszdzw+bdQr3s9bWBduVF6ZOvxXU8mwLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDSiHjqS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDSiHjqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774843110; x=1806379110;
  h=date:from:to:cc:subject:message-id;
  bh=VOHL08zl6SRckADChc5l4f589MPrlQGE9zOBE4xzNZk=;
  b=bDSiHjqSUzsuiYOLky3tOJznlYKHn0CJtZ5xzsktaysY0KWnn3vq2inY
   TVjmZRAHdRCjEDIu6psF1WHn+klNmdtQlS4sXjOgRtGA5s5oTwBW2dwy/
   ryyS2z+OkoBHEC+3x8qBJP1nM+PAidM6Reg3pA3yichoob5j4fMkVI/xv
   8jdndgiBqbk9bqexksOL65ySju6Bfrj/fJvoHrNMFKEBpXO8vKq0Vspw8
   akgB5FljK8I7pSDx4UaAGqBoElWurINvXwWKAlfOr7WLjj4rLmWefAWuc
   I8FVswHpFQP/bQK8uzee/mVVkeih6Cgn3IIiUx8dvNy+Zf58jLK1e5/7z
   g==;
X-CSE-ConnectionGUID: rbpQqLB8TCqMNgXVyJnmJQ==
X-CSE-MsgGUID: CmTm5dTBTXSHZiainsuz/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75715710"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75715710"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 20:58:26 -0700
X-CSE-ConnectionGUID: 2ZAulr/dSHWd5zAeD39FIQ==
X-CSE-MsgGUID: uWoUu5VVRyqc5n+ECVqDmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="221530628"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 20:58:24 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w73ld-000000000dN-37Af;
	Mon, 30 Mar 2026 03:58:21 +0000
Date: Mon, 30 Mar 2026 11:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 mm/memblock.c:2082:13: warning: variable 'memsize_memmap' set but not used
Message-ID: <202603301104.uOdMnE9K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 08e2d0957850ea89a03f935c72797784fa40599d [4/4] ANDROID: memblock: print kernel internal size
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260330/202603301104.uOdMnE9K-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301104.uOdMnE9K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301104.uOdMnE9K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memblock.c:2082:13: warning: variable 'memsize_memmap' set but not used [-Wunused-but-set-global]
    2082 | static long memsize_memmap;
         |             ^
>> mm/memblock.c:2083:22: warning: variable 'memsize_code' set but not used [-Wunused-but-set-global]
    2083 | static unsigned long memsize_code __initdata_memblock;
         |                      ^
>> mm/memblock.c:2084:22: warning: variable 'memsize_data' set but not used [-Wunused-but-set-global]
    2084 | static unsigned long memsize_data __initdata_memblock;
         |                      ^
>> mm/memblock.c:2085:22: warning: variable 'memsize_ro' set but not used [-Wunused-but-set-global]
    2085 | static unsigned long memsize_ro __initdata_memblock;
         |                      ^
>> mm/memblock.c:2086:22: warning: variable 'memsize_bss' set but not used [-Wunused-but-set-global]
    2086 | static unsigned long memsize_bss __initdata_memblock;
         |                      ^
   5 warnings generated.


vim +/memsize_memmap +2082 mm/memblock.c

  2079	
  2080	static struct memsize_rgn_struct memsize_rgn[CONFIG_MAX_MEMBLOCK_MEMSIZE] __initdata_memblock;
  2081	static int memsize_rgn_count __initdata_memblock;
> 2082	static long memsize_memmap;
> 2083	static unsigned long memsize_code __initdata_memblock;
> 2084	static unsigned long memsize_data __initdata_memblock;
> 2085	static unsigned long memsize_ro __initdata_memblock;
> 2086	static unsigned long memsize_bss __initdata_memblock;
  2087	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
