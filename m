Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3021060B80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 19:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707852797; cv=none; b=VDdHzZ6sjOeTZtpIKGcUeZGt7vYvUn2w5cikod2IBGpF/JB+n3pPvrqXhmxxZ44nYWMZXV9J5gtf26j2w3veaIZTyskk7jlfPrCja7ATrGUKccz5hfCiyhbdJS6wgMtFsS2QwC8aM0QcpSWGmW3P/KKkhrWKU8NEfywihQarrTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707852797; c=relaxed/simple;
	bh=TNld6XaySAPY7pFksbtwoGXTg7LWpBC2yDDLsOUYag4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b69sVPwQSLt5Vx9M3Zigz/xJn3/fIUKCSh52hn5TJx6WjqmJ4j4jAyWxWuIUni/re/n7Ibi4rk0isHbMlBjltAqfMh7ysForWqpGo1mI2yjLpRu58dnlFx73B4LnA3UEbAtbgm8mKVSpT3PR44nhbAwAm0Ib2G7kKFgwxb0NaV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYfTijeY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYfTijeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707852795; x=1739388795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TNld6XaySAPY7pFksbtwoGXTg7LWpBC2yDDLsOUYag4=;
  b=EYfTijeYTvMzGbWFaYvt93EjIfpZhXxgeVNc39Hsr7XEtiNYKgaHAXze
   KOpcfpQpeg8l+3O8TvWgInmqHLnV/8k+DNeJ6uAeLx4I4tXnP5Xqxf4ZE
   HpF2NFh0TlOQ1EavRNqlPTTzzYTvzRfE71eMHEgCsCyODCgbE5in2Cir8
   te8PPfFRu+lm3jE/GktbW3EHaqbH6loOgfn4OYen5ohYZXZwjBboMzp4z
   W7FscTw0UfcgBrFWtpTKQ3Johx06HG/2IsXpRiotaXkuPjDkkxsB9OtUK
   QcmTLR1TtnmhJSFMUmgzVYSDEXUbLLlGEHxQ4o7UyfFqk25heurfyF7wy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2235696"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2235696"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 11:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="826201363"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="826201363"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Feb 2024 11:33:12 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZyWk-00082K-0K;
	Tue, 13 Feb 2024 19:33:10 +0000
Date: Wed, 14 Feb 2024 03:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: oe-kbuild-all@lists.linux.dev, Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [ambarus:hyperbus 1/7] drivers/mtd/hyperbus/hyperbus-sfdp.c:174:21:
 error: implicit declaration of function 'kmalloc'; did you mean 'vmalloc'?
Message-ID: <202402140354.3i8TmkZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day hyperbus
head:   a15251683a61e8502ebc06584861bf9f5d84823b
commit: b6d1b619a848f5a304ae59ed71a414058e8d3013 [1/7] mtd: hyperbus: Introduce SFDP probe
config: i386-buildonly-randconfig-002-20240213 (https://download.01.org/0day-ci/archive/20240214/202402140354.3i8TmkZv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140354.3i8TmkZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140354.3i8TmkZv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mtd/gen_probe.h:10,
                    from drivers/mtd/hyperbus/hyperbus-sfdp.c:6:
   include/linux/mtd/flashchip.h:77:9: error: unknown type name 'wait_queue_head_t'
      77 |         wait_queue_head_t wq; /* Wait on here when we're waiting for the chip
         |         ^~~~~~~~~~~~~~~~~
   drivers/mtd/hyperbus/hyperbus-sfdp.c: In function 'hyperbus_s26hx_chip_setup':
>> drivers/mtd/hyperbus/hyperbus-sfdp.c:174:21: error: implicit declaration of function 'kmalloc'; did you mean 'vmalloc'? [-Werror=implicit-function-declaration]
     174 |         cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + nregions * sizeof(u32),
         |                     ^~~~~~~
         |                     vmalloc
>> drivers/mtd/hyperbus/hyperbus-sfdp.c:174:19: warning: assignment to 'struct cfi_ident *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     174 |         cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + nregions * sizeof(u32),
         |                   ^
>> drivers/mtd/hyperbus/hyperbus-sfdp.c:209:38: error: 'SZ_4K' undeclared (first use in this function)
     209 |                 *erase++ = ERASEINFO(SZ_4K, nbtm4ks);
         |                                      ^~~~~
   drivers/mtd/hyperbus/hyperbus-sfdp.c:56:36: note: in definition of macro 'ERASEINFO'
      56 | #define ERASEINFO(s, b)         (((s) << 8) | ((b) - 1))
         |                                    ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c:209:38: note: each undeclared identifier is reported only once for each function it appears in
     209 |                 *erase++ = ERASEINFO(SZ_4K, nbtm4ks);
         |                                      ^~~~~
   drivers/mtd/hyperbus/hyperbus-sfdp.c:56:36: note: in definition of macro 'ERASEINFO'
      56 | #define ERASEINFO(s, b)         (((s) << 8) | ((b) - 1))
         |                                    ^
>> drivers/mtd/hyperbus/hyperbus-sfdp.c:210:38: error: 'SZ_256K' undeclared (first use in this function)
     210 |                 *erase++ = ERASEINFO(SZ_256K - (SZ_4K * nbtm4ks), 1);
         |                                      ^~~~~~~
   drivers/mtd/hyperbus/hyperbus-sfdp.c:56:36: note: in definition of macro 'ERASEINFO'
      56 | #define ERASEINFO(s, b)         (((s) << 8) | ((b) - 1))
         |                                    ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c: At top level:
>> drivers/mtd/hyperbus/hyperbus-sfdp.c:343:18: warning: no previous prototype for 'hyperbus_sfdp_probe' [-Wmissing-prototypes]
     343 | struct mtd_info *hyperbus_sfdp_probe(struct map_info *map)
         |                  ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +174 drivers/mtd/hyperbus/hyperbus-sfdp.c

   125	
   126	static int __xipram hyperbus_s26hx_chip_setup(struct map_info *map,
   127						      struct cfi_private *cfi)
   128	{
   129		u16 mfr_id, dev_id1, dev_id2, cfr1v, cfr2v, n256ks;
   130		u8 nregions, nbtm4ks, ntop4ks;
   131		u32 *erase;
   132	
   133		/* Read manufacturer and Device ID */
   134		mfr_id = hyperbus_read(S26HX_ADDR_MFR_ID, map, cfi);
   135		dev_id1 = hyperbus_read(S26HX_ADDR_DEV_ID1, map, cfi);
   136		dev_id2 = hyperbus_read(S26HX_ADDR_DEV_ID2, map, cfi);
   137	
   138		if ((mfr_id != CFI_MFR_CYPRESS) ||
   139		    (dev_id1 != S26HX_DEV_ID1_3V0 && dev_id1 != S26HX_DEV_ID1_1V8) ||
   140		    (dev_id2 != S26HX_DEV_ID2_512 && dev_id2 != S26HX_DEV_ID2_01G)) {
   141			xip_enable(0, map, cfi);
   142			return 0;
   143		}
   144	
   145		/* Exit SFDP ASO then read CFR1V and CFR2V */
   146		hyperbus_sfdp_mode_off(0, map, cfi);
   147		cfr1v = hyperbus_s26hx_rdvcr1(map, cfi);
   148		cfr2v = hyperbus_s26hx_rdvcr2(map, cfi);
   149	
   150		xip_enable(0, map, cfi);
   151	
   152		/*
   153		 * Determine number of regions (nregions), number of bottom 4KB sectors
   154		 * (nbtm4ks), and number of top 4KB sectors (ntop4ks)
   155		 */
   156		if (cfr1v & S26HX_CFR1_UNIFORM) {
   157			nregions = 1;
   158			nbtm4ks = 0;
   159			ntop4ks = 0;
   160		} else if (cfr2v & S26HX_CFR2_SP4KBS) {
   161			nregions = 5;
   162			nbtm4ks = 16;
   163			ntop4ks = 16;
   164		} else if (cfr1v & S26HX_CFR1_TP4KBS) {
   165			nregions = 3;
   166			nbtm4ks = 0;
   167			ntop4ks = 32;
   168		} else {
   169			nregions = 3;
   170			nbtm4ks = 32;
   171			ntop4ks = 0;
   172		}
   173	
 > 174		cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + nregions * sizeof(u32),
   175				    GFP_KERNEL);
   176		if (!cfi->cfiq)
   177			return 0;
   178	
   179		memset(cfi->cfiq, 0, sizeof(struct cfi_ident));
   180	
   181		cfi->mfr = mfr_id;
   182		cfi->id = dev_id1 << 8 | dev_id2;
   183		cfi->cfi_mode = CFI_MODE_CFI;
   184		cfi->addr_unlock1 = HYPERBUS_ADDR_UNLOCK1;
   185		cfi->addr_unlock2 = HYPERBUS_ADDR_UNLOCK2;
   186		cfi->sector_erase_cmd = CMD(HYPERBUS_CMD_ERSCTR);
   187	
   188		cfi->cfiq->P_ID = P_ID_AMD_STD;
   189		cfi->cfiq->DevSize = dev_id2; /* dev_id2 indicates size in 2^N */
   190		cfi->cfiq->MaxBufWriteSize = 9; /* 2^9 = 512 */
   191	
   192		/*
   193		 * cfi_cmdset_0002 uses fixed timeout for word write (1ms + 1 jiffies)
   194		 * and sector erase (20s) that should be enough for s26hx. For buffer
   195		 * write, 2000us is used if cfiq->BufWriteTimeoutXXX is 0. The typical
   196		 * and maximum 512B page programming times are 680us and 2175us
   197		 * respectively. Specify proper values here to extend buffer write
   198		 * timeout.
   199		 */
   200		cfi->cfiq->BufWriteTimeoutTyp = 10; /* 2^10 = 1024 */
   201		cfi->cfiq->BufWriteTimeoutMax = 2; /* 1024 x 2^2 = 4096 */
   202	
   203		/* Setup erase region info */
   204		cfi->cfiq->NumEraseRegions = nregions;
   205		erase = cfi->cfiq->EraseRegionInfo;
   206	
   207		/* Bottom 4KB sectors and remaining portion */
   208		if (nbtm4ks) {
 > 209			*erase++ = ERASEINFO(SZ_4K, nbtm4ks);
 > 210			*erase++ = ERASEINFO(SZ_256K - (SZ_4K * nbtm4ks), 1);
   211		}
   212	
   213		/*
   214		 * The number of uniform 256KB sectors is obtained by dividing 'device
   215		 * size' by 256K(=2^18). Deduct overlaid sector(s) from uniform number
   216		 * if top and/or bottom 4KB sectors exist.
   217		 */
   218		n256ks = (1 << (cfi->cfiq->DevSize - 18)) - !!(nbtm4ks) - !!(ntop4ks);
   219		*erase++ = ERASEINFO(SZ_256K, n256ks);
   220	
   221		/* Top 4KB sectors and remaining portion */
   222		if (ntop4ks) {
   223			*erase++ = ERASEINFO(SZ_256K - (SZ_4K * ntop4ks), 1);
   224			*erase = ERASEINFO(SZ_4K, ntop4ks);
   225		}
   226	
   227		return 1;
   228	}
   229	
   230	static int __xipram hyperbus_sfdp_chip_setup(struct map_info *map,
   231						     struct cfi_private *cfi)
   232	{
   233		/*
   234		 * Just call setup for S26Hx since it is only chip supported.
   235		 * Once other devices come up, we will implement vendor/chip specific
   236		 * detection and setup flow here.
   237		 */
   238		return hyperbus_s26hx_chip_setup(map, cfi);
   239	}
   240	
   241	static int __xipram hyperbus_sfdp_probe_chip(struct map_info *map, __u32 base,
   242						     unsigned long *chip_map,
   243						     struct cfi_private *cfi)
   244	{
   245		u32 probe_addr;
   246		int i;
   247	
   248		if (base >= map->size) {
   249			pr_notice("Probe at base(0x%08x) past the end of the map(0x%08lx)\n",
   250				  base, map->size - 1);
   251			return 0;
   252		}
   253	
   254		probe_addr = base + cfi_build_cmd_addr(HYPERBUS_ADDR_UNLOCK1, map, cfi);
   255		if (probe_addr >= map->size) {
   256			pr_notice("Probe at base[unlock](0x%08x) past the end of the map(0x%08lx)\n",
   257				  probe_addr, map->size - 1);
   258			return 0;
   259		}
   260	
   261		xip_disable();
   262		if (!hyperbus_sfdp_mode_on(base, map, cfi)) {
   263			xip_enable(base, map, cfi);
   264			return 0;
   265		}
   266	
   267		/*
   268		 * This is the first time we're called. Set up the CFI stuff accordingly
   269		 * and return
   270		 */
   271		if (!cfi->numchips)
   272			return hyperbus_sfdp_chip_setup(map, cfi);
   273	
   274		/* Check each previous chip to see if it's an alias */
   275		for (i = 0; i < (base >> cfi->chipshift); i++) {
   276			unsigned long start;
   277	
   278			/* Skip location; no valid chip at this address */
   279			if (!test_bit(i, chip_map))
   280				continue;
   281	
   282			start = i << cfi->chipshift;
   283	
   284			/*
   285			 * This chip should be in read mode if it's one we've already
   286			 * touched.
   287			 */
   288			if (hyperbus_sfdp_present(map, start, cfi)) {
   289				/*
   290				 * Eep. This chip also had the SFDP signature. Is it an
   291				 * alias or the new one?
   292				 */
   293				hyperbus_sfdp_mode_off(start, map, cfi);
   294	
   295				/* If the SFDP signature goes away, it's an alias */
   296				if (!hyperbus_sfdp_present(map, start, cfi)) {
   297					xip_allowed(base, map);
   298					pr_debug("%s: Found an alias at 0x%x for the chip at 0x%lx\n",
   299						 map->name, base, start);
   300					return 0;
   301				}
   302	
   303				/*
   304				 * Yes, it's actually got SFDP for data. Most
   305				 * unfortunate. Stick the new chip in read mode too and
   306				 * if it's the same, assume it's an alias.
   307				 * FIXME: Use other modes to do a proper check
   308				 */
   309				hyperbus_sfdp_mode_off(base, map, cfi);
   310	
   311				if (hyperbus_sfdp_present(map, base, cfi)) {
   312					xip_allowed(base, map);
   313					pr_debug("%s: Found an alias at 0x%x for the chip at 0x%lx\n",
   314						 map->name, base, start);
   315					return 0;
   316				}
   317			}
   318		}
   319	
   320		/*
   321		 * OK, if we got to here, then none of the previous chips appear to
   322		 * be aliases for the current one.
   323		 */
   324		set_bit((base >> cfi->chipshift), chip_map);  /* Update chip map */
   325		cfi->numchips++;
   326	
   327		/* Put it back into Read Mode */
   328		hyperbus_sfdp_mode_off(base, map, cfi);
   329		xip_allowed(base, map);
   330	
   331		pr_info("%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
   332			map->name, cfi->interleave, cfi->device_type * 8, base,
   333			map->bankwidth * 8);
   334	
   335		return 1;
   336	}
   337	
   338	static struct chip_probe hyperbus_sfdp_chip_probe = {
   339		.name		= "SFDP",
   340		.probe_chip	= hyperbus_sfdp_probe_chip
   341	};
   342	
 > 343	struct mtd_info *hyperbus_sfdp_probe(struct map_info *map)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
