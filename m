Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC2725D53B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748931940; cv=none; b=rQtZkDFOIA4V8xRDJBs6QCwCp+hN4dxZR0uR+dkGf8vv0yM03XtQg3nCKnep8OETW4XpLg2om7dsfhvuAtMbPB7WBduX7S7M6ujSs/AdKRM0ZGdnYKpVzkzckjthya5iUa/7aWpM3NbNu5ZFwf3AbFxOYyKvE/UmuMHFkK62Yy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748931940; c=relaxed/simple;
	bh=siTziZB1aMGrqlkVIuCYP49at+J815i5vZpT7NQFn/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsnaPCIPelYdFsN1la5WMnJ5TgT4UCtXOqNBiwU5TWB8HHsw3sOJsLPIqSTTaRfN6I+o8RmEwErtOhGneWaBM3fIN1HARxpXmjfDFCoRI96w4uvC6ErdIe/Q1mAZnQctn7cugi5Zy9owhail8oQ52vf0BTCZoXdcnfkkb9eXkJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yj34Gmpa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yj34Gmpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748931938; x=1780467938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=siTziZB1aMGrqlkVIuCYP49at+J815i5vZpT7NQFn/c=;
  b=Yj34GmpaetPzNu6kl4l0EX8wtpoAuIkK/hgOCeE2TBcpJn2lxpSbb4od
   ZnAZxgR5XnIf/fuRSy6v0EHU7M8Tnd3uBuoWAhmzneJqkh0bflXheAJsx
   sx/LypU+o9DxJstWPzbusFoDOY3BP3TUFLtq9UQdKCGw67hwIO4YofRnD
   2AdZYKujJmHuGhnXD7whqPMiEC4Dq5Q+i0FxjxQ1DYh2MimT3VzcKz14c
   wg5nQE5CYRPi4uP2Du9fo44CYNnMrkMmm1uyQYHpW+tP/Tc9UkyEddgqo
   jyx+MCQ5KscEZ6k5rwuWtxofBqr0oBPdtuyd5zCfp9lXGK6fQG5W9voED
   w==;
X-CSE-ConnectionGUID: HUEfpKI9S3SqI2lF+wf5NA==
X-CSE-MsgGUID: YBE44dLyR0u1iUsl+7f6Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62314409"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="62314409"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 23:25:37 -0700
X-CSE-ConnectionGUID: 36Edgt1/QCCkj4QTRtICyw==
X-CSE-MsgGUID: 8Af1iJ80SSWXDVrV1vnc9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="144796081"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2025 23:25:36 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uML5a-0001RG-1N;
	Tue, 03 Jun 2025 06:25:34 +0000
Date: Tue, 3 Jun 2025 14:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 drivers/phy/mediatek/phy-mtk-pcie.c:235: warning: Function parameter or
 member 'phy_init' not described in 'mtk_pcie_phy_data'
Message-ID: <202506031459.TqTBd0zY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   21fc2218c3dfde22b522a0352bb0112b85d0fe72
commit: ec8dea63c9a41739b51416b3fff0fedb81944f0d [0/1] CHROMIUM: phy: mediatek: pcie: Add PCIe phy support for MT8196
config: i386-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250603/202506031459.TqTBd0zY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031459.TqTBd0zY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031459.TqTBd0zY-lkp@intel.com/

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
ec8dea63c9a417 Jianjun Wang 2024-03-07  234  	int (*phy_init)(struct phy *phy);
e4e46bc71c1840 Jianjun Wang 2022-06-17 @235  };
e4e46bc71c1840 Jianjun Wang 2022-06-17  236  
e4e46bc71c1840 Jianjun Wang 2022-06-17  237  /**
e4e46bc71c1840 Jianjun Wang 2022-06-17  238   * struct mtk_pcie_phy - PCIe phy driver main structure
e4e46bc71c1840 Jianjun Wang 2022-06-17  239   * @dev: pointer to device
e4e46bc71c1840 Jianjun Wang 2022-06-17  240   * @phy: pointer to generic phy
e4e46bc71c1840 Jianjun Wang 2022-06-17  241   * @sif_base: IO mapped register base address of system interface
e4e46bc71c1840 Jianjun Wang 2022-06-17  242   * @data: pointer to SoC dependent data
ec8dea63c9a417 Jianjun Wang 2024-03-07  243   * @num_lanes: supported lane numbers
ec8dea63c9a417 Jianjun Wang 2024-03-07  244   * @num_clks: PCIe PHY clocks count
ec8dea63c9a417 Jianjun Wang 2024-03-07  245   * @clks: PCIe PHY clocks
e4e46bc71c1840 Jianjun Wang 2022-06-17  246   * @sw_efuse_en: software eFuse enable status
e4e46bc71c1840 Jianjun Wang 2022-06-17  247   * @efuse_glb_intr: internal resistor selection of TX bias current data
e4e46bc71c1840 Jianjun Wang 2022-06-17  248   * @efuse: pointer to eFuse data for each lane
e4e46bc71c1840 Jianjun Wang 2022-06-17  249   */
e4e46bc71c1840 Jianjun Wang 2022-06-17  250  struct mtk_pcie_phy {
e4e46bc71c1840 Jianjun Wang 2022-06-17  251  	struct device *dev;
e4e46bc71c1840 Jianjun Wang 2022-06-17  252  	struct phy *phy;
e4e46bc71c1840 Jianjun Wang 2022-06-17  253  	void __iomem *sif_base;
ec8dea63c9a417 Jianjun Wang 2024-03-07  254  	void __iomem *ckm_base;
e4e46bc71c1840 Jianjun Wang 2022-06-17  255  	const struct mtk_pcie_phy_data *data;
e4e46bc71c1840 Jianjun Wang 2022-06-17  256  
ec8dea63c9a417 Jianjun Wang 2024-03-07  257  	int num_lanes;
ec8dea63c9a417 Jianjun Wang 2024-03-07  258  	int num_clks;
ec8dea63c9a417 Jianjun Wang 2024-03-07  259  	struct clk_bulk_data *clks;
e4e46bc71c1840 Jianjun Wang 2022-06-17  260  	bool sw_efuse_en;
e4e46bc71c1840 Jianjun Wang 2022-06-17  261  	u32 efuse_glb_intr;
ec8dea63c9a417 Jianjun Wang 2024-03-07  262  	u32 *efuse_info;
ec8dea63c9a417 Jianjun Wang 2024-03-07  263  	size_t efuse_info_len;
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
