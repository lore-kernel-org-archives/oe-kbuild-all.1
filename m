Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7831DCB0E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 21:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199493; cv=none; b=tetBcKlszESXS60r9/7FgxVN0235ZfXhVVJx2NTR+8vvBjfs5GBhlsQDuKZ+W7idBSykolgsqi3I8kgYIV4G6FXLN8kjI0NWwKmoT5FNL7M3BPfaCGK0Bk4LmfmHHkBUN2zJPX6tsEhqOwVs+YyVn1AUlaacN51le0acUzpzAHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199493; c=relaxed/simple;
	bh=HvONposlKuJw4Y+dSo+jkkd/aq1cJfkDp0GXQPM1m7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiUrZpPxLNGMxEwQa08wpYWN+DU6eU74PFYIZyzu65MNC4vE6sVnLQ0OY4zudc0KkNwbjmlQ4YfaJoQ2XDQS4uf1fUCwzAXTdeNEsI3K0xVidVziJQ/nQ76+QrmjNeGwT4p5kOi9RRxcMVv8U+qW5OYXvcuo2zwXSUADAFSWv4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGlUebwF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGlUebwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736199492; x=1767735492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvONposlKuJw4Y+dSo+jkkd/aq1cJfkDp0GXQPM1m7g=;
  b=jGlUebwF5yvqEVZOmW6GJtMfOwCHV0QG6Xd2xN+r5z4hydGqzacqPte2
   PpJrHEH1iM0Y3mYo8YFbHoiR3R51T+9Up/Og/ZydnXRIWLtA62rXfy5xY
   mfhxk5vXYT+NPF86lOr5JXIJ6mdPgP0czZF7vO6P7kVZSPmvM+qHlwYAd
   1IeaGR6ABJHfqBaYeEdmkVOjhf+VvWZtZfRktuSxZE50j9iIewzrsaFT/
   9Vur1OIH8TqwxhAVeBlnHw2A+dmmUVMysgAQjwDLItIjhp0ueLLTQpFpI
   CCGMOQkvBZ1QLgOppEsZYhAG3srHA4zcxKNrLoGYhB67bznr1nLNad2q9
   w==;
X-CSE-ConnectionGUID: EP0tfpA2Sri4khoInrUlkw==
X-CSE-MsgGUID: A7wQCaqHRp65TYQEuuxLHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53780323"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="53780323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 13:38:11 -0800
X-CSE-ConnectionGUID: QPWSosUcR8GXShDSJc/YYQ==
X-CSE-MsgGUID: fPwO4tSLSAarkRVBMlbf0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="103079957"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2025 13:38:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUunW-000Dwh-1W;
	Mon, 06 Jan 2025 21:38:06 +0000
Date: Tue, 7 Jan 2025 05:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chukun Pan <amadeus@jmu.edu.cn>, Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] phy: rockchip: naneng-combphy: compatible with old
 DT for RK3568
Message-ID: <202501070458.qKEuL2HH-lkp@intel.com>
References: <20250106070000.605284-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106070000.605284-1-amadeus@jmu.edu.cn>

Hi Chukun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc6 next-20250106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chukun-Pan/phy-rockchip-naneng-combphy-compatible-with-old-DT-for-RK3568/20250106-150311
base:   linus/master
patch link:    https://lore.kernel.org/r/20250106070000.605284-1-amadeus%40jmu.edu.cn
patch subject: [PATCH 1/1] phy: rockchip: naneng-combphy: compatible with old DT for RK3568
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250107/202501070458.qKEuL2HH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070458.qKEuL2HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070458.qKEuL2HH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c: In function 'rockchip_combphy_parse_dt':
>> drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:314:32: error: passing argument 1 of 'ERR_PTR' makes integer from pointer without a cast [-Wint-conversion]
     314 |         if (IS_ERR(ERR_PTR(priv->phy_rst)))
         |                            ~~~~^~~~~~~~~
         |                                |
         |                                struct reset_control *
   In file included from include/linux/clk.h:12,
                    from drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:9:
   include/linux/err.h:39:48: note: expected 'long int' but argument is of type 'struct reset_control *'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                           ~~~~~^~~~~


vim +/ERR_PTR +314 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c

   274	
   275	static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy_priv *priv)
   276	{
   277		int i;
   278	
   279		priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
   280		if (priv->num_clks < 1)
   281			return -EINVAL;
   282	
   283		priv->refclk = NULL;
   284		for (i = 0; i < priv->num_clks; i++) {
   285			if (!strncmp(priv->clks[i].id, "ref", 3)) {
   286				priv->refclk = priv->clks[i].clk;
   287				break;
   288			}
   289		}
   290	
   291		if (!priv->refclk) {
   292			dev_err(dev, "no refclk found\n");
   293			return -EINVAL;
   294		}
   295	
   296		priv->pipe_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,pipe-grf");
   297		if (IS_ERR(priv->pipe_grf)) {
   298			dev_err(dev, "failed to find peri_ctrl pipe-grf regmap\n");
   299			return PTR_ERR(priv->pipe_grf);
   300		}
   301	
   302		priv->phy_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,pipe-phy-grf");
   303		if (IS_ERR(priv->phy_grf)) {
   304			dev_err(dev, "failed to find peri_ctrl pipe-phy-grf regmap\n");
   305			return PTR_ERR(priv->phy_grf);
   306		}
   307	
   308		priv->enable_ssc = device_property_present(dev, "rockchip,enable-ssc");
   309	
   310		priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
   311	
   312		priv->phy_rst = devm_reset_control_get(dev, "phy");
   313		/* fallback to old behaviour */
 > 314		if (IS_ERR(ERR_PTR(priv->phy_rst)))
   315			priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
   316	
   317		if (IS_ERR(priv->phy_rst))
   318			return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
   319	
   320		return 0;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
