Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB93A451B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 04:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783571931; cv=none; b=CPRwqsFAOjTICREnkOUc+LLqTOR9KMLtxaGX1xLdFtDf8izG5QWebJaqsM00LtcL/Nagjyy6hZC4Ow5mno4IRodLzn80HJxm1yFMXNndmH936QE+l7r9590UEY/y33lYCWaxj7rL2K8vGKdybqoc4lI9UJIWJ9IIh8IYnw5w/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783571931; c=relaxed/simple;
	bh=n1pfyn/zjjP7Y9M4F97L8jI7lEenQ+z/dtTanYJqy9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUx+DY0XUPF9ZdAT2suftGm+ygt1Pp+lJxFZkWVb6s0459qkoxpOR5XrFQiClq4UfHdCEdEowYDnJyYTR/9MdSDVwLWEbg2xQdDyD33b23/MENRV/SUNXRxaH9fcp2zFGRAa7yyGgy5LZz+gYfMu643QClbLHahstqDEr47Dn+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UO5d8bcJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UO5d8bcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783571930; x=1815107930;
  h=date:from:to:cc:subject:message-id;
  bh=n1pfyn/zjjP7Y9M4F97L8jI7lEenQ+z/dtTanYJqy9s=;
  b=UO5d8bcJ68AyQ6NrcSU41coHNUcKsSIOHheAXjaafc/+PaeBdRTf0KcM
   DNI3RjMM8Iz4QYgJZE5unoJ9btGLgR3sKNY3Gvwkf5AWZs6im0hRltwMi
   X5wtM2Sn5dD5ashBaQy01eZSKDM8qBtPIwJkcnrPIcKQXHmaK1Rm82iW8
   aQhmuf8XulWsxxKD78mkyMWN54jqhbUdljcVS+PPSJIOVOzhhTGFA9yiT
   lsZtJC34Lx667fJGvkrN46rzSs/MIGppkS/uPXA8jqHHYKVS+wHdnYNVT
   dNHjQriVpV7h292niAk46The8nSlopnUnYSjRpL4zbNMJWQBj77vTajPz
   Q==;
X-CSE-ConnectionGUID: XSj/XNb/TE2cJR/Qv5FprA==
X-CSE-MsgGUID: v6EgqziwTsymwQWYH48vzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95401861"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95401861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 21:38:50 -0700
X-CSE-ConnectionGUID: EQukoW2yQBWq6nu0Qb2ghw==
X-CSE-MsgGUID: eW62sAdqS/Sh/0f28tcuqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277700175"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2026 21:38:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whgX8-00000000HHL-0Ytp;
	Thu, 09 Jul 2026 04:38:46 +0000
Date: Thu, 09 Jul 2026 12:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 93/121]
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:439:34: sparse: sparse:
 symbol 'phy_qcom_mipi_csi2_ops_3ph_1_0' was not declared. Should it be
 static?
Message-ID: <202607091248.rf8X2HoK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: d7952be2f35aa9609bdcb72055e2410f4754a056 [93/121] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
config: arc-randconfig-r134-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091248.rf8X2HoK-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091248.rf8X2HoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091248.rf8X2HoK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:439:34: sparse: sparse: symbol 'phy_qcom_mipi_csi2_ops_3ph_1_0' was not declared. Should it be static?
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:449:36: sparse: sparse: symbol 'dphy_4nm_x1e_csiphy' was not declared. Should it be static?
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:456:36: sparse: sparse: symbol 'dphy_4nm_x1e_csiphy_timer' was not declared. Should it be static?

vim +/phy_qcom_mipi_csi2_ops_3ph_1_0 +439 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

   438	
 > 439	const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 = {
   440		.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
   441		.reset = phy_qcom_mipi_csi2_reset,
   442		.lanes_enable = phy_qcom_mipi_csi2_lanes_enable,
   443		.lanes_disable = phy_qcom_mipi_csi2_lanes_disable,
   444		.isr = phy_qcom_mipi_csi2_isr,
   445	};
   446	
   447	const struct mipi_csi2phy_clk_freq zero = { 0 };
   448	
 > 449	const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy = {
   450		.freq = {
   451			300000000, 400000000, 480000000
   452		},
   453		.num_freq = 3,
   454	};
   455	
 > 456	const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer = {
   457		.freq = {
   458			266666667, 400000000
   459		},
   460		.num_freq = 2,
   461	};
   462	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
