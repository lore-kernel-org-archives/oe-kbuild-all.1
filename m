Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B3C7E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 00:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEO551lB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698107967; x=1729643967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=077RRm4des7TSVckJL4PY5E97TxrfcMy4N8acRjl9Mc=;
  b=eEO551lBmg3d7jIyDCcn9+ypRnJopm+rUpa2EE8XoQxSGQYCLTa+yUIW
   /R/k742WcRQRRJm7g50gnatyj4dW4kN3fOwptMzWuI6b1vDBJpe5xe7gy
   PUvEJxW0JFozM4+j7Guv5zoE6RhAbV87VR7njENYhXP3O5sIZU+HZgmXH
   e4FaM7C+WtwGcknIvyPoeokNe1qpZsHuXOI1cR1omGlW8OS9Iq2Nft8DA
   qD1YTBKqySvWwxsxEO+FiRBvMaLyZCPdHR9RtgFWI2Ea1uKW1lQIrxg8R
   Awo8rh5Wqu3uEEfTxvi/PNkV/AsKBE4l7BYnyqze+dZAngd8X+Twh/crC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="384154043"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="384154043"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="793310726"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="793310726"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Oct 2023 17:39:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv5S7-0007PJ-1i;
	Tue, 24 Oct 2023 00:39:23 +0000
Date: Tue, 24 Oct 2023 08:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 100/30000] sound/soc/fsl/fsl_spdif.c:765:37:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202310240829.0Xb56XJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 960f3f4848db6e2b0b83407e053dd0fed920e60a [100/30000] MLK-19154-3: ASoC: fsl_spdif: Add support for PLL switch at runtime.
config: i386-randconfig-062-20231021 (https://download.01.org/0day-ci/archive/20231024/202310240829.0Xb56XJU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240829.0Xb56XJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240829.0Xb56XJU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_spdif.c:765:37: sparse: sparse: Using plain integer as NULL pointer
   sound/soc/fsl/fsl_spdif.c:765:48: sparse: sparse: Using plain integer as NULL pointer

vim +765 sound/soc/fsl/fsl_spdif.c

   758	
   759	static int fsl_spdif_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
   760			int clk_id, unsigned int freq, int dir)
   761	{
   762		struct fsl_spdif_priv *data = snd_soc_dai_get_drvdata(cpu_dai);
   763		struct platform_device *pdev = data->pdev;
   764		struct device *dev = &pdev->dev;
 > 765		struct clk *clk, *p, *pll = 0, *npll = 0;
   766		u64 ratio = freq;
   767		int ret, i;
   768	
   769		if (dir != SND_SOC_CLOCK_OUT || freq == 0 || clk_id != STC_TXCLK_SPDIF_ROOT)
   770			return 0;
   771	
   772		if (data->pll8k_clk == NULL || data->pll11k_clk == NULL)
   773			return 0;
   774	
   775		clk = data->txclk[clk_id];
   776		if (IS_ERR_OR_NULL(clk)) {
   777			dev_err(dev, "no rxtx%d clock in devicetree\n", clk_id);
   778			return PTR_ERR(clk);
   779		}
   780	
   781		p = clk;
   782		while (p && data->pll8k_clk && data->pll11k_clk) {
   783			struct clk *pp = clk_get_parent(p);
   784	
   785			if (clk_is_match(pp, data->pll8k_clk) ||
   786			    clk_is_match(pp, data->pll11k_clk)) {
   787				pll = pp;
   788				break;
   789			}
   790			p = pp;
   791		}
   792	
   793		if (pll) {
   794			npll = (do_div(ratio, 8000) ? data->pll11k_clk : data->pll8k_clk);
   795			if (!clk_is_match(pll, npll)) {
   796				if (!data->streams) {
   797					ret = clk_set_parent(p, npll);
   798					if (ret < 0)
   799						dev_warn(cpu_dai->dev,
   800							"failed to set parent %s: %d\n",
   801							__clk_get_name(npll), ret);
   802				} else {
   803					dev_err(cpu_dai->dev,
   804						"PLL %s is in use by a running stream.\n",
   805						__clk_get_name(pll));
   806					return -EINVAL;
   807				}
   808			}
   809		}
   810	
   811		ret = clk_set_rate(clk, freq);
   812		if (ret < 0) {
   813			dev_err(cpu_dai->dev, "failed to set clock rate (%u): %d\n",
   814				freq, ret);
   815			return ret;
   816		}
   817	
   818		for (i = 0; i < SPDIF_TXRATE_MAX; i++) {
   819			ret = fsl_spdif_probe_txclk(data, i);
   820			if (ret)
   821				return ret;
   822		}
   823	
   824		return 0;
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
