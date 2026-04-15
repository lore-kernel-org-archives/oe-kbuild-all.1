Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185153A7F67
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264437; cv=none; b=AvSP5szzUK6IedG1xMH7vCNJryBEf7/lWHMeKejh3vlRGSEVPQc/39jgX7SM6GRZOcy3No0uzCmi8/rYIP+/sSvU4ApTHn1WrPQPp2z2lFmiB9fy8ZiU2Jd3arsw+pPcn9uu9TTotcZ1bcY2/KZsMOrBwzvH6qbPp3tqbofk2L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264437; c=relaxed/simple;
	bh=Gt3TBc0PAI0rEt46CKcCvis4A7qMOF+W6tAsuZOs4ZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F9+bMyOjj0bm5roUSI3VitwPDOSYClmLko6Nidq0saewDigyoSxkyHWPd5MeoD1Nmdfpwz7CpOLIYHpMK/b27hhAbiUhWOk84Jrc3KatoYrINmqigdM96npyY7mA3zjFPlDkAtdO0BTxp7Gs4hp5jLD6gmYtyB3HEyKpOdd6Zbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpp2ov0V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpp2ov0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776264436; x=1807800436;
  h=date:from:to:cc:subject:message-id;
  bh=Gt3TBc0PAI0rEt46CKcCvis4A7qMOF+W6tAsuZOs4ZI=;
  b=fpp2ov0Vy5G4Rk5QQTpINrtG/RIyhOBoGNiwMtchiYZEiqfkRB8PdoHg
   NV3Ht12cODndKUADXsHeQVIGrxkRqNEJTDzvyg7QP06gkcxJbNT8uCjMa
   9yu6iS6UITqiOSrxmWZXBJFkyyldqwfr1rzP+JwahmnaGkjOpI97Z9S3r
   fSbgNkCUUzNmtP2yhQlXF5Qqxq0xdiCZncPMbGDFDJgHXA0B3olOqglmG
   e5j6yv7MTFT4+tmoymnAq5dB16O4xAjss5oPvd3Nd/YFCjm7TUYanaFri
   SXlA94h/Pir10qX75m2eVQJVMQ5DYOM7gkTtSeQ16h8y1yA6Dn+Oq5uUA
   A==;
X-CSE-ConnectionGUID: rGfraUzqS9+kxJGu5GhQqA==
X-CSE-MsgGUID: +0eHeDO/QRyAtj6p23aJOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="79826651"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="79826651"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 07:47:16 -0700
X-CSE-ConnectionGUID: M7tY1aceTWqd5RqFS+zsNg==
X-CSE-MsgGUID: 1drT0M5VTKWmUoBovVOP3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230365808"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Apr 2026 07:47:14 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD1WJ-000000000az-0TY1;
	Wed, 15 Apr 2026 14:47:11 +0000
Date: Wed, 15 Apr 2026 22:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Sebastian Reichel <sre@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [sre-misc:thinkpad-t14s-x1e 27/106]
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:440:34: sparse: sparse:
 symbol 'phy_qcom_mipi_csi2_ops_3ph_1_0' was not declared. Should it be
 static?
Message-ID: <202604152215.ouAFAN60-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   f1da547e2fdb6a7e05855a3bd78da0681cd32d77
commit: 729b50da9ca6685cb749bd328730a7e9655e9572 [27/106] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
config: alpha-randconfig-r122-20260415 (https://download.01.org/0day-ci/archive/20260415/202604152215.ouAFAN60-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152215.ouAFAN60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152215.ouAFAN60-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:440:34: sparse: sparse: symbol 'phy_qcom_mipi_csi2_ops_3ph_1_0' was not declared. Should it be static?
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:451:36: sparse: sparse: symbol 'dphy_4nm_x1e_csiphy' was not declared. Should it be static?
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:458:36: sparse: sparse: symbol 'dphy_4nm_x1e_csiphy_timer' was not declared. Should it be static?

vim +/phy_qcom_mipi_csi2_ops_3ph_1_0 +440 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

   439	
 > 440	const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 = {
   441		.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
   442		.reset = phy_qcom_mipi_csi2_reset,
   443		.lanes_enable = phy_qcom_mipi_csi2_lanes_enable,
   444		.lanes_disable = phy_qcom_mipi_csi2_lanes_disable,
   445		.isr = phy_qcom_mipi_csi2_isr,
   446		.init = phy_qcom_mipi_csi2_init,
   447	};
   448	
   449	const struct mipi_csi2phy_clk_freq zero = { 0 };
   450	
 > 451	const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy = {
   452		.freq = {
   453			300000000, 400000000, 480000000
   454		},
   455		.num_freq = 3,
   456	};
   457	
 > 458	const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer = {
   459		.freq = {
   460			266666667, 400000000
   461		},
   462		.num_freq = 2,
   463	};
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
