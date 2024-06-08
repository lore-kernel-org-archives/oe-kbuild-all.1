Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77E3D68
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 04:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717821314; cv=none; b=lozdPo+EH9voiQ2XbPcfVrD5YU/UFIje9tuY2UTzT8hiZqSj3m6pZhrDU4jVmzJZru8gCnqjyhIvJavmZqrkmJ1RSSxmxvdCmWnJGScepX0tEBztmIavA0rRAC7/8M9Y+UYITfEZ+BBPCT5mQj/vFgcF+wqkaDqksYAH37SXBnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717821314; c=relaxed/simple;
	bh=k1IBQDysGOhhIDZyl2vmzcqiqDVBaGiwPebJqiAPEKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q5kKTwHCAVtdrN/PWKR6GGFVuQpGvmyBI20rRIoUl3Crtn6/y+MIuZMJ4HbAKQ357mJuaEGawX7UMBoTTQ/BT9E0XByCU0D2tCdTZfFiWVdzLY32wMfLiZ7ABdRDQUUieJ1xuDDHDlM6zm8mPgyCXvELzLZGlM2q+kdiet1wwOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLxiHLAx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLxiHLAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717821310; x=1749357310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k1IBQDysGOhhIDZyl2vmzcqiqDVBaGiwPebJqiAPEKw=;
  b=cLxiHLAxN3iC8EPJUS/mIqCO+TIlJ44LFof2ALHUJ67Xp1ox5SC9oYwU
   LCb1dqbDEsQnInMZjqW/79Q00xmd0RxSPTr683Zqvg3xr+v2hTuSwN18T
   C+rYM0/6nPOm300buW8G2yd57RbbinT7JobkNzDbRawBYRj1fK9A5meW+
   fmrmXErqm/D8HKbizb8SnvfQdGGGjoieW8Q2x8YZtAq9uZSFajRKIZKLo
   mI+N98EaVk04KQMxJRrziBf5FbFQIGCf8Gwp6Q1MgQwulAFTHZVii16m+
   fM//YIzXULOTVfHYxKtBn1q9FfqOLUC9cUiHdKWBXJ+zDxmhcp6gqLzIO
   w==;
X-CSE-ConnectionGUID: hAG/urKyQEWnKL3h7kMw9A==
X-CSE-MsgGUID: WlByC+dBRtynVdvI1cMpFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25129910"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25129910"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 21:35:09 -0700
X-CSE-ConnectionGUID: uWWPMj5iTo2kpa9tULnbxA==
X-CSE-MsgGUID: +41CXgsuQDi1MsnVSrJGkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38606133"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2024 21:35:07 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFnnF-00010d-1C;
	Sat, 08 Jun 2024 04:35:05 +0000
Date: Sat, 8 Jun 2024 12:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5924/11738]
 arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning
 (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address
 (also used in node /mix_gpu_ml@40000000)
Message-ID: <202406081210.XnOA6fKr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   d8b0bac40433ce7ef0a7493948bad27a6e223c08
commit: 2d4c0fc8fd40c9a2b927c780217d98b1f51340cc [5924/11738] LF-10676-2 arm64: dts: imx: fix unit_address_vs_reg build warnings
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081210.XnOA6fKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081210.XnOA6fKr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2071.36-2097.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:235.40-238.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1389.12-1393.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1389.12-1393.7: Warning (unique_unit_address_if_enabled): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@0: duplicate unit-address (also used in node /soc@0/bus@32c00000/mipi_dsi@32e60000/panel@0)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-it6263-lvds-dual-channel.dts:12.6-14.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2071.36-2097.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1015.26-1030.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/spba-bus@30800000/spi@30830000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:282.9-296.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ecspi-slave.dts:9.9-13.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2071.36-2097.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-jdi-wuxga-lvds-panel.dts:23.6-38.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2071.36-2097.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ov2775.dts:101.13-111.3
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ov2775-ov5640.dts:95.13-105.3
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-basler-ov5640.dts:43.13-53.3
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1775.30-1794.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/camera/csi@32e50000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1451.13-1466.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-basler.dts:54.13-56.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-basler.dts:42.13-52.3
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-basler-ov2775.dts:90.13-100.3
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-dual-basler.dts:97.13-111.3
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-dual-ov2775.dts:106.13-119.3
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2071.36-2097.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-os08a20-ov5640.dts:91.13-101.3
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1775.30-1794.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/camera/csi@32e50000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1451.13-1466.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-os08a20.dts:84.13-86.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-os08a20.dts:72.13-82.3
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:1434.13-1449.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-dual-os08a20.dts:98.13-111.3
--
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:235.40-238.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1389.12-1393.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ab2.dts:31.18-35.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1565.20-1580.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2071.36-2097.6: Warning (graph_child_address): /soc@0/bus@30c00000/lcd-controller@32fc6000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ab2.dts:420.9-422.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2099.24-2128.6: Warning (graph_child_address): /soc@0/bus@30c00000/hdmi@32fd8000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ab2.dts:412.7-414.3
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts:129.9-137.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts:139.9-147.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dts:779.9-784.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e60000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:357.28-364.5: Warning (simple_bus_reg): /power-domains/audiomix-pd: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:663.29-670.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1553.32-1598.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/ldb-display-controller: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:756.6-770.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1600.22-1619.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/phy-lvds: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:772.10-774.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:2041.31-2044.6: Warning (simple_bus_reg): /soc@0/bus@30c00000/audiomix_dsp: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1373.32-1394.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e60000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:776.11-785.3
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:194.18-197.4: Warning (unique_unit_address_if_enabled): /memory@40000000: duplicate unit-address (also used in node /mix_gpu_ml@40000000)
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:32.18-36.4
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:672.34-677.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1396.36-1424.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e80000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:741.9-743.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts:111.9-119.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1426.36-1461.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcd-controller@32e90000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk.dts:745.9-747.3
     also defined at arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts:121.9-129.3
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1582.20-1597.7: Warning (graph_child_address): /soc@0/bus@32c00000/ldb-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1754.30-1773.7: Warning (graph_child_address): /soc@0/bus@32c00000/camera/csi@32e40000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi:13.45-18.4: Warning (simple_bus_reg): /bus@5b000000/clock-conn-enet0-root: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi:12.27-17.4: Warning (simple_bus_reg): /bus@5c000000/clock-db-ipg: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi:17.31-22.4: Warning (simple_bus_reg): /bus@5d000000/clock-lsio-mem: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi:24.31-29.4: Warning (simple_bus_reg): /bus@5d000000/clock-lsio-bus: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:16.27-21.4: Warning (simple_bus_reg): /bus@5f000000/clock-xtal100m: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:23.33-28.4: Warning (simple_bus_reg): /bus@5f000000/clock-hsio-refa: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:30.33-35.4: Warning (simple_bus_reg): /bus@5f000000/clock-hsio-refb: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:37.31-42.4: Warning (simple_bus_reg): /bus@5f000000/clock-hsio-axi: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:44.31-49.4: Warning (simple_bus_reg): /bus@5f000000/clock-hsio-per: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8-ss-lcdif.dtsi:13.25-18.4: Warning (simple_bus_reg): /bus@5a180000/clock-ipg: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8-ss-lcdif.dtsi:31.29-47.4: Warning (graph_child_address): /bus@5a180000/lcdif@5a180000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8dxl-evk-lcdif.dts:106.13-128.3
--
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:628.17-639.3
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:397.37-442.5: Warning (avoid_unnecessary_addr_size): /bus@56220000/dsi_host@56248000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:715.17-726.3
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:293.6-313.4: Warning (avoid_unnecessary_addr_size): /cm4: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:114.38-117.5: Warning (unique_unit_address_if_enabled): /bus@56220000/lvds_region@56221000: duplicate unit-address (also used in node /bus@56220000/ldb_phy@56221000)
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:286.38-289.5: Warning (unique_unit_address_if_enabled): /bus@56220000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56220000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:507.28-521.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:1255.13-1269.3
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:539.31-553.5: Warning (graph_child_address): /bus@58000000/camera/pcsi@58261000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:1276.15-1286.3
>> arch/arm64/boot/dts/freescale/imx8-ss-lcdif.dtsi:31.29-47.4: Warning (graph_child_address): /bus@5a180000/lcdif@5a180000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>>   also defined at arch/arm64/boot/dts/freescale/imx8x-mek-lcdif.dtsi:95.13-109.3
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:169.19-184.6: Warning (graph_child_address): /bus@56220000/ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:580.26-599.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:259.22-268.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:341.19-356.6: Warning (graph_child_address): /bus@56220000/ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:667.26-686.4: Warning (graph_child_address): /bus@56220000/i2c@56246000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:431.22-440.7: Warning (graph_child_address): /bus@56220000/dsi_host@56248000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:628.17-639.3
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:397.37-442.5: Warning (avoid_unnecessary_addr_size): /bus@56220000/dsi_host@56248000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:715.17-726.3
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:293.6-313.4: Warning (avoid_unnecessary_addr_size): /cm4: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:114.38-117.5: Warning (unique_unit_address_if_enabled): /bus@56220000/lvds_region@56221000: duplicate unit-address (also used in node /bus@56220000/ldb_phy@56221000)
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:286.38-289.5: Warning (unique_unit_address_if_enabled): /bus@56220000/lvds_region@56241000: duplicate unit-address (also used in node /bus@56220000/ldb_phy@56241000)
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:507.28-521.5: Warning (graph_child_address): /bus@58000000/camera/csi@58227000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:1255.13-1269.3
   arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi:539.31-553.5: Warning (graph_child_address): /bus@58000000/camera/pcsi@58261000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
     also defined at arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:1276.15-1286.3
>> arch/arm64/boot/dts/freescale/imx8-ss-lcdif.dtsi:31.29-47.4: Warning (graph_child_address): /bus@5a180000/lcdif@5a180000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>>   also defined at arch/arm64/boot/dts/freescale/imx8x-mek-lcdif.dtsi:95.13-109.3
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:169.19-184.6: Warning (graph_child_address): /bus@56220000/ldb1-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:580.26-599.4: Warning (graph_child_address): /bus@56220000/i2c@56226000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:259.22-268.7: Warning (graph_child_address): /bus@56220000/dsi_host@56228000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:341.19-356.6: Warning (graph_child_address): /bus@56220000/ldb2-display-controller/lvds-channel@1: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8x-mek.dtsi:667.26-686.4: Warning (graph_child_address): /bus@56220000/i2c@56246000/adv7535@3d: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8qxp-ss-lvds.dtsi:431.22-440.7: Warning (graph_child_address): /bus@56220000/dsi_host@56248000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +194 arch/arm64/boot/dts/freescale/imx8mp.dtsi

6d9b8d20431f12 Anson Huang    2020-02-11   16  
6d9b8d20431f12 Anson Huang    2020-02-11   17  / {
6d9b8d20431f12 Anson Huang    2020-02-11   18  	interrupt-parent = <&gic>;
6d9b8d20431f12 Anson Huang    2020-02-11   19  	#address-cells = <2>;
6d9b8d20431f12 Anson Huang    2020-02-11   20  	#size-cells = <2>;
6d9b8d20431f12 Anson Huang    2020-02-11   21  
6d9b8d20431f12 Anson Huang    2020-02-11   22  	aliases {
6d9b8d20431f12 Anson Huang    2020-02-11   23  		ethernet0 = &fec;
ec4d1196f1138b Marek Vasut    2021-02-28   24  		ethernet1 = &eqos;
6d9b8d20431f12 Anson Huang    2020-02-11   25  		gpio0 = &gpio1;
6d9b8d20431f12 Anson Huang    2020-02-11   26  		gpio1 = &gpio2;
6d9b8d20431f12 Anson Huang    2020-02-11   27  		gpio2 = &gpio3;
6d9b8d20431f12 Anson Huang    2020-02-11   28  		gpio3 = &gpio4;
6d9b8d20431f12 Anson Huang    2020-02-11   29  		gpio4 = &gpio5;
ac4af2b12bbebd Peng Fan       2020-05-20   30  		i2c0 = &i2c1;
ac4af2b12bbebd Peng Fan       2020-05-20   31  		i2c1 = &i2c2;
ac4af2b12bbebd Peng Fan       2020-05-20   32  		i2c2 = &i2c3;
ac4af2b12bbebd Peng Fan       2020-05-20   33  		i2c3 = &i2c4;
ac4af2b12bbebd Peng Fan       2020-05-20   34  		i2c4 = &i2c5;
ac4af2b12bbebd Peng Fan       2020-05-20   35  		i2c5 = &i2c6;
6d9b8d20431f12 Anson Huang    2020-02-11   36  		mmc0 = &usdhc1;
6d9b8d20431f12 Anson Huang    2020-02-11   37  		mmc1 = &usdhc2;
6d9b8d20431f12 Anson Huang    2020-02-11   38  		mmc2 = &usdhc3;
6d9b8d20431f12 Anson Huang    2020-02-11   39  		serial0 = &uart1;
6d9b8d20431f12 Anson Huang    2020-02-11   40  		serial1 = &uart2;
6d9b8d20431f12 Anson Huang    2020-02-11   41  		serial2 = &uart3;
6d9b8d20431f12 Anson Huang    2020-02-11   42  		serial3 = &uart4;
6914d1ba4d0ace Heiko Schocher 2021-03-09   43  		spi0 = &flexspi;
a59ce171cef7ea Guoniu.zhou    2020-07-31   44  		isi0 = &isi_0;
a59ce171cef7ea Guoniu.zhou    2020-07-31   45  		isi1 = &isi_1;
a59ce171cef7ea Guoniu.zhou    2020-07-31   46  		csi0 = &mipi_csi_0;
a59ce171cef7ea Guoniu.zhou    2020-07-31   47  		csi1 = &mipi_csi_1;
ccd72d37756069 Guoniu.zhou    2020-09-18   48  		isp0 = &isp_0;
ccd72d37756069 Guoniu.zhou    2020-09-18   49  		isp1 = &isp_1;
6d9b8d20431f12 Anson Huang    2020-02-11   50  	};
6d9b8d20431f12 Anson Huang    2020-02-11   51  
6d9b8d20431f12 Anson Huang    2020-02-11   52  	cpus {
6d9b8d20431f12 Anson Huang    2020-02-11   53  		#address-cells = <1>;
6d9b8d20431f12 Anson Huang    2020-02-11   54  		#size-cells = <0>;
6d9b8d20431f12 Anson Huang    2020-02-11   55  
6a0e95db00bed0 Jacky Bai      2020-04-23   56  		idle-states {
6a0e95db00bed0 Jacky Bai      2020-04-23   57  			entry-method = "psci";
6a0e95db00bed0 Jacky Bai      2020-04-23   58  
6a0e95db00bed0 Jacky Bai      2020-04-23   59  			cpu_pd_wait: cpu-pd-wait {
6a0e95db00bed0 Jacky Bai      2020-04-23   60  				compatible = "arm,idle-state";
6a0e95db00bed0 Jacky Bai      2020-04-23   61  				arm,psci-suspend-param = <0x0010033>;
6a0e95db00bed0 Jacky Bai      2020-04-23   62  				local-timer-stop;
6a0e95db00bed0 Jacky Bai      2020-04-23   63  				entry-latency-us = <1000>;
6a0e95db00bed0 Jacky Bai      2020-04-23   64  				exit-latency-us = <700>;
6a0e95db00bed0 Jacky Bai      2020-04-23   65  				min-residency-us = <2700>;
6a0e95db00bed0 Jacky Bai      2020-04-23   66  				wakeup-latency-us = <1500>;
6a0e95db00bed0 Jacky Bai      2020-04-23   67  			};
6a0e95db00bed0 Jacky Bai      2020-04-23   68  		};
6a0e95db00bed0 Jacky Bai      2020-04-23   69  
6d9b8d20431f12 Anson Huang    2020-02-11   70  		A53_0: cpu@0 {
6d9b8d20431f12 Anson Huang    2020-02-11   71  			device_type = "cpu";
6d9b8d20431f12 Anson Huang    2020-02-11   72  			compatible = "arm,cortex-a53";
6d9b8d20431f12 Anson Huang    2020-02-11   73  			reg = <0x0>;
6d9b8d20431f12 Anson Huang    2020-02-11   74  			clock-latency = <61036>;
6d9b8d20431f12 Anson Huang    2020-02-11   75  			clocks = <&clk IMX8MP_CLK_ARM>;
6d9b8d20431f12 Anson Huang    2020-02-11   76  			enable-method = "psci";
cb551b5e3bab54 Peng Fan       2021-11-12   77  			i-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan       2021-11-12   78  			i-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12   79  			i-cache-sets = <256>;
cb551b5e3bab54 Peng Fan       2021-11-12   80  			d-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan       2021-11-12   81  			d-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12   82  			d-cache-sets = <128>;
6d9b8d20431f12 Anson Huang    2020-02-11   83  			next-level-cache = <&A53_L2>;
9ad9773e89f8e0 Marek Vasut    2022-03-11   84  			nvmem-cells = <&cpu_speed_grade>;
9ad9773e89f8e0 Marek Vasut    2022-03-11   85  			nvmem-cell-names = "speed_grade";
21a14c68f3a34e Marek Vasut    2022-03-11   86  			operating-points-v2 = <&a53_opp_table>;
30cdd62dce6b59 Anson Huang    2020-04-03   87  			#cooling-cells = <2>;
6a0e95db00bed0 Jacky Bai      2020-04-23   88  			cpu-idle-states = <&cpu_pd_wait>;
6d9b8d20431f12 Anson Huang    2020-02-11   89  		};
6d9b8d20431f12 Anson Huang    2020-02-11   90  
6d9b8d20431f12 Anson Huang    2020-02-11   91  		A53_1: cpu@1 {
6d9b8d20431f12 Anson Huang    2020-02-11   92  			device_type = "cpu";
6d9b8d20431f12 Anson Huang    2020-02-11   93  			compatible = "arm,cortex-a53";
6d9b8d20431f12 Anson Huang    2020-02-11   94  			reg = <0x1>;
6d9b8d20431f12 Anson Huang    2020-02-11   95  			clock-latency = <61036>;
6d9b8d20431f12 Anson Huang    2020-02-11   96  			clocks = <&clk IMX8MP_CLK_ARM>;
6d9b8d20431f12 Anson Huang    2020-02-11   97  			enable-method = "psci";
cb551b5e3bab54 Peng Fan       2021-11-12   98  			i-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan       2021-11-12   99  			i-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12  100  			i-cache-sets = <256>;
cb551b5e3bab54 Peng Fan       2021-11-12  101  			d-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan       2021-11-12  102  			d-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12  103  			d-cache-sets = <128>;
6d9b8d20431f12 Anson Huang    2020-02-11  104  			next-level-cache = <&A53_L2>;
21a14c68f3a34e Marek Vasut    2022-03-11  105  			operating-points-v2 = <&a53_opp_table>;
30cdd62dce6b59 Anson Huang    2020-04-03  106  			#cooling-cells = <2>;
6a0e95db00bed0 Jacky Bai      2020-04-23  107  			cpu-idle-states = <&cpu_pd_wait>;
6d9b8d20431f12 Anson Huang    2020-02-11  108  		};
6d9b8d20431f12 Anson Huang    2020-02-11  109  
6d9b8d20431f12 Anson Huang    2020-02-11  110  		A53_2: cpu@2 {
6d9b8d20431f12 Anson Huang    2020-02-11  111  			device_type = "cpu";
6d9b8d20431f12 Anson Huang    2020-02-11  112  			compatible = "arm,cortex-a53";
6d9b8d20431f12 Anson Huang    2020-02-11  113  			reg = <0x2>;
6d9b8d20431f12 Anson Huang    2020-02-11  114  			clock-latency = <61036>;
6d9b8d20431f12 Anson Huang    2020-02-11  115  			clocks = <&clk IMX8MP_CLK_ARM>;
6d9b8d20431f12 Anson Huang    2020-02-11  116  			enable-method = "psci";
cb551b5e3bab54 Peng Fan       2021-11-12  117  			i-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan       2021-11-12  118  			i-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12  119  			i-cache-sets = <256>;
cb551b5e3bab54 Peng Fan       2021-11-12  120  			d-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan       2021-11-12  121  			d-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12  122  			d-cache-sets = <128>;
6d9b8d20431f12 Anson Huang    2020-02-11  123  			next-level-cache = <&A53_L2>;
21a14c68f3a34e Marek Vasut    2022-03-11  124  			operating-points-v2 = <&a53_opp_table>;
30cdd62dce6b59 Anson Huang    2020-04-03  125  			#cooling-cells = <2>;
6a0e95db00bed0 Jacky Bai      2020-04-23  126  			cpu-idle-states = <&cpu_pd_wait>;
6d9b8d20431f12 Anson Huang    2020-02-11  127  		};
6d9b8d20431f12 Anson Huang    2020-02-11  128  
6d9b8d20431f12 Anson Huang    2020-02-11  129  		A53_3: cpu@3 {
6d9b8d20431f12 Anson Huang    2020-02-11  130  			device_type = "cpu";
6d9b8d20431f12 Anson Huang    2020-02-11  131  			compatible = "arm,cortex-a53";
6d9b8d20431f12 Anson Huang    2020-02-11  132  			reg = <0x3>;
6d9b8d20431f12 Anson Huang    2020-02-11  133  			clock-latency = <61036>;
6d9b8d20431f12 Anson Huang    2020-02-11  134  			clocks = <&clk IMX8MP_CLK_ARM>;
6d9b8d20431f12 Anson Huang    2020-02-11  135  			enable-method = "psci";
cb551b5e3bab54 Peng Fan       2021-11-12  136  			i-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan       2021-11-12  137  			i-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12  138  			i-cache-sets = <256>;
cb551b5e3bab54 Peng Fan       2021-11-12  139  			d-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan       2021-11-12  140  			d-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12  141  			d-cache-sets = <128>;
6d9b8d20431f12 Anson Huang    2020-02-11  142  			next-level-cache = <&A53_L2>;
21a14c68f3a34e Marek Vasut    2022-03-11  143  			operating-points-v2 = <&a53_opp_table>;
30cdd62dce6b59 Anson Huang    2020-04-03  144  			#cooling-cells = <2>;
6a0e95db00bed0 Jacky Bai      2020-04-23  145  			cpu-idle-states = <&cpu_pd_wait>;
6d9b8d20431f12 Anson Huang    2020-02-11  146  		};
6d9b8d20431f12 Anson Huang    2020-02-11  147  
6d9b8d20431f12 Anson Huang    2020-02-11  148  		A53_L2: l2-cache0 {
6d9b8d20431f12 Anson Huang    2020-02-11  149  			compatible = "cache";
3b450831e5f1af Pierre Gondois 2022-11-07  150  			cache-unified;
cb551b5e3bab54 Peng Fan       2021-11-12  151  			cache-level = <2>;
cb551b5e3bab54 Peng Fan       2021-11-12  152  			cache-size = <0x80000>;
cb551b5e3bab54 Peng Fan       2021-11-12  153  			cache-line-size = <64>;
cb551b5e3bab54 Peng Fan       2021-11-12  154  			cache-sets = <512>;
6d9b8d20431f12 Anson Huang    2020-02-11  155  		};
6d9b8d20431f12 Anson Huang    2020-02-11  156  	};
6d9b8d20431f12 Anson Huang    2020-02-11  157  
dbed8a17fc3384 Fancy Fang     2020-04-22  158  	display-subsystem {
dbed8a17fc3384 Fancy Fang     2020-04-22  159  		compatible = "fsl,imx-display-subsystem";
74044747494e86 Fancy Fang     2020-05-15  160  		ports = <&lcdif1_disp>,
a3347a1640ca20 Sandor Yu      2020-04-23  161  			<&lcdif2_disp>,
a3347a1640ca20 Sandor Yu      2020-04-23  162  			<&lcdif3_disp>;
dbed8a17fc3384 Fancy Fang     2020-04-22  163  	};
dbed8a17fc3384 Fancy Fang     2020-04-22  164  
21a14c68f3a34e Marek Vasut    2022-03-11  165  	a53_opp_table: opp-table {
21a14c68f3a34e Marek Vasut    2022-03-11  166  		compatible = "operating-points-v2";
21a14c68f3a34e Marek Vasut    2022-03-11  167  		opp-shared;
21a14c68f3a34e Marek Vasut    2022-03-11  168  
21a14c68f3a34e Marek Vasut    2022-03-11  169  		opp-1200000000 {
21a14c68f3a34e Marek Vasut    2022-03-11  170  			opp-hz = /bits/ 64 <1200000000>;
21a14c68f3a34e Marek Vasut    2022-03-11  171  			opp-microvolt = <850000>;
21a14c68f3a34e Marek Vasut    2022-03-11  172  			opp-supported-hw = <0x8a0>, <0x7>;
21a14c68f3a34e Marek Vasut    2022-03-11  173  			clock-latency-ns = <150000>;
21a14c68f3a34e Marek Vasut    2022-03-11  174  			opp-suspend;
21a14c68f3a34e Marek Vasut    2022-03-11  175  		};
21a14c68f3a34e Marek Vasut    2022-03-11  176  
21a14c68f3a34e Marek Vasut    2022-03-11  177  		opp-1600000000 {
21a14c68f3a34e Marek Vasut    2022-03-11  178  			opp-hz = /bits/ 64 <1600000000>;
21a14c68f3a34e Marek Vasut    2022-03-11  179  			opp-microvolt = <950000>;
21a14c68f3a34e Marek Vasut    2022-03-11  180  			opp-supported-hw = <0xa0>, <0x7>;
21a14c68f3a34e Marek Vasut    2022-03-11  181  			clock-latency-ns = <150000>;
21a14c68f3a34e Marek Vasut    2022-03-11  182  			opp-suspend;
21a14c68f3a34e Marek Vasut    2022-03-11  183  		};
21a14c68f3a34e Marek Vasut    2022-03-11  184  
21a14c68f3a34e Marek Vasut    2022-03-11  185  		opp-1800000000 {
21a14c68f3a34e Marek Vasut    2022-03-11  186  			opp-hz = /bits/ 64 <1800000000>;
21a14c68f3a34e Marek Vasut    2022-03-11  187  			opp-microvolt = <1000000>;
21a14c68f3a34e Marek Vasut    2022-03-11  188  			opp-supported-hw = <0x20>, <0x3>;
21a14c68f3a34e Marek Vasut    2022-03-11  189  			clock-latency-ns = <150000>;
21a14c68f3a34e Marek Vasut    2022-03-11  190  			opp-suspend;
21a14c68f3a34e Marek Vasut    2022-03-11  191  		};
21a14c68f3a34e Marek Vasut    2022-03-11  192  	};
21a14c68f3a34e Marek Vasut    2022-03-11  193  
b54a14217900cb Shengjiu Wang  2020-04-22 @194  	memory@40000000 {
b54a14217900cb Shengjiu Wang  2020-04-22  195  		device_type = "memory";
b54a14217900cb Shengjiu Wang  2020-04-22  196  		reg = <0x0 0x40000000 0 0x80000000>;
b54a14217900cb Shengjiu Wang  2020-04-22  197  	};
b54a14217900cb Shengjiu Wang  2020-04-22  198  
b54a14217900cb Shengjiu Wang  2020-04-22  199  	resmem: reserved-memory {
b54a14217900cb Shengjiu Wang  2020-04-22  200  		#address-cells = <2>;
b54a14217900cb Shengjiu Wang  2020-04-22  201  		#size-cells = <2>;
b54a14217900cb Shengjiu Wang  2020-04-22  202  		ranges;
5c93439c77f59c Bing Song      2020-06-15  203  
5c93439c77f59c Bing Song      2020-06-15  204  		ocram: ocram@900000 {
5c93439c77f59c Bing Song      2020-06-15  205  			no-map;
5c93439c77f59c Bing Song      2020-06-15  206  			reg = <0 0x900000 0 0x70000>;
5c93439c77f59c Bing Song      2020-06-15  207  		};
5c93439c77f59c Bing Song      2020-06-15  208  

:::::: The code at line 194 was first introduced by commit
:::::: b54a14217900cb0b25c1454da8f52afcdf7c8c4a LF-1299: arm64: dts: imx8mp: Enable SAI/ASRC/WM8960/MICFIL

:::::: TO: Shengjiu Wang <shengjiu.wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
