Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2CB2ECEBA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554702; cv=none; b=L6chdM6JxFm408Mk6vwINnMuHTNDcHlBFQ92Qz04xmFTjkqr2IEWn5nbs5psD0TWVWPiPJA7gTSeFzA4jKIXl5Wb4/HgCny2WdLtHGAoqv1ddtjbpGJP9l8BsEGeX9gAheYR+Uc5FweywUI5Jm73/S94nm443eVtNJ45zd2VVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554702; c=relaxed/simple;
	bh=cnzmclR6B01di7aqYmD0TRv+jiHZ9vfod7IZtOwJT8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XI79xAkO65TSX0q9XvZaFy+/em+rvi059qIQWXe7GgvfkB9LHQMo70ZWb/3INmPIb8/frazWLkm9tbEFOmDuG/RqfiBtYLkb7Hd7Jy0n5pVPD/XwrdM/qyBs2p74B657fvn3778fdUsJhK6QvHkO61rzkZo3l5csx2mm4o5a16A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHdJcgLV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHdJcgLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751554701; x=1783090701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnzmclR6B01di7aqYmD0TRv+jiHZ9vfod7IZtOwJT8w=;
  b=KHdJcgLVDg6m6mhcvsiuOI3pFzvSRLj/+msW1iaxURDKPb4MiiSnC0sn
   Uz09CWFEDcBQnM3HCb77eLXnfzu+/VmNIZGGEFefq/cF11N0UTf6twyBE
   qQlN6coYW1qwSdvO5Jm1iUfoSEELIELnzNEM0R+5FTCwyhZTnqA4Q8iRC
   KiE5ipD1nP6EH+pXeBcgRWRk6N7Gwe6aNLb94tkK6IJ9cy9Ref4pxRI9G
   DG9K3mFT2A5YEuaJE6hdES26D48BhDxO+oR9Pk03dRP5tuqytHiutdLEV
   6AG5EN29hwKEHtB2MIcgMFLydKe8Rw3XCvZCe58CQu0cgmytyaSPBJVmy
   Q==;
X-CSE-ConnectionGUID: w9R5rS50S26Wau505m6WsA==
X-CSE-MsgGUID: yXadfn4GSSKjc+ajrW90yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57557633"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="57557633"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:58:20 -0700
X-CSE-ConnectionGUID: zaN7OxuFSxqtl8BW0v3aJg==
X-CSE-MsgGUID: m59Hixe8TrylaiCw2BxeMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="158432846"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jul 2025 07:58:19 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXLOD-00026l-0O;
	Thu, 03 Jul 2025 14:58:17 +0000
Date: Thu, 3 Jul 2025 22:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [linux-next:master 1706/7039]
 drivers/gpu/drm/omapdrm/dss/dispc.c:527:32: warning: stack frame size (2256)
 exceeds limit (2048) in 'dispc_restore_context'
Message-ID: <202507032251.5766L2PU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6c58332c7a8ba025fcfa76888b6c37dbce9633
commit: 660942f2441df622d527f216009f332151843ce8 [1706/7039] drm: omapdrm: reduce clang stack usage
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250703/202507032251.5766L2PU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f1a4bb62452d88a0edd9340b3ca7c9b11ad9193f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507032251.5766L2PU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032251.5766L2PU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/omapdrm/dss/dispc.c:4720:27: warning: stack frame size (2256) exceeds limit (2048) in 'dispc_runtime_suspend' [-Wframe-larger-than]
    4720 | static __maybe_unused int dispc_runtime_suspend(struct device *dev)
         |                           ^
>> drivers/gpu/drm/omapdrm/dss/dispc.c:527:32: warning: stack frame size (2256) exceeds limit (2048) in 'dispc_restore_context' [-Wframe-larger-than]
     527 | static noinline_for_stack void dispc_restore_context(struct dispc_device *dispc)
         |                                ^
   2 warnings generated.


vim +/dispc_restore_context +527 drivers/gpu/drm/omapdrm/dss/dispc.c

   526	
 > 527	static noinline_for_stack void dispc_restore_context(struct dispc_device *dispc)
   528	{
   529		int i, j;
   530	
   531		DSSDBG("dispc_restore_context\n");
   532	
   533		if (!dispc->ctx_valid)
   534			return;
   535	
   536		/*RR(dispc, IRQENABLE);*/
   537		/*RR(dispc, CONTROL);*/
   538		RR(dispc, CONFIG);
   539		RR(dispc, LINE_NUMBER);
   540		if (dispc_has_feature(dispc, FEAT_ALPHA_FIXED_ZORDER) ||
   541				dispc_has_feature(dispc, FEAT_ALPHA_FREE_ZORDER))
   542			RR(dispc, GLOBAL_ALPHA);
   543		if (dispc_has_feature(dispc, FEAT_MGR_LCD2))
   544			RR(dispc, CONFIG2);
   545		if (dispc_has_feature(dispc, FEAT_MGR_LCD3))
   546			RR(dispc, CONFIG3);
   547	
   548		for (i = 0; i < dispc_get_num_mgrs(dispc); i++) {
   549			RR(dispc, DEFAULT_COLOR(i));
   550			RR(dispc, TRANS_COLOR(i));
   551			RR(dispc, SIZE_MGR(i));
   552			if (i == OMAP_DSS_CHANNEL_DIGIT)
   553				continue;
   554			RR(dispc, TIMING_H(i));
   555			RR(dispc, TIMING_V(i));
   556			RR(dispc, POL_FREQ(i));
   557			RR(dispc, DIVISORo(i));
   558	
   559			RR(dispc, DATA_CYCLE1(i));
   560			RR(dispc, DATA_CYCLE2(i));
   561			RR(dispc, DATA_CYCLE3(i));
   562	
   563			if (dispc_has_feature(dispc, FEAT_CPR)) {
   564				RR(dispc, CPR_COEF_R(i));
   565				RR(dispc, CPR_COEF_G(i));
   566				RR(dispc, CPR_COEF_B(i));
   567			}
   568		}
   569	
   570		for (i = 0; i < dispc_get_num_ovls(dispc); i++) {
   571			RR(dispc, OVL_BA0(i));
   572			RR(dispc, OVL_BA1(i));
   573			RR(dispc, OVL_POSITION(i));
   574			RR(dispc, OVL_SIZE(i));
   575			RR(dispc, OVL_ATTRIBUTES(i));
   576			RR(dispc, OVL_FIFO_THRESHOLD(i));
   577			RR(dispc, OVL_ROW_INC(i));
   578			RR(dispc, OVL_PIXEL_INC(i));
   579			if (dispc_has_feature(dispc, FEAT_PRELOAD))
   580				RR(dispc, OVL_PRELOAD(i));
   581			if (i == OMAP_DSS_GFX) {
   582				RR(dispc, OVL_WINDOW_SKIP(i));
   583				RR(dispc, OVL_TABLE_BA(i));
   584				continue;
   585			}
   586			RR(dispc, OVL_FIR(i));
   587			RR(dispc, OVL_PICTURE_SIZE(i));
   588			RR(dispc, OVL_ACCU0(i));
   589			RR(dispc, OVL_ACCU1(i));
   590	
   591			for (j = 0; j < 8; j++)
   592				RR(dispc, OVL_FIR_COEF_H(i, j));
   593	
   594			for (j = 0; j < 8; j++)
   595				RR(dispc, OVL_FIR_COEF_HV(i, j));
   596	
   597			for (j = 0; j < 5; j++)
   598				RR(dispc, OVL_CONV_COEF(i, j));
   599	
   600			if (dispc_has_feature(dispc, FEAT_FIR_COEF_V)) {
   601				for (j = 0; j < 8; j++)
   602					RR(dispc, OVL_FIR_COEF_V(i, j));
   603			}
   604	
   605			if (dispc_has_feature(dispc, FEAT_HANDLE_UV_SEPARATE)) {
   606				RR(dispc, OVL_BA0_UV(i));
   607				RR(dispc, OVL_BA1_UV(i));
   608				RR(dispc, OVL_FIR2(i));
   609				RR(dispc, OVL_ACCU2_0(i));
   610				RR(dispc, OVL_ACCU2_1(i));
   611	
   612				for (j = 0; j < 8; j++)
   613					RR(dispc, OVL_FIR_COEF_H2(i, j));
   614	
   615				for (j = 0; j < 8; j++)
   616					RR(dispc, OVL_FIR_COEF_HV2(i, j));
   617	
   618				for (j = 0; j < 8; j++)
   619					RR(dispc, OVL_FIR_COEF_V2(i, j));
   620			}
   621			if (dispc_has_feature(dispc, FEAT_ATTR2))
   622				RR(dispc, OVL_ATTRIBUTES2(i));
   623		}
   624	
   625		if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV))
   626			RR(dispc, DIVISOR);
   627	
   628		/* enable last, because LCD & DIGIT enable are here */
   629		RR(dispc, CONTROL);
   630		if (dispc_has_feature(dispc, FEAT_MGR_LCD2))
   631			RR(dispc, CONTROL2);
   632		if (dispc_has_feature(dispc, FEAT_MGR_LCD3))
   633			RR(dispc, CONTROL3);
   634		/* clear spurious SYNC_LOST_DIGIT interrupts */
   635		dispc_clear_irqstatus(dispc, DISPC_IRQ_SYNC_LOST_DIGIT);
   636	
   637		/*
   638		 * enable last so IRQs won't trigger before
   639		 * the context is fully restored
   640		 */
   641		RR(dispc, IRQENABLE);
   642	
   643		DSSDBG("context restored\n");
   644	}
   645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
