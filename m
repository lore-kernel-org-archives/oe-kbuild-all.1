Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AB01D5ADD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 19:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736967696; cv=none; b=Bh0X/Xp8XegwnSsGu390AM777kroj3D2EYDfsXg1nVOIrbgPdnRKQcr89YG2ytWM9N/U9ofGnOHGUeFE4L+HDrNysicK2PLeCYmKgU3QdQQoTECSSPGY6m5zRGuOe6zyPgRDNcCfKfRiNK+U4atZ7SNnvK5pJwy8Tv3k9g6ZlCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736967696; c=relaxed/simple;
	bh=COSoahmhXFhF5pb/vKsqw0yCcArFBTiBRi43a3IDW64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=esVcgpLm9v94vpQuU9dbgNeD3vRwUFtJ04TU7hmPDeVlKesKAGgXZS3VPWqoRsyImSUxEgbG3Hd7a2fZIEHCN9ZphriwqthlkZzwLncW7+wbp2YyXDzNUzyTBi9z5jMsCcY8Wfs0mGcwuaewIyN2xQxaVHfNG3lTM80ptziFVsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Chv0mNeX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Chv0mNeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736967695; x=1768503695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COSoahmhXFhF5pb/vKsqw0yCcArFBTiBRi43a3IDW64=;
  b=Chv0mNeXM2G1QX05YKok62Rw9byuL5kPv5Bux7mE9bkyVVabWvF9E3Aq
   P0cNuhguXQzFVjIlCor7V4haxIx4QoLGdwUPgMPx4M4uoFShLzsXbivPg
   vh3Tl9KDc6wX090NamqHiIi+6NMo/cj10URr422z+10xbpS8PJQqCEoI2
   AbjEBc0YC6Gt/NLVkXXJG8GIunVIGk/8TefK3ETfP75wdMZMk9ADLI36t
   OCiQn0ddsHvlHZ2QZGZZSsp0yEM6ogW1kMoetoNdKOKxHMdo+XaxcKdgg
   HOGZvKE6y1fOb9xYzoS1NEGgjAxCTSAtB1zb6Ij9J9/FmIOr1N2X9qdMl
   g==;
X-CSE-ConnectionGUID: VET86EKdRFGOQ2eCEfck8A==
X-CSE-MsgGUID: +MgUNu71Q0KXM9IweQkGng==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40132731"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="40132731"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 11:01:34 -0800
X-CSE-ConnectionGUID: LqP7aD95Rai0X4QtnSwVzA==
X-CSE-MsgGUID: NqiEhzpxRE2ZjpLNQdwbXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="105059272"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jan 2025 11:01:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY8du-000QiV-2W;
	Wed, 15 Jan 2025 19:01:30 +0000
Date: Thu, 16 Jan 2025 03:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 278/278]
 drivers/phy/mediatek/phy-mtk-pcie.c:235: warning: Function parameter or
 member 'phy_init' not described in 'mtk_pcie_phy_data'
Message-ID: <202501160205.plHbaajB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0014573e8c8416a944ddeb1015b257d2bf148222
commit: 0014573e8c8416a944ddeb1015b257d2bf148222 [278/278] CHROMIUM: phy: mediatek: pcie: Add PCIe phy support for MT8196
config: arm-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250116/202501160205.plHbaajB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160205.plHbaajB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160205.plHbaajB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/mediatek/phy-mtk-pcie.c:235: warning: Function parameter or member 'phy_init' not described in 'mtk_pcie_phy_data'
>> drivers/phy/mediatek/phy-mtk-pcie.c:265: warning: Function parameter or member 'ckm_base' not described in 'mtk_pcie_phy'
>> drivers/phy/mediatek/phy-mtk-pcie.c:265: warning: Function parameter or member 'efuse_info' not described in 'mtk_pcie_phy'
>> drivers/phy/mediatek/phy-mtk-pcie.c:265: warning: Function parameter or member 'efuse_info_len' not described in 'mtk_pcie_phy'


vim +235 drivers/phy/mediatek/phy-mtk-pcie.c

e4e46bc71c1840 Jianjun Wang 2022-06-17  225  
e4e46bc71c1840 Jianjun Wang 2022-06-17  226  /**
e4e46bc71c1840 Jianjun Wang 2022-06-17  227   * struct mtk_pcie_phy_data - phy data for each SoC
e4e46bc71c1840 Jianjun Wang 2022-06-17  228   * @num_lanes: supported lane numbers
e4e46bc71c1840 Jianjun Wang 2022-06-17  229   * @sw_efuse_supported: support software to load eFuse data
e4e46bc71c1840 Jianjun Wang 2022-06-17  230   */
e4e46bc71c1840 Jianjun Wang 2022-06-17  231  struct mtk_pcie_phy_data {
e4e46bc71c1840 Jianjun Wang 2022-06-17  232  	int num_lanes;
e4e46bc71c1840 Jianjun Wang 2022-06-17  233  	bool sw_efuse_supported;
0014573e8c8416 Jianjun Wang 2024-03-07  234  	int (*phy_init)(struct phy *phy);
e4e46bc71c1840 Jianjun Wang 2022-06-17 @235  };
e4e46bc71c1840 Jianjun Wang 2022-06-17  236  
e4e46bc71c1840 Jianjun Wang 2022-06-17  237  /**
e4e46bc71c1840 Jianjun Wang 2022-06-17  238   * struct mtk_pcie_phy - PCIe phy driver main structure
e4e46bc71c1840 Jianjun Wang 2022-06-17  239   * @dev: pointer to device
e4e46bc71c1840 Jianjun Wang 2022-06-17  240   * @phy: pointer to generic phy
e4e46bc71c1840 Jianjun Wang 2022-06-17  241   * @sif_base: IO mapped register base address of system interface
e4e46bc71c1840 Jianjun Wang 2022-06-17  242   * @data: pointer to SoC dependent data
0014573e8c8416 Jianjun Wang 2024-03-07  243   * @num_lanes: supported lane numbers
0014573e8c8416 Jianjun Wang 2024-03-07  244   * @num_clks: PCIe PHY clocks count
0014573e8c8416 Jianjun Wang 2024-03-07  245   * @clks: PCIe PHY clocks
e4e46bc71c1840 Jianjun Wang 2022-06-17  246   * @sw_efuse_en: software eFuse enable status
e4e46bc71c1840 Jianjun Wang 2022-06-17  247   * @efuse_glb_intr: internal resistor selection of TX bias current data
e4e46bc71c1840 Jianjun Wang 2022-06-17  248   * @efuse: pointer to eFuse data for each lane
e4e46bc71c1840 Jianjun Wang 2022-06-17  249   */
e4e46bc71c1840 Jianjun Wang 2022-06-17  250  struct mtk_pcie_phy {
e4e46bc71c1840 Jianjun Wang 2022-06-17  251  	struct device *dev;
e4e46bc71c1840 Jianjun Wang 2022-06-17  252  	struct phy *phy;
e4e46bc71c1840 Jianjun Wang 2022-06-17  253  	void __iomem *sif_base;
0014573e8c8416 Jianjun Wang 2024-03-07  254  	void __iomem *ckm_base;
e4e46bc71c1840 Jianjun Wang 2022-06-17  255  	const struct mtk_pcie_phy_data *data;
e4e46bc71c1840 Jianjun Wang 2022-06-17  256  
0014573e8c8416 Jianjun Wang 2024-03-07  257  	int num_lanes;
0014573e8c8416 Jianjun Wang 2024-03-07  258  	int num_clks;
0014573e8c8416 Jianjun Wang 2024-03-07  259  	struct clk_bulk_data *clks;
e4e46bc71c1840 Jianjun Wang 2022-06-17  260  	bool sw_efuse_en;
e4e46bc71c1840 Jianjun Wang 2022-06-17  261  	u32 efuse_glb_intr;
0014573e8c8416 Jianjun Wang 2024-03-07  262  	u32 *efuse_info;
0014573e8c8416 Jianjun Wang 2024-03-07  263  	size_t efuse_info_len;
e4e46bc71c1840 Jianjun Wang 2022-06-17  264  	struct mtk_pcie_lane_efuse *efuse;
e4e46bc71c1840 Jianjun Wang 2022-06-17 @265  };
e4e46bc71c1840 Jianjun Wang 2022-06-17  266  

:::::: The code at line 235 was first introduced by commit
:::::: e4e46bc71c18407c087bbade3c92d4554207be21 phy: mediatek: Add PCIe PHY driver

:::::: TO: Jianjun Wang <jianjun.wang@mediatek.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
