Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A32487A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 03:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734492234; cv=none; b=M2900c0t+Iml6sFVmtDMJRKgUOxd0qiBL+Gd6/W5gJ9IlAVC8M5KkFrrv7DjFRS0zakMteHJz6CcaAlyNZlUVVagiBOXbcCzEUardDUfXy8GZ1w0ApSPazHiTmZrarcMHkwvhkPS/uiCTNq1QZplXAsrmw9rT4wEUJqmpxlP2Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734492234; c=relaxed/simple;
	bh=igc0wCCmqMgXnLGBLvd86Vg+OPbEPG7kT/rnF162m4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i8NuroYUpM3gmlV1SsxIi15V1vIQvoDQtyCBDj9QQK3RKz9YtSMStSOWOuXBlpncFMuHGr6Wxrb5M3I6H7qMZNoPk5WLEiyERkMitC9aa3qLUQ5JTsR4bYBDjW8pjlxMpMISdujiQpFXB/srSHYKj5wCHjJihaSe9RdCOdSNXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOSwFN8T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOSwFN8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734492232; x=1766028232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igc0wCCmqMgXnLGBLvd86Vg+OPbEPG7kT/rnF162m4Y=;
  b=EOSwFN8Tyu6yg0QMoV4eQVBuLlxAHA48Z32lIzPZwRtz2uTROlIQI7PY
   bgHxtkMCPyzdz2u+h4UxhfbU73oIjgwiwyUqfdR/iO/HsFNYiRd5A+5UZ
   TC8H3tBMjNi+op8p526Y4vfhDt2eIGAGTSB745n17VUTrRB3xsARxyEeM
   DczKdclQER7eje36Ovf9FdXUHPrW/DSnAKgvvSO77ppX4KSirZaJVyx0r
   9isskj0QNAYgWl1ZJRkB5Z8/LWsvOC0PzG1NiH4nJO4vyzSNm9QQLhYFv
   6lUkRW1UYs9u5T+hTm9g8hU9mpfFelV9Ax0Wn0D1TmxTryklGWXnzWUPO
   w==;
X-CSE-ConnectionGUID: faNVtq4ESrKg4GziJ/mNBg==
X-CSE-MsgGUID: Ss1t4ZQMS1eorL5oPp0b9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45955937"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45955937"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 19:23:51 -0800
X-CSE-ConnectionGUID: DOf3qlIMSvSpp1lmn88lbQ==
X-CSE-MsgGUID: wC4NGexmTXS25OOY8Kkdvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102726235"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Dec 2024 19:23:49 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNkf5-000G0s-1P;
	Wed, 18 Dec 2024 03:23:47 +0000
Date: Wed, 18 Dec 2024 11:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wen Zhiwei <wenzhiwei@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613]
 drivers/clk/imx/clk-composite-7ulp.c:85:24: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202412181102.2njg5nzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: c9198a0f5708ba5f1247256dd8af19cb1be30c55 [1613/1613] clk: imx: composite-7ulp: Check the PCC present bit
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241218/202412181102.2njg5nzI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241218/202412181102.2njg5nzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181102.2njg5nzI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/imx/clk-composite-7ulp.c:85:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/imx/clk-composite-7ulp.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:244:46: sparse: sparse: self-comparison always evaluates to false

vim +85 drivers/clk/imx/clk-composite-7ulp.c

    68	
    69	static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
    70					     const char * const *parent_names,
    71					     int num_parents, bool mux_present,
    72					     bool rate_present, bool gate_present,
    73					     void __iomem *reg, bool has_swrst)
    74	{
    75		struct clk_hw *mux_hw = NULL, *fd_hw = NULL, *gate_hw = NULL;
    76		struct clk_fractional_divider *fd = NULL;
    77		struct clk_gate *gate = NULL;
    78		struct clk_mux *mux = NULL;
    79		struct clk_hw *hw;
    80		u32 val;
    81	
    82		val = readl(reg);
    83		if (!(val & PCG_PR_MASK)) {
    84			pr_info("PCC PR is 0 for clk:%s, bypass\n", name);
  > 85			return 0;
    86		}
    87	
    88		if (mux_present) {
    89			mux = kzalloc(sizeof(*mux), GFP_KERNEL);
    90			if (!mux)
    91				return ERR_PTR(-ENOMEM);
    92			mux_hw = &mux->hw;
    93			mux->reg = reg;
    94			mux->shift = PCG_PCS_SHIFT;
    95			mux->mask = PCG_PCS_MASK;
    96			if (has_swrst)
    97				mux->lock = &imx_ccm_lock;
    98		}
    99	
   100		if (rate_present) {
   101			fd = kzalloc(sizeof(*fd), GFP_KERNEL);
   102			if (!fd) {
   103				kfree(mux);
   104				return ERR_PTR(-ENOMEM);
   105			}
   106			fd_hw = &fd->hw;
   107			fd->reg = reg;
   108			fd->mshift = PCG_FRAC_SHIFT;
   109			fd->mwidth = PCG_FRAC_WIDTH;
   110			fd->nshift = PCG_PCD_SHIFT;
   111			fd->nwidth = PCG_PCD_WIDTH;
   112			fd->flags = CLK_FRAC_DIVIDER_ZERO_BASED;
   113			if (has_swrst)
   114				fd->lock = &imx_ccm_lock;
   115		}
   116	
   117		if (gate_present) {
   118			gate = kzalloc(sizeof(*gate), GFP_KERNEL);
   119			if (!gate) {
   120				kfree(mux);
   121				kfree(fd);
   122				return ERR_PTR(-ENOMEM);
   123			}
   124			gate_hw = &gate->hw;
   125			gate->reg = reg;
   126			gate->bit_idx = PCG_CGC_SHIFT;
   127			if (has_swrst)
   128				gate->lock = &imx_ccm_lock;
   129			/*
   130			 * make sure clock is gated during clock tree initialization,
   131			 * the HW ONLY allow clock parent/rate changed with clock gated,
   132			 * during clock tree initialization, clocks could be enabled
   133			 * by bootloader, so the HW status will mismatch with clock tree
   134			 * prepare count, then clock core driver will allow parent/rate
   135			 * change since the prepare count is zero, but HW actually
   136			 * prevent the parent/rate change due to the clock is enabled.
   137			 */
   138			val = readl_relaxed(reg);
   139			val &= ~(1 << PCG_CGC_SHIFT);
   140			writel_relaxed(val, reg);
   141		}
   142	
   143		hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
   144					       mux_hw, &clk_mux_ops, fd_hw,
   145					       &clk_fractional_divider_ops, gate_hw,
   146					       has_swrst ? &pcc_gate_ops : &clk_gate_ops, CLK_SET_RATE_GATE |
   147					       CLK_SET_PARENT_GATE | CLK_SET_RATE_NO_REPARENT);
   148		if (IS_ERR(hw)) {
   149			kfree(mux);
   150			kfree(fd);
   151			kfree(gate);
   152		}
   153	
   154		return hw;
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
