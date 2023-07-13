Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E51F191
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689276311; x=1720812311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWiNa++piRsM0Ai4AVnrXmiQrxy1kVEsF+brXa6Pg54=;
  b=ZN3ZQb+Clo3kmnt6hEYy2MTLoDW7fz/yoIRqFhgrxZ9O2i5UujtMlwAu
   OR2pdjKDjQoLgK27IGFyO39fONonhztMbMveiby/dXctg9j/zXEBTBpBz
   +QjnkoW8VfmEbphgoJxyvPKvHn6waIDo9B7T8mSBnsmgS1XA7rsDXgLqm
   GkV+5SZHynJfzlUYtZ3KFg6880GS9TAUGrgagK9ZA0jniC+GNOwaLLkcw
   wu90UkBieJw6PfOXUCst+TqeMwmsFEykfCuBjVy/jX6pwJiUGpWFcNCsz
   56Dv3sDq8bKCeTRsDd6sVG1jr4jnRGIrMvK2sZ3js06U5mdfe9dwdg0uJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429060811"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="429060811"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 12:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812143031"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="812143031"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2023 12:25:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK1w3-0006rv-15;
	Thu, 13 Jul 2023 19:25:07 +0000
Date: Fri, 14 Jul 2023 03:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-mt7988 14/33]
 drivers/net/ethernet/mediatek/mtk_eth_path.c:144:13: warning: variable
 'mac_id' set but not used
Message-ID: <202307140340.Lv3hGfQj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-mt7988
head:   3668419fdc6132f0433d29c7a4c35678c2be50a7
commit: cf239f745f04716b14cdbd89c46679fb426408df [14/33] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230714/202307140340.Lv3hGfQj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140340.Lv3hGfQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140340.Lv3hGfQj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_path.c: In function 'set_mux_gmac2_to_2p5gphy':
>> drivers/net/ethernet/mediatek/mtk_eth_path.c:144:13: warning: variable 'mac_id' set but not used [-Wunused-but-set-variable]
     144 |         int mac_id = 0;
         |             ^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SM_GCC_8350
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_VIDEOCC_8350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8450
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8550
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]


vim +/mac_id +144 drivers/net/ethernet/mediatek/mtk_eth_path.c

   139	
   140	static int set_mux_gmac2_to_2p5gphy(struct mtk_eth *eth, u64 path)
   141	{
   142		unsigned int val = 0;
   143		bool updated = true;
 > 144		int mac_id = 0;
   145	
   146		regmap_read(eth->ethsys, ETHSYS_SYSCFG0, &val);
   147	
   148		switch (path) {
   149		case MTK_ETH_PATH_GMAC2_2P5GPHY:
   150			val &= ~(u32)SYSCFG0_SGMII_GMAC2_V2;
   151			mac_id = MTK_GMAC2_ID;
   152			break;
   153		default:
   154			updated = false;
   155			break;
   156		};
   157	
   158		if (updated)
   159			regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
   160					   SYSCFG0_SGMII_MASK, val);
   161	
   162		return 0;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
