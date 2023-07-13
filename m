Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF781ED53
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689279311; x=1720815311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7zlbAb/thk8RiIlwazOU7K/EMZLvMsUley1/selzJoc=;
  b=K1Mx7pv0FauvOaONySZbMGcUPXi4/bFqaVyGaypbl1pqQxPIMPb35WXG
   bMCpO8ssf1IGWrAKT0HbEHJc3J4zzwCdGi/wf0QByBW7zp0UWWYtZx2CT
   uDl+EORLYZUoaGd6yWbctKmES7Tm6oZDOvm0wNZjNRUQcT3n8Z/Cyrzz+
   I7HnHKj2uv7Pq3o7ONXEJqmAu9zF6293JcyPRWno9wXehPDdQ1AMzrV+o
   AbzDf4BdGR4zQAI2eQ8FRtVOTP5WC0lepifFuA61VfeBV1KUWeHEzCTxt
   tQ/UiReMxIhCnYKMyd/zIP4Y0WoH0GNTgVlED0a1fJsTSJREZvDbBj0hr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345623022"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="345623022"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 13:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="672413747"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="672413747"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jul 2023 13:15:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK2iR-0006sn-2z;
	Thu, 13 Jul 2023 20:15:07 +0000
Date: Fri, 14 Jul 2023 04:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-mt7988 18/33]
 drivers/clk/mediatek/clk-mt7988-eth.c:128:25: error:
 'of_match_clk_mt7988_eth' undeclared here (not in a function); did you mean
 'of_match_clk_mt7986_eth'?
Message-ID: <202307140450.aNKODOXf-lkp@intel.com>
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
commit: 82bd5fad3e801221659f56b64e7dc8e32a526f46 [18/33] clk: mediatek: add drivers for MT7988 SoC
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230714/202307140450.aNKODOXf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140450.aNKODOXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140450.aNKODOXf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from include/linux/of_device.h:5,
                    from drivers/clk/mediatek/clk-mt7988-eth.c:11:
>> drivers/clk/mediatek/clk-mt7988-eth.c:128:25: error: 'of_match_clk_mt7988_eth' undeclared here (not in a function); did you mean 'of_match_clk_mt7986_eth'?
     128 | MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__of_match_clk_mt7988_eth_device_table' aliased to undefined symbol 'of_match_clk_mt7988_eth'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/clk/mediatek/clk-mt7988-eth.c:128:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     128 | MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
         | ^~~~~~~~~~~~~~~~~~~

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


vim +128 drivers/clk/mediatek/clk-mt7988-eth.c

  > 11	#include <linux/of_device.h>
    12	#include <linux/platform_device.h>
    13	#include "clk-mtk.h"
    14	#include "clk-gate.h"
    15	#include <dt-bindings/clock/mediatek,mt7988-clk.h>
    16	
    17	static const struct mtk_gate_regs ethdma_cg_regs = {
    18		.set_ofs = 0x30,
    19		.clr_ofs = 0x30,
    20		.sta_ofs = 0x30,
    21	};
    22	
    23	#define GATE_ETHDMA(_id, _name, _parent, _shift)                              \
    24		{                                                                     \
    25			.id = _id, .name = _name, .parent_name = _parent,             \
    26			.regs = &ethdma_cg_regs, .shift = _shift,                     \
    27			.ops = &mtk_clk_gate_ops_no_setclr_inv,                       \
    28		}
    29	
    30	static const struct mtk_gate ethdma_clks[] = {
    31		GATE_ETHDMA(CLK_ETHDMA_XGP1_EN, "ethdma_xgp1_en", "top_xtal", 0),
    32		GATE_ETHDMA(CLK_ETHDMA_XGP2_EN, "ethdma_xgp2_en", "top_xtal", 1),
    33		GATE_ETHDMA(CLK_ETHDMA_XGP3_EN, "ethdma_xgp3_en", "top_xtal", 2),
    34		GATE_ETHDMA(CLK_ETHDMA_FE_EN, "ethdma_fe_en", "netsys_2x_sel", 6),
    35		GATE_ETHDMA(CLK_ETHDMA_GP2_EN, "ethdma_gp2_en", "top_xtal", 7),
    36		GATE_ETHDMA(CLK_ETHDMA_GP1_EN, "ethdma_gp1_en", "top_xtal", 8),
    37		GATE_ETHDMA(CLK_ETHDMA_GP3_EN, "ethdma_gp3_en", "top_xtal", 10),
    38		GATE_ETHDMA(CLK_ETHDMA_ESW_EN, "ethdma_esw_en", "netsys_gsw_sel", 16),
    39		GATE_ETHDMA(CLK_ETHDMA_CRYPT0_EN, "ethdma_crypt0_en", "eip197_sel",
    40			    29),
    41	};
    42	
    43	static const struct mtk_clk_desc ethdma_desc = {
    44		.clks = ethdma_clks,
    45		.num_clks = ARRAY_SIZE(ethdma_clks),
    46	};
    47	
    48	static const struct mtk_gate_regs sgmii0_cg_regs = {
    49		.set_ofs = 0xe4,
    50		.clr_ofs = 0xe4,
    51		.sta_ofs = 0xe4,
    52	};
    53	
    54	#define GATE_SGMII0(_id, _name, _parent, _shift)                              \
    55		{                                                                     \
    56			.id = _id, .name = _name, .parent_name = _parent,             \
    57			.regs = &sgmii0_cg_regs, .shift = _shift,                     \
    58			.ops = &mtk_clk_gate_ops_no_setclr_inv,                       \
    59		}
    60	
    61	static const struct mtk_gate sgmii0_clks[] = {
    62		GATE_SGMII0(CLK_SGM0_TX_EN, "sgm0_tx_en", "top_xtal", 2),
    63		GATE_SGMII0(CLK_SGM0_RX_EN, "sgm0_rx_en", "top_xtal", 3),
    64	};
    65	
    66	static const struct mtk_clk_desc sgmii0_desc = {
    67		.clks = sgmii0_clks,
    68		.num_clks = ARRAY_SIZE(sgmii0_clks),
    69	};
    70	
    71	static const struct mtk_gate_regs sgmii1_cg_regs = {
    72		.set_ofs = 0xe4,
    73		.clr_ofs = 0xe4,
    74		.sta_ofs = 0xe4,
    75	};
    76	
    77	#define GATE_SGMII1(_id, _name, _parent, _shift)                              \
    78		{                                                                     \
    79			.id = _id, .name = _name, .parent_name = _parent,             \
    80			.regs = &sgmii1_cg_regs, .shift = _shift,                     \
    81			.ops = &mtk_clk_gate_ops_no_setclr_inv,                       \
    82		}
    83	
    84	static const struct mtk_gate sgmii1_clks[] = {
    85		GATE_SGMII1(CLK_SGM1_TX_EN, "sgm1_tx_en", "top_xtal", 2),
    86		GATE_SGMII1(CLK_SGM1_RX_EN, "sgm1_rx_en", "top_xtal", 3),
    87	};
    88	
    89	static const struct mtk_clk_desc sgmii1_desc = {
    90		.clks = sgmii1_clks,
    91		.num_clks = ARRAY_SIZE(sgmii1_clks),
    92	};
    93	
    94	static const struct mtk_gate_regs ethwarp_cg_regs = {
    95		.set_ofs = 0x14,
    96		.clr_ofs = 0x14,
    97		.sta_ofs = 0x14,
    98	};
    99	
   100	#define GATE_ETHWARP(_id, _name, _parent, _shift)                             \
   101		{                                                                     \
   102			.id = _id, .name = _name, .parent_name = _parent,             \
   103			.regs = &ethwarp_cg_regs, .shift = _shift,                    \
   104			.ops = &mtk_clk_gate_ops_no_setclr_inv,                       \
   105		}
   106	
   107	static const struct mtk_gate ethwarp_clks[] = {
   108		GATE_ETHWARP(CLK_ETHWARP_WOCPU2_EN, "ethwarp_wocpu2_en",
   109			     "netsys_mcu_sel", 13),
   110		GATE_ETHWARP(CLK_ETHWARP_WOCPU1_EN, "ethwarp_wocpu1_en",
   111			     "netsys_mcu_sel", 14),
   112		GATE_ETHWARP(CLK_ETHWARP_WOCPU0_EN, "ethwarp_wocpu0_en",
   113			     "netsys_mcu_sel", 15),
   114	};
   115	
   116	static const struct mtk_clk_desc ethwarp_desc = {
   117		.clks = ethwarp_clks,
   118		.num_clks = ARRAY_SIZE(ethwarp_clks),
   119	};
   120	
   121	static const struct of_device_id of_match_clk_mt7986_eth[] = {
   122		{ .compatible = "mediatek,mt7988-ethsys", .data = &ethdma_desc },
   123		{ .compatible = "mediatek,mt7988-sgmiisys_0", .data = &sgmii0_desc },
   124		{ .compatible = "mediatek,mt7988-sgmiisys_1", .data = &sgmii1_desc },
   125		{ .compatible = "mediatek,mt7988-ethwarp", .data = &ethwarp_desc },
   126		{ /* sentinel */ }
   127	};
 > 128	MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
