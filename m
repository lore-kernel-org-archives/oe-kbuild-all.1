Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96D2F2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 03:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707880033; cv=none; b=H9hhODQ7+qerhtixh8C8iT43tyHl6iy941Gnwe/jzlvvsF0Ll9kgoDuAq/yEa4qAA/ABeQL0Y7jPWArlKB0sxb2FJBJ0xl0yuxtXaVbrL9FO23nMsQg/gPrwSmwOVEhPWqIEbgtHyzXG6nWvf9noYYdF52jeYEC28RtwSXW64dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707880033; c=relaxed/simple;
	bh=6TpH/LWbKVvWgkJBb55eoT/ecvM1DUA31Pn6/GNGgn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPuS3qjLXDPvjLq7gwC1HnHw4RR1oopsOlrDUypwyJwsNoerhs7TD6b+lEZGOWzuVgFIfefncMiS/JZxUJIbJ2BUQ0TwbgjSq8yiRpPlCsqIwn5dNABm2RJ2veXqDUJavGsrzpfv77Av4ZfRzCkzSiaXs0DCg8i1pEbHY/x+NMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3RmCzdM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3RmCzdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707880028; x=1739416028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TpH/LWbKVvWgkJBb55eoT/ecvM1DUA31Pn6/GNGgn0=;
  b=i3RmCzdMiVERRo0Wi0J1X/HHYDbBHNPYa6G1SyMLkLUlGmMVAcIc2ogR
   6m/1bDaY6Fm9NzBUeArnWmhpl/Dz1hvOZ2kKpsiG8WRZNfhJbboNE8iZY
   8TVjMoR67k8W2htEKLWozoPmJ1KvzfXp2p0x/LvKTROSAPRLxhdVv/Crh
   rY0B0vSa5Q6+nAPh96bPCw470vBPf41MHpjTDfwrPezZ4SbaJfM8U2jO1
   NmoFK8LrQ0+FzgVo/Oe+bTNi8fjUuEngcjKg1wvMuV7WkLCB/I3sjIMUa
   8vnYLryQojH4SBOKr0AbFWzlN0WXuuOC6mzVpciQmBXRo1c396m7nqX+h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2061178"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="2061178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 19:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7720719"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2024 19:07:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra5bz-0008Fk-1R;
	Wed, 14 Feb 2024 03:07:03 +0000
Date: Wed, 14 Feb 2024 11:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: oe-kbuild-all@lists.linux.dev, Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [ambarus:hyperbus 1/7] drivers/mtd/hyperbus/hyperbus-sfdp.c:174:12:
 warning: assignment makes pointer from integer without a cast
Message-ID: <202402141147.lJztQE4D-lkp@intel.com>
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
config: i386-randconfig-006-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141147.lJztQE4D-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141147.lJztQE4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141147.lJztQE4D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mtd/gen_probe.h:10:0,
                    from drivers/mtd/hyperbus/hyperbus-sfdp.c:6:
   include/linux/mtd/flashchip.h:77:2: error: unknown type name 'wait_queue_head_t'
     wait_queue_head_t wq; /* Wait on here when we're waiting for the chip
     ^~~~~~~~~~~~~~~~~
   drivers/mtd/hyperbus/hyperbus-sfdp.c: In function 'hyperbus_s26hx_chip_setup':
   drivers/mtd/hyperbus/hyperbus-sfdp.c:174:14: error: implicit declaration of function 'kmalloc'; did you mean 'vmalloc'? [-Werror=implicit-function-declaration]
     cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + nregions * sizeof(u32),
                 ^~~~~~~
                 vmalloc
>> drivers/mtd/hyperbus/hyperbus-sfdp.c:174:12: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + nregions * sizeof(u32),
               ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c:209:24: error: 'SZ_4K' undeclared (first use in this function)
      *erase++ = ERASEINFO(SZ_4K, nbtm4ks);
                           ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c:56:29: note: in definition of macro 'ERASEINFO'
    #define ERASEINFO(s, b)  (((s) << 8) | ((b) - 1))
                                ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c:209:24: note: each undeclared identifier is reported only once for each function it appears in
      *erase++ = ERASEINFO(SZ_4K, nbtm4ks);
                           ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c:56:29: note: in definition of macro 'ERASEINFO'
    #define ERASEINFO(s, b)  (((s) << 8) | ((b) - 1))
                                ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c:210:24: error: 'SZ_256K' undeclared (first use in this function); did you mean 'SZ_4K'?
      *erase++ = ERASEINFO(SZ_256K - (SZ_4K * nbtm4ks), 1);
                           ^
   drivers/mtd/hyperbus/hyperbus-sfdp.c:56:29: note: in definition of macro 'ERASEINFO'
    #define ERASEINFO(s, b)  (((s) << 8) | ((b) - 1))
                                ^
   cc1: some warnings being treated as errors


vim +174 drivers/mtd/hyperbus/hyperbus-sfdp.c

   > 6	#include <linux/mtd/gen_probe.h>
     7	
     8	#ifdef CONFIG_MTD_XIP
     9	
    10	/* only needed for short periods, so this is rather simple */
    11	#define xip_disable()	local_irq_disable()
    12	
    13	#define xip_allowed(base, map) \
    14	do { \
    15		(void) map_read(map, base); \
    16		xip_iprefetch(); \
    17		local_irq_enable(); \
    18	} while (0)
    19	
    20	#define xip_enable(base, map, cfi) \
    21	do { \
    22		hyperbus_sfdp_mode_off(base, map, cfi);		\
    23		xip_allowed(base, map); \
    24	} while (0)
    25	
    26	#else
    27	
    28	#define xip_disable()				do { } while (0)
    29	#define xip_allowed(base, map)			do { } while (0)
    30	#define xip_enable(base, map, cfi)		do { } while (0)
    31	
    32	#endif
    33	
    34	/* HyperBus Commands */
    35	#define HYPERBUS_ADDR_UNLOCK1	0x555
    36	#define HYPERBUS_ADDR_UNLOCK2	0x2AA
    37	#define HYPERBUS_CMD_UNLOCK1	0xAA
    38	#define HYPERBUS_CMD_UNLOCK2	0x55
    39	#define HYPERBUS_CMD_RDSFDP	0x90
    40	#define HYPERBUS_CMD_RDVCR1	0xC7
    41	#define HYPERBUS_CMD_RDVCR2	0xC9
    42	#define HYPERBUS_CMD_ASOEXT	0xF0
    43	#define HYPERBUS_CMD_ERSCTR	0x30
    44	
    45	/* For Infineon S26Hx family */
    46	#define S26HX_ADDR_MFR_ID	0x800
    47	#define S26HX_ADDR_DEV_ID1	0x801
    48	#define S26HX_ADDR_DEV_ID2	0x802
    49	#define S26HX_DEV_ID1_3V0	0x006A
    50	#define S26HX_DEV_ID1_1V8	0x007B
    51	#define S26HX_DEV_ID2_512	0x001A
    52	#define S26HX_DEV_ID2_01G	0x001B
    53	#define S26HX_CFR1_UNIFORM	BIT(9)
    54	#define S26HX_CFR1_TP4KBS	BIT(8)
    55	#define S26HX_CFR2_SP4KBS	BIT(2)
    56	#define ERASEINFO(s, b)		(((s) << 8) | ((b) - 1))
    57	
    58	static inline u16 hyperbus_read(u32 addr, struct map_info *map,
    59					struct cfi_private *cfi)
    60	{
    61		return cfi_read_query16(map, addr * cfi->interleave * cfi->device_type);
    62	}
    63	
    64	static inline void hyperbus_write(u8 cmd, u32 addr, struct map_info *map,
    65					  struct cfi_private *cfi)
    66	{
    67		cfi_send_gen_cmd(cmd, addr, 0, map, cfi, cfi->device_type, NULL);
    68	}
    69	
    70	static int __xipram hyperbus_sfdp_present(struct map_info *map, __u32 base,
    71						  struct cfi_private *cfi)
    72	{
    73		int osf = cfi->interleave * cfi->device_type; /* scale factor */
    74		map_word val[2];
    75		map_word sfdp[2];
    76	
    77		sfdp[0] = cfi_build_cmd(0x4653, map, cfi); /* "SF" */
    78		sfdp[1] = cfi_build_cmd(0x5044, map, cfi); /* "DP" */
    79	
    80		val[0] = map_read(map, base + osf * 0x0);
    81		val[1] = map_read(map, base + osf * 0x1);
    82	
    83		if (!map_word_equal(map, sfdp[0], val[0]))
    84			return 0;
    85	
    86		if (!map_word_equal(map, sfdp[1], val[1]))
    87			return 0;
    88	
    89		return 1; /* "SFDP" found */
    90	}
    91	
    92	static int __xipram hyperbus_sfdp_mode_on(u32 base, struct map_info *map,
    93						  struct cfi_private *cfi)
    94	{
    95		hyperbus_write(HYPERBUS_CMD_ASOEXT, 0, map, cfi);
    96		hyperbus_write(HYPERBUS_CMD_UNLOCK1, HYPERBUS_ADDR_UNLOCK1, map, cfi);
    97		hyperbus_write(HYPERBUS_CMD_UNLOCK2, HYPERBUS_ADDR_UNLOCK2, map, cfi);
    98		hyperbus_write(HYPERBUS_CMD_RDSFDP, HYPERBUS_ADDR_UNLOCK1, map, cfi);
    99		return hyperbus_sfdp_present(map, 0, cfi);
   100	}
   101	
   102	static void __xipram hyperbus_sfdp_mode_off(u32 base, struct map_info *map,
   103						    struct cfi_private *cfi)
   104	{
   105		hyperbus_write(HYPERBUS_CMD_ASOEXT, 0, map, cfi);
   106	}
   107	
   108	static u16 __xipram hyperbus_s26hx_rdvcr1(struct map_info *map,
   109						  struct cfi_private *cfi)
   110	{
   111		hyperbus_write(HYPERBUS_CMD_UNLOCK1, HYPERBUS_ADDR_UNLOCK1, map, cfi);
   112		hyperbus_write(HYPERBUS_CMD_UNLOCK2, HYPERBUS_ADDR_UNLOCK2, map, cfi);
   113		hyperbus_write(HYPERBUS_CMD_RDVCR1, HYPERBUS_ADDR_UNLOCK1, map, cfi);
   114		return hyperbus_read(0, map, cfi);
   115	}
   116	
   117	static u16 __xipram hyperbus_s26hx_rdvcr2(struct map_info *map,
   118						  struct cfi_private *cfi)
   119	{
   120		hyperbus_write(HYPERBUS_CMD_UNLOCK1, HYPERBUS_ADDR_UNLOCK1, map, cfi);
   121		hyperbus_write(HYPERBUS_CMD_UNLOCK2, HYPERBUS_ADDR_UNLOCK2, map, cfi);
   122		hyperbus_write(HYPERBUS_CMD_RDVCR2, HYPERBUS_ADDR_UNLOCK1, map, cfi);
   123		return hyperbus_read(0, map, cfi);
   124	}
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
   209			*erase++ = ERASEINFO(SZ_4K, nbtm4ks);
   210			*erase++ = ERASEINFO(SZ_256K - (SZ_4K * nbtm4ks), 1);
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
