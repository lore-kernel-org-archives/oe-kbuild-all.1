Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47F9F4F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TP+tODNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697318495; x=1728854495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ue4FGaAorf3YiZn2Nc9opXnHASAIoCWFXk9ejlzPY0s=;
  b=TP+tODNB2weHjYDGt9TGcQCWdhPTaINnT80gXyNCCnG1N/COf3ma0k2k
   P17hjNaSoznenFrs/LXson438JmziUV4arDKuNmJp6IpQ5Bz/I9Canqt6
   DrBs/pvDTDiE0W6L9ZixgfmEvyh8MUscaU9AF9kzd9AiiYECqss3KxvoT
   Dan0SQoEUrgcdvuJhumnX018Xr2UnPbcGLvkxQcjxded8RBSPVtuT42ht
   fgsB42J22CIWPWFk00JQp+gZxoBDtJsrZWCRQTJcGHu0f2ABFGuLwbntp
   08Mi4GwJeLO2naH95a/bQ3UhLfdybEBuC+/U9wHHXbcmLyyyGgd+jveE/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384220415"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384220415"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 14:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821079369"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="821079369"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Oct 2023 14:21:33 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrm4h-0006gF-2F;
	Sat, 14 Oct 2023 21:21:31 +0000
Date: Sun, 15 Oct 2023 05:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1498/30000] drivers/clk/imx/clk-scu.c:795:20:
 warning: no previous prototype for 'imx_clk_scu_suspend'
Message-ID: <202310150533.3VgWhymU-lkp@intel.com>
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
commit: 19d97bb5327f5ff4b09a29d2899e3757c2cd9c94 [1498/30000] clk: imx: scu: add suspend/resume support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231015/202310150533.3VgWhymU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150533.3VgWhymU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150533.3VgWhymU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-scu.c:795:20: warning: no previous prototype for 'imx_clk_scu_suspend' [-Wmissing-prototypes]
     795 | int __maybe_unused imx_clk_scu_suspend(struct device *dev)
         |                    ^~~~~~~~~~~~~~~~~~~
>> drivers/clk/imx/clk-scu.c:811:20: warning: no previous prototype for 'imx_clk_scu_resume' [-Wmissing-prototypes]
     811 | int __maybe_unused imx_clk_scu_resume(struct device *dev)
         |                    ^~~~~~~~~~~~~~~~~~


vim +/imx_clk_scu_suspend +795 drivers/clk/imx/clk-scu.c

   794	
 > 795	int __maybe_unused imx_clk_scu_suspend(struct device *dev)
   796	{
   797		struct clk_scu *clk = dev_get_drvdata(dev);
   798	
   799		clk->rate = clk_hw_get_rate(&clk->hw);
   800		clk->is_enabled = clk_hw_is_enabled(&clk->hw);
   801	
   802		if (clk->rate)
   803			dev_dbg(dev, "save rate %d\n", clk->rate);
   804	
   805		if (clk->is_enabled)
   806			dev_dbg(dev, "save enabled state\n");
   807	
   808		return 0;
   809	}
   810	
 > 811	int __maybe_unused imx_clk_scu_resume(struct device *dev)
   812	{
   813		struct clk_scu *clk = dev_get_drvdata(dev);
   814		int ret = 0;
   815	
   816		if (clk->rate) {
   817			ret = clk_scu_set_rate(&clk->hw, clk->rate, 0);
   818			dev_dbg(dev, "restore rate %d %s\n", clk->rate,
   819				!ret ? "success" : "failed");
   820		}
   821	
   822		if (clk->is_enabled) {
   823			ret = clk_scu_prepare(&clk->hw);
   824			dev_dbg(dev, "restore enabled state %s\n",
   825				!ret ? "success" : "failed");
   826		}
   827	
   828		return ret;
   829	}
   830	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
