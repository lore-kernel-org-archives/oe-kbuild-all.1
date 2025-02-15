Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1414D28C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 03:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739588872; cv=none; b=Fr5IFD1ViMKPNhZSbQOp0a2Ng97lqquB1H/Xtbe52F0VfX/z2SjMOWQ9nDLtnzjZAonmE8tHUDAJemxTSwwPULiZyeCohdYBWxcPVJBVQwOKM2WWSGv2rKkaazYgqXFvQv/oYyWD07HHn38wVG4QR3InIDUmT6MxLGY9/Ks8XAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739588872; c=relaxed/simple;
	bh=DEItxrEUUiOaC0Ccyo5FuJ7fc93iAqxqVGVfbJvzfA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mDs+ttyjGhnBINdLpXb4gOB/bD4dtJkIqKPFHZ17JXQbH1NTyU1GZ+uLstBfo46TfYS7gWrMFDG+MGt8NMw6L+64IcPMl2xysE2q4UDs8fw8Ry0tYa2qjJxt3wsVKimg+XrrLwySIIqysUl74EDm6km+A9C0zOwXjErEJPOUk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avMv4r2Q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avMv4r2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739588871; x=1771124871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEItxrEUUiOaC0Ccyo5FuJ7fc93iAqxqVGVfbJvzfA0=;
  b=avMv4r2QJvPcX+xQNbvbkRSFkscSUyvMz+5OxRPD6S+0UPfNQt0l78t8
   X89CiGL+UbGX8SAflCzhMmMAS/RQeIhq1/T1K7IZo8zLPsdPpqK6yJkKe
   49lkNwIZKrSJPJbx2OEsoiLybRFCvCQVCr6jpL+UlUM8M02SaASLSjJdo
   h3CzEfJDPcIkZ9v5xpPVwZFvNmKD1VMy/mylkX5k9ochtne0aZ3atjAKd
   M6S7dJisqxHGlqMcaDUfCVO2qfwzxFLExm3Bs6JRwKW+y2Htkx44Kkuoc
   EIdfT6S8tZTxiS711m74rk3ilK5SVIRFFh6NuGAzmK2L46WsT3+mrXQ1C
   g==;
X-CSE-ConnectionGUID: SnWQw4/RQpuvMvy0X6k2NA==
X-CSE-MsgGUID: DRPJhqKsTCqvA2bzAjRrug==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40218114"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="40218114"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 19:07:50 -0800
X-CSE-ConnectionGUID: A7toh2N9QnCIJoOv59gIrg==
X-CSE-MsgGUID: HVb2PgRITHyiE981b+1ACQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113583406"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Feb 2025 19:07:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj8Wx-001ASJ-0B;
	Sat, 15 Feb 2025 03:07:47 +0000
Date: Sat, 15 Feb 2025 11:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/drm-msm-phy-pll-cfg-reg 11/11]
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:575:31: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202502151155.FetbIJ4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/drm-msm-phy-pll-cfg-reg
head:   a2a83d7d6b76b1d17da45c316d8b347c81da4a58
commit: a2a83d7d6b76b1d17da45c316d8b347c81da4a58 [11/11] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502151155.FetbIJ4W-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151155.FetbIJ4W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151155.FetbIJ4W-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c: In function 'dsi_7nm_pll_save_state':
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:575:31: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     575 |         cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
         |                               ^~~~~~~~~


vim +/FIELD_GET +575 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c

   558	
   559	/*
   560	 * PLL Callbacks
   561	 */
   562	
   563	static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
   564	{
   565		struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
   566		struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
   567		void __iomem *phy_base = pll_7nm->phy->base;
   568		u32 cmn_clk_cfg0, cmn_clk_cfg1;
   569	
   570		cached->pll_out_div = readl(pll_7nm->phy->pll_base +
   571				REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
   572		cached->pll_out_div &= 0x3;
   573	
   574		cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
 > 575		cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
   576		cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
   577	
   578		cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
   579		cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
   580	
   581		DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
   582		    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
   583		    cached->pix_clk_div, cached->pll_mux);
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
