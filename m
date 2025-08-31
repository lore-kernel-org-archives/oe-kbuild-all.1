Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B767E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Aug 2025 04:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756614798; cv=none; b=XZCGIpoHKNs5A5fb35wq44gw26bmgDD1N0exldO6D1Wr5dgUEiUyw6yJ+iean1Hbmu8u94laApYuyBans4AdGNogQMCJOAwFVkEa1W0n29xQ5UVU+NimMgp//zTYgJAW722TEAst/7n/5RfF/k+eB9rlRcRW++7IifanzBvaqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756614798; c=relaxed/simple;
	bh=5yHpC3GheJNNZlQCSlWJXldrH+fLHb8aiVNaW5WLELo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F1O5Wrw9mREFzGc46KqZ02Bj5cwvrukTWf3djcq/uTEDiV6+VxPE9zhOVRLO0M9QqvTLxfrI40UqXJ07D+vtagehiUWK1VU7Wz8VKmOpkFHkL9XXIlDnbjiOz02QIIXQnYE1VoSawsxfo0iRFgJPiyKKFv5NKLUeU75HFUVnzXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZC2ztn5n; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZC2ztn5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756614796; x=1788150796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yHpC3GheJNNZlQCSlWJXldrH+fLHb8aiVNaW5WLELo=;
  b=ZC2ztn5nCLFa9WK9t7Dsb1DTmOtwQZQQpCuJFz2b/XkGKDI5eFzcWyj3
   0pbnbIN5z0D/RWxQB3YjrpGxAOCGRkDX05ICBwC/K94J63e0RCEG9iKjC
   +3iCM0sPW6gmpj5IsMBx9bZGLC0KVs/QQYg7t/l6aIlytMt7wmne8Yz/p
   GznvPF+6qa5+mdNE8zw4wiVJyiA41EogwgDXcSHcHzAQuOr5B/zWOVnMl
   upCL9R+qZzB5ZTrCWOPLEYjM3NEjKkAFnHEcXVLtcdc4UQRatUpx/4Rzg
   K9NL/nwMkuZcFO2nbuoElZs0h2Kn8fAGSR+oA7MZJYWT6fcUqT2QdkV4K
   A==;
X-CSE-ConnectionGUID: gmGDI8TAQaCp6FFRFnw19g==
X-CSE-MsgGUID: w3msccRDTx+t3GDkD9r4uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58781771"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58781771"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 21:33:16 -0700
X-CSE-ConnectionGUID: ZZKVAYt0RQKPeWmkmXFPrA==
X-CSE-MsgGUID: tAh6qrl1QomYiB9YzgZOhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194358960"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 21:33:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usZke-000Vx1-1N;
	Sun, 31 Aug 2025 04:33:12 +0000
Date: Sun, 31 Aug 2025 12:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [sre-misc:thinkpad-t14s-x1e 57/98]
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:440:34: sparse: sparse:
 symbol 'phy_qcom_mipi_csi2_ops_3ph_1_0' was not declared. Should it be
 static?
Message-ID: <202508311215.RZb2CznM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   35312e38725800c1399ecce4451a46696dc671ca
commit: 298f529d0c46850b0d6d48f29d085aab13509929 [57/98] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
config: loongarch-randconfig-r121-20250830 (https://download.01.org/0day-ci/archive/20250831/202508311215.RZb2CznM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508311215.RZb2CznM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508311215.RZb2CznM-lkp@intel.com/

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
