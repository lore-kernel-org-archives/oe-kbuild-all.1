Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD83B19A5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792347179; cv=none; b=sE1CA2A+YEQUyyUVxAOayygtbLuqmQ8azxM7gIuNcVmdYQ0/q4meW+DyTFxV8gU05Z1NsDQDNiOpvU9DJNF8HbI4wSn/YnWl/NJ3BNadT+4QHiirtLY9eoJHe/MQgtecKFBX5n2qN38oFwi//DBP2pRbEvMiu28q1FKR8Rldj1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792347179; c=relaxed/simple;
	bh=PsLMXpalYZqifBGM6NR7jdPXBphtz3UA/Guc+ba5XpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lIZi3jnCh0SOfIDgFelYM3R+mQkBbVEANhTjyOXBA00ARz+wMXEU8RT7RGAbFs6cQWoPUZVSz55sSrFs4lLwSESrhzXsDydsfkKTJAhcdXqbBg9nPnyM0pjy9pOiJazhzkSUnqwMmfgylUBEbU+R0FEBWgfqRjgaS7PTIeQhG98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXvE4QxP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXvE4QxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792347177; x=1823883177;
  h=date:from:to:cc:subject:message-id;
  bh=PsLMXpalYZqifBGM6NR7jdPXBphtz3UA/Guc+ba5XpA=;
  b=RXvE4QxPpt9yCRqEeErpI7A1Io+wEbG/lLO99k6uuMtm9xemWNQyedxH
   CL1WdENGVoB9LEdOn+2HI1oWFKxI6K43+qC2oY0QzsdWg/gOSitS5fsoP
   vFPEMZrfNoOCrh5vpjQ6vlQyp3XSVXUY8fyU9oSjvmL+rIc4kJc5swyKN
   pBol2ijYYJYk1ZSZRwvUK+7a5SQc393VnBstJqYJfI/0a1Hzd0zy5Xm+7
   pr3NQrpNeNDynTYGRD1wsSb/BNoGjzhEAhkjp8skQ+7g2HbO9CcSoz20X
   DoRJug+e5W7lrquJYt1yUcOP0WttrmSE01dlZf+LODU8r2703t9O4VWX3
   Q==;
X-CSE-ConnectionGUID: 7dPAkctGQteUSTP2HN4tqw==
X-CSE-MsgGUID: KrDOaibOSI+HNOQ89xxyng==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="947423"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="947423"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 11:12:56 -0700
X-CSE-ConnectionGUID: b0HreyfSQTGdLs0kNBnqhQ==
X-CSE-MsgGUID: TUFi8tA1TMmsTNdWCM9kDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2411675"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2026 11:12:54 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIVNL-000000005D1-3Ooq;
	Sun, 18 Oct 2026 18:12:51 +0000
Date: Sun, 18 Oct 2026 20:12:05 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 drivers/mtd/nand/raw/nand_timings.c:295:43: warning: 'onfi_nvddr_timings'
 defined but not used
Message-ID: <202610182018.iz2MaYJr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Miquel,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: d4f7bcce90023eeca5cbbbd72dafa2e49ed5bf16 [1/1] mtd: rawnand: Add NV-DDR timings
config: arm64-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261018/202610182018.iz2MaYJr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182018.iz2MaYJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182018.iz2MaYJr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/nand_timings.c:295:43: warning: 'onfi_nvddr_timings' defined but not used [-Wunused-const-variable=]
     295 | static const struct nand_interface_config onfi_nvddr_timings[] = {
         |                                           ^~~~~~~~~~~~~~~~~~


vim +/onfi_nvddr_timings +295 drivers/mtd/nand/raw/nand_timings.c

   294	
 > 295	static const struct nand_interface_config onfi_nvddr_timings[] = {
   296		/* Mode 0 */
   297		{
   298			.type = NAND_NVDDR_IFACE,
   299			.timings.mode = 0,
   300			.timings.nvddr = {
   301				.tCCS_min = 500000,
   302				.tR_max = 200000000,
   303				.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   304				.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   305				.tAC_min = 3000,
   306				.tAC_max = 25000,
   307				.tADL_min = 400000,
   308				.tCAD_min = 45000,
   309				.tCAH_min = 10000,
   310				.tCALH_min = 10000,
   311				.tCALS_min = 10000,
   312				.tCAS_min = 10000,
   313				.tCEH_min = 20000,
   314				.tCH_min = 10000,
   315				.tCK_min = 50000,
   316				.tCS_min = 35000,
   317				.tDH_min = 5000,
   318				.tDQSCK_min = 3000,
   319				.tDQSCK_max = 25000,
   320				.tDQSD_min = 0,
   321				.tDQSD_max = 18000,
   322				.tDQSHZ_max = 20000,
   323				.tDQSQ_max = 5000,
   324				.tDS_min = 5000,
   325				.tDSC_min = 50000,
   326				.tFEAT_max = 1000000,
   327				.tITC_max = 1000000,
   328				.tQHS_max = 6000,
   329				.tRHW_min = 100000,
   330				.tRR_min = 20000,
   331				.tRST_max = 500000000,
   332				.tWB_max = 100000,
   333				.tWHR_min = 80000,
   334				.tWRCK_min = 20000,
   335				.tWW_min = 100000,
   336			},
   337		},
   338		/* Mode 1 */
   339		{
   340			.type = NAND_NVDDR_IFACE,
   341			.timings.mode = 1,
   342			.timings.nvddr = {
   343				.tCCS_min = 500000,
   344				.tR_max = 200000000,
   345				.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   346				.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   347				.tAC_min = 3000,
   348				.tAC_max = 25000,
   349				.tADL_min = 400000,
   350				.tCAD_min = 45000,
   351				.tCAH_min = 5000,
   352				.tCALH_min = 5000,
   353				.tCALS_min = 5000,
   354				.tCAS_min = 5000,
   355				.tCEH_min = 20000,
   356				.tCH_min = 5000,
   357				.tCK_min = 30000,
   358				.tCS_min = 25000,
   359				.tDH_min = 2500,
   360				.tDQSCK_min = 3000,
   361				.tDQSCK_max = 25000,
   362				.tDQSD_min = 0,
   363				.tDQSD_max = 18000,
   364				.tDQSHZ_max = 20000,
   365				.tDQSQ_max = 2500,
   366				.tDS_min = 3000,
   367				.tDSC_min = 30000,
   368				.tFEAT_max = 1000000,
   369				.tITC_max = 1000000,
   370				.tQHS_max = 3000,
   371				.tRHW_min = 100000,
   372				.tRR_min = 20000,
   373				.tRST_max = 500000000,
   374				.tWB_max = 100000,
   375				.tWHR_min = 80000,
   376				.tWRCK_min = 20000,
   377				.tWW_min = 100000,
   378			},
   379		},
   380		/* Mode 2 */
   381		{
   382			.type = NAND_NVDDR_IFACE,
   383			.timings.mode = 2,
   384			.timings.nvddr = {
   385				.tCCS_min = 500000,
   386				.tR_max = 200000000,
   387				.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   388				.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   389				.tAC_min = 3000,
   390				.tAC_max = 25000,
   391				.tADL_min = 400000,
   392				.tCAD_min = 45000,
   393				.tCAH_min = 4000,
   394				.tCALH_min = 4000,
   395				.tCALS_min = 4000,
   396				.tCAS_min = 4000,
   397				.tCEH_min = 20000,
   398				.tCH_min = 4000,
   399				.tCK_min = 20000,
   400				.tCS_min = 15000,
   401				.tDH_min = 1700,
   402				.tDQSCK_min = 3000,
   403				.tDQSCK_max = 25000,
   404				.tDQSD_min = 0,
   405				.tDQSD_max = 18000,
   406				.tDQSHZ_max = 20000,
   407				.tDQSQ_max = 1700,
   408				.tDS_min = 2000,
   409				.tDSC_min = 20000,
   410				.tFEAT_max = 1000000,
   411				.tITC_max = 1000000,
   412				.tQHS_max = 2000,
   413				.tRHW_min = 100000,
   414				.tRR_min = 20000,
   415				.tRST_max = 500000000,
   416				.tWB_max = 100000,
   417				.tWHR_min = 80000,
   418				.tWRCK_min = 20000,
   419				.tWW_min = 100000,
   420			},
   421		},
   422		/* Mode 3 */
   423		{
   424			.type = NAND_NVDDR_IFACE,
   425			.timings.mode = 3,
   426			.timings.nvddr = {
   427				.tCCS_min = 500000,
   428				.tR_max = 200000000,
   429				.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   430				.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   431				.tAC_min = 3000,
   432				.tAC_max = 25000,
   433				.tADL_min = 400000,
   434				.tCAD_min = 45000,
   435				.tCAH_min = 3000,
   436				.tCALH_min = 3000,
   437				.tCALS_min = 3000,
   438				.tCAS_min = 3000,
   439				.tCEH_min = 20000,
   440				.tCH_min = 3000,
   441				.tCK_min = 15000,
   442				.tCS_min = 15000,
   443				.tDH_min = 1300,
   444				.tDQSCK_min = 3000,
   445				.tDQSCK_max = 25000,
   446				.tDQSD_min = 0,
   447				.tDQSD_max = 18000,
   448				.tDQSHZ_max = 20000,
   449				.tDQSQ_max = 1300,
   450				.tDS_min = 1500,
   451				.tDSC_min = 15000,
   452				.tFEAT_max = 1000000,
   453				.tITC_max = 1000000,
   454				.tQHS_max = 1500,
   455				.tRHW_min = 100000,
   456				.tRR_min = 20000,
   457				.tRST_max = 500000000,
   458				.tWB_max = 100000,
   459				.tWHR_min = 80000,
   460				.tWRCK_min = 20000,
   461				.tWW_min = 100000,
   462			},
   463		},
   464		/* Mode 4 */
   465		{
   466			.type = NAND_NVDDR_IFACE,
   467			.timings.mode = 4,
   468			.timings.nvddr = {
   469				.tCCS_min = 500000,
   470				.tR_max = 200000000,
   471				.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   472				.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   473				.tAC_min = 3000,
   474				.tAC_max = 25000,
   475				.tADL_min = 400000,
   476				.tCAD_min = 45000,
   477				.tCAH_min = 2500,
   478				.tCALH_min = 2500,
   479				.tCALS_min = 2500,
   480				.tCAS_min = 2500,
   481				.tCEH_min = 20000,
   482				.tCH_min = 2500,
   483				.tCK_min = 12000,
   484				.tCS_min = 15000,
   485				.tDH_min = 1100,
   486				.tDQSCK_min = 3000,
   487				.tDQSCK_max = 25000,
   488				.tDQSD_min = 0,
   489				.tDQSD_max = 18000,
   490				.tDQSHZ_max = 20000,
   491				.tDQSQ_max = 1000,
   492				.tDS_min = 1100,
   493				.tDSC_min = 12000,
   494				.tFEAT_max = 1000000,
   495				.tITC_max = 1000000,
   496				.tQHS_max = 1200,
   497				.tRHW_min = 100000,
   498				.tRR_min = 20000,
   499				.tRST_max = 500000000,
   500				.tWB_max = 100000,
   501				.tWHR_min = 80000,
   502				.tWRCK_min = 20000,
   503				.tWW_min = 100000,
   504			},
   505		},
   506		/* Mode 5 */
   507		{
   508			.type = NAND_NVDDR_IFACE,
   509			.timings.mode = 5,
   510			.timings.nvddr = {
   511				.tCCS_min = 500000,
   512				.tR_max = 200000000,
   513				.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   514				.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
   515				.tAC_min = 3000,
   516				.tAC_max = 25000,
   517				.tADL_min = 400000,
   518				.tCAD_min = 45000,
   519				.tCAH_min = 2000,
   520				.tCALH_min = 2000,
   521				.tCALS_min = 2000,
   522				.tCAS_min = 2000,
   523				.tCEH_min = 20000,
   524				.tCH_min = 2000,
   525				.tCK_min = 10000,
   526				.tCS_min = 15000,
   527				.tDH_min = 900,
   528				.tDQSCK_min = 3000,
   529				.tDQSCK_max = 25000,
   530				.tDQSD_min = 0,
   531				.tDQSD_max = 18000,
   532				.tDQSHZ_max = 20000,
   533				.tDQSQ_max = 850,
   534				.tDS_min = 900,
   535				.tDSC_min = 10000,
   536				.tFEAT_max = 1000000,
   537				.tITC_max = 1000000,
   538				.tQHS_max = 1000,
   539				.tRHW_min = 100000,
   540				.tRR_min = 20000,
   541				.tRST_max = 500000000,
   542				.tWB_max = 100000,
   543				.tWHR_min = 80000,
   544				.tWRCK_min = 20000,
   545				.tWW_min = 100000,
   546			},
   547		},
   548	};
   549	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
