Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904E13715
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 18:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689359583; x=1720895583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3M7NRymXgRS8PtpY7m6WRq9jfrZ25N3oooMGKmhFvK8=;
  b=SSiGGWwDAvVzKclK1qcxcbPjKhHFUhICPMBvAY9x1HI7PDOzzfBDhgWA
   hOqwG1kDhYjUmNdM7/oo7LZKtRH8r1WOuTrVRTShL69lzEn7Tjz9LDWdZ
   eiqDWhKyLFTfMYBQca16LPQkWp3JbaJ6Lhhf+XjFq1y8cjjeLwBJVwXdN
   M9vK6E+E3XdmsnNXSbPBxFoiNieje1/Grx/u0EUUU7AJUVhs3Q8EcArYQ
   pSgt5VxXJesqOGo/jlIeE6COPXE04jjy5l0DjLq9MrR3DtdvC4TSJPwyS
   RKq/qEtrnYuaHXtzxDvoK0zIPfW7N+BREb1vZo0vm0BsW+aBFMDM5Itpb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345857836"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="345857836"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 11:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="896499900"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="896499900"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2023 11:32:41 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKNar-0007cj-07;
	Fri, 14 Jul 2023 18:32:41 +0000
Date: Sat, 15 Jul 2023 02:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-mt7988 40/41]
 drivers/net/ethernet/mediatek/mtk_eth_path.c:151:17: error: 'mac_id'
 undeclared; did you mean 'tca_id'?
Message-ID: <202307150249.7u4GHEdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-mt7988
head:   65e5860b8822c6a0ef1eb32d636542730e00c0bd
commit: 78db15b7511b331c054d611f1136a3a27f476d8c [40/41] net: ethernet: mediatek: fix 'mac_id' set but not used
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230715/202307150249.7u4GHEdP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150249.7u4GHEdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150249.7u4GHEdP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_path.c: In function 'set_mux_gmac2_to_2p5gphy':
>> drivers/net/ethernet/mediatek/mtk_eth_path.c:151:17: error: 'mac_id' undeclared (first use in this function); did you mean 'tca_id'?
     151 |                 mac_id = MTK_GMAC2_ID;
         |                 ^~~~~~
         |                 tca_id
   drivers/net/ethernet/mediatek/mtk_eth_path.c:151:17: note: each undeclared identifier is reported only once for each function it appears in

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


vim +151 drivers/net/ethernet/mediatek/mtk_eth_path.c

7093f9d80c7cb8 Sean Wang        2019-06-01  139  
cf239f745f0471 Daniel Golle     2023-06-10  140  static int set_mux_gmac2_to_2p5gphy(struct mtk_eth *eth, u64 path)
cf239f745f0471 Daniel Golle     2023-06-10  141  {
cf239f745f0471 Daniel Golle     2023-06-10  142  	unsigned int val = 0;
cf239f745f0471 Daniel Golle     2023-06-10  143  	bool updated = true;
78db15b7511b33 Frank Wunderlich 2023-07-14  144  	//int mac_id = 0;
cf239f745f0471 Daniel Golle     2023-06-10  145  
cf239f745f0471 Daniel Golle     2023-06-10  146  	regmap_read(eth->ethsys, ETHSYS_SYSCFG0, &val);
cf239f745f0471 Daniel Golle     2023-06-10  147  
cf239f745f0471 Daniel Golle     2023-06-10  148  	switch (path) {
cf239f745f0471 Daniel Golle     2023-06-10  149  	case MTK_ETH_PATH_GMAC2_2P5GPHY:
cf239f745f0471 Daniel Golle     2023-06-10  150  		val &= ~(u32)SYSCFG0_SGMII_GMAC2_V2;
cf239f745f0471 Daniel Golle     2023-06-10 @151  		mac_id = MTK_GMAC2_ID;
cf239f745f0471 Daniel Golle     2023-06-10  152  		break;
cf239f745f0471 Daniel Golle     2023-06-10  153  	default:
cf239f745f0471 Daniel Golle     2023-06-10  154  		updated = false;
cf239f745f0471 Daniel Golle     2023-06-10  155  		break;
cf239f745f0471 Daniel Golle     2023-06-10  156  	};
cf239f745f0471 Daniel Golle     2023-06-10  157  
cf239f745f0471 Daniel Golle     2023-06-10  158  	if (updated)
cf239f745f0471 Daniel Golle     2023-06-10  159  		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
cf239f745f0471 Daniel Golle     2023-06-10  160  				   SYSCFG0_SGMII_MASK, val);
cf239f745f0471 Daniel Golle     2023-06-10  161  
cf239f745f0471 Daniel Golle     2023-06-10  162  	return 0;
cf239f745f0471 Daniel Golle     2023-06-10  163  }
cf239f745f0471 Daniel Golle     2023-06-10  164  

:::::: The code at line 151 was first introduced by commit
:::::: cf239f745f04716b14cdbd89c46679fb426408df net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
