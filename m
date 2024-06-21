Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05B29A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719006987; cv=none; b=rtyRrigDJnMjDaQ1QU1ELd3d8HZ0Yx+WLZpxO3HPXr+7G6NBHq57ky4Acx3Yh3L1rUs1Gs3jq9FpWUk+TWQi/n0uHQzrZup6gbqyAC1Um2jm0iY75rgh0TGkehh1MtlV41kKr2CWMedIH0oZrhkBY/hugYlFdJ7PJk0swiEzVDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719006987; c=relaxed/simple;
	bh=kqYoKaZP99wMi3QpAbuaQn2taHlFKV6BHrN6R+W81yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQmKvUjgSwDOTKPG5tgp6Yrweu8f5VlwhXKU084Nr6dDCKYuXBiN96K5Q2F0E76KQ/Y1XjBMvfs070BJRhdzLWRnz0OVVUKhmBrJFHt0Ya//m4Wd0CknJObev+YD9MEKLBghPChDJNR4KxxiRc2y7/1Et+gqL2PpaYOEV5c4dZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEosiWKI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEosiWKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719006986; x=1750542986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kqYoKaZP99wMi3QpAbuaQn2taHlFKV6BHrN6R+W81yU=;
  b=eEosiWKIWZyCEQ3bDhIMKWDl4nVilfvliwDxe70vzO7szR+wHBRryU1V
   RAVEwMQZKo75VsBNHJVbYdiy3MSfQKKDcH5XkOVbMyENFo64p81y7Rzci
   jaJ0L1SGr3D/vYbhGhe8VbNZkb6vfxhSEsGn0t2xnsOGzMpW+UyJxIu4m
   HhLO0oE06JQrqM89l+tlSeNsttgwZdCfu29LcaEONV0OxjYmA/GeZDe3d
   fPr2qNcZhtDEal8KryY4iTuVPsgrxyBG1HyzpCwLSxBG95p3DARRc2vLj
   Vl+Kb4SNH1si5eq2OO8vkSGM2F43hd/nxfKO8Ty1l/S5v9/MQu29K74G/
   Q==;
X-CSE-ConnectionGUID: 4L1PYTeqQpC1sCN2Nz/1iA==
X-CSE-MsgGUID: aOlYXdTHSg6LcGSCsdiFCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15888144"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="15888144"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 14:56:25 -0700
X-CSE-ConnectionGUID: PHKz6xK5TOqVx0BUcTOpiA==
X-CSE-MsgGUID: c36O3e4WQG2Ce9VlxNxEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="47656146"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jun 2024 14:56:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKmF3-00091y-02;
	Fri, 21 Jun 2024 21:56:21 +0000
Date: Sat, 22 Jun 2024 05:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Li <ye.li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 7477/7797]
 drivers/clk/imx/clk-composite-7ulp.c:85:24: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202406220536.JnAncjqz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
commit: 4717ccadb51e2630790dddd222830702de17f090 [7477/7797] clk: imx: composite-7ulp: Check the PCC present bit
config: csky-randconfig-r111-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220536.JnAncjqz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240622/202406220536.JnAncjqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220536.JnAncjqz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/imx/clk-composite-7ulp.c:85:24: sparse: sparse: Using plain integer as NULL pointer

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
