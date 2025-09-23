Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B173128D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758618680; cv=none; b=YPZNrwCk5EgmxPRMo93VZzrDuEmrWodaEmY4/tQleIGUXJoCAK2FFxePV+pSPk1aYFRh+A+S3ip6o3G7CCmAcvwIugu/T4HofOCbSbAMg8HREbsLppNcrbD6sIVPDzUz3ShAtj4EYnR1r3Eyryph/XH03IlJ/vVSstJBqlzy3Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758618680; c=relaxed/simple;
	bh=9mvT/LhNV6s9NTKFTJoFYQXleie44pRS3bROHglvPDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBkfQ9+og3PG1quGLJxX5Hz78EYVCJWzk+2KmEEDzk3Hws0g8rPKoIammuAdCPEiNRp7dhi939nEtPD3rR6ObEmLMsp7aIYlDCCRysu/dgmUUja/3o0lj38cJYSC5MisYakC6YRjEyphmNassjRy/Odr7dK4gy9CrDiybhm03m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMHyzNMF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMHyzNMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758618678; x=1790154678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9mvT/LhNV6s9NTKFTJoFYQXleie44pRS3bROHglvPDc=;
  b=fMHyzNMFf2w5V7c82iw+7WOkFKXn37No3v+ZMFDfgo38KYuKLi2l6wd1
   LjrQh3lNnYBwFCmqYz3QOQ6cvUIOuzI/zgaYi2IcZOElLJpee/EPylohC
   Cwfp1ZaiLvrDPh284OVZ8xm/k4xrYDbXmlxbr20i1t0WApsORpIGv3S7W
   xCQHrbHn24oOniSFCf1o+WvpXw/bzuBz2BWBY/m9n1RKvxkqyOl6XoKa1
   FMKc1ostkV5JoUPM6eZC4Lp0rfJ9Ks/blNB4sBC8JpYLrNeMJ6sUkZokg
   HpLcVwc1v7et+MbXITSMJVwcq4YZE//a3lq3wQud2q4Fjn2tI1MuRDgG4
   w==;
X-CSE-ConnectionGUID: YKQoph0SQ32N9+DRqFX75w==
X-CSE-MsgGUID: 4oZBPEeqSLO7Nyj9AS1GPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64695813"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64695813"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 02:11:17 -0700
X-CSE-ConnectionGUID: r5iRVfARShWLhBA4rPsI3A==
X-CSE-MsgGUID: HM460zP7SVSFpzwAu+hRaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="207641248"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2025 02:11:16 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0z3J-0002x9-2p;
	Tue, 23 Sep 2025 09:11:13 +0000
Date: Tue, 23 Sep 2025 17:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] include/linux/mmzone.h:1136:13:
 error: variable 'nid' set but not used
Message-ID: <202509231730.hW2EAQ5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   bd0e4cef233d7f95e320d36ced31a23b952ab0cd
commit: c65b1bd0af076fa5a1da26b9cf780097b14b1543 [1/1] mm/page_alloc: detect allocation forbidden by cpuset and bail out early
config: i386-buildonly-randconfig-001-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231730.hW2EAQ5P-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231730.hW2EAQ5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231730.hW2EAQ5P-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from lib/radix-tree.c:15:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   lib/radix-tree.c: At top level:
   lib/radix-tree.c:288:6: warning: no previous prototype for 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/clk-provider.h:9,
                    from lib/vsprintf.c:23:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1691:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1691 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from lib/test_ida.c:9:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   lib/test_ida.c: At top level:
   lib/test_ida.c:16:6: warning: no previous prototype for 'ida_dump' [-Wmissing-prototypes]
      16 | void ida_dump(struct ida *ida) { }
         |      ^~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from lib/zstd/decompress.c:37:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   lib/zstd/decompress.c: At top level:
   lib/zstd/decompress.c:126:12: warning: no previous prototype for 'ZSTD_createDCtx_advanced' [-Wmissing-prototypes]
     126 | ZSTD_DCtx *ZSTD_createDCtx_advanced(ZSTD_customMem customMem)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/decompress.c:394:8: warning: no previous prototype for 'ZSTD_getcBlockSize' [-Wmissing-prototypes]
     394 | size_t ZSTD_getcBlockSize(const void *src, size_t srcSize, blockProperties_t *bpPtr)
         |        ^~~~~~~~~~~~~~~~~~
   lib/zstd/decompress.c:432:8: warning: no previous prototype for 'ZSTD_decodeLiteralsBlock' [-Wmissing-prototypes]
     432 | size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t srcSize) /* note : srcSize < BLOCKSIZE */
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/decompress.c:794:8: warning: no previous prototype for 'ZSTD_decodeSeqHeaders' [-Wmissing-prototypes]
     794 | size_t ZSTD_decodeSeqHeaders(ZSTD_DCtx *dctx, int *nbSeqPtr, const void *src, size_t srcSize)
         |        ^~~~~~~~~~~~~~~~~~~~~
   lib/zstd/decompress.c:1497:8: warning: no previous prototype for 'ZSTD_generateNxBytes' [-Wmissing-prototypes]
    1497 | size_t ZSTD_generateNxBytes(void *dst, size_t dstCapacity, BYTE byte, size_t length)
         |        ^~~~~~~~~~~~~~~~~~~~
   In file included from lib/zstd/decompress.c:35:
   lib/zstd/zstd_internal.h:124:18: warning: 'OF_defaultNormLog' defined but not used [-Wunused-const-variable=]
     124 | static const U32 OF_defaultNormLog = OF_DEFAULTNORMLOG;
         |                  ^~~~~~~~~~~~~~~~~
   lib/zstd/zstd_internal.h:122:18: warning: 'OF_defaultNorm' defined but not used [-Wunused-const-variable=]
     122 | static const S16 OF_defaultNorm[MaxOff + 1] = {1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1};
         |                  ^~~~~~~~~~~~~~
   lib/zstd/zstd_internal.h:120:18: warning: 'ML_defaultNormLog' defined but not used [-Wunused-const-variable=]
     120 | static const U32 ML_defaultNormLog = ML_DEFAULTNORMLOG;
         |                  ^~~~~~~~~~~~~~~~~
   lib/zstd/zstd_internal.h:117:18: warning: 'ML_defaultNorm' defined but not used [-Wunused-const-variable=]
     117 | static const S16 ML_defaultNorm[MaxML + 1] = {1, 4, 3, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1,  1,  1,  1,  1,  1, 1,
         |                  ^~~~~~~~~~~~~~
   lib/zstd/zstd_internal.h:113:18: warning: 'LL_defaultNormLog' defined but not used [-Wunused-const-variable=]
     113 | static const U32 LL_defaultNormLog = LL_DEFAULTNORMLOG;
         |                  ^~~~~~~~~~~~~~~~~
   lib/zstd/zstd_internal.h:111:18: warning: 'LL_defaultNorm' defined but not used [-Wunused-const-variable=]
     111 | static const S16 LL_defaultNorm[MaxLL + 1] = {4, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 1, 1, 1, 1, 1, -1, -1, -1, -1};
         |                  ^~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from lib/lz4/lz4_decompress.c:39:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   lib/lz4/lz4_decompress.c: At top level:
   lib/lz4/lz4_decompress.c:488:5: warning: no previous prototype for 'LZ4_decompress_safe_withPrefix64k' [-Wmissing-prototypes]
     488 | int LZ4_decompress_safe_withPrefix64k(const char *source, char *dest,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/lz4/lz4_decompress.c:510:5: warning: no previous prototype for 'LZ4_decompress_safe_forceExtDict' [-Wmissing-prototypes]
     510 | int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from lib/lzo/lzo1x_compress.c:15:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   lib/lzo/lzo1x_compress.c: At top level:
   lib/lzo/lzo1x_compress.c:304:5: warning: no previous prototype for 'lzogeneric1x_1_compress' [-Wmissing-prototypes]
     304 | int lzogeneric1x_1_compress(const unsigned char *in, size_t in_len,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/kernel/head32.c:11:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/kernel/head32.c: At top level:
   arch/x86/kernel/head32.c:72:13: warning: no previous prototype for 'mk_early_pgtbl_32' [-Wmissing-prototypes]
      72 | void __init mk_early_pgtbl_32(void)
         |             ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from arch/x86/kernel/devicetree.c:9:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/kernel/devicetree.c: At top level:
   arch/x86/kernel/devicetree.c:34:13: warning: no previous prototype for 'early_init_dt_scan_chosen_arch' [-Wmissing-prototypes]
      34 | void __init early_init_dt_scan_chosen_arch(unsigned long node)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/devicetree.c:39:13: warning: no previous prototype for 'early_init_dt_add_memory_arch' [-Wmissing-prototypes]
      39 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/kernel/doublefault_32.c:2:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/kernel/doublefault_32.c: At top level:
   arch/x86/kernel/doublefault_32.c:23:36: warning: no previous prototype for 'doublefault_shim' [-Wmissing-prototypes]
      23 | asmlinkage noinstr void __noreturn doublefault_shim(void)
         |                                    ^~~~~~~~~~~~~~~~
   arch/x86/kernel/doublefault_32.c:117:6: warning: no previous prototype for 'doublefault_init_cpu_tss' [-Wmissing-prototypes]
     117 | void doublefault_init_cpu_tss(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:97,
                    from arch/x86/kernel/static_call.c:2:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/kernel/static_call.c: At top level:
   arch/x86/kernel/static_call.c:20:17: warning: 'tramp_ud' defined but not used [-Wunused-const-variable=]
      20 | static const u8 tramp_ud[] = { 0x0f, 0xb9, 0xcc };
         |                 ^~~~~~~~
..


vim +/nid +1136 include/linux/mmzone.h

  1094	
  1095	/**
  1096	 * for_each_zone_zonelist_nodemask - helper macro to iterate over valid zones in a zonelist at or below a given zone index and within a nodemask
  1097	 * @zone - The current zone in the iterator
  1098	 * @z - The current pointer within zonelist->_zonerefs being iterated
  1099	 * @zlist - The zonelist being iterated
  1100	 * @highidx - The zone index of the highest zone to return
  1101	 * @nodemask - Nodemask allowed by the allocator
  1102	 *
  1103	 * This iterator iterates though all zones at or below a given zone index and
  1104	 * within a given nodemask
  1105	 */
  1106	#define for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, nodemask) \
  1107		for (z = first_zones_zonelist(zlist, highidx, nodemask), zone = zonelist_zone(z);	\
  1108			zone;							\
  1109			z = next_zones_zonelist(++z, highidx, nodemask),	\
  1110				zone = zonelist_zone(z))
  1111	
  1112	#define for_next_zone_zonelist_nodemask(zone, z, highidx, nodemask) \
  1113		for (zone = z->zone;	\
  1114			zone;							\
  1115			z = next_zones_zonelist(++z, highidx, nodemask),	\
  1116				zone = zonelist_zone(z))
  1117	
  1118	
  1119	/**
  1120	 * for_each_zone_zonelist - helper macro to iterate over valid zones in a zonelist at or below a given zone index
  1121	 * @zone - The current zone in the iterator
  1122	 * @z - The current pointer within zonelist->zones being iterated
  1123	 * @zlist - The zonelist being iterated
  1124	 * @highidx - The zone index of the highest zone to return
  1125	 *
  1126	 * This iterator iterates though all zones at or below a given zone index.
  1127	 */
  1128	#define for_each_zone_zonelist(zone, z, zlist, highidx) \
  1129		for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, NULL)
  1130	
  1131	/* Whether the 'nodes' are all movable nodes */
  1132	static inline bool movable_only_nodes(nodemask_t *nodes)
  1133	{
  1134		struct zonelist *zonelist;
  1135		struct zoneref *z;
> 1136		int nid;
  1137	
  1138		if (nodes_empty(*nodes))
  1139			return false;
  1140	
  1141		/*
  1142		 * We can chose arbitrary node from the nodemask to get a
  1143		 * zonelist as they are interlinked. We just need to find
  1144		 * at least one zone that can satisfy kernel allocations.
  1145		 */
  1146		nid = first_node(*nodes);
  1147		zonelist = &NODE_DATA(nid)->node_zonelists[ZONELIST_FALLBACK];
  1148		z = first_zones_zonelist(zonelist, ZONE_NORMAL,	nodes);
  1149		return (!z->zone) ? true : false;
  1150	}
  1151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
