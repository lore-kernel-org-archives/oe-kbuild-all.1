Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6D81CEABF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 06:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725343848; cv=none; b=VJnnOHKRB+XlSrl/eYsm3MAUc0rgmSHIVzYGoNJ1WXm01yjl5H3aQLe1k+NtxqiHnVHgYX98WVnxBaS2C+Se4Qa6N5GFa+eKvm9En+Hz6+o2j2kieA4ucBTfOom3/4/XPvDeM0Naw/6BFeR7D79KhhoawYVrzPGJCYQBAK8+GMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725343848; c=relaxed/simple;
	bh=zk7t04B2aYWwSeR7O//l2CXS6lnw3yrl/cozyYXgJWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQGFgk06hbVMdixAc5fyyUoIm/Ajyabw8qGU6/cmHZvmHdI0VJGYuF1sKan4mBgVtZmNfnnRfrzkbjJlRn1Uz9qYVCsnNBx//cHp2QjL+I1yUlQURMfKE1xnkO1X9iKdN/Ux7Z4HPWIR7ZTijf6YirNW+RLpkYJ+io1gM+zFo/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCUfNfSx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCUfNfSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725343847; x=1756879847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zk7t04B2aYWwSeR7O//l2CXS6lnw3yrl/cozyYXgJWo=;
  b=aCUfNfSxh04yEHVaJcetMkNIG6NFPvrfcdDTTF8uzwNU42Tqce8OkNt8
   12DezDuSQ+uB3fAGExBcWCSfW6eJgPi2af5ej0VHaH90SEUijgl3rARal
   PTJja0fYiwcZA541wJu20in+TfeTlY1OwDANinWuWWn4U1NeqOV+22Pvk
   /efcAPLz/RnjznMVcJ4MIqUagCix4SzxlQFKlpWN7Fzv6QIidsxMXsK6L
   e4rY9Jjj3Ow63Pcr5nsJjaHM36dgOs8Hd0UrWz1o7NiqRf02AIVGpLfeT
   GNfKXOuDEOKJ45vDpLy0ZfDOsXCiTuFbYvM7UjO+PALPL8gA3QKo1M3j1
   g==;
X-CSE-ConnectionGUID: 0jPjboniQki7pORM+TM9ig==
X-CSE-MsgGUID: Y7rjqOkOTXOAu4EKiUBrHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41393355"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="41393355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 23:10:45 -0700
X-CSE-ConnectionGUID: M10+DiYmRu++HH3UELZrmw==
X-CSE-MsgGUID: lfLR4nCrTDOQ+owcIMKvKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="95515308"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Sep 2024 23:10:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slMkT-0006IA-0g;
	Tue, 03 Sep 2024 06:10:41 +0000
Date: Tue, 3 Sep 2024 14:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 7820/8400]
 arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: pcie-ep@33c00000: reg:
 [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576],
 [871366656, 1048576]] is too long
Message-ID: <202409031446.tp4p9J0w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: ffb2e5f1cbdf3a828d0d729d3f3fbbfbdedfd40c [7820/8400] arm64: dts: imx8mq: Add dbi2 and atu reg for i.MX8MQ PCIe EP
config: arm64-randconfig-055-20240902 (https://download.01.org/0day-ci/archive/20240903/202409031446.tp4p9J0w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031446.tp4p9J0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031446.tp4p9J0w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36: failed to match any schema with compatible: ['ti,lm36922']
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36: failed to match any schema with compatible: ['ti,lm36922']
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36: failed to match any schema with compatible: ['ti,lm36922']
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: /extcon-usbotg0: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a20000/amp@60: failed to match any schema with compatible: ['ti,tpa6130a2']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a20000/codec@18: failed to match any schema with compatible: ['ti,tlv320dac3100']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a30000/codec@18: failed to match any schema with compatible: ['ti,tlv320dac3100']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a30000/amp@60: failed to match any schema with compatible: ['ti,tpa6130a2']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a40000/watchdog@38: failed to match any schema with compatible: ['zii,rave-wdt']
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/i2c@30a20000/amp@60: failed to match any schema with compatible: ['ti,tpa6130a2']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/i2c@30a30000/codec@18: failed to match any schema with compatible: ['ti,tlv320dac3100']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/i2c@30a30000/amp@60: failed to match any schema with compatible: ['ti,tpa6130a2']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/i2c@30a40000/watchdog@38: failed to match any schema with compatible: ['zii,rave-wdt']
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000: Unevaluated properties are not allowed ('ports', 'samsung,burst-clock-frequency', 'samsung,esc-clock-frequency' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: pcie-ep@33c00000: reg: [[868220928, 1048576], [536870912, 134217728], [869269504, 1048576], [871366656, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: panel-lvds: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: panel-lvds: Unevaluated properties are not allowed ('backlight', 'port', 'power-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: /extcon-usbotg0: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
