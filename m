Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F851865FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 01:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272882; cv=none; b=mU6kcaB6xnpj60Z0QTnpt875H4MCUAVv+Jj0acAv+I2rFzBSDURso9LKnFN2AHZEk/pD9q4Rr7mIeV8XFVsP+vXp5wxPCwQ+wF7xXgyNVYkrJJcearh+iG64+y02wEhYhGNnXsXMNHhjUuPZ1hVpGi5rSD67e7mGVuYNXDb331Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272882; c=relaxed/simple;
	bh=DdczSh8/WzdLzod7C5GF5vHwGipb+MR7R04Gav9pRJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOXoi0Bb2IzuWH0mSMTrC0V5jsP+9ma5puLnyvYlNSZsAORpUBSojtbVfi7O9KRu/1UeucVh4o88VytmSPjQ7pLnc2+UNlCmOH1k0nmGHL3OlPbJtNmFTYQj+rpIMRXe70bZClyOQMKWrl8wJ+TZrYHKK6DrR0u31e0TJwS0dFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5wjWVsn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5wjWVsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747272880; x=1778808880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DdczSh8/WzdLzod7C5GF5vHwGipb+MR7R04Gav9pRJM=;
  b=B5wjWVsnl33pmmvlbwU5RZhb9FlQY+V8itn8ydGx7SPQYdPdozR/4mOp
   aef8yMrn0ZaTnhM6I5Rl7e3l5/0TWiC2wlq63mHDpnB2RVkD74SO0vMaN
   RzAEzXwkOjQbMZkyeXixiVgPj3ia6x0yGC76QwEUsczk7qZi+yzlOlU2E
   x2L8VL6oyieKh4JDOApIk9O95cWTFamIjdTVWZzEp4aprct2lIkr7g3oV
   IHPQrAt4sCbVWPoeK/XqmG0rgRd7n+tHVZzhjqcLJbCExckBhaPFzZ2/H
   nrrJz8PLzUSBNLtj4gVDwE0sVLk1R/N1zHnZvW6gRs5FM7TIc5iKIjoUp
   w==;
X-CSE-ConnectionGUID: WRMHEICMRoWcmPsPB2C7dg==
X-CSE-MsgGUID: KWlEwXJDSlK4ylEw1KW+9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49176901"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="49176901"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 18:34:40 -0700
X-CSE-ConnectionGUID: 82GL0HhVRcSlm0bWvSssew==
X-CSE-MsgGUID: uYI9KuCXQBCO9kSyW6m9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="169295121"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2025 18:34:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFNUZ-000HlX-2o;
	Thu, 15 May 2025 01:34:35 +0000
Date: Thu, 15 May 2025 09:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 7657/11093]
 drivers/clk/rockchip/clk-rk3576.c:1752:22: error: implicit declaration of
 function 'kzalloc'
Message-ID: <202505150941.KWKskr2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
commit: 70a114daf2077472e58b3cac23ba8998e35352f4 [7657/11093] clk: rockchip: introduce auxiliary GRFs
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250515/202505150941.KWKskr2c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150941.KWKskr2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150941.KWKskr2c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/rockchip/clk-rk3576.c: In function 'rk3576_clk_init':
>> drivers/clk/rockchip/clk-rk3576.c:1752:22: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
    1752 |         pmu0_grf_e = kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL);
         |                      ^~~~~~~
>> drivers/clk/rockchip/clk-rk3576.c:1752:20: error: assignment to 'struct rockchip_aux_grf *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1752 |         pmu0_grf_e = kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL);
         |                    ^


vim +/kzalloc +1752 drivers/clk/rockchip/clk-rk3576.c

  1722	
  1723	static void __init rk3576_clk_init(struct device_node *np)
  1724	{
  1725		struct rockchip_clk_provider *ctx;
  1726		unsigned long clk_nr_clks;
  1727		void __iomem *reg_base;
  1728		struct rockchip_aux_grf *pmu0_grf_e;
  1729		struct regmap *pmu0_grf;
  1730	
  1731		clk_nr_clks = rockchip_clk_find_max_clk_id(rk3576_clk_branches,
  1732						ARRAY_SIZE(rk3576_clk_branches)) + 1;
  1733	
  1734		pmu0_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3576-pmu0-grf");
  1735		if (IS_ERR(pmu0_grf)) {
  1736			pr_err("%s: could not get PMU0 GRF syscon\n", __func__);
  1737			return;
  1738		}
  1739	
  1740		reg_base = of_iomap(np, 0);
  1741		if (!reg_base) {
  1742			pr_err("%s: could not map cru region\n", __func__);
  1743			return;
  1744		}
  1745	
  1746		ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
  1747		if (IS_ERR(ctx)) {
  1748			pr_err("%s: rockchip clk init failed\n", __func__);
  1749			goto err_unmap;
  1750		}
  1751	
> 1752		pmu0_grf_e = kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL);
  1753		if (!pmu0_grf_e)
  1754			goto err_unmap;
  1755	
  1756		pmu0_grf_e->grf = pmu0_grf;
  1757		pmu0_grf_e->type = grf_type_pmu0;
  1758		hash_add(ctx->aux_grf_table, &pmu0_grf_e->node, grf_type_pmu0);
  1759	
  1760		rockchip_clk_register_plls(ctx, rk3576_pll_clks,
  1761					   ARRAY_SIZE(rk3576_pll_clks),
  1762					   RK3576_GRF_SOC_STATUS0);
  1763	
  1764		rockchip_clk_register_armclk(ctx, ARMCLK_L, "armclk_l",
  1765				mux_armclkl_p, ARRAY_SIZE(mux_armclkl_p),
  1766				&rk3576_cpulclk_data, rk3576_cpulclk_rates,
  1767				ARRAY_SIZE(rk3576_cpulclk_rates));
  1768		rockchip_clk_register_armclk(ctx, ARMCLK_B, "armclk_b",
  1769				mux_armclkb_p, ARRAY_SIZE(mux_armclkb_p),
  1770				&rk3576_cpubclk_data, rk3576_cpubclk_rates,
  1771				ARRAY_SIZE(rk3576_cpubclk_rates));
  1772	
  1773		rockchip_clk_register_branches(ctx, rk3576_clk_branches,
  1774					       ARRAY_SIZE(rk3576_clk_branches));
  1775	
  1776		rk3576_rst_init(np, reg_base);
  1777	
  1778		rockchip_register_restart_notifier(ctx, RK3576_GLB_SRST_FST, NULL);
  1779	
  1780		rockchip_clk_of_add_provider(np, ctx);
  1781	
  1782		return;
  1783	
  1784	err_unmap:
  1785		iounmap(reg_base);
  1786		return;
  1787	}
  1788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
