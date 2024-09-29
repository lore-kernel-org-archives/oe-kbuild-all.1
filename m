Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB8F149E00
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727611237; cv=none; b=D48H++21FG9AX4BQ5BN+zQWEPdM303LW6Ula2gHbio5eISTO6pXsm29QJ/JQUqgRybjGWqbabB1AGgv5nNWPqDCcUHf69iSDcPBU9g5C7gEZRvZS5ixobhNsBeE8Xbj+xCVzDxQ2uqZ7SGKmVlL5Wjw9v6iYn41LmBCesqSlk74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727611237; c=relaxed/simple;
	bh=AhDZH+uGlN+zlxyi95Kr+h/0mXaYeQKhuwFFlxjMuEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VZIpwVbKiBUgDMKduCNlVGWXr3EXlppzVyksSN3c9bKdrf1WflKM625yYUsgh5H70O14KcjcRVrriCn2si9Cgt+zZl6xayQ+vTeatfTus63ArnypDHQ7lD2ZeRqjkdBPeG7VaR77VIeZa+gxT5HtJeamoSQEgomcYSgBU1kQ69g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcnEuNWm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcnEuNWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727611232; x=1759147232;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AhDZH+uGlN+zlxyi95Kr+h/0mXaYeQKhuwFFlxjMuEk=;
  b=LcnEuNWmK8sStweoppinYUQxXdux+SpDl+WVlsuqCrW0VtIKW3dMqkUd
   PSFmyuUmMul1YtEPERIAMVrERj3bNG6kZ6LPKS94zH+VRNzwxzx3zRUvp
   FrMwFy1IB3wHrkD+Tb9qFzV3L/fbxt/fT4/xS/QpHn666uiYE+MuEJw8Y
   NKVmGYQ2LKIL1Pv9vfeRzjXho9a/yE1BT6nMkT16/N8FHjGDFMkK7cj+G
   WZTbFCk6Q4BAlXqDOWny7qn1DaPyrUWzFtZRrSsbAI3BOcGgaUWFZzFVN
   BiflUu4kgmXiIwFS4Y856rwklK+kBdrwgcNzUMR74NYmnTQx3N9wvLU/t
   g==;
X-CSE-ConnectionGUID: yunlqK+EQ1a6M0Hkrv2oAg==
X-CSE-MsgGUID: qY3FO3xQTruh+ifk7yAbyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30499344"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30499344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 05:00:30 -0700
X-CSE-ConnectionGUID: azowbA+TRnCnEaObAtbobw==
X-CSE-MsgGUID: WCQcFECyT/adBygg+kuV3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="103809782"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Sep 2024 05:00:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1susbB-000OGN-2K;
	Sun, 29 Sep 2024 12:00:25 +0000
Date: Sun, 29 Sep 2024 20:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5903/16788]
 arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning
 (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202409291949.Ryb99sXg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: c12ec0930d63763d0e8ee06aad46c2bd02edfead [5903/16788] Merge branch 'reset/next' into next
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291949.Ryb99sXg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291949.Ryb99sXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291949.Ryb99sXg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:579.15-584.10: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:552.31-558.5: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_csi@32e30000/port/endpoint@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:560.28-562.5: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_csi@32e30000/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:659.29-666.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1224.32-1247.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1261.34-1274.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_csi@32e30000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:668.34-673.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:579.15-584.10: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:552.31-558.5: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_csi@32e30000/port/endpoint@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:560.28-562.5: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_csi@32e30000/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:659.29-666.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1261.34-1274.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_csi@32e30000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:668.34-673.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unique_unit_address_if_enabled): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: duplicate unit-address (also used in node /soc@0/bus@32c00000/mipi_dsi@32e10000/panel@0)
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-ab2-m4.dts:33.13-36.5: Warning (unit_address_vs_reg): /reserved-memory/rsc-table: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:659.29-666.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1224.32-1247.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1261.34-1274.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_csi@32e30000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:668.34-673.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:659.29-666.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1224.32-1247.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:668.34-673.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8ulp-rpmsg.dtsi:37.22-46.4: Warning (unit_address_vs_reg): /gpio@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8ulp-rpmsg.dtsi:48.22-57.4: Warning (unit_address_vs_reg): /gpio@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8ulp-evk.dts:79.40-82.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:850.24-863.5: Warning (simple_bus_reg): /soc@0/gpio@2d000080: simple-bus unit address format error, expected "2d000000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:865.24-878.5: Warning (simple_bus_reg): /soc@0/gpio@2d010080: simple-bus unit address format error, expected "2d010000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1101.29-1129.7: Warning (simple_bus_reg): /soc@0/bus@2d800000/camera/csi@2dad0000: simple-bus unit address format error, expected "2daf0000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1310.24-1323.5: Warning (simple_bus_reg): /soc@0/gpio@2e200080: simple-bus unit address format error, expected "2e200000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:468.29-489.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@29000000/flexio@29350000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8ulp.dtsi:644.25-657.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@29800000/i2c@29850000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1132.22-1177.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@2d800000/dsi@2db00000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:223.13-1324.4: Warning (unique_unit_address_if_enabled): /soc@0: duplicate unit-address (also used in node /gpio@0)
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1101.29-1129.7: Warning (graph_child_address): /soc@0/bus@2d800000/camera/csi@2dad0000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:579.15-584.10: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:552.31-558.5: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_csi@32e30000/port/endpoint@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:560.28-562.5: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_csi@32e30000/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:659.29-666.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:935.26-947.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/spba-bus@30800000/spi@30830000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1224.32-1247.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1261.34-1274.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_csi@32e30000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:668.34-673.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:95.11-102.4: Warning (unit_address_vs_reg): /gpu: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8ulp-rpmsg.dtsi:37.22-46.4: Warning (unit_address_vs_reg): /gpio@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8ulp-rpmsg.dtsi:48.22-57.4: Warning (unit_address_vs_reg): /gpio@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8ulp-evk.dts:79.40-82.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:850.24-863.5: Warning (simple_bus_reg): /soc@0/gpio@2d000080: simple-bus unit address format error, expected "2d000000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:865.24-878.5: Warning (simple_bus_reg): /soc@0/gpio@2d010080: simple-bus unit address format error, expected "2d010000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1101.29-1129.7: Warning (simple_bus_reg): /soc@0/bus@2d800000/camera/csi@2dad0000: simple-bus unit address format error, expected "2daf0000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1310.24-1323.5: Warning (simple_bus_reg): /soc@0/gpio@2e200080: simple-bus unit address format error, expected "2e200000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:468.29-489.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@29000000/flexio@29350000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8ulp.dtsi:582.25-597.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@29000000/spi@293c0000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1132.22-1177.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@2d800000/dsi@2db00000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:223.13-1324.4: Warning (unique_unit_address_if_enabled): /soc@0: duplicate unit-address (also used in node /gpio@0)
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1101.29-1129.7: Warning (graph_child_address): /soc@0/bus@2d800000/camera/csi@2dad0000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:659.29-666.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1224.32-1247.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1261.34-1274.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_csi@32e30000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:668.34-673.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mm-ab2-m4.dts:33.13-36.5: Warning (unit_address_vs_reg): /reserved-memory/rsc-table: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:659.29-666.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1224.32-1247.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1261.34-1274.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_csi@32e30000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:668.34-673.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:95.11-102.4: Warning (unit_address_vs_reg): /gpu: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8ulp-rpmsg.dtsi:37.22-46.4: Warning (unit_address_vs_reg): /gpio@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8ulp-rpmsg.dtsi:48.22-57.4: Warning (unit_address_vs_reg): /gpio@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8ulp-evk.dts:79.40-82.5: Warning (unit_address_vs_reg): /reserved-memory/dsp_reserved_heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:850.24-863.5: Warning (simple_bus_reg): /soc@0/gpio@2d000080: simple-bus unit address format error, expected "2d000000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:865.24-878.5: Warning (simple_bus_reg): /soc@0/gpio@2d010080: simple-bus unit address format error, expected "2d010000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1101.29-1129.7: Warning (simple_bus_reg): /soc@0/bus@2d800000/camera/csi@2dad0000: simple-bus unit address format error, expected "2daf0000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1310.24-1323.5: Warning (simple_bus_reg): /soc@0/gpio@2e200080: simple-bus unit address format error, expected "2e200000"
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:468.29-489.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@29000000/flexio@29350000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8ulp.dtsi:582.25-597.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@29000000/spi@293c0000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1132.22-1177.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@2d800000/dsi@2db00000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:223.13-1324.4: Warning (unique_unit_address_if_enabled): /soc@0: duplicate unit-address (also used in node /gpio@0)
   arch/arm64/boot/dts/freescale/imx8ulp.dtsi:1101.29-1129.7: Warning (graph_child_address): /soc@0/bus@2d800000/camera/csi@2dad0000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:138.8-142.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:144.8-148.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led3: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:150.8-154.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led4: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:156.8-160.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led5: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:162.8-166.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led6: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:168.8-172.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led7: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:174.8-178.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led8: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:180.8-184.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led9: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:186.9-190.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led10: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx8mm-evk-8mic-revE.dts:192.9-196.5: Warning (unit_address_vs_reg): /soc@0/bus@30800000/i2c@30a40000/pca9955btw@7/led11: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:579.15-584.10: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:552.31-558.5: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_csi@32e30000/port/endpoint@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi:560.28-562.5: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_csi@32e30000/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:659.29-666.6: Warning (simple_bus_reg): /soc@0/bus@30000000/caam_secvio: missing or empty reg/ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1224.32-1247.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1261.34-1274.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_csi@32e30000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:668.34-673.6: Warning (unique_unit_address_if_enabled): /soc@0/bus@30000000/caam-snvs@30370000: duplicate unit-address (also used in node /soc@0/bus@30000000/snvs@30370000)
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1242.12-1246.7: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/mipi_dsi@32e10000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk-inmate.dts:24.21-29.4: Warning (unit_address_vs_reg): /clock@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk-inmate.dts:32.20-37.4: Warning (unit_address_vs_reg): /clock@9: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk-inmate.dts:38.20-43.4: Warning (unit_address_vs_reg): /clock@10: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk-inmate.dts:44.21-49.4: Warning (unit_address_vs_reg): /clock@11: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1303.22-1306.6: Warning (simple_bus_reg): /soc@0/bus@32c00000/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1224.32-1247.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@32c00000/mipi_dsi@32e10000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mm.dtsi:1195.26-1222.6: Warning (graph_child_address): /soc@0/bus@32c00000/lcdif@32e00000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1242 arch/arm64/boot/dts/freescale/imx8mm.dtsi

a05ea40eb384e2 Jacky Bai           2019-03-22    16  
a05ea40eb384e2 Jacky Bai           2019-03-22    17  / {
a05ea40eb384e2 Jacky Bai           2019-03-22    18  	interrupt-parent = <&gic>;
a05ea40eb384e2 Jacky Bai           2019-03-22    19  	#address-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22    20  	#size-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22    21  
a05ea40eb384e2 Jacky Bai           2019-03-22    22  	aliases {
a05ea40eb384e2 Jacky Bai           2019-03-22    23  		ethernet0 = &fec1;
83ae2848520a91 Peng Fan            2020-05-20    24  		gpio0 = &gpio1;
83ae2848520a91 Peng Fan            2020-05-20    25  		gpio1 = &gpio2;
83ae2848520a91 Peng Fan            2020-05-20    26  		gpio2 = &gpio3;
83ae2848520a91 Peng Fan            2020-05-20    27  		gpio3 = &gpio4;
83ae2848520a91 Peng Fan            2020-05-20    28  		gpio4 = &gpio5;
a05ea40eb384e2 Jacky Bai           2019-03-22    29  		i2c0 = &i2c1;
a05ea40eb384e2 Jacky Bai           2019-03-22    30  		i2c1 = &i2c2;
a05ea40eb384e2 Jacky Bai           2019-03-22    31  		i2c2 = &i2c3;
a05ea40eb384e2 Jacky Bai           2019-03-22    32  		i2c3 = &i2c4;
83ae2848520a91 Peng Fan            2020-05-20    33  		mmc0 = &usdhc1;
83ae2848520a91 Peng Fan            2020-05-20    34  		mmc1 = &usdhc2;
83ae2848520a91 Peng Fan            2020-05-20    35  		mmc2 = &usdhc3;
282ada115a010a Shengjiu Wang       2020-04-15    36  		sai1 = &sai1;
282ada115a010a Shengjiu Wang       2020-04-15    37  		sai2 = &sai2;
282ada115a010a Shengjiu Wang       2020-04-15    38  		sai3 = &sai3;
282ada115a010a Shengjiu Wang       2020-04-15    39  		sai5 = &sai5;
282ada115a010a Shengjiu Wang       2020-04-15    40  		sai6 = &sai6;
a05ea40eb384e2 Jacky Bai           2019-03-22    41  		serial0 = &uart1;
a05ea40eb384e2 Jacky Bai           2019-03-22    42  		serial1 = &uart2;
a05ea40eb384e2 Jacky Bai           2019-03-22    43  		serial2 = &uart3;
a05ea40eb384e2 Jacky Bai           2019-03-22    44  		serial3 = &uart4;
a05ea40eb384e2 Jacky Bai           2019-03-22    45  		spi0 = &ecspi1;
a05ea40eb384e2 Jacky Bai           2019-03-22    46  		spi1 = &ecspi2;
a05ea40eb384e2 Jacky Bai           2019-03-22    47  		spi2 = &ecspi3;
a05ea40eb384e2 Jacky Bai           2019-03-22    48  	};
a05ea40eb384e2 Jacky Bai           2019-03-22    49  
a05ea40eb384e2 Jacky Bai           2019-03-22    50  	cpus {
a05ea40eb384e2 Jacky Bai           2019-03-22    51  		#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22    52  		#size-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22    53  
a1406b72cbca4d Anson Huang         2019-08-16    54  		idle-states {
a1406b72cbca4d Anson Huang         2019-08-16    55  			entry-method = "psci";
a1406b72cbca4d Anson Huang         2019-08-16    56  
a1406b72cbca4d Anson Huang         2019-08-16    57  			cpu_pd_wait: cpu-pd-wait {
a1406b72cbca4d Anson Huang         2019-08-16    58  				compatible = "arm,idle-state";
a1406b72cbca4d Anson Huang         2019-08-16    59  				arm,psci-suspend-param = <0x0010033>;
a1406b72cbca4d Anson Huang         2019-08-16    60  				local-timer-stop;
a1406b72cbca4d Anson Huang         2019-08-16    61  				entry-latency-us = <1000>;
a1406b72cbca4d Anson Huang         2019-08-16    62  				exit-latency-us = <700>;
a1406b72cbca4d Anson Huang         2019-08-16    63  				min-residency-us = <2700>;
a1406b72cbca4d Anson Huang         2019-08-16    64  			};
a1406b72cbca4d Anson Huang         2019-08-16    65  		};
a1406b72cbca4d Anson Huang         2019-08-16    66  
a05ea40eb384e2 Jacky Bai           2019-03-22    67  		A53_0: cpu@0 {
a05ea40eb384e2 Jacky Bai           2019-03-22    68  			device_type = "cpu";
a05ea40eb384e2 Jacky Bai           2019-03-22    69  			compatible = "arm,cortex-a53";
a05ea40eb384e2 Jacky Bai           2019-03-22    70  			reg = <0x0>;
e85c9d0faa7504 Leonard Crestez     2019-04-12    71  			clock-latency = <61036>; /* two CLK32 periods */
e85c9d0faa7504 Leonard Crestez     2019-04-12    72  			clocks = <&clk IMX8MM_CLK_ARM>;
a05ea40eb384e2 Jacky Bai           2019-03-22    73  			enable-method = "psci";
cb551b5e3bab54 Peng Fan            2021-11-12    74  			i-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan            2021-11-12    75  			i-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12    76  			i-cache-sets = <256>;
cb551b5e3bab54 Peng Fan            2021-11-12    77  			d-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan            2021-11-12    78  			d-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12    79  			d-cache-sets = <128>;
a05ea40eb384e2 Jacky Bai           2019-03-22    80  			next-level-cache = <&A53_L2>;
e85c9d0faa7504 Leonard Crestez     2019-04-12    81  			operating-points-v2 = <&a53_opp_table>;
f403a26c865b3b Leonard Crestez     2019-05-13    82  			nvmem-cells = <&cpu_speed_grade>;
f403a26c865b3b Leonard Crestez     2019-05-13    83  			nvmem-cell-names = "speed_grade";
a1406b72cbca4d Anson Huang         2019-08-16    84  			cpu-idle-states = <&cpu_pd_wait>;
11699fd5ca3264 Anson Huang         2020-02-29    85  			#cooling-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22    86  		};
a05ea40eb384e2 Jacky Bai           2019-03-22    87  
a05ea40eb384e2 Jacky Bai           2019-03-22    88  		A53_1: cpu@1 {
a05ea40eb384e2 Jacky Bai           2019-03-22    89  			device_type = "cpu";
a05ea40eb384e2 Jacky Bai           2019-03-22    90  			compatible = "arm,cortex-a53";
a05ea40eb384e2 Jacky Bai           2019-03-22    91  			reg = <0x1>;
e85c9d0faa7504 Leonard Crestez     2019-04-12    92  			clock-latency = <61036>; /* two CLK32 periods */
e85c9d0faa7504 Leonard Crestez     2019-04-12    93  			clocks = <&clk IMX8MM_CLK_ARM>;
a05ea40eb384e2 Jacky Bai           2019-03-22    94  			enable-method = "psci";
cb551b5e3bab54 Peng Fan            2021-11-12    95  			i-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan            2021-11-12    96  			i-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12    97  			i-cache-sets = <256>;
cb551b5e3bab54 Peng Fan            2021-11-12    98  			d-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan            2021-11-12    99  			d-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12   100  			d-cache-sets = <128>;
a05ea40eb384e2 Jacky Bai           2019-03-22   101  			next-level-cache = <&A53_L2>;
e85c9d0faa7504 Leonard Crestez     2019-04-12   102  			operating-points-v2 = <&a53_opp_table>;
a1406b72cbca4d Anson Huang         2019-08-16   103  			cpu-idle-states = <&cpu_pd_wait>;
11699fd5ca3264 Anson Huang         2020-02-29   104  			#cooling-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   105  		};
a05ea40eb384e2 Jacky Bai           2019-03-22   106  
a05ea40eb384e2 Jacky Bai           2019-03-22   107  		A53_2: cpu@2 {
a05ea40eb384e2 Jacky Bai           2019-03-22   108  			device_type = "cpu";
a05ea40eb384e2 Jacky Bai           2019-03-22   109  			compatible = "arm,cortex-a53";
a05ea40eb384e2 Jacky Bai           2019-03-22   110  			reg = <0x2>;
e85c9d0faa7504 Leonard Crestez     2019-04-12   111  			clock-latency = <61036>; /* two CLK32 periods */
e85c9d0faa7504 Leonard Crestez     2019-04-12   112  			clocks = <&clk IMX8MM_CLK_ARM>;
a05ea40eb384e2 Jacky Bai           2019-03-22   113  			enable-method = "psci";
cb551b5e3bab54 Peng Fan            2021-11-12   114  			i-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan            2021-11-12   115  			i-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12   116  			i-cache-sets = <256>;
cb551b5e3bab54 Peng Fan            2021-11-12   117  			d-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan            2021-11-12   118  			d-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12   119  			d-cache-sets = <128>;
a05ea40eb384e2 Jacky Bai           2019-03-22   120  			next-level-cache = <&A53_L2>;
e85c9d0faa7504 Leonard Crestez     2019-04-12   121  			operating-points-v2 = <&a53_opp_table>;
a1406b72cbca4d Anson Huang         2019-08-16   122  			cpu-idle-states = <&cpu_pd_wait>;
11699fd5ca3264 Anson Huang         2020-02-29   123  			#cooling-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   124  		};
a05ea40eb384e2 Jacky Bai           2019-03-22   125  
a05ea40eb384e2 Jacky Bai           2019-03-22   126  		A53_3: cpu@3 {
a05ea40eb384e2 Jacky Bai           2019-03-22   127  			device_type = "cpu";
a05ea40eb384e2 Jacky Bai           2019-03-22   128  			compatible = "arm,cortex-a53";
a05ea40eb384e2 Jacky Bai           2019-03-22   129  			reg = <0x3>;
e85c9d0faa7504 Leonard Crestez     2019-04-12   130  			clock-latency = <61036>; /* two CLK32 periods */
e85c9d0faa7504 Leonard Crestez     2019-04-12   131  			clocks = <&clk IMX8MM_CLK_ARM>;
a05ea40eb384e2 Jacky Bai           2019-03-22   132  			enable-method = "psci";
cb551b5e3bab54 Peng Fan            2021-11-12   133  			i-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan            2021-11-12   134  			i-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12   135  			i-cache-sets = <256>;
cb551b5e3bab54 Peng Fan            2021-11-12   136  			d-cache-size = <0x8000>;
cb551b5e3bab54 Peng Fan            2021-11-12   137  			d-cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12   138  			d-cache-sets = <128>;
a05ea40eb384e2 Jacky Bai           2019-03-22   139  			next-level-cache = <&A53_L2>;
e85c9d0faa7504 Leonard Crestez     2019-04-12   140  			operating-points-v2 = <&a53_opp_table>;
a1406b72cbca4d Anson Huang         2019-08-16   141  			cpu-idle-states = <&cpu_pd_wait>;
11699fd5ca3264 Anson Huang         2020-02-29   142  			#cooling-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   143  		};
a05ea40eb384e2 Jacky Bai           2019-03-22   144  
a05ea40eb384e2 Jacky Bai           2019-03-22   145  		A53_L2: l2-cache0 {
a05ea40eb384e2 Jacky Bai           2019-03-22   146  			compatible = "cache";
cb551b5e3bab54 Peng Fan            2021-11-12   147  			cache-level = <2>;
3b450831e5f1af Pierre Gondois      2022-11-07   148  			cache-unified;
cb551b5e3bab54 Peng Fan            2021-11-12   149  			cache-size = <0x80000>;
cb551b5e3bab54 Peng Fan            2021-11-12   150  			cache-line-size = <64>;
cb551b5e3bab54 Peng Fan            2021-11-12   151  			cache-sets = <512>;
a05ea40eb384e2 Jacky Bai           2019-03-22   152  		};
a05ea40eb384e2 Jacky Bai           2019-03-22   153  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   154  
e85c9d0faa7504 Leonard Crestez     2019-04-12   155  	a53_opp_table: opp-table {
e85c9d0faa7504 Leonard Crestez     2019-04-12   156  		compatible = "operating-points-v2";
e85c9d0faa7504 Leonard Crestez     2019-04-12   157  		opp-shared;
e85c9d0faa7504 Leonard Crestez     2019-04-12   158  
e85c9d0faa7504 Leonard Crestez     2019-04-12   159  		opp-1200000000 {
e85c9d0faa7504 Leonard Crestez     2019-04-12   160  			opp-hz = /bits/ 64 <1200000000>;
e85c9d0faa7504 Leonard Crestez     2019-04-12   161  			opp-microvolt = <850000>;
f403a26c865b3b Leonard Crestez     2019-05-13   162  			opp-supported-hw = <0xe>, <0x7>;
e85c9d0faa7504 Leonard Crestez     2019-04-12   163  			clock-latency-ns = <150000>;
0d9df5815ccc9c Anson Huang         2019-07-09   164  			opp-suspend;
e85c9d0faa7504 Leonard Crestez     2019-04-12   165  		};
e85c9d0faa7504 Leonard Crestez     2019-04-12   166  
e85c9d0faa7504 Leonard Crestez     2019-04-12   167  		opp-1600000000 {
e85c9d0faa7504 Leonard Crestez     2019-04-12   168  			opp-hz = /bits/ 64 <1600000000>;
d19d2152ca055b Lucas Stach         2020-11-05   169  			opp-microvolt = <950000>;
f403a26c865b3b Leonard Crestez     2019-05-13   170  			opp-supported-hw = <0xc>, <0x7>;
f403a26c865b3b Leonard Crestez     2019-05-13   171  			clock-latency-ns = <150000>;
0d9df5815ccc9c Anson Huang         2019-07-09   172  			opp-suspend;
f403a26c865b3b Leonard Crestez     2019-05-13   173  		};
f403a26c865b3b Leonard Crestez     2019-05-13   174  
f403a26c865b3b Leonard Crestez     2019-05-13   175  		opp-1800000000 {
f403a26c865b3b Leonard Crestez     2019-05-13   176  			opp-hz = /bits/ 64 <1800000000>;
f403a26c865b3b Leonard Crestez     2019-05-13   177  			opp-microvolt = <1000000>;
cd7c2ddfda3629 Anson Huang         2019-06-29   178  			opp-supported-hw = <0x8>, <0x3>;
e85c9d0faa7504 Leonard Crestez     2019-04-12   179  			clock-latency-ns = <150000>;
0d9df5815ccc9c Anson Huang         2019-07-09   180  			opp-suspend;
e85c9d0faa7504 Leonard Crestez     2019-04-12   181  		};
e85c9d0faa7504 Leonard Crestez     2019-04-12   182  	};
e85c9d0faa7504 Leonard Crestez     2019-04-12   183  
61d1f2e317cc97 Zhou Peng           2019-10-10   184  	resmem: reserved-memory {
61d1f2e317cc97 Zhou Peng           2019-10-10   185  		#address-cells = <2>;
61d1f2e317cc97 Zhou Peng           2019-10-10   186  		#size-cells = <2>;
61d1f2e317cc97 Zhou Peng           2019-10-10   187  		ranges;
61d1f2e317cc97 Zhou Peng           2019-10-10   188  
61d1f2e317cc97 Zhou Peng           2019-10-10   189  		/* global autoconfigured region for contiguous allocations */
61d1f2e317cc97 Zhou Peng           2019-10-10   190  		linux,cma {
61d1f2e317cc97 Zhou Peng           2019-10-10   191  			compatible = "shared-dma-pool";
61d1f2e317cc97 Zhou Peng           2019-10-10   192  			reusable;
61d1f2e317cc97 Zhou Peng           2019-10-10   193  			size = <0 0x28000000>;
61d1f2e317cc97 Zhou Peng           2019-10-10   194  			alloc-ranges = <0 0x80000000 0 0x40000000>;
61d1f2e317cc97 Zhou Peng           2019-10-10   195  			linux,cma-default;
61d1f2e317cc97 Zhou Peng           2019-10-10   196  		};
61d1f2e317cc97 Zhou Peng           2019-10-10   197  	};
61d1f2e317cc97 Zhou Peng           2019-10-10   198  
a05ea40eb384e2 Jacky Bai           2019-03-22   199  	osc_32k: clock-osc-32k {
a05ea40eb384e2 Jacky Bai           2019-03-22   200  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai           2019-03-22   201  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   202  		clock-frequency = <32768>;
a05ea40eb384e2 Jacky Bai           2019-03-22   203  		clock-output-names = "osc_32k";
a05ea40eb384e2 Jacky Bai           2019-03-22   204  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   205  
a05ea40eb384e2 Jacky Bai           2019-03-22   206  	osc_24m: clock-osc-24m {
a05ea40eb384e2 Jacky Bai           2019-03-22   207  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai           2019-03-22   208  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   209  		clock-frequency = <24000000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   210  		clock-output-names = "osc_24m";
a05ea40eb384e2 Jacky Bai           2019-03-22   211  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   212  
a05ea40eb384e2 Jacky Bai           2019-03-22   213  	clk_ext1: clock-ext1 {
a05ea40eb384e2 Jacky Bai           2019-03-22   214  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai           2019-03-22   215  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   216  		clock-frequency = <133000000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   217  		clock-output-names = "clk_ext1";
a05ea40eb384e2 Jacky Bai           2019-03-22   218  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   219  
a05ea40eb384e2 Jacky Bai           2019-03-22   220  	clk_ext2: clock-ext2 {
a05ea40eb384e2 Jacky Bai           2019-03-22   221  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai           2019-03-22   222  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   223  		clock-frequency = <133000000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   224  		clock-output-names = "clk_ext2";
a05ea40eb384e2 Jacky Bai           2019-03-22   225  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   226  
a05ea40eb384e2 Jacky Bai           2019-03-22   227  	clk_ext3: clock-ext3 {
a05ea40eb384e2 Jacky Bai           2019-03-22   228  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai           2019-03-22   229  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   230  		clock-frequency = <133000000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   231  		clock-output-names = "clk_ext3";
a05ea40eb384e2 Jacky Bai           2019-03-22   232  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   233  
a05ea40eb384e2 Jacky Bai           2019-03-22   234  	clk_ext4: clock-ext4 {
a05ea40eb384e2 Jacky Bai           2019-03-22   235  		compatible = "fixed-clock";
a05ea40eb384e2 Jacky Bai           2019-03-22   236  		#clock-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   237  		clock-frequency = <133000000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   238  		clock-output-names = "clk_ext4";
a05ea40eb384e2 Jacky Bai           2019-03-22   239  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   240  
a05ea40eb384e2 Jacky Bai           2019-03-22   241  	psci {
a05ea40eb384e2 Jacky Bai           2019-03-22   242  		compatible = "arm,psci-1.0";
a05ea40eb384e2 Jacky Bai           2019-03-22   243  		method = "smc";
a05ea40eb384e2 Jacky Bai           2019-03-22   244  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   245  
a05ea40eb384e2 Jacky Bai           2019-03-22   246  	pmu {
ceec36ee0d156e Peng Fan            2021-08-07   247  		compatible = "arm,cortex-a53-pmu";
a05ea40eb384e2 Jacky Bai           2019-03-22   248  		interrupts = <GIC_PPI 7
5c22a9af414c46 Krzysztof Kozlowski 2020-09-29   249  			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
a05ea40eb384e2 Jacky Bai           2019-03-22   250  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   251  
a05ea40eb384e2 Jacky Bai           2019-03-22   252  	timer {
a05ea40eb384e2 Jacky Bai           2019-03-22   253  		compatible = "arm,armv8-timer";
5c22a9af414c46 Krzysztof Kozlowski 2020-09-29   254  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
5c22a9af414c46 Krzysztof Kozlowski 2020-09-29   255  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
5c22a9af414c46 Krzysztof Kozlowski 2020-09-29   256  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
5c22a9af414c46 Krzysztof Kozlowski 2020-09-29   257  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
a05ea40eb384e2 Jacky Bai           2019-03-22   258  		clock-frequency = <8000000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   259  		arm,no-tick-in-suspend;
a05ea40eb384e2 Jacky Bai           2019-03-22   260  	};
a05ea40eb384e2 Jacky Bai           2019-03-22   261  
11699fd5ca3264 Anson Huang         2020-02-29   262  	thermal-zones {
11699fd5ca3264 Anson Huang         2020-02-29   263  		cpu-thermal {
11699fd5ca3264 Anson Huang         2020-02-29   264  			polling-delay-passive = <250>;
11699fd5ca3264 Anson Huang         2020-02-29   265  			polling-delay = <2000>;
11699fd5ca3264 Anson Huang         2020-02-29   266  			thermal-sensors = <&tmu>;
11699fd5ca3264 Anson Huang         2020-02-29   267  			trips {
11699fd5ca3264 Anson Huang         2020-02-29   268  				cpu_alert0: trip0 {
11699fd5ca3264 Anson Huang         2020-02-29   269  					temperature = <85000>;
11699fd5ca3264 Anson Huang         2020-02-29   270  					hysteresis = <2000>;
11699fd5ca3264 Anson Huang         2020-02-29   271  					type = "passive";
11699fd5ca3264 Anson Huang         2020-02-29   272  				};
11699fd5ca3264 Anson Huang         2020-02-29   273  
11699fd5ca3264 Anson Huang         2020-02-29   274  				cpu_crit0: trip1 {
11699fd5ca3264 Anson Huang         2020-02-29   275  					temperature = <95000>;
11699fd5ca3264 Anson Huang         2020-02-29   276  					hysteresis = <2000>;
11699fd5ca3264 Anson Huang         2020-02-29   277  					type = "critical";
11699fd5ca3264 Anson Huang         2020-02-29   278  				};
11699fd5ca3264 Anson Huang         2020-02-29   279  			};
11699fd5ca3264 Anson Huang         2020-02-29   280  
11699fd5ca3264 Anson Huang         2020-02-29   281  			cooling-maps {
11699fd5ca3264 Anson Huang         2020-02-29   282  				map0 {
11699fd5ca3264 Anson Huang         2020-02-29   283  					trip = <&cpu_alert0>;
11699fd5ca3264 Anson Huang         2020-02-29   284  					cooling-device =
11699fd5ca3264 Anson Huang         2020-02-29   285  						<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
11699fd5ca3264 Anson Huang         2020-02-29   286  						<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
11699fd5ca3264 Anson Huang         2020-02-29   287  						<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
11699fd5ca3264 Anson Huang         2020-02-29   288  						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
11699fd5ca3264 Anson Huang         2020-02-29   289  				};
11699fd5ca3264 Anson Huang         2020-02-29   290  			};
11699fd5ca3264 Anson Huang         2020-02-29   291  		};
11699fd5ca3264 Anson Huang         2020-02-29   292  	};
11699fd5ca3264 Anson Huang         2020-02-29   293  
a656622a22d665 Fabio Estevam       2019-05-28   294  	usbphynop1: usbphynop1 {
78e80c4b4238c1 Marek Vasut         2021-07-21   295  		#phy-cells = <0>;
a656622a22d665 Fabio Estevam       2019-05-28   296  		compatible = "usb-nop-xceiv";
a656622a22d665 Fabio Estevam       2019-05-28   297  		clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
a656622a22d665 Fabio Estevam       2019-05-28   298  		assigned-clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
a656622a22d665 Fabio Estevam       2019-05-28   299  		assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
a656622a22d665 Fabio Estevam       2019-05-28   300  		clock-names = "main_clk";
4585c79ff477f9 Li Jun              2022-09-26   301  		power-domains = <&pgc_otg1>;
b91d40d1ee33c8 Li Jun              2022-11-04   302  		wakeup-source;
a656622a22d665 Fabio Estevam       2019-05-28   303  	};
a656622a22d665 Fabio Estevam       2019-05-28   304  
a656622a22d665 Fabio Estevam       2019-05-28   305  	usbphynop2: usbphynop2 {
78e80c4b4238c1 Marek Vasut         2021-07-21   306  		#phy-cells = <0>;
a656622a22d665 Fabio Estevam       2019-05-28   307  		compatible = "usb-nop-xceiv";
a656622a22d665 Fabio Estevam       2019-05-28   308  		clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
a656622a22d665 Fabio Estevam       2019-05-28   309  		assigned-clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
a656622a22d665 Fabio Estevam       2019-05-28   310  		assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
a656622a22d665 Fabio Estevam       2019-05-28   311  		clock-names = "main_clk";
4585c79ff477f9 Li Jun              2022-09-26   312  		power-domains = <&pgc_otg2>;
b91d40d1ee33c8 Li Jun              2022-11-04   313  		wakeup-source;
a656622a22d665 Fabio Estevam       2019-05-28   314  	};
a656622a22d665 Fabio Estevam       2019-05-28   315  
7db616c59d8d84 Leonard Crestez     2019-05-10   316  	busfreq { /* BUSFREQ */
7db616c59d8d84 Leonard Crestez     2019-05-10   317  		compatible = "fsl,imx_busfreq";
7db616c59d8d84 Leonard Crestez     2019-05-10   318  		clocks = <&clk IMX8MM_DRAM_PLL_OUT>, <&clk IMX8MM_CLK_DRAM_ALT>,
7db616c59d8d84 Leonard Crestez     2019-05-10   319  			 <&clk IMX8MM_CLK_DRAM_APB>, <&clk IMX8MM_CLK_DRAM_APB>,
7db616c59d8d84 Leonard Crestez     2019-05-10   320  		         <&clk IMX8MM_CLK_DRAM_CORE>, <&clk IMX8MM_CLK_DRAM_ALT_ROOT>,
7db616c59d8d84 Leonard Crestez     2019-05-10   321  			 <&clk IMX8MM_SYS_PLL1_40M>, <&clk IMX8MM_SYS_PLL1_100M>,
7db616c59d8d84 Leonard Crestez     2019-05-10   322  			 <&clk IMX8MM_SYS_PLL2_333M>, <&clk IMX8MM_CLK_NOC>,
7db616c59d8d84 Leonard Crestez     2019-05-10   323  			 <&clk IMX8MM_CLK_AHB>, <&clk IMX8MM_CLK_MAIN_AXI>,
7db616c59d8d84 Leonard Crestez     2019-05-10   324  			 <&clk IMX8MM_CLK_24M>, <&clk IMX8MM_SYS_PLL1_800M>,
7db616c59d8d84 Leonard Crestez     2019-05-10   325  			 <&clk IMX8MM_DRAM_PLL>;
7db616c59d8d84 Leonard Crestez     2019-05-10   326  		clock-names = "dram_pll", "dram_alt_src", "dram_apb_src", "dram_apb_pre_div",
7db616c59d8d84 Leonard Crestez     2019-05-10   327  			      "dram_core", "dram_alt_root", "sys_pll1_40m", "sys_pll1_100m",
7db616c59d8d84 Leonard Crestez     2019-05-10   328  			      "sys_pll2_333m", "noc_div", "ahb_div", "main_axi_src", "osc_24m",
7db616c59d8d84 Leonard Crestez     2019-05-10   329  			      "sys_pll1_800m", "dram_pll_div";
7db616c59d8d84 Leonard Crestez     2019-05-10   330  		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
7db616c59d8d84 Leonard Crestez     2019-05-10   331  			     <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
7db616c59d8d84 Leonard Crestez     2019-05-10   332  		interrupt-name = "irq_busfreq_0", "irq_busfreq_1", "irq_busfreq_2", "irq_busfreq_3";
7db616c59d8d84 Leonard Crestez     2019-05-10   333  	};
7db616c59d8d84 Leonard Crestez     2019-05-10   334  
fcdef92ba63975 Fabio Estevam       2022-06-14   335  	soc: soc@0 {
b3d131531fdd57 Robin Gong          2021-06-04   336  		compatible = "simple-bus";
a05ea40eb384e2 Jacky Bai           2019-03-22   337  		#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   338  		#size-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   339  		ranges = <0x0 0x0 0x0 0x3e000000>;
4251a3ac4de962 Lucas Stach         2021-05-04   340  		dma-ranges = <0x40000000 0x0 0x40000000 0xc0000000>;
d3bba217b63bc9 Alice Guo           2021-01-04   341  		nvmem-cells = <&imx8mm_uid>;
d3bba217b63bc9 Alice Guo           2021-01-04   342  		nvmem-cell-names = "soc_unique_id";
a05ea40eb384e2 Jacky Bai           2019-03-22   343  
6dce1fb4c3fb45 Horia Geantă        2019-11-27   344  		caam_sm: caam-sm@100000 {
6dce1fb4c3fb45 Horia Geantă        2019-11-27   345  			compatible = "fsl,imx6q-caam-sm";
6dce1fb4c3fb45 Horia Geantă        2019-11-27   346  			reg = <0x100000 0x8000>;
6dce1fb4c3fb45 Horia Geantă        2019-11-27   347  		};
6dce1fb4c3fb45 Horia Geantă        2019-11-27   348  
a05ea40eb384e2 Jacky Bai           2019-03-22   349  		aips1: bus@30000000 {
dc3efc6ff0d51a Peng Fan            2020-03-11   350  			compatible = "fsl,aips-bus", "simple-bus";
921a6845d01b66 Fabio Estevam       2020-03-31   351  			reg = <0x30000000 0x400000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   352  			#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   353  			#size-cells = <1>;
10c7420738e683 Fabio Estevam       2019-06-05   354  			ranges = <0x30000000 0x30000000 0x400000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   355  
7923353b623d51 Adam Ford           2021-04-05   356  			spba2: spba-bus@30000000 {
7923353b623d51 Adam Ford           2021-04-05   357  				compatible = "fsl,spba-bus", "simple-bus";
7923353b623d51 Adam Ford           2021-04-05   358  				#address-cells = <1>;
7923353b623d51 Adam Ford           2021-04-05   359  				#size-cells = <1>;
7923353b623d51 Adam Ford           2021-04-05   360  				reg = <0x30000000 0x100000>;
7923353b623d51 Adam Ford           2021-04-05   361  				ranges;
7923353b623d51 Adam Ford           2021-04-05   362  
4bee4357428280 Daniel Baluta       2019-05-15   363  				sai1: sai@30010000 {
ebfa8951e6cd22 Matt Porter         2020-04-15   364  					#sound-dai-cells = <0>;
4bee4357428280 Daniel Baluta       2019-05-15   365  					compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
4bee4357428280 Daniel Baluta       2019-05-15   366  					reg = <0x30010000 0x10000>;
4bee4357428280 Daniel Baluta       2019-05-15   367  					interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
194bf2d2634875 Adrian Alonso       2020-05-04   368  					clocks = <&clk IMX8MM_CLK_SAI1_IPG>, <&clk IMX8MM_CLK_DUMMY>,
4bee4357428280 Daniel Baluta       2019-05-15   369  						 <&clk IMX8MM_CLK_SAI1_ROOT>,
4bee4357428280 Daniel Baluta       2019-05-15   370  						 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
194bf2d2634875 Adrian Alonso       2020-05-04   371  					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
4bee4357428280 Daniel Baluta       2019-05-15   372  					dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
4bee4357428280 Daniel Baluta       2019-05-15   373  					dma-names = "rx", "tx";
47a6bbff3d84e3 Shengjiu Wang       2019-11-15   374  					fsl,dataline = <0 0xff 0xff>;
4bee4357428280 Daniel Baluta       2019-05-15   375  					status = "disabled";
4bee4357428280 Daniel Baluta       2019-05-15   376  				};
4bee4357428280 Daniel Baluta       2019-05-15   377  
4bee4357428280 Daniel Baluta       2019-05-15   378  				sai2: sai@30020000 {
ebfa8951e6cd22 Matt Porter         2020-04-15   379  					#sound-dai-cells = <0>;
4bee4357428280 Daniel Baluta       2019-05-15   380  					compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
4bee4357428280 Daniel Baluta       2019-05-15   381  					reg = <0x30020000 0x10000>;
4bee4357428280 Daniel Baluta       2019-05-15   382  					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
194bf2d2634875 Adrian Alonso       2020-05-04   383  					clocks = <&clk IMX8MM_CLK_SAI2_IPG>, <&clk IMX8MM_CLK_DUMMY>,
4bee4357428280 Daniel Baluta       2019-05-15   384  						<&clk IMX8MM_CLK_SAI2_ROOT>,
4bee4357428280 Daniel Baluta       2019-05-15   385  						<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
194bf2d2634875 Adrian Alonso       2020-05-04   386  					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
4bee4357428280 Daniel Baluta       2019-05-15   387  					dmas = <&sdma2 2 2 0>, <&sdma2 3 2 0>;
4bee4357428280 Daniel Baluta       2019-05-15   388  					dma-names = "rx", "tx";
4bee4357428280 Daniel Baluta       2019-05-15   389  					status = "disabled";
4bee4357428280 Daniel Baluta       2019-05-15   390  				};
4bee4357428280 Daniel Baluta       2019-05-15   391  
4bee4357428280 Daniel Baluta       2019-05-15   392  				sai3: sai@30030000 {
4bee4357428280 Daniel Baluta       2019-05-15   393  					#sound-dai-cells = <0>;
4bee4357428280 Daniel Baluta       2019-05-15   394  					compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
4bee4357428280 Daniel Baluta       2019-05-15   395  					reg = <0x30030000 0x10000>;
4bee4357428280 Daniel Baluta       2019-05-15   396  					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
194bf2d2634875 Adrian Alonso       2020-05-04   397  					clocks = <&clk IMX8MM_CLK_SAI3_IPG>, <&clk IMX8MM_CLK_DUMMY>,
4bee4357428280 Daniel Baluta       2019-05-15   398  						 <&clk IMX8MM_CLK_SAI3_ROOT>,
4bee4357428280 Daniel Baluta       2019-05-15   399  						 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
194bf2d2634875 Adrian Alonso       2020-05-04   400  					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
4bee4357428280 Daniel Baluta       2019-05-15   401  					dmas = <&sdma2 4 2 0>, <&sdma2 5 2 0>;
4bee4357428280 Daniel Baluta       2019-05-15   402  					dma-names = "rx", "tx";
4bee4357428280 Daniel Baluta       2019-05-15   403  					status = "disabled";
4bee4357428280 Daniel Baluta       2019-05-15   404  				};
4bee4357428280 Daniel Baluta       2019-05-15   405  
4bee4357428280 Daniel Baluta       2019-05-15   406  				sai5: sai@30050000 {
ebfa8951e6cd22 Matt Porter         2020-04-15   407  					#sound-dai-cells = <0>;
4bee4357428280 Daniel Baluta       2019-05-15   408  					compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
4bee4357428280 Daniel Baluta       2019-05-15   409  					reg = <0x30050000 0x10000>;
4bee4357428280 Daniel Baluta       2019-05-15   410  					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
194bf2d2634875 Adrian Alonso       2020-05-04   411  					clocks = <&clk IMX8MM_CLK_SAI5_IPG>, <&clk IMX8MM_CLK_DUMMY>,
4bee4357428280 Daniel Baluta       2019-05-15   412  						 <&clk IMX8MM_CLK_SAI5_ROOT>,
4bee4357428280 Daniel Baluta       2019-05-15   413  						 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
194bf2d2634875 Adrian Alonso       2020-05-04   414  					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
4bee4357428280 Daniel Baluta       2019-05-15   415  					dmas = <&sdma2 8 2 0>, <&sdma2 9 2 0>;
4bee4357428280 Daniel Baluta       2019-05-15   416  					dma-names = "rx", "tx";
47a6bbff3d84e3 Shengjiu Wang       2019-11-15   417  					fsl,dataline = <0 0xf 0xf>;
4bee4357428280 Daniel Baluta       2019-05-15   418  					status = "disabled";
4bee4357428280 Daniel Baluta       2019-05-15   419  				};
4bee4357428280 Daniel Baluta       2019-05-15   420  
4bee4357428280 Daniel Baluta       2019-05-15   421  				sai6: sai@30060000 {
ebfa8951e6cd22 Matt Porter         2020-04-15   422  					#sound-dai-cells = <0>;
4bee4357428280 Daniel Baluta       2019-05-15   423  					compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
4bee4357428280 Daniel Baluta       2019-05-15   424  					reg = <0x30060000 0x10000>;
4bee4357428280 Daniel Baluta       2019-05-15   425  					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
194bf2d2634875 Adrian Alonso       2020-05-04   426  					clocks = <&clk IMX8MM_CLK_SAI6_IPG>, <&clk IMX8MM_CLK_DUMMY>,
4bee4357428280 Daniel Baluta       2019-05-15   427  						 <&clk IMX8MM_CLK_SAI6_ROOT>,
4bee4357428280 Daniel Baluta       2019-05-15   428  						 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
194bf2d2634875 Adrian Alonso       2020-05-04   429  					clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
4bee4357428280 Daniel Baluta       2019-05-15   430  					dmas = <&sdma2 10 2 0>, <&sdma2 11 2 0>;
4bee4357428280 Daniel Baluta       2019-05-15   431  					dma-names = "rx", "tx";
4bee4357428280 Daniel Baluta       2019-05-15   432  					status = "disabled";
4bee4357428280 Daniel Baluta       2019-05-15   433  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   434  
3bd0788c43d972 Adam Ford           2020-10-19   435  				micfil: audio-controller@30080000 {
3bd0788c43d972 Adam Ford           2020-10-19   436  					compatible = "fsl,imx8mm-micfil";
3bd0788c43d972 Adam Ford           2020-10-19   437  					reg = <0x30080000 0x10000>;
3bd0788c43d972 Adam Ford           2020-10-19   438  					interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
3bd0788c43d972 Adam Ford           2020-10-19   439  						     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
3bd0788c43d972 Adam Ford           2020-10-19   440  						     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
3bd0788c43d972 Adam Ford           2020-10-19   441  						     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
3bd0788c43d972 Adam Ford           2020-10-19   442  					clocks = <&clk IMX8MM_CLK_PDM_IPG>,
3bd0788c43d972 Adam Ford           2020-10-19   443  						 <&clk IMX8MM_CLK_PDM_ROOT>,
3bd0788c43d972 Adam Ford           2020-10-19   444  						 <&clk IMX8MM_AUDIO_PLL1_OUT>,
3bd0788c43d972 Adam Ford           2020-10-19   445  						 <&clk IMX8MM_AUDIO_PLL2_OUT>,
3bd0788c43d972 Adam Ford           2020-10-19   446  						 <&clk IMX8MM_CLK_EXT3>;
3bd0788c43d972 Adam Ford           2020-10-19   447  					clock-names = "ipg_clk", "ipg_clk_app",
3bd0788c43d972 Adam Ford           2020-10-19   448  						      "pll8k", "pll11k", "clkext3";
3bd0788c43d972 Adam Ford           2020-10-19   449  					dmas = <&sdma2 24 25 0x80000000>;
3bd0788c43d972 Adam Ford           2020-10-19   450  					dma-names = "rx";
3bd0788c43d972 Adam Ford           2020-10-19   451  					status = "disabled";
3bd0788c43d972 Adam Ford           2020-10-19   452  				};
3bd0788c43d972 Adam Ford           2020-10-19   453  
57412197faf186 Adam Ford           2020-10-19   454  				spdif1: spdif@30090000 {
57412197faf186 Adam Ford           2020-10-19   455  					compatible = "fsl,imx35-spdif";
57412197faf186 Adam Ford           2020-10-19   456  					reg = <0x30090000 0x10000>;
57412197faf186 Adam Ford           2020-10-19   457  					interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
57412197faf186 Adam Ford           2020-10-19   458  					clocks = <&clk IMX8MM_CLK_AUDIO_AHB>, /* core */
57412197faf186 Adam Ford           2020-10-19   459  						 <&clk IMX8MM_CLK_24M>, /* rxtx0 */
57412197faf186 Adam Ford           2020-10-19   460  						 <&clk IMX8MM_CLK_SPDIF1>, /* rxtx1 */
57412197faf186 Adam Ford           2020-10-19   461  						 <&clk IMX8MM_CLK_DUMMY>, /* rxtx2 */
57412197faf186 Adam Ford           2020-10-19   462  						 <&clk IMX8MM_CLK_DUMMY>, /* rxtx3 */
57412197faf186 Adam Ford           2020-10-19   463  						 <&clk IMX8MM_CLK_DUMMY>, /* rxtx4 */
57412197faf186 Adam Ford           2020-10-19   464  						 <&clk IMX8MM_CLK_AUDIO_AHB>, /* rxtx5 */
57412197faf186 Adam Ford           2020-10-19   465  						 <&clk IMX8MM_CLK_DUMMY>, /* rxtx6 */
57412197faf186 Adam Ford           2020-10-19   466  						 <&clk IMX8MM_CLK_DUMMY>, /* rxtx7 */
57412197faf186 Adam Ford           2020-10-19   467  						 <&clk IMX8MM_CLK_DUMMY>; /* spba */
57412197faf186 Adam Ford           2020-10-19   468  					clock-names = "core", "rxtx0",
57412197faf186 Adam Ford           2020-10-19   469  						      "rxtx1", "rxtx2",
57412197faf186 Adam Ford           2020-10-19   470  						      "rxtx3", "rxtx4",
57412197faf186 Adam Ford           2020-10-19   471  						      "rxtx5", "rxtx6",
57412197faf186 Adam Ford           2020-10-19   472  						      "rxtx7", "spba";
57412197faf186 Adam Ford           2020-10-19   473  					dmas = <&sdma2 28 18 0>, <&sdma2 29 18 0>;
57412197faf186 Adam Ford           2020-10-19   474  					dma-names = "rx", "tx";
57412197faf186 Adam Ford           2020-10-19   475  					status = "disabled";
57412197faf186 Adam Ford           2020-10-19   476  				};
7923353b623d51 Adam Ford           2021-04-05   477  			};
57412197faf186 Adam Ford           2020-10-19   478  
a05ea40eb384e2 Jacky Bai           2019-03-22   479  			gpio1: gpio@30200000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   480  				compatible = "fsl,imx8mm-gpio", "fsl,imx35-gpio";
a05ea40eb384e2 Jacky Bai           2019-03-22   481  				reg = <0x30200000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   482  				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
a05ea40eb384e2 Jacky Bai           2019-03-22   483  					     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
09892aa146feb9 Anson Huang         2019-05-12   484  				clocks = <&clk IMX8MM_CLK_GPIO1_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   485  				gpio-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   486  				#gpio-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   487  				interrupt-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   488  				#interrupt-cells = <2>;
156263599e9e89 Anson Huang         2019-07-02   489  				gpio-ranges = <&iomuxc 0 10 30>;
a05ea40eb384e2 Jacky Bai           2019-03-22   490  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   491  
a05ea40eb384e2 Jacky Bai           2019-03-22   492  			gpio2: gpio@30210000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   493  				compatible = "fsl,imx8mm-gpio", "fsl,imx35-gpio";
a05ea40eb384e2 Jacky Bai           2019-03-22   494  				reg = <0x30210000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   495  				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
a05ea40eb384e2 Jacky Bai           2019-03-22   496  					     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
09892aa146feb9 Anson Huang         2019-05-12   497  				clocks = <&clk IMX8MM_CLK_GPIO2_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   498  				gpio-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   499  				#gpio-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   500  				interrupt-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   501  				#interrupt-cells = <2>;
156263599e9e89 Anson Huang         2019-07-02   502  				gpio-ranges = <&iomuxc 0 40 21>;
a05ea40eb384e2 Jacky Bai           2019-03-22   503  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   504  
a05ea40eb384e2 Jacky Bai           2019-03-22   505  			gpio3: gpio@30220000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   506  				compatible = "fsl,imx8mm-gpio", "fsl,imx35-gpio";
a05ea40eb384e2 Jacky Bai           2019-03-22   507  				reg = <0x30220000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   508  				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
a05ea40eb384e2 Jacky Bai           2019-03-22   509  					     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
09892aa146feb9 Anson Huang         2019-05-12   510  				clocks = <&clk IMX8MM_CLK_GPIO3_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   511  				gpio-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   512  				#gpio-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   513  				interrupt-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   514  				#interrupt-cells = <2>;
156263599e9e89 Anson Huang         2019-07-02   515  				gpio-ranges = <&iomuxc 0 61 26>;
a05ea40eb384e2 Jacky Bai           2019-03-22   516  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   517  
a05ea40eb384e2 Jacky Bai           2019-03-22   518  			gpio4: gpio@30230000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   519  				compatible = "fsl,imx8mm-gpio", "fsl,imx35-gpio";
a05ea40eb384e2 Jacky Bai           2019-03-22   520  				reg = <0x30230000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   521  				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
a05ea40eb384e2 Jacky Bai           2019-03-22   522  					     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
09892aa146feb9 Anson Huang         2019-05-12   523  				clocks = <&clk IMX8MM_CLK_GPIO4_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   524  				gpio-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   525  				#gpio-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   526  				interrupt-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   527  				#interrupt-cells = <2>;
156263599e9e89 Anson Huang         2019-07-02   528  				gpio-ranges = <&iomuxc 0 87 32>;
a05ea40eb384e2 Jacky Bai           2019-03-22   529  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   530  
a05ea40eb384e2 Jacky Bai           2019-03-22   531  			gpio5: gpio@30240000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   532  				compatible = "fsl,imx8mm-gpio", "fsl,imx35-gpio";
a05ea40eb384e2 Jacky Bai           2019-03-22   533  				reg = <0x30240000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   534  				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
a05ea40eb384e2 Jacky Bai           2019-03-22   535  					     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
09892aa146feb9 Anson Huang         2019-05-12   536  				clocks = <&clk IMX8MM_CLK_GPIO5_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   537  				gpio-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   538  				#gpio-cells = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   539  				interrupt-controller;
a05ea40eb384e2 Jacky Bai           2019-03-22   540  				#interrupt-cells = <2>;
156263599e9e89 Anson Huang         2019-07-02   541  				gpio-ranges = <&iomuxc 0 119 30>;
a05ea40eb384e2 Jacky Bai           2019-03-22   542  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   543  
11699fd5ca3264 Anson Huang         2020-02-29   544  			tmu: tmu@30260000 {
11699fd5ca3264 Anson Huang         2020-02-29   545  				compatible = "fsl,imx8mm-tmu";
11699fd5ca3264 Anson Huang         2020-02-29   546  				reg = <0x30260000 0x10000>;
11699fd5ca3264 Anson Huang         2020-02-29   547  				clocks = <&clk IMX8MM_CLK_TMU_ROOT>;
105b9bb84f4936 Marek Vasut         2022-12-02   548  				nvmem-cells = <&tmu_calib>;
105b9bb84f4936 Marek Vasut         2022-12-02   549  				nvmem-cell-names = "calib";
11699fd5ca3264 Anson Huang         2020-02-29   550  				#thermal-sensor-cells = <0>;
11699fd5ca3264 Anson Huang         2020-02-29   551  			};
11699fd5ca3264 Anson Huang         2020-02-29   552  
a05ea40eb384e2 Jacky Bai           2019-03-22   553  			wdog1: watchdog@30280000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   554  				compatible = "fsl,imx8mm-wdt", "fsl,imx21-wdt";
a05ea40eb384e2 Jacky Bai           2019-03-22   555  				reg = <0x30280000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   556  				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   557  				clocks = <&clk IMX8MM_CLK_WDOG1_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   558  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   559  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   560  
a05ea40eb384e2 Jacky Bai           2019-03-22   561  			wdog2: watchdog@30290000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   562  				compatible = "fsl,imx8mm-wdt", "fsl,imx21-wdt";
a05ea40eb384e2 Jacky Bai           2019-03-22   563  				reg = <0x30290000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   564  				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   565  				clocks = <&clk IMX8MM_CLK_WDOG2_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   566  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   567  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   568  
a05ea40eb384e2 Jacky Bai           2019-03-22   569  			wdog3: watchdog@302a0000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   570  				compatible = "fsl,imx8mm-wdt", "fsl,imx21-wdt";
a05ea40eb384e2 Jacky Bai           2019-03-22   571  				reg = <0x302a0000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   572  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   573  				clocks = <&clk IMX8MM_CLK_WDOG3_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   574  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   575  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   576  
a05ea40eb384e2 Jacky Bai           2019-03-22   577  			sdma2: dma-controller@302c0000 {
e346ff93f02b1b Shengjiu Wang       2019-10-25   578  				compatible = "fsl,imx8mm-sdma", "fsl,imx8mq-sdma";
a05ea40eb384e2 Jacky Bai           2019-03-22   579  				reg = <0x302c0000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   580  				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   581  				clocks = <&clk IMX8MM_CLK_SDMA2_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   582  					 <&clk IMX8MM_CLK_SDMA2_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   583  				clock-names = "ipg", "ahb";
a05ea40eb384e2 Jacky Bai           2019-03-22   584  				#dma-cells = <3>;
a05ea40eb384e2 Jacky Bai           2019-03-22   585  				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
a05ea40eb384e2 Jacky Bai           2019-03-22   586  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   587  
a05ea40eb384e2 Jacky Bai           2019-03-22   588  			sdma3: dma-controller@302b0000 {
e346ff93f02b1b Shengjiu Wang       2019-10-25   589  				compatible = "fsl,imx8mm-sdma", "fsl,imx8mq-sdma";
a05ea40eb384e2 Jacky Bai           2019-03-22   590  				reg = <0x302b0000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   591  				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   592  				clocks = <&clk IMX8MM_CLK_SDMA3_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   593  				 <&clk IMX8MM_CLK_SDMA3_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   594  				clock-names = "ipg", "ahb";
a05ea40eb384e2 Jacky Bai           2019-03-22   595  				#dma-cells = <3>;
a05ea40eb384e2 Jacky Bai           2019-03-22   596  				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
a05ea40eb384e2 Jacky Bai           2019-03-22   597  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   598  
a05ea40eb384e2 Jacky Bai           2019-03-22   599  			iomuxc: pinctrl@30330000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   600  				compatible = "fsl,imx8mm-iomuxc";
a05ea40eb384e2 Jacky Bai           2019-03-22   601  				reg = <0x30330000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   602  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   603  
e43f400ddc2b4b Peng Fan            2023-01-04   604  			gpr: syscon@30340000 {
e43f400ddc2b4b Peng Fan            2023-01-04   605  				compatible = "fsl,imx8mm-iomuxc-gpr", "syscon";
a05ea40eb384e2 Jacky Bai           2019-03-22   606  				reg = <0x30340000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   607  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   608  
12fa1078efc871 Anson Huang         2020-05-28   609  			ocotp: efuse@30350000 {
b3d131531fdd57 Robin Gong          2021-06-04   610  				compatible = "fsl,imx8mm-ocotp", "syscon", "simple-mfd";
a05ea40eb384e2 Jacky Bai           2019-03-22   611  				reg = <0x30350000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   612  				clocks = <&clk IMX8MM_CLK_OCOTP_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   613  				/* For nvmem subnodes */
a05ea40eb384e2 Jacky Bai           2019-03-22   614  				#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   615  				#size-cells = <1>;
f403a26c865b3b Leonard Crestez     2019-05-13   616  
5b81a87ddd56eb Marek Vasut         2022-12-02   617  				/*
5b81a87ddd56eb Marek Vasut         2022-12-02   618  				 * The register address below maps to the MX8M
5b81a87ddd56eb Marek Vasut         2022-12-02   619  				 * Fusemap Description Table entries this way.
5b81a87ddd56eb Marek Vasut         2022-12-02   620  				 * Assuming
5b81a87ddd56eb Marek Vasut         2022-12-02   621  				 *   reg = <ADDR SIZE>;
5b81a87ddd56eb Marek Vasut         2022-12-02   622  				 * then
5b81a87ddd56eb Marek Vasut         2022-12-02   623  				 *   Fuse Address = (ADDR * 4) + 0x400
5b81a87ddd56eb Marek Vasut         2022-12-02   624  				 * Note that if SIZE is greater than 4, then
5b81a87ddd56eb Marek Vasut         2022-12-02   625  				 * each subsequent fuse is located at offset
5b81a87ddd56eb Marek Vasut         2022-12-02   626  				 * +0x10 in Fusemap Description Table (e.g.
5b81a87ddd56eb Marek Vasut         2022-12-02   627  				 * reg = <0x4 0x8> describes fuses 0x410 and
5b81a87ddd56eb Marek Vasut         2022-12-02   628  				 * 0x420).
5b81a87ddd56eb Marek Vasut         2022-12-02   629  				 */
5b81a87ddd56eb Marek Vasut         2022-12-02   630  				imx8mm_uid: unique-id@4 { /* 0x410-0x420 */
cbff23797fa1ec Alice Guo           2021-01-04   631  					reg = <0x4 0x8>;
cbff23797fa1ec Alice Guo           2021-01-04   632  				};
cbff23797fa1ec Alice Guo           2021-01-04   633  
5b81a87ddd56eb Marek Vasut         2022-12-02   634  				cpu_speed_grade: speed-grade@10 { /* 0x440 */
f403a26c865b3b Leonard Crestez     2019-05-13   635  					reg = <0x10 4>;
f403a26c865b3b Leonard Crestez     2019-05-13   636  				};
066438ae637b49 Joakim Zhang        2021-01-16   637  
105b9bb84f4936 Marek Vasut         2022-12-02   638  				tmu_calib: calib@3c { /* 0x4f0 */
105b9bb84f4936 Marek Vasut         2022-12-02   639  					reg = <0x3c 4>;
105b9bb84f4936 Marek Vasut         2022-12-02   640  				};
105b9bb84f4936 Marek Vasut         2022-12-02   641  
5b81a87ddd56eb Marek Vasut         2022-12-02   642  				fec_mac_address: mac-address@90 { /* 0x640 */
066438ae637b49 Joakim Zhang        2021-01-16   643  					reg = <0x90 6>;
066438ae637b49 Joakim Zhang        2021-01-16   644  				};
b3d131531fdd57 Robin Gong          2021-06-04   645  
b3d131531fdd57 Robin Gong          2021-06-04   646  				imx8mm_soc: imx8mm-soc {
b3d131531fdd57 Robin Gong          2021-06-04   647  					compatible = "fsl,imx8mm-soc";
b3d131531fdd57 Robin Gong          2021-06-04   648  					nvmem-cells = <&imx8mm_uid>;
b3d131531fdd57 Robin Gong          2021-06-04   649  					nvmem-cell-names = "soc_unique_id";
b3d131531fdd57 Robin Gong          2021-06-04   650  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   651  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   652  
f98c2dfedb735b Peng Fan            2022-09-23   653  			anatop: clock-controller@30360000 {
f98c2dfedb735b Peng Fan            2022-09-23   654  				compatible = "fsl,imx8mm-anatop";
a05ea40eb384e2 Jacky Bai           2019-03-22   655  				reg = <0x30360000 0x10000>;
f98c2dfedb735b Peng Fan            2022-09-23   656  				#clock-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   657  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   658  
6277d5465f4b04 Horia Geantă        2019-11-27   659  			irq_sec_vio: caam_secvio {
6277d5465f4b04 Horia Geantă        2019-11-27   660  				compatible = "fsl,imx6q-caam-secvio";
6277d5465f4b04 Horia Geantă        2019-11-27   661  				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
6277d5465f4b04 Horia Geantă        2019-11-27   662  				jtag-tamper = "disabled";
6277d5465f4b04 Horia Geantă        2019-11-27   663  				watchdog-tamper = "enabled";
6277d5465f4b04 Horia Geantă        2019-11-27   664  				internal-boot-tamper = "enabled";
6277d5465f4b04 Horia Geantă        2019-11-27   665  				external-pin-tamper = "disabled";
6277d5465f4b04 Horia Geantă        2019-11-27   666  			};
6277d5465f4b04 Horia Geantă        2019-11-27   667  
6277d5465f4b04 Horia Geantă        2019-11-27   668  			caam_snvs: caam-snvs@30370000 {
6277d5465f4b04 Horia Geantă        2019-11-27   669  				compatible = "fsl,imx6q-caam-snvs";
6277d5465f4b04 Horia Geantă        2019-11-27   670  				reg = <0x30370000 0x10000>;
6277d5465f4b04 Horia Geantă        2019-11-27   671  				clocks = <&clk IMX8MM_CLK_SNVS_ROOT>;
6277d5465f4b04 Horia Geantă        2019-11-27   672  				clock-names = "ipg";
6277d5465f4b04 Horia Geantă        2019-11-27   673  			};
6277d5465f4b04 Horia Geantă        2019-11-27   674  
a05ea40eb384e2 Jacky Bai           2019-03-22   675  			snvs: snvs@30370000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   676  				compatible = "fsl,sec-v4.0-mon","syscon", "simple-mfd";
a05ea40eb384e2 Jacky Bai           2019-03-22   677  				reg = <0x30370000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   678  
a05ea40eb384e2 Jacky Bai           2019-03-22   679  				snvs_rtc: snvs-rtc-lp {
a05ea40eb384e2 Jacky Bai           2019-03-22   680  					compatible = "fsl,sec-v4.0-mon-rtc-lp";
a05ea40eb384e2 Jacky Bai           2019-03-22   681  					regmap = <&snvs>;
a05ea40eb384e2 Jacky Bai           2019-03-22   682  					offset = <0x34>;
a05ea40eb384e2 Jacky Bai           2019-03-22   683  					interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
a05ea40eb384e2 Jacky Bai           2019-03-22   684  						     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
f145b209b82f70 Anson Huang         2019-05-15   685  					clocks = <&clk IMX8MM_CLK_SNVS_ROOT>;
f145b209b82f70 Anson Huang         2019-05-15   686  					clock-names = "snvs-rtc";
a05ea40eb384e2 Jacky Bai           2019-03-22   687  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   688  
a05ea40eb384e2 Jacky Bai           2019-03-22   689  				snvs_pwrkey: snvs-powerkey {
a05ea40eb384e2 Jacky Bai           2019-03-22   690  					compatible = "fsl,sec-v4.0-pwrkey";
a05ea40eb384e2 Jacky Bai           2019-03-22   691  					regmap = <&snvs>;
a05ea40eb384e2 Jacky Bai           2019-03-22   692  					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
46770eae2120ec André Draszik       2020-02-25   693  					clocks = <&clk IMX8MM_CLK_SNVS_ROOT>;
46770eae2120ec André Draszik       2020-02-25   694  					clock-names = "snvs-pwrkey";
a05ea40eb384e2 Jacky Bai           2019-03-22   695  					linux,keycode = <KEY_POWER>;
a05ea40eb384e2 Jacky Bai           2019-03-22   696  					wakeup-source;
d038c1dc35565e Anson Huang         2019-06-13   697  					status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   698  				};
fd207b47278277 Marek Vasut         2022-05-23   699  
fd207b47278277 Marek Vasut         2022-05-23   700  				snvs_lpgpr: snvs-lpgpr {
fd207b47278277 Marek Vasut         2022-05-23   701  					compatible = "fsl,imx8mm-snvs-lpgpr",
fd207b47278277 Marek Vasut         2022-05-23   702  						     "fsl,imx7d-snvs-lpgpr";
fd207b47278277 Marek Vasut         2022-05-23   703  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   704  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   705  
a05ea40eb384e2 Jacky Bai           2019-03-22   706  			clk: clock-controller@30380000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   707  				compatible = "fsl,imx8mm-ccm";
a05ea40eb384e2 Jacky Bai           2019-03-22   708  				reg = <0x30380000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   709  				#clock-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   710  				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
a05ea40eb384e2 Jacky Bai           2019-03-22   711  					 <&clk_ext3>, <&clk_ext4>;
a05ea40eb384e2 Jacky Bai           2019-03-22   712  				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
a05ea40eb384e2 Jacky Bai           2019-03-22   713  					      "clk_ext3", "clk_ext4";
9e6337e6fdb157 Peng Fan            2020-05-07   714  				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
9e6337e6fdb157 Peng Fan            2020-05-07   715  						<&clk IMX8MM_CLK_A53_CORE>,
9e6337e6fdb157 Peng Fan            2020-05-07   716  						<&clk IMX8MM_CLK_NOC>,
6b392e16307f96 Abel Vesa           2019-07-03   717  						<&clk IMX8MM_CLK_AUDIO_AHB>,
6b392e16307f96 Abel Vesa           2019-07-03   718  						<&clk IMX8MM_CLK_IPG_AUDIO_ROOT>,
6b392e16307f96 Abel Vesa           2019-07-03   719  						<&clk IMX8MM_SYS_PLL3>,
e8b395b23643ca S.j. Wang           2019-10-16   720  						<&clk IMX8MM_VIDEO_PLL1>,
bcc2adbf9c66ad Shengjiu Wang       2022-02-25   721  						<&clk IMX8MM_AUDIO_PLL1>,
bcc2adbf9c66ad Shengjiu Wang       2022-02-25   722  						<&clk IMX8MM_AUDIO_PLL2>;
9e6337e6fdb157 Peng Fan            2020-05-07   723  				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_800M>,
9e6337e6fdb157 Peng Fan            2020-05-07   724  							 <&clk IMX8MM_ARM_PLL_OUT>,
9e6337e6fdb157 Peng Fan            2020-05-07   725  							 <&clk IMX8MM_SYS_PLL3_OUT>,
6b392e16307f96 Abel Vesa           2019-07-03   726  							 <&clk IMX8MM_SYS_PLL1_800M>;
9e6337e6fdb157 Peng Fan            2020-05-07   727  				assigned-clock-rates = <0>, <0>, <0>,
6b392e16307f96 Abel Vesa           2019-07-03   728  							<400000000>,
6b392e16307f96 Abel Vesa           2019-07-03   729  							<400000000>,
6b392e16307f96 Abel Vesa           2019-07-03   730  							<750000000>,
1504fa57f3f226 Liu Ying            2022-11-10   731  							<1039500000>,
bcc2adbf9c66ad Shengjiu Wang       2022-02-25   732  							<393216000>,
bcc2adbf9c66ad Shengjiu Wang       2022-02-25   733  							<361267200>;
a05ea40eb384e2 Jacky Bai           2019-03-22   734  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   735  
a05ea40eb384e2 Jacky Bai           2019-03-22   736  			src: reset-controller@30390000 {
46b29f4bd67e10 Anson Huang         2019-07-05   737  				compatible = "fsl,imx8mm-src", "fsl,imx8mq-src", "syscon";
a05ea40eb384e2 Jacky Bai           2019-03-22   738  				reg = <0x30390000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   739  				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   740  				#reset-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   741  			};
d39d4bb1531029 Lucas Stach         2021-10-02   742  
d39d4bb1531029 Lucas Stach         2021-10-02   743  			gpc: gpc@303a0000 {
d39d4bb1531029 Lucas Stach         2021-10-02   744  				compatible = "fsl,imx8mm-gpc";
d39d4bb1531029 Lucas Stach         2021-10-02   745  				reg = <0x303a0000 0x10000>;
d39d4bb1531029 Lucas Stach         2021-10-02   746  				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
d39d4bb1531029 Lucas Stach         2021-10-02   747  				interrupt-parent = <&gic>;
d39d4bb1531029 Lucas Stach         2021-10-02   748  				interrupt-controller;
d39d4bb1531029 Lucas Stach         2021-10-02   749  				#interrupt-cells = <3>;
d39d4bb1531029 Lucas Stach         2021-10-02   750  
d39d4bb1531029 Lucas Stach         2021-10-02   751  				pgc {
d39d4bb1531029 Lucas Stach         2021-10-02   752  					#address-cells = <1>;
d39d4bb1531029 Lucas Stach         2021-10-02   753  					#size-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   754  
d39d4bb1531029 Lucas Stach         2021-10-02   755  					pgc_hsiomix: power-domain@0 {
d39d4bb1531029 Lucas Stach         2021-10-02   756  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   757  						reg = <IMX8MM_POWER_DOMAIN_HSIOMIX>;
d39d4bb1531029 Lucas Stach         2021-10-02   758  						clocks = <&clk IMX8MM_CLK_USB_BUS>;
d39d4bb1531029 Lucas Stach         2021-10-02   759  						assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>;
d39d4bb1531029 Lucas Stach         2021-10-02   760  						assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>;
d39d4bb1531029 Lucas Stach         2021-10-02   761  					};
d39d4bb1531029 Lucas Stach         2021-10-02   762  
d39d4bb1531029 Lucas Stach         2021-10-02   763  					pgc_pcie: power-domain@1 {
d39d4bb1531029 Lucas Stach         2021-10-02   764  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   765  						reg = <IMX8MM_POWER_DOMAIN_PCIE>;
d39d4bb1531029 Lucas Stach         2021-10-02   766  						power-domains = <&pgc_hsiomix>;
d39d4bb1531029 Lucas Stach         2021-10-02   767  						clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>;
d39d4bb1531029 Lucas Stach         2021-10-02   768  					};
d39d4bb1531029 Lucas Stach         2021-10-02   769  
d39d4bb1531029 Lucas Stach         2021-10-02   770  					pgc_otg1: power-domain@2 {
d39d4bb1531029 Lucas Stach         2021-10-02   771  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   772  						reg = <IMX8MM_POWER_DOMAIN_OTG1>;
d39d4bb1531029 Lucas Stach         2021-10-02   773  					};
d39d4bb1531029 Lucas Stach         2021-10-02   774  
d39d4bb1531029 Lucas Stach         2021-10-02   775  					pgc_otg2: power-domain@3 {
d39d4bb1531029 Lucas Stach         2021-10-02   776  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   777  						reg = <IMX8MM_POWER_DOMAIN_OTG2>;
d39d4bb1531029 Lucas Stach         2021-10-02   778  					};
d39d4bb1531029 Lucas Stach         2021-10-02   779  
d39d4bb1531029 Lucas Stach         2021-10-02   780  					pgc_gpumix: power-domain@4 {
d39d4bb1531029 Lucas Stach         2021-10-02   781  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   782  						reg = <IMX8MM_POWER_DOMAIN_GPUMIX>;
d39d4bb1531029 Lucas Stach         2021-10-02   783  						clocks = <&clk IMX8MM_CLK_GPU_BUS_ROOT>,
d39d4bb1531029 Lucas Stach         2021-10-02   784  							 <&clk IMX8MM_CLK_GPU_AHB>;
d39d4bb1531029 Lucas Stach         2021-10-02   785  						assigned-clocks = <&clk IMX8MM_CLK_GPU_AXI>,
d39d4bb1531029 Lucas Stach         2021-10-02   786  								  <&clk IMX8MM_CLK_GPU_AHB>;
d39d4bb1531029 Lucas Stach         2021-10-02   787  						assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_800M>,
d39d4bb1531029 Lucas Stach         2021-10-02   788  									 <&clk IMX8MM_SYS_PLL1_800M>;
d39d4bb1531029 Lucas Stach         2021-10-02   789  						assigned-clock-rates = <800000000>, <400000000>;
d39d4bb1531029 Lucas Stach         2021-10-02   790  					};
d39d4bb1531029 Lucas Stach         2021-10-02   791  
d39d4bb1531029 Lucas Stach         2021-10-02   792  					pgc_gpu: power-domain@5 {
d39d4bb1531029 Lucas Stach         2021-10-02   793  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   794  						reg = <IMX8MM_POWER_DOMAIN_GPU>;
d39d4bb1531029 Lucas Stach         2021-10-02   795  						clocks = <&clk IMX8MM_CLK_GPU_AHB>,
d39d4bb1531029 Lucas Stach         2021-10-02   796  							 <&clk IMX8MM_CLK_GPU_BUS_ROOT>,
d39d4bb1531029 Lucas Stach         2021-10-02   797  							 <&clk IMX8MM_CLK_GPU2D_ROOT>,
d39d4bb1531029 Lucas Stach         2021-10-02   798  							 <&clk IMX8MM_CLK_GPU3D_ROOT>;
d39d4bb1531029 Lucas Stach         2021-10-02   799  						resets = <&src IMX8MQ_RESET_GPU_RESET>;
d39d4bb1531029 Lucas Stach         2021-10-02   800  						power-domains = <&pgc_gpumix>;
d39d4bb1531029 Lucas Stach         2021-10-02   801  					};
d39d4bb1531029 Lucas Stach         2021-10-02   802  
d39d4bb1531029 Lucas Stach         2021-10-02   803  					pgc_vpumix: power-domain@6 {
d39d4bb1531029 Lucas Stach         2021-10-02   804  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   805  						reg = <IMX8MM_POWER_DOMAIN_VPUMIX>;
d39d4bb1531029 Lucas Stach         2021-10-02   806  						clocks = <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
d39d4bb1531029 Lucas Stach         2021-10-02   807  						assigned-clocks = <&clk IMX8MM_CLK_VPU_BUS>;
d39d4bb1531029 Lucas Stach         2021-10-02   808  						assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_800M>;
d39d4bb1531029 Lucas Stach         2021-10-02   809  					};
d39d4bb1531029 Lucas Stach         2021-10-02   810  
d39d4bb1531029 Lucas Stach         2021-10-02   811  					pgc_vpu_g1: power-domain@7 {
d39d4bb1531029 Lucas Stach         2021-10-02   812  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   813  						reg = <IMX8MM_POWER_DOMAIN_VPUG1>;
d39d4bb1531029 Lucas Stach         2021-10-02   814  					};
d39d4bb1531029 Lucas Stach         2021-10-02   815  
d39d4bb1531029 Lucas Stach         2021-10-02   816  					pgc_vpu_g2: power-domain@8 {
d39d4bb1531029 Lucas Stach         2021-10-02   817  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   818  						reg = <IMX8MM_POWER_DOMAIN_VPUG2>;
d39d4bb1531029 Lucas Stach         2021-10-02   819  					};
d39d4bb1531029 Lucas Stach         2021-10-02   820  
d39d4bb1531029 Lucas Stach         2021-10-02   821  					pgc_vpu_h1: power-domain@9 {
d39d4bb1531029 Lucas Stach         2021-10-02   822  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   823  						reg = <IMX8MM_POWER_DOMAIN_VPUH1>;
d39d4bb1531029 Lucas Stach         2021-10-02   824  					};
d39d4bb1531029 Lucas Stach         2021-10-02   825  
d39d4bb1531029 Lucas Stach         2021-10-02   826  					pgc_dispmix: power-domain@10 {
d39d4bb1531029 Lucas Stach         2021-10-02   827  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   828  						reg = <IMX8MM_POWER_DOMAIN_DISPMIX>;
d39d4bb1531029 Lucas Stach         2021-10-02   829  						clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
d39d4bb1531029 Lucas Stach         2021-10-02   830  							 <&clk IMX8MM_CLK_DISP_AXI_ROOT>;
d39d4bb1531029 Lucas Stach         2021-10-02   831  						assigned-clocks = <&clk IMX8MM_CLK_DISP_AXI>,
d39d4bb1531029 Lucas Stach         2021-10-02   832  								  <&clk IMX8MM_CLK_DISP_APB>;
d39d4bb1531029 Lucas Stach         2021-10-02   833  						assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_1000M>,
d39d4bb1531029 Lucas Stach         2021-10-02   834  									 <&clk IMX8MM_SYS_PLL1_800M>;
d39d4bb1531029 Lucas Stach         2021-10-02   835  						assigned-clock-rates = <500000000>, <200000000>;
d39d4bb1531029 Lucas Stach         2021-10-02   836  					};
d39d4bb1531029 Lucas Stach         2021-10-02   837  
d39d4bb1531029 Lucas Stach         2021-10-02   838  					pgc_mipi: power-domain@11 {
d39d4bb1531029 Lucas Stach         2021-10-02   839  						#power-domain-cells = <0>;
d39d4bb1531029 Lucas Stach         2021-10-02   840  						reg = <IMX8MM_POWER_DOMAIN_MIPI>;
d39d4bb1531029 Lucas Stach         2021-10-02   841  					};
d39d4bb1531029 Lucas Stach         2021-10-02   842  				};
d39d4bb1531029 Lucas Stach         2021-10-02   843  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   844  		};
a05ea40eb384e2 Jacky Bai           2019-03-22   845  
a05ea40eb384e2 Jacky Bai           2019-03-22   846  		aips2: bus@30400000 {
dc3efc6ff0d51a Peng Fan            2020-03-11   847  			compatible = "fsl,aips-bus", "simple-bus";
921a6845d01b66 Fabio Estevam       2020-03-31   848  			reg = <0x30400000 0x400000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   849  			#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   850  			#size-cells = <1>;
10c7420738e683 Fabio Estevam       2019-06-05   851  			ranges = <0x30400000 0x30400000 0x400000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   852  
a05ea40eb384e2 Jacky Bai           2019-03-22   853  			pwm1: pwm@30660000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   854  				compatible = "fsl,imx8mm-pwm", "fsl,imx27-pwm";
a05ea40eb384e2 Jacky Bai           2019-03-22   855  				reg = <0x30660000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   856  				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   857  				clocks = <&clk IMX8MM_CLK_PWM1_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   858  					<&clk IMX8MM_CLK_PWM1_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   859  				clock-names = "ipg", "per";
957aef026c462f Markus Niebel       2022-05-02   860  				#pwm-cells = <3>;
a05ea40eb384e2 Jacky Bai           2019-03-22   861  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   862  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   863  
a05ea40eb384e2 Jacky Bai           2019-03-22   864  			pwm2: pwm@30670000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   865  				compatible = "fsl,imx8mm-pwm", "fsl,imx27-pwm";
a05ea40eb384e2 Jacky Bai           2019-03-22   866  				reg = <0x30670000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   867  				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   868  				clocks = <&clk IMX8MM_CLK_PWM2_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   869  					 <&clk IMX8MM_CLK_PWM2_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   870  				clock-names = "ipg", "per";
957aef026c462f Markus Niebel       2022-05-02   871  				#pwm-cells = <3>;
a05ea40eb384e2 Jacky Bai           2019-03-22   872  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   873  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   874  
a05ea40eb384e2 Jacky Bai           2019-03-22   875  			pwm3: pwm@30680000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   876  				compatible = "fsl,imx8mm-pwm", "fsl,imx27-pwm";
a05ea40eb384e2 Jacky Bai           2019-03-22   877  				reg = <0x30680000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   878  				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   879  				clocks = <&clk IMX8MM_CLK_PWM3_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   880  					 <&clk IMX8MM_CLK_PWM3_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   881  				clock-names = "ipg", "per";
957aef026c462f Markus Niebel       2022-05-02   882  				#pwm-cells = <3>;
a05ea40eb384e2 Jacky Bai           2019-03-22   883  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   884  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   885  
a05ea40eb384e2 Jacky Bai           2019-03-22   886  			pwm4: pwm@30690000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   887  				compatible = "fsl,imx8mm-pwm", "fsl,imx27-pwm";
a05ea40eb384e2 Jacky Bai           2019-03-22   888  				reg = <0x30690000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   889  				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   890  				clocks = <&clk IMX8MM_CLK_PWM4_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   891  					 <&clk IMX8MM_CLK_PWM4_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   892  				clock-names = "ipg", "per";
957aef026c462f Markus Niebel       2022-05-02   893  				#pwm-cells = <3>;
a05ea40eb384e2 Jacky Bai           2019-03-22   894  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   895  			};
5b0221bf7b0816 Anson Huang         2019-08-15   896  
5b0221bf7b0816 Anson Huang         2019-08-15   897  			system_counter: timer@306a0000 {
5b0221bf7b0816 Anson Huang         2019-08-15   898  				compatible = "nxp,sysctr-timer";
5b0221bf7b0816 Anson Huang         2019-08-15   899  				reg = <0x306a0000 0x20000>;
5b0221bf7b0816 Anson Huang         2019-08-15   900  				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
5b0221bf7b0816 Anson Huang         2019-08-15   901  				clocks = <&osc_24m>;
5b0221bf7b0816 Anson Huang         2019-08-15   902  				clock-names = "per";
5b0221bf7b0816 Anson Huang         2019-08-15   903  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   904  		};
a05ea40eb384e2 Jacky Bai           2019-03-22   905  
a05ea40eb384e2 Jacky Bai           2019-03-22   906  		aips3: bus@30800000 {
dc3efc6ff0d51a Peng Fan            2020-03-11   907  			compatible = "fsl,aips-bus", "simple-bus";
921a6845d01b66 Fabio Estevam       2020-03-31   908  			reg = <0x30800000 0x400000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   909  			#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   910  			#size-cells = <1>;
f0692bb890c177 Adam Ford           2020-03-06   911  			ranges = <0x30800000 0x30800000 0x400000>,
f0692bb890c177 Adam Ford           2020-03-06   912  				 <0x8000000 0x8000000 0x10000000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   913  
7923353b623d51 Adam Ford           2021-04-05   914  			spba1: spba-bus@30800000 {
7923353b623d51 Adam Ford           2021-04-05   915  				compatible = "fsl,spba-bus", "simple-bus";
7923353b623d51 Adam Ford           2021-04-05   916  				#address-cells = <1>;
7923353b623d51 Adam Ford           2021-04-05   917  				#size-cells = <1>;
7923353b623d51 Adam Ford           2021-04-05   918  				reg = <0x30800000 0x100000>;
7923353b623d51 Adam Ford           2021-04-05   919  				ranges;
7923353b623d51 Adam Ford           2021-04-05   920  
a05ea40eb384e2 Jacky Bai           2019-03-22   921  				ecspi1: spi@30820000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   922  					compatible = "fsl,imx8mm-ecspi", "fsl,imx51-ecspi";
a05ea40eb384e2 Jacky Bai           2019-03-22   923  					#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   924  					#size-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   925  					reg = <0x30820000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   926  					interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   927  					clocks = <&clk IMX8MM_CLK_ECSPI1_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   928  						 <&clk IMX8MM_CLK_ECSPI1_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   929  					clock-names = "ipg", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22   930  					dmas = <&sdma1 0 7 1>, <&sdma1 1 7 2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   931  					dma-names = "rx", "tx";
a05ea40eb384e2 Jacky Bai           2019-03-22   932  					status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   933  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   934  
a05ea40eb384e2 Jacky Bai           2019-03-22   935  				ecspi2: spi@30830000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   936  					compatible = "fsl,imx8mm-ecspi", "fsl,imx51-ecspi";
a05ea40eb384e2 Jacky Bai           2019-03-22   937  					#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   938  					#size-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   939  					reg = <0x30830000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   940  					interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   941  					clocks = <&clk IMX8MM_CLK_ECSPI2_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   942  						 <&clk IMX8MM_CLK_ECSPI2_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   943  					clock-names = "ipg", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22   944  					dmas = <&sdma1 2 7 1>, <&sdma1 3 7 2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   945  					dma-names = "rx", "tx";
a05ea40eb384e2 Jacky Bai           2019-03-22   946  					status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   947  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   948  
a05ea40eb384e2 Jacky Bai           2019-03-22   949  				ecspi3: spi@30840000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   950  					compatible = "fsl,imx8mm-ecspi", "fsl,imx51-ecspi";
a05ea40eb384e2 Jacky Bai           2019-03-22   951  					#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22   952  					#size-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   953  					reg = <0x30840000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   954  					interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   955  					clocks = <&clk IMX8MM_CLK_ECSPI3_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   956  						 <&clk IMX8MM_CLK_ECSPI3_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   957  					clock-names = "ipg", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22   958  					dmas = <&sdma1 4 7 1>, <&sdma1 5 7 2>;
a05ea40eb384e2 Jacky Bai           2019-03-22   959  					dma-names = "rx", "tx";
a05ea40eb384e2 Jacky Bai           2019-03-22   960  					status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   961  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   962  
a05ea40eb384e2 Jacky Bai           2019-03-22   963  				uart1: serial@30860000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   964  					compatible = "fsl,imx8mm-uart", "fsl,imx6q-uart";
a05ea40eb384e2 Jacky Bai           2019-03-22   965  					reg = <0x30860000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   966  					interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   967  					clocks = <&clk IMX8MM_CLK_UART1_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   968  						 <&clk IMX8MM_CLK_UART1_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   969  					clock-names = "ipg", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22   970  					dmas = <&sdma1 22 4 0>, <&sdma1 23 4 0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   971  					dma-names = "rx", "tx";
a05ea40eb384e2 Jacky Bai           2019-03-22   972  					status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   973  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   974  
a05ea40eb384e2 Jacky Bai           2019-03-22   975  				uart3: serial@30880000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   976  					compatible = "fsl,imx8mm-uart", "fsl,imx6q-uart";
a05ea40eb384e2 Jacky Bai           2019-03-22   977  					reg = <0x30880000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   978  					interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   979  					clocks = <&clk IMX8MM_CLK_UART3_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   980  						 <&clk IMX8MM_CLK_UART3_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   981  					clock-names = "ipg", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22   982  					dmas = <&sdma1 26 4 0>, <&sdma1 27 4 0>;
a05ea40eb384e2 Jacky Bai           2019-03-22   983  					dma-names = "rx", "tx";
a05ea40eb384e2 Jacky Bai           2019-03-22   984  					status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   985  				};
a05ea40eb384e2 Jacky Bai           2019-03-22   986  
a05ea40eb384e2 Jacky Bai           2019-03-22   987  				uart2: serial@30890000 {
a05ea40eb384e2 Jacky Bai           2019-03-22   988  					compatible = "fsl,imx8mm-uart", "fsl,imx6q-uart";
a05ea40eb384e2 Jacky Bai           2019-03-22   989  					reg = <0x30890000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22   990  					interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22   991  					clocks = <&clk IMX8MM_CLK_UART2_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22   992  						 <&clk IMX8MM_CLK_UART2_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22   993  					clock-names = "ipg", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22   994  					status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22   995  				};
7923353b623d51 Adam Ford           2021-04-05   996  			};
a05ea40eb384e2 Jacky Bai           2019-03-22   997  
bff5b972373221 Adam Ford           2019-12-18   998  			crypto: crypto@30900000 {
bff5b972373221 Adam Ford           2019-12-18   999  				compatible = "fsl,sec-v4.0";
bff5b972373221 Adam Ford           2019-12-18  1000  				#address-cells = <1>;
bff5b972373221 Adam Ford           2019-12-18  1001  				#size-cells = <1>;
bff5b972373221 Adam Ford           2019-12-18  1002  				reg = <0x30900000 0x40000>;
bff5b972373221 Adam Ford           2019-12-18  1003  				ranges = <0 0x30900000 0x40000>;
bff5b972373221 Adam Ford           2019-12-18  1004  				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
bff5b972373221 Adam Ford           2019-12-18  1005  				clocks = <&clk IMX8MM_CLK_AHB>,
bff5b972373221 Adam Ford           2019-12-18  1006  					 <&clk IMX8MM_CLK_IPG_ROOT>;
bff5b972373221 Adam Ford           2019-12-18  1007  				clock-names = "aclk", "ipg";
bff5b972373221 Adam Ford           2019-12-18  1008  
bff5b972373221 Adam Ford           2019-12-18  1009  				sec_jr0: jr@1000 {
bff5b972373221 Adam Ford           2019-12-18  1010  					compatible = "fsl,sec-v4.0-job-ring";
bff5b972373221 Adam Ford           2019-12-18  1011  					reg = <0x1000 0x1000>;
bff5b972373221 Adam Ford           2019-12-18  1012  					interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
dc9c1ceb555ff6 Fabio Estevam       2022-06-08  1013  					status = "disabled";
bff5b972373221 Adam Ford           2019-12-18  1014  				};
bff5b972373221 Adam Ford           2019-12-18  1015  
bff5b972373221 Adam Ford           2019-12-18  1016  				sec_jr1: jr@2000 {
bff5b972373221 Adam Ford           2019-12-18  1017  					compatible = "fsl,sec-v4.0-job-ring";
bff5b972373221 Adam Ford           2019-12-18  1018  					reg = <0x2000 0x1000>;
bff5b972373221 Adam Ford           2019-12-18  1019  					interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
bff5b972373221 Adam Ford           2019-12-18  1020  				};
bff5b972373221 Adam Ford           2019-12-18  1021  
bff5b972373221 Adam Ford           2019-12-18  1022  				sec_jr2: jr@3000 {
bff5b972373221 Adam Ford           2019-12-18  1023  					compatible = "fsl,sec-v4.0-job-ring";
bff5b972373221 Adam Ford           2019-12-18  1024  					reg = <0x3000 0x1000>;
bff5b972373221 Adam Ford           2019-12-18  1025  					interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
bff5b972373221 Adam Ford           2019-12-18  1026  				};
bff5b972373221 Adam Ford           2019-12-18  1027  			};
bff5b972373221 Adam Ford           2019-12-18  1028  
a05ea40eb384e2 Jacky Bai           2019-03-22  1029  			i2c1: i2c@30a20000 {
a05ea40eb384e2 Jacky Bai           2019-03-22  1030  				compatible = "fsl,imx8mm-i2c", "fsl,imx21-i2c";
a05ea40eb384e2 Jacky Bai           2019-03-22  1031  				#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1032  				#size-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1033  				reg = <0x30a20000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1034  				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1035  				clocks = <&clk IMX8MM_CLK_I2C1_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1036  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1037  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1038  
a05ea40eb384e2 Jacky Bai           2019-03-22  1039  			i2c2: i2c@30a30000 {
a05ea40eb384e2 Jacky Bai           2019-03-22  1040  				compatible = "fsl,imx8mm-i2c", "fsl,imx21-i2c";
a05ea40eb384e2 Jacky Bai           2019-03-22  1041  				#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1042  				#size-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1043  				reg = <0x30a30000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1044  				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1045  				clocks = <&clk IMX8MM_CLK_I2C2_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1046  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1047  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1048  
a05ea40eb384e2 Jacky Bai           2019-03-22  1049  			i2c3: i2c@30a40000 {
a05ea40eb384e2 Jacky Bai           2019-03-22  1050  				#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1051  				#size-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1052  				compatible = "fsl,imx8mm-i2c", "fsl,imx21-i2c";
a05ea40eb384e2 Jacky Bai           2019-03-22  1053  				reg = <0x30a40000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1054  				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1055  				clocks = <&clk IMX8MM_CLK_I2C3_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1056  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1057  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1058  
a05ea40eb384e2 Jacky Bai           2019-03-22  1059  			i2c4: i2c@30a50000 {
a05ea40eb384e2 Jacky Bai           2019-03-22  1060  				compatible = "fsl,imx8mm-i2c", "fsl,imx21-i2c";
a05ea40eb384e2 Jacky Bai           2019-03-22  1061  				#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1062  				#size-cells = <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1063  				reg = <0x30a50000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1064  				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1065  				clocks = <&clk IMX8MM_CLK_I2C4_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1066  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1067  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1068  
a05ea40eb384e2 Jacky Bai           2019-03-22  1069  			uart4: serial@30a60000 {
a05ea40eb384e2 Jacky Bai           2019-03-22  1070  				compatible = "fsl,imx8mm-uart", "fsl,imx6q-uart";
a05ea40eb384e2 Jacky Bai           2019-03-22  1071  				reg = <0x30a60000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1072  				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1073  				clocks = <&clk IMX8MM_CLK_UART4_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1074  					 <&clk IMX8MM_CLK_UART4_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1075  				clock-names = "ipg", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22  1076  				dmas = <&sdma1 28 4 0>, <&sdma1 29 4 0>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1077  				dma-names = "rx", "tx";
a05ea40eb384e2 Jacky Bai           2019-03-22  1078  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1079  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1080  
bbfc59bec2ad6e Peng Fan            2020-06-01  1081  			mu: mailbox@30aa0000 {
bbfc59bec2ad6e Peng Fan            2020-06-01  1082  				compatible = "fsl,imx8mm-mu", "fsl,imx6sx-mu";
bbfc59bec2ad6e Peng Fan            2020-06-01  1083  				reg = <0x30aa0000 0x10000>;
bbfc59bec2ad6e Peng Fan            2020-06-01  1084  				interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
bbfc59bec2ad6e Peng Fan            2020-06-01  1085  				clocks = <&clk IMX8MM_CLK_MU_ROOT>;
bbfc59bec2ad6e Peng Fan            2020-06-01  1086  				#mbox-cells = <2>;
bbfc59bec2ad6e Peng Fan            2020-06-01  1087  			};
bbfc59bec2ad6e Peng Fan            2020-06-01  1088  
a05ea40eb384e2 Jacky Bai           2019-03-22  1089  			usdhc1: mmc@30b40000 {
a05ea40eb384e2 Jacky Bai           2019-03-22  1090  				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
a05ea40eb384e2 Jacky Bai           2019-03-22  1091  				reg = <0x30b40000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1092  				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
a6a40d5688f226 Anson Huang         2019-10-08  1093  				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1094  					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1095  					 <&clk IMX8MM_CLK_USDHC1_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1096  				clock-names = "ipg", "ahb", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22  1097  				fsl,tuning-start-tap = <20>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1098  				fsl,tuning-step = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1099  				bus-width = <4>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1100  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1101  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1102  
a05ea40eb384e2 Jacky Bai           2019-03-22  1103  			usdhc2: mmc@30b50000 {
a05ea40eb384e2 Jacky Bai           2019-03-22  1104  				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
a05ea40eb384e2 Jacky Bai           2019-03-22  1105  				reg = <0x30b50000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1106  				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
a6a40d5688f226 Anson Huang         2019-10-08  1107  				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1108  					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1109  					 <&clk IMX8MM_CLK_USDHC2_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1110  				clock-names = "ipg", "ahb", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22  1111  				fsl,tuning-start-tap = <20>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1112  				fsl,tuning-step = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1113  				bus-width = <4>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1114  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1115  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1116  
a05ea40eb384e2 Jacky Bai           2019-03-22  1117  			usdhc3: mmc@30b60000 {
a05ea40eb384e2 Jacky Bai           2019-03-22  1118  				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
a05ea40eb384e2 Jacky Bai           2019-03-22  1119  				reg = <0x30b60000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1120  				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
a6a40d5688f226 Anson Huang         2019-10-08  1121  				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1122  					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1123  					 <&clk IMX8MM_CLK_USDHC3_ROOT>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1124  				clock-names = "ipg", "ahb", "per";
a05ea40eb384e2 Jacky Bai           2019-03-22  1125  				fsl,tuning-start-tap = <20>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1126  				fsl,tuning-step = <2>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1127  				bus-width = <4>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1128  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1129  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1130  
f0692bb890c177 Adam Ford           2020-03-06  1131  			flexspi: spi@30bb0000 {
f0692bb890c177 Adam Ford           2020-03-06  1132  				#address-cells = <1>;
f0692bb890c177 Adam Ford           2020-03-06  1133  				#size-cells = <0>;
f0692bb890c177 Adam Ford           2020-03-06  1134  				compatible = "nxp,imx8mm-fspi";
f0692bb890c177 Adam Ford           2020-03-06  1135  				reg = <0x30bb0000 0x10000>, <0x8000000 0x10000000>;
f0692bb890c177 Adam Ford           2020-03-06  1136  				reg-names = "fspi_base", "fspi_mmap";
f0692bb890c177 Adam Ford           2020-03-06  1137  				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
f0692bb890c177 Adam Ford           2020-03-06  1138  				clocks = <&clk IMX8MM_CLK_QSPI_ROOT>,
f0692bb890c177 Adam Ford           2020-03-06  1139  					 <&clk IMX8MM_CLK_QSPI_ROOT>;
9eaf9984221b18 Kuldeep Singh       2021-03-09  1140  				clock-names = "fspi_en", "fspi";
f0692bb890c177 Adam Ford           2020-03-06  1141  				status = "disabled";
f0692bb890c177 Adam Ford           2020-03-06  1142  			};
f0692bb890c177 Adam Ford           2020-03-06  1143  
a05ea40eb384e2 Jacky Bai           2019-03-22  1144  			sdma1: dma-controller@30bd0000 {
e346ff93f02b1b Shengjiu Wang       2019-10-25  1145  				compatible = "fsl,imx8mm-sdma", "fsl,imx8mq-sdma";
a05ea40eb384e2 Jacky Bai           2019-03-22  1146  				reg = <0x30bd0000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1147  				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1148  				clocks = <&clk IMX8MM_CLK_SDMA1_ROOT>,
24a572bf679942 Adam Ford           2019-12-16  1149  					 <&clk IMX8MM_CLK_AHB>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1150  				clock-names = "ipg", "ahb";
a05ea40eb384e2 Jacky Bai           2019-03-22  1151  				#dma-cells = <3>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1152  				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
a05ea40eb384e2 Jacky Bai           2019-03-22  1153  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1154  
a05ea40eb384e2 Jacky Bai           2019-03-22  1155  			fec1: ethernet@30be0000 {
a758dee8ac50cd Joakim Zhang        2021-07-28  1156  				compatible = "fsl,imx8mm-fec", "fsl,imx8mq-fec", "fsl,imx6sx-fec";
a05ea40eb384e2 Jacky Bai           2019-03-22  1157  				reg = <0x30be0000 0x10000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1158  				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1159  					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
d3762a4713b1a5 Fabio Estevam       2020-08-18  1160  					     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
d3762a4713b1a5 Fabio Estevam       2020-08-18  1161  					     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1162  				clocks = <&clk IMX8MM_CLK_ENET1_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1163  					 <&clk IMX8MM_CLK_ENET1_ROOT>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1164  					 <&clk IMX8MM_CLK_ENET_TIMER>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1165  					 <&clk IMX8MM_CLK_ENET_REF>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1166  					 <&clk IMX8MM_CLK_ENET_PHY_REF>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1167  				clock-names = "ipg", "ahb", "ptp",
a05ea40eb384e2 Jacky Bai           2019-03-22  1168  					      "enet_clk_ref", "enet_out";
a05ea40eb384e2 Jacky Bai           2019-03-22  1169  				assigned-clocks = <&clk IMX8MM_CLK_ENET_AXI>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1170  						  <&clk IMX8MM_CLK_ENET_TIMER>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1171  						  <&clk IMX8MM_CLK_ENET_REF>,
70eacf42a93aff Joakim Zhang        2021-01-16  1172  						  <&clk IMX8MM_CLK_ENET_PHY_REF>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1173  				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
a05ea40eb384e2 Jacky Bai           2019-03-22  1174  							 <&clk IMX8MM_SYS_PLL2_100M>,
70eacf42a93aff Joakim Zhang        2021-01-16  1175  							 <&clk IMX8MM_SYS_PLL2_125M>,
70eacf42a93aff Joakim Zhang        2021-01-16  1176  							 <&clk IMX8MM_SYS_PLL2_50M>;
70eacf42a93aff Joakim Zhang        2021-01-16  1177  				assigned-clock-rates = <0>, <100000000>, <125000000>, <0>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1178  				fsl,num-tx-queues = <3>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1179  				fsl,num-rx-queues = <3>;
066438ae637b49 Joakim Zhang        2021-01-16  1180  				nvmem-cells = <&fec_mac_address>;
066438ae637b49 Joakim Zhang        2021-01-16  1181  				nvmem-cell-names = "mac-address";
afe99354633463 Joakim Zhang        2021-01-16  1182  				fsl,stop-mode = <&gpr 0x10 3>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1183  				status = "disabled";
a05ea40eb384e2 Jacky Bai           2019-03-22  1184  			};
a05ea40eb384e2 Jacky Bai           2019-03-22  1185  
a05ea40eb384e2 Jacky Bai           2019-03-22  1186  		};
a05ea40eb384e2 Jacky Bai           2019-03-22  1187  
a05ea40eb384e2 Jacky Bai           2019-03-22  1188  		aips4: bus@32c00000 {
dc3efc6ff0d51a Peng Fan            2020-03-11  1189  			compatible = "fsl,aips-bus", "simple-bus";
921a6845d01b66 Fabio Estevam       2020-03-31  1190  			reg = <0x32c00000 0x400000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1191  			#address-cells = <1>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1192  			#size-cells = <1>;
10c7420738e683 Fabio Estevam       2019-06-05  1193  			ranges = <0x32c00000 0x32c00000 0x400000>;
a05ea40eb384e2 Jacky Bai           2019-03-22  1194  
bc32ed276f2f59 Fancy Fang          2019-07-22  1195  			lcdif: lcdif@32e00000 {
bc32ed276f2f59 Fancy Fang          2019-07-22  1196  				#address-cells = <1>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1197  				#size-cells = <0>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1198  				compatible = "fsl,imx8mm-lcdif";
bc32ed276f2f59 Fancy Fang          2019-07-22  1199  				reg = <0x32e00000 0x10000>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1200  				clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
bc32ed276f2f59 Fancy Fang          2019-07-22  1201  					 <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
bc32ed276f2f59 Fancy Fang          2019-07-22  1202  					 <&clk IMX8MM_CLK_DISP_APB_ROOT>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1203  				clock-names = "pix", "disp-axi", "disp-apb";
bc32ed276f2f59 Fancy Fang          2019-07-22  1204  				assigned-clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
bc32ed276f2f59 Fancy Fang          2019-07-22  1205  						  <&clk IMX8MM_CLK_DISP_AXI>,
bc32ed276f2f59 Fancy Fang          2019-07-22  1206  						  <&clk IMX8MM_CLK_DISP_APB>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1207  				assigned-clock-parents = <&clk IMX8MM_VIDEO_PLL1_OUT>,
bc32ed276f2f59 Fancy Fang          2019-07-22  1208  							 <&clk IMX8MM_SYS_PLL2_1000M>,
bc32ed276f2f59 Fancy Fang          2019-07-22  1209  							 <&clk IMX8MM_SYS_PLL1_800M>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1210  				assigned-clock-rate = <594000000>, <500000000>, <200000000>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1211  				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1212  				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_LCDIF>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1213  				status = "disabled";
bc32ed276f2f59 Fancy Fang          2019-07-22  1214  
bc32ed276f2f59 Fancy Fang          2019-07-22  1215  				lcdif_disp0: port@0 {
bc32ed276f2f59 Fancy Fang          2019-07-22  1216  					reg = <0>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1217  
bc32ed276f2f59 Fancy Fang          2019-07-22  1218  					lcdif_to_dsim: endpoint {
bc32ed276f2f59 Fancy Fang          2019-07-22  1219  						remote-endpoint = <&dsim_from_lcdif>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1220  					};
bc32ed276f2f59 Fancy Fang          2019-07-22  1221  				};
bc32ed276f2f59 Fancy Fang          2019-07-22  1222  			};
bc32ed276f2f59 Fancy Fang          2019-07-22  1223  
bc32ed276f2f59 Fancy Fang          2019-07-22 @1224  			mipi_dsi: mipi_dsi@32e10000 {
bc32ed276f2f59 Fancy Fang          2019-07-22  1225  				#address-cells = <1>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1226  				#size-cells = <0>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1227  				compatible = "fsl,imx8mm-mipi-dsim";
bc32ed276f2f59 Fancy Fang          2019-07-22  1228  				reg = <0x32e10000 0x400>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1229  				clocks = <&clk IMX8MM_CLK_DSI_CORE>,
87c6094487910f Liu Ying            2022-06-27  1230  					 <&clk IMX8MM_CLK_DSI_PHY_REF>,
87c6094487910f Liu Ying            2022-06-27  1231  					 <&clk IMX8MM_CLK_DISP_APB_ROOT>;
87c6094487910f Liu Ying            2022-06-27  1232  				clock-names = "cfg", "pll-ref", "apb-root";
bc32ed276f2f59 Fancy Fang          2019-07-22  1233  				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
bc32ed276f2f59 Fancy Fang          2019-07-22  1234  						  <&clk IMX8MM_CLK_DSI_PHY_REF>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1235  				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
bc32ed276f2f59 Fancy Fang          2019-07-22  1236  							 <&clk IMX8MM_CLK_24M>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1237  				assigned-clock-rates = <266000000>, <12000000>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1238  				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1239  				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
bc32ed276f2f59 Fancy Fang          2019-07-22  1240  				status = "disabled";
bc32ed276f2f59 Fancy Fang          2019-07-22  1241  
bc32ed276f2f59 Fancy Fang          2019-07-22 @1242  				port@0 {

:::::: The code at line 1242 was first introduced by commit
:::::: bc32ed276f2f59ee25275dd9550e129f6ca14fee ARM64: dts: imx8mm: add display devices nodes

:::::: TO: Fancy Fang <chen.fang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
