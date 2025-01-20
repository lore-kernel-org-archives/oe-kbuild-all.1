Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738E2033A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 01:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737336447; cv=none; b=KU6+XUJcu8kCnZT+Nv2Ru+CAPOPihSfukx4/0xsE15mRuzIU44atE6QbiiF+/aUNShr6SATpJ1vVZT+JTtgPqlvme87U5/a492H3IJfwHS4PZw/HLJ1i+Y/g1ENGRXh3m/UKkqh8Th97kIC6jpNZw/djVtQp0TnPxmY0WO6esXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737336447; c=relaxed/simple;
	bh=Euqtuiuj5c54JfEASRbHqYGVpWv4nlN3ZfWg5m6zFPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdSpmMl5Dz4ykMT5ghm/Dw/0h6Ihnp+oLvxqwLI2lxun57LbaLK7cinf596KPbYktTjziZwAOjZmoLDBsW9A2GJ16i6CxHYx/2GNCakCXRYjE0caZbSsmgM1kqD6C2JgkFvwyVFQur5WVCLV/N0+S6KiantETuZj9XXW4wdWirg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmbUj4Kh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmbUj4Kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737336446; x=1768872446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Euqtuiuj5c54JfEASRbHqYGVpWv4nlN3ZfWg5m6zFPk=;
  b=UmbUj4KhNp0+M1jGJwBhmK602P7wtvTEZE+w8FgRy8lxPCyvoeg1oy5p
   dUISRweH5+wV2+z8orefGINp/6qPIQ0FJeir2y4zaj8S+xSmwPuSFkOvK
   7gT2iW67wvcDDBXQ5YUKvy5e2WtdNo08o+po1sx15Eh8vf/SKJ7Iy6VjS
   2xGJRQ9dUp0jOI6tCP661b+ElNdio6F4YVBBNhh4WWJCjeOWi1pIiRshh
   BzOVm6BhkfTx7crUdDA+mAq76J3huaUpnKtpKo5arF7VxlcypxNyqXcOU
   JwEe9ZPqP2EKpDDZs+BlxsASKUjtAcS7r9823xWfyaMWd4S5/JcEv+wVe
   A==;
X-CSE-ConnectionGUID: ysULb2ROTpiI9SLjzaqPbQ==
X-CSE-MsgGUID: uzmdSIUFQjaK/uVmL3vw1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="55095581"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="55095581"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 17:27:26 -0800
X-CSE-ConnectionGUID: /BGREJdnQ9ix2eSj7QCyRw==
X-CSE-MsgGUID: EICot2mnTmWUhTFbSVQpxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106140452"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jan 2025 17:27:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZgZV-000W1L-2A;
	Mon, 20 Jan 2025 01:27:21 +0000
Date: Mon, 20 Jan 2025 09:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 913/9563]
 drivers/phy/mediatek/phy-mtk-hdmi.c:93:undefined reference to
 `devm_regulator_register'
Message-ID: <202501200933.jroR9FlN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 49393b2da1cd5b0a6859693369b4fb27df59d3e2 [913/9563] phy: mediatek: phy-mtk-hdmi: Register PHY provided regulator
config: csky-randconfig-r131-20250119 (https://download.01.org/0day-ci/archive/20250120/202501200933.jroR9FlN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250120/202501200933.jroR9FlN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200933.jroR9FlN-lkp@intel.com/

Note: the linux-next/master HEAD 0907e7fb35756464aa34c35d6abb02998418164b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi.o: in function `mtk_hdmi_phy_register_regulators':
>> drivers/phy/mediatek/phy-mtk-hdmi.c:93:(.text.unlikely+0x42): undefined reference to `devm_regulator_register'
>> csky-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi.c:98:(.text.unlikely+0x70): undefined reference to `devm_regulator_register'
   csky-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_is_enabled':
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:503:(.text+0x248): undefined reference to `rdev_get_drvdata'
   csky-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_disable':
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:494:(.text+0x270): undefined reference to `rdev_get_drvdata'
   csky-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_phy_pwr5v_enable':
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:485:(.text+0x2a8): undefined reference to `rdev_get_drvdata'
   csky-linux-ld: drivers/phy/mediatek/phy-mtk-hdmi-mt8195.o: in function `mtk_hdmi_pll_set_hw':
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:114:(.text+0x45c): undefined reference to `rdev_get_drvdata'


vim +93 drivers/phy/mediatek/phy-mtk-hdmi.c

    77	
    78	static int mtk_hdmi_phy_register_regulators(struct mtk_hdmi_phy *hdmi_phy)
    79	{
    80		const struct regulator_desc *vreg_desc = hdmi_phy->conf->hdmi_phy_regulator_desc;
    81		const struct regulator_init_data vreg_init_data = {
    82			.constraints = {
    83				.valid_ops_mask = REGULATOR_CHANGE_STATUS,
    84			}
    85		};
    86		struct regulator_config vreg_config = {
    87			.dev = hdmi_phy->dev,
    88			.driver_data = hdmi_phy,
    89			.init_data = &vreg_init_data,
    90			.of_node = hdmi_phy->dev->of_node
    91		};
    92	
  > 93		hdmi_phy->rdev = devm_regulator_register(hdmi_phy->dev, vreg_desc, &vreg_config);
    94		if (IS_ERR(hdmi_phy->rdev))
    95			return PTR_ERR(hdmi_phy->rdev);
    96	
    97		return 0;
  > 98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
