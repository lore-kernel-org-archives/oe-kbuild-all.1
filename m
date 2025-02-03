Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C3211466
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 23:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738624420; cv=none; b=YhKLjeiPm3vIhAy6y8gOg+INjLUmmIMMgVRwhzkRWc59slu5NKVyZ3kb5P1aB+8SHsNnikIzmrUI6fZuKObPcNV+aaoIrx4GpDROIlg1wBRJArff3IBhGZH/NGlA/GT0BGXIj4Fw7WQKFkkDQOxLLcvKHIYdGjSI4zV3yWxdNro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738624420; c=relaxed/simple;
	bh=F/dGODo2LZPYkmXU1r7JvCgeekALOO4FwmlDu1IR9VM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pEIrQVp7gvHYOclqjdOFg7cUQVrRnVMMxCxx8+jlzZyAejKt0cwliexwrWfx2H8bxHBXtTspIEX+gncB35mAvTQdoczSxW225T2PMke2ZncSqzC5g29g0qG6k3wrcnXMQ8Yjl1aS5yUegk5w4DJBK/9OAPP86VKxqciebe/rDC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lt5nOOQw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lt5nOOQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738624418; x=1770160418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/dGODo2LZPYkmXU1r7JvCgeekALOO4FwmlDu1IR9VM=;
  b=Lt5nOOQwsZvh3RI4I75hTJ39clCnTe+TrOnwsGm0FxF8aVHzyyr8rUlw
   KdN9UZPc+KRGxs3kwgRp5y5G8g+uavocnr9H6PFmfO3xEQf2MVhYtEyz/
   Tams/i1xa7OwlHyFWi721YHHtWPgBFOYebCosiAUjoJplP2qocR1wWYMZ
   YYGAVcdrUenNvvaF5RcGqvf2edIuss8mlZLW1/HdMgrDuHAowuS2WGNFc
   ClFckcpmuMfDAb3cUEirHbQ6mrvLtHT6xiQs9I8x2sZLmdB87pyjQCF/b
   ACwFKSfXvA5V7v1b284kuHwfkNvqQhS38dnYt3Wm1szCwrvXY9iQ3IBM8
   Q==;
X-CSE-ConnectionGUID: GZmXVRg1QlSEvQtK1z+17Q==
X-CSE-MsgGUID: CdC1judXRRehGJJA9h6Pqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38366057"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="38366057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 15:13:37 -0800
X-CSE-ConnectionGUID: Vgy7O2LLQXSaGMlovY5nYg==
X-CSE-MsgGUID: d3mWUu4rTX+KAwGAQvtnjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141266404"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2025 15:13:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf5dG-000rfJ-0T;
	Mon, 03 Feb 2025 23:13:34 +0000
Date: Tue, 4 Feb 2025 07:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 169/169]
 drivers/phy/mediatek/phy-mtk-edp.c:166:5: warning: no previous prototype for
 function 'mtk_dp_phy_configure'
Message-ID: <202502040707.gMX3UeaV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: 044955e3eece16d9c50e1a693c197e4193399d72 [169/169] CHROMIUM: drm/mediatek: add eDP driver for mt8196
config: i386-buildonly-randconfig-005-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040707.gMX3UeaV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040707.gMX3UeaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040707.gMX3UeaV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/mediatek/phy-mtk-edp.c:166:5: warning: no previous prototype for function 'mtk_dp_phy_configure' [-Wmissing-prototypes]
     166 | int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
         |     ^
   drivers/phy/mediatek/phy-mtk-edp.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     166 | int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
         | ^
         | static 
   1 warning generated.
--
>> drivers/gpu/drm/mediatek/mtk_dvo.c:609:6: warning: no previous prototype for function 'mtk_dvo_start' [-Wmissing-prototypes]
     609 | void mtk_dvo_start(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:609:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     609 | void mtk_dvo_start(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_dvo.c:616:6: warning: no previous prototype for function 'mtk_dvo_stop' [-Wmissing-prototypes]
     616 | void mtk_dvo_stop(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:616:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     616 | void mtk_dvo_stop(struct device *dev)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/gpu/drm/mediatek/mtk_dvo.c:192: warning: Function parameter or member 'out_np_sel' not described in 'mtk_dvo_conf'
>> drivers/gpu/drm/mediatek/mtk_dvo.c:192: warning: Function parameter or member 'has_commit' not described in 'mtk_dvo_conf'


vim +/mtk_dp_phy_configure +166 drivers/phy/mediatek/phy-mtk-edp.c

   165	
 > 166	int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
   167	{
   168		struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
   169		u32 val;
   170	
   171		if (opts->dp.set_rate) {
   172			switch (opts->dp.link_rate) {
   173			case 1620:
   174				val = BIT_RATE_RBR;
   175				break;
   176			case 2700:
   177				val = BIT_RATE_HBR;
   178				break;
   179			case 5400:
   180				val = BIT_RATE_HBR2;
   181				break;
   182			case 8100:
   183				val = BIT_RATE_HBR3;
   184				break;
   185			default:
   186				dev_err(&phy->dev,
   187					"Implementation error, unknown linkrate %x\n",
   188					opts->dp.link_rate);
   189				return -EINVAL;
   190			}
   191			regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
   192		}
   193	
   194		if (opts->dp.set_lanes) {
   195			for (val = 0; val < 4; val++) {
   196				regmap_update_bits(dp_phy->regs, DP_PHY_DIG_TX_CTL_0,
   197						   ((1 << (val + 1)) - 1),
   198						   TX_LN_EN_FLDMASK);
   199			}
   200		}
   201	
   202		if (opts->dp.set_voltages) {
   203			switch (opts->dp.lanes) {
   204			case DPTX_LANE_COUNT1:
   205				regmap_update_bits(dp_phy->regs, PHYD_DIG_LAN0_OFFSET +
   206						   DRIVING_FORCE,
   207						   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
   208						   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
   209						   opts->dp.voltage[DPTX_LANE0] << 1 |
   210						   opts->dp.pre[DPTX_LANE0] << 3);
   211			break;
   212			case DPTX_LANE_COUNT2:
   213				regmap_update_bits(dp_phy->regs, PHYD_DIG_LAN0_OFFSET +
   214						   DRIVING_FORCE,
   215						   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
   216						   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
   217						   opts->dp.voltage[DPTX_LANE0] << 1 |
   218						   opts->dp.pre[DPTX_LANE0] << 3);
   219				regmap_update_bits(dp_phy->regs, PHYD_DIG_LAN1_OFFSET +
   220						   DRIVING_FORCE,
   221						   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
   222						   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
   223						   opts->dp.voltage[DPTX_LANE1] << 1 |
   224						   opts->dp.pre[DPTX_LANE1] << 3);
   225			break;
   226			case DPTX_LANE_COUNT4:
   227				regmap_update_bits(dp_phy->regs, PHYD_DIG_LAN0_OFFSET +
   228						   DRIVING_FORCE,
   229						   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
   230						   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
   231						   opts->dp.voltage[DPTX_LANE0] << 1 |
   232						   opts->dp.pre[DPTX_LANE0] << 3);
   233				regmap_update_bits(dp_phy->regs, PHYD_DIG_LAN1_OFFSET +
   234						   DRIVING_FORCE,
   235						   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
   236						   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
   237						   opts->dp.voltage[DPTX_LANE1] << 1 |
   238						   opts->dp.pre[DPTX_LANE1] << 3);
   239				regmap_update_bits(dp_phy->regs, PHYD_DIG_LAN2_OFFSET +
   240						   DRIVING_FORCE,
   241						   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
   242						   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
   243						   opts->dp.voltage[DPTX_LANE2] << 1 |
   244						   opts->dp.pre[DPTX_LANE2] << 3);
   245				regmap_update_bits(dp_phy->regs, PHYD_DIG_LAN3_OFFSET +
   246						   DRIVING_FORCE,
   247						   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
   248						   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
   249						   opts->dp.voltage[DPTX_LANE3] << 1 |
   250						   opts->dp.pre[DPTX_LANE3] << 3);
   251			break;
   252			default:
   253				dev_err(&phy->dev, "Wrong lanes config: %x\n",
   254					opts->dp.lanes);
   255				return -EINVAL;
   256			}
   257		}
   258	
   259		regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
   260				   TPLL_SSC_EN, opts->dp.ssc ? 0 : TPLL_SSC_EN);
   261	
   262		return 0;
   263	}
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
