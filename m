Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B2742C0B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317709; cv=none; b=jsEa9g6/oWvRYdld5OLeNJJdhvQfCV9mIQJrCmT7rz3Jqy9pTdmOjSm/kUEJ/YgzJFUTJF+lxWw7c7oh/H6asV/hwTBRrv/6EFXf30/0ONkDrtoABLcBf2tzaxEVLVFZuxsLzAPtve6fxD+TorTkeIUmB3mGKIbUKYUrhpjQhyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317709; c=relaxed/simple;
	bh=Kp3ufLQWRNmjg5R8adenxAdcIa4UpPJ5MKhWrwF6OJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Asqj1FtWcs7iC9CVyMqrXREzC0aFMv18XG0hBfhYJ/d9S82ir7zL+G/sCHfPl4r1A0tz7aeHerZuypzey3R665igm+5fE/+VFjxdEwYUE33/gGxBVHVN8nxgcIjFBDxLEdZHkXjE5/eZm2g+tIVnTFi0WG9eauQmR0+Zk18yX4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPlt+Yl3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPlt+Yl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317708; x=1778853708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kp3ufLQWRNmjg5R8adenxAdcIa4UpPJ5MKhWrwF6OJs=;
  b=FPlt+Yl3ILLXaU28bHbZWCCAyk5t2PAhRw9ZjfRUqdunS7ai1b1HDIdO
   p6kCLqrHh6MXzLjhZheeoPwjbjoNeVT9E4xtUVqgRmL9w9J2hgIxRfLL6
   wLvA20dUWF16ayeBJuGuXEQ20ol2MAUfTNvr7vWC2qZ+/XPtrkTlfePxt
   QIUs4SVpbP5OGXwE8AwiIiNXbwCMtL/ZKJLBXM2qsR4BsP/XaBekYAzTW
   K+gmtW1RFLk+VcvAnnIQjxabVIepmPUYu7kXTlCT/MG8s1TQofUi8Pp13
   sRHbyx5AVnQMG1lPgxJOlRjdSa2sdPeudIL618UAgS0SQS40fiWa5Ptnn
   Q==;
X-CSE-ConnectionGUID: hfMHs8kZTIetOem3iHThHg==
X-CSE-MsgGUID: RCxXw9AkQPu83kJ2177Isg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59908715"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="59908715"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:01:47 -0700
X-CSE-ConnectionGUID: YrIItPTSS+Kx9Qj7IuU5xQ==
X-CSE-MsgGUID: vgU23MOiSpO5sB/mRGc/lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143267465"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2025 07:01:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZ9b-000IRJ-2M;
	Thu, 15 May 2025 14:01:43 +0000
Date: Thu, 15 May 2025 22:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 7524/11408]
 drivers/clk/rockchip/clk-rk3576.c:1810:9: error: implicit declaration of
 function 'kfree'
Message-ID: <202505152121.FIUXB0Kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   484803582c77061b470ac64a634f25f89715be3f
commit: 9199ec29f0977efee223791c9ee3eb402d23f8ba [7524/11408] clk: rockchip: add GATE_GRFs for SAI MCLKOUT to rk3576
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250515/202505152121.FIUXB0Kj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152121.FIUXB0Kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505152121.FIUXB0Kj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/rockchip/clk-rk3576.c: In function 'rk3576_clk_init':
   drivers/clk/rockchip/clk-rk3576.c:1769:22: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
    1769 |         pmu0_grf_e = kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL);
         |                      ^~~~~~~
   drivers/clk/rockchip/clk-rk3576.c:1769:20: error: assignment to 'struct rockchip_aux_grf *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1769 |         pmu0_grf_e = kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL);
         |                    ^
   drivers/clk/rockchip/clk-rk3576.c:1777:19: error: assignment to 'struct rockchip_aux_grf *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1777 |         ioc_grf_e = kzalloc(sizeof(*ioc_grf_e), GFP_KERNEL);
         |                   ^
>> drivers/clk/rockchip/clk-rk3576.c:1810:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
    1810 |         kfree(pmu0_grf_e);
         |         ^~~~~


vim +/kfree +1810 drivers/clk/rockchip/clk-rk3576.c

  1731	
  1732	static void __init rk3576_clk_init(struct device_node *np)
  1733	{
  1734		struct rockchip_clk_provider *ctx;
  1735		unsigned long clk_nr_clks;
  1736		void __iomem *reg_base;
  1737		struct rockchip_aux_grf *ioc_grf_e;
  1738		struct rockchip_aux_grf *pmu0_grf_e;
  1739		struct regmap *ioc_grf;
  1740		struct regmap *pmu0_grf;
  1741	
  1742		clk_nr_clks = rockchip_clk_find_max_clk_id(rk3576_clk_branches,
  1743						ARRAY_SIZE(rk3576_clk_branches)) + 1;
  1744	
  1745		pmu0_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3576-pmu0-grf");
  1746		if (IS_ERR(pmu0_grf)) {
  1747			pr_err("%s: could not get PMU0 GRF syscon\n", __func__);
  1748			return;
  1749		}
  1750	
  1751		ioc_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3576-ioc-grf");
  1752		if (IS_ERR(ioc_grf)) {
  1753			pr_err("%s: could not get IOC GRF syscon\n", __func__);
  1754			return;
  1755		}
  1756	
  1757		reg_base = of_iomap(np, 0);
  1758		if (!reg_base) {
  1759			pr_err("%s: could not map cru region\n", __func__);
  1760			return;
  1761		}
  1762	
  1763		ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
  1764		if (IS_ERR(ctx)) {
  1765			pr_err("%s: rockchip clk init failed\n", __func__);
  1766			goto err_unmap;
  1767		}
  1768	
  1769		pmu0_grf_e = kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL);
  1770		if (!pmu0_grf_e)
  1771			goto err_unmap;
  1772	
  1773		pmu0_grf_e->grf = pmu0_grf;
  1774		pmu0_grf_e->type = grf_type_pmu0;
  1775		hash_add(ctx->aux_grf_table, &pmu0_grf_e->node, grf_type_pmu0);
  1776	
  1777		ioc_grf_e = kzalloc(sizeof(*ioc_grf_e), GFP_KERNEL);
  1778		if (!ioc_grf_e)
  1779			goto err_free_pmu0;
  1780	
  1781		ioc_grf_e->grf = ioc_grf;
  1782		ioc_grf_e->type = grf_type_ioc;
  1783		hash_add(ctx->aux_grf_table, &ioc_grf_e->node, grf_type_ioc);
  1784	
  1785		rockchip_clk_register_plls(ctx, rk3576_pll_clks,
  1786					   ARRAY_SIZE(rk3576_pll_clks),
  1787					   RK3576_GRF_SOC_STATUS0);
  1788	
  1789		rockchip_clk_register_armclk(ctx, ARMCLK_L, "armclk_l",
  1790				mux_armclkl_p, ARRAY_SIZE(mux_armclkl_p),
  1791				&rk3576_cpulclk_data, rk3576_cpulclk_rates,
  1792				ARRAY_SIZE(rk3576_cpulclk_rates));
  1793		rockchip_clk_register_armclk(ctx, ARMCLK_B, "armclk_b",
  1794				mux_armclkb_p, ARRAY_SIZE(mux_armclkb_p),
  1795				&rk3576_cpubclk_data, rk3576_cpubclk_rates,
  1796				ARRAY_SIZE(rk3576_cpubclk_rates));
  1797	
  1798		rockchip_clk_register_branches(ctx, rk3576_clk_branches,
  1799					       ARRAY_SIZE(rk3576_clk_branches));
  1800	
  1801		rk3576_rst_init(np, reg_base);
  1802	
  1803		rockchip_register_restart_notifier(ctx, RK3576_GLB_SRST_FST, NULL);
  1804	
  1805		rockchip_clk_of_add_provider(np, ctx);
  1806	
  1807		return;
  1808	
  1809	err_free_pmu0:
> 1810		kfree(pmu0_grf_e);
  1811	err_unmap:
  1812		iounmap(reg_base);
  1813		return;
  1814	}
  1815	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
