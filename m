Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A547724BCF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761235038; cv=none; b=TbnMoXdjSUKrn8UmGIFr2KAmqg2ksxhqI+FGszsbZJo77ITyrgDyDXz2PS6/cgJradthWiJ6nZ+tAtROOO8nIxqQL/QPbV0EjtYBBOvL8AhE0e4EBgr5azPoNylLJrEXKvQt/Eaz9HvT0p+fN7sTnEh/ffeReITVmmsIUybi/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761235038; c=relaxed/simple;
	bh=+Mt7OJ4qZpR07LYjiW2BmTSsfeguf+q5nmn9Zy67hZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYilyWO+7M4PA+JSnSQTey65a5ucqe0LutUTB2eXxQ09ImuUnaIHXcAoxclFNSfoS10UCEsvGfTwD2XJh4PtDQKGe8hW4l38t/h24sBwGnf30Hz5VscGJTL55NUlX1r3+O7vOSApHNLRg3U85KqXXHGxxDP1sv80bbzE0C7eOCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fn3dDyzi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fn3dDyzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761235037; x=1792771037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Mt7OJ4qZpR07LYjiW2BmTSsfeguf+q5nmn9Zy67hZ0=;
  b=Fn3dDyzi7urJZVE+GymQwWk7IYy7yuOE7D4L/o61hAkQ9z8b0DWWyTbK
   h+POlBqqKbaEVoMtj6cZ6CjV5TiZX7mex9qO8hi1peLJmVlIPqyT509U2
   XnumYy9ACH3dJ/6++S3fPVXmtN17XY/6yun7X0lCeK6SauIPsLwQHwJex
   IkykW5G6kLeF3iu1caO8HZVuwtGE8nVT+GJ2tB9Du8JvsqmfKQv4c3BEs
   AkCP6PxOlhU3LKrCHzSg7qoVaAwD1eP/Pv2vcVnZEE7bsUbGfPRT52E2g
   mP/0buF1jB3VUyofiXaaiNBiy/B320m/vVciKr6SBEGk8i5ZwinzRTLFv
   g==;
X-CSE-ConnectionGUID: to12yRCWTNynr28XRGFxrg==
X-CSE-MsgGUID: mZkJXkkWQIuft7d5tGLduw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62440332"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="62440332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 08:57:15 -0700
X-CSE-ConnectionGUID: RmGaR0PwRMedOq7W6uUt1Q==
X-CSE-MsgGUID: n+Z/1kQZSvaumHYENl/+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="184118693"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Oct 2025 08:57:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBxge-000Ddp-1K;
	Thu, 23 Oct 2025 15:57:12 +0000
Date: Thu, 23 Oct 2025 23:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 202/202]
 drivers/gpu/drm/mediatek/mtk_dsi.c:341:6: warning: variable 'ui' set but not
 used
Message-ID: <202510232353.X8IGV26i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   d6e365e8de4e085c0601fabcc823ecf8a6e223ad
commit: 7db4e2a06b322fdbe143eee233178c4f2e7d6f87 [202/202] CHROMIUM: drm/mediatek: Add cphy driver for mt8189
config: arm-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251023/202510232353.X8IGV26i-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510232353.X8IGV26i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510232353.X8IGV26i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dsi.c:341:6: warning: variable 'ui' set but not used [-Wunused-but-set-variable]
     341 |         u32 ui = 0, cycle_time = 0;
         |             ^
>> drivers/gpu/drm/mediatek/mtk_dsi.c:341:14: warning: variable 'cycle_time' set but not used [-Wunused-but-set-variable]
     341 |         u32 ui = 0, cycle_time = 0;
         |                     ^
   2 warnings generated.


vim +/ui +341 drivers/gpu/drm/mediatek/mtk_dsi.c

   338	
   339	static void mtk_dsi_cphy_timconfig(struct mtk_dsi *dsi)
   340	{
 > 341		u32 ui = 0, cycle_time = 0;
   342		u32 value = 0;
   343		u32 data_rate = dsi->data_rate / 1000000;
   344		struct mtk_phy_timing *timing = &dsi->phy_timing;
   345	
   346		ui = (1000 / data_rate > 0) ? 1000 / data_rate : 1;
   347		cycle_time = 7000 / data_rate;
   348		/* spec. lpx > 50ns */
   349		timing->lpx = (data_rate * 80) / 7000 + 1;
   350		round_up(timing->lpx, 2);
   351		/* spec.  38ns < hs_prpr < 95ns */
   352		timing->da_hs_prepare = (data_rate * 50) / 7000 + 1;
   353		round_up(timing->da_hs_prepare, 2);
   354		/* spec.  7ui < hs_zero(prebegin) < 448ui
   355		 * The PreBegin part of the Preamble may
   356		 * range from 1 to 64 Words, or 7 to 448 symbols.
   357		 */
   358		timing->da_hs_zero = 48;
   359	
   360		/* spec.  7ui < hs_trail(post) < 224ui
   361		 * The Post field may range from 1 to 32 Words,
   362		 * or 7 to 224 symbols.
   363		 */
   364		timing->da_hs_trail = 32;
   365	
   366		/* spec. ta_get = 5*lpx */
   367		timing->ta_get = 5 * timing->lpx;
   368		/* spec. ta_sure = 1.5*lpx */
   369		timing->ta_sure = 3 * timing->lpx / 2;
   370		/* spec. ta_go = 4*lpx */
   371		timing->ta_go = 4 * timing->lpx;
   372		/* spec. da_hs_exit > 100ns */
   373		timing->da_hs_exit = round_up((data_rate * 118) / 7000 + 1, 2) + 1;
   374		dsi->data_phy_cycle = timing->da_hs_prepare + timing->da_hs_zero + timing->da_hs_exit + timing->lpx + 5;
   375		value = REG_FLD_VAL(FLD_LPX, timing->lpx)
   376			| REG_FLD_VAL(FLD_HS_PREP, timing->da_hs_prepare)
   377			| REG_FLD_VAL(FLD_HS_ZERO, timing->da_hs_zero)
   378			| REG_FLD_VAL(FLD_HS_TRAIL, timing->da_hs_trail);
   379	
   380		writel(value, dsi->regs + DSI_PHY_TIMECON0(dsi->driver_data));
   381	
   382		value = REG_FLD_VAL(FLD_TA_GO, timing->ta_go)
   383			| REG_FLD_VAL(FLD_TA_SURE, timing->ta_sure)
   384			| REG_FLD_VAL(FLD_TA_GET, timing->ta_get)
   385			| REG_FLD_VAL(FLD_DA_HS_EXIT, timing->da_hs_exit);
   386	
   387		writel(value, dsi->regs + DSI_PHY_TIMECON1(dsi->driver_data));
   388		writel(CPHY_CON0_VAL, dsi->regs + DSI_CPHY_CON0);
   389		writel(16 * dsi->lanes, dsi->regs + DSI_BLLP_WC);
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
