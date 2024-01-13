Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6BFDF61
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV55e1gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705124256; x=1736660256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EsT4JtjmFMbXRBX9GzF/UtkDPVEUQOIc5+Ua1Il4ZqQ=;
  b=LV55e1gx5pStya6Xnt7tgfUkJYLD+aKKN/unLA4UZ+awdJIdgIwfXZQo
   vVOJx9dQdUlGLxF51D4dJyfGRsOcn5FS6nBPT3pNULaYZ51BEqDa1WqYy
   eEy8Rs1agiXs1Z5jM7QfsTpy1ILhDS07q90qbs51glrh652ezv6IshI7t
   iFgkffYnY+Psg+W4x1GqDnzEYozVOnX+iZjQ6g0GT11CAPf/PPQz4dl34
   B0qVi9U+na/OJe+5AajAi6sHGMQQvmKsyDm5yDAVkyZfhMCkZX4JBGloU
   6xFz2rYZCStg1sfYOWTEDPrS/btfdWko+VSnZyOpNe4pDch3PkQAIbYgc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="398220435"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="398220435"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 21:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906520372"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="906520372"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2024 21:37:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOWi3-000A8K-0p;
	Sat, 13 Jan 2024 05:37:31 +0000
Date: Sat, 13 Jan 2024 13:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 13405/17888]
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:274:31: warning: variable
 'plat_dat' set but not used
Message-ID: <202401131341.sFctjlA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: e04d1f83b1e11c1f37c53b3333c53809eeda496f [13405/17888] LF-9449-4 net: stmmac: dwmac-imx: pause the TXC clock in fixed-link
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240113/202401131341.sFctjlA2-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131341.sFctjlA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131341.sFctjlA2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:274:31: warning: variable 'plat_dat' set but not used [-Wunused-but-set-variable]
     274 |         struct plat_stmmacenet_data *plat_dat;
         |                                      ^
   1 warning generated.


vim +/plat_dat +274 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c

   271	
   272	static void imx_dwmac_fix_speed_mx93(void *priv, unsigned int speed)
   273	{
 > 274		struct plat_stmmacenet_data *plat_dat;
   275		struct imx_priv_data *dwmac = priv;
   276		int val, ctrl, old_ctrl;
   277	
   278		imx_dwmac_fix_speed(priv, speed);
   279	
   280		old_ctrl = readl(dwmac->base_addr + MAC_CTRL_REG);
   281		plat_dat = dwmac->plat_dat;
   282		ctrl = old_ctrl & ~CTRL_SPEED_MASK;
   283	
   284		/* by default ctrl will be SPEED_1000 */
   285		if (speed == SPEED_100)
   286			ctrl |= RMII_RESET_SPEED;
   287		if (speed == SPEED_10)
   288			ctrl |= BASET10_RESET_SPEED;
   289	
   290		if (imx_dwmac_is_fixed_link(dwmac)) {
   291			writel(ctrl, dwmac->base_addr + MAC_CTRL_REG);
   292	
   293			/* Ensure the settings for CTRL are applied */
   294			wmb();
   295	
   296			val = MX93_GPR_ENET_QOS_INTF_SEL_RGMII;
   297			regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
   298					   MX93_GPR_ENET_QOS_INTF_MODE_MASK, val);
   299			usleep_range(50, 100);
   300			val = MX93_GPR_ENET_QOS_INTF_SEL_RGMII | MX93_GPR_ENET_QOS_CLK_GEN_EN;
   301			regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
   302					   MX93_GPR_ENET_QOS_INTF_MODE_MASK, val);
   303	
   304			writel(old_ctrl, dwmac->base_addr + MAC_CTRL_REG);
   305		}
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
