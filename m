Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACEC19343E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724245117; cv=none; b=EHvvf01hFIrls/Wloys0kXfoTybijp4o34w8wmVv3BvUIBtkft8ydQJOeAM3lATm/MCMBUVn5R0qbq2yWx6p/bxa0qUl7xDqeUpJvh8GD97hBjikZ3UBTx4ZGdauCMHyJaKw3QPPiaD7W7hNbcABed9QLACYYJE9D+U5xRVVIxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724245117; c=relaxed/simple;
	bh=KCmU67FKNJL99v37ZGtSzXECy60DQgbrLWPm2EVr2jA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+6YMMWldyTLfERH4zN0Z5HIkivq1UjmXKApPyNw7TnreGF4nowlQ80TNGHZfNs8oEUkbHMQH2uU+5fRaoc0rXe0wvA5SXq2Dg7Ibsj5m2JWlTrmHlhZAI49ORGwaLiPcdu8h7zMMxlqKnResXpjQzIAyVxgrwSdhqPnUSMcfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnOKt4uN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnOKt4uN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724245115; x=1755781115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCmU67FKNJL99v37ZGtSzXECy60DQgbrLWPm2EVr2jA=;
  b=UnOKt4uNPZZkJgmuQcsoe1RLBE4Bb5D82TOJjDG0fGbP9HRVVHqpnAvl
   Z6On/8+eKD7lcSeFl9/E5GXyOwxu8gTspwcpZm4rxWyyXjH2XuyZqDtoq
   oD3cr3VnJQM6UpoBKPGGDjS9+2U2+4lIk55/EbAHeoQ+N3lZQv8PGqfia
   6klHthW5xch6IYdK4KA9kZGr0X7/G1K2XVXVJh8ZLlGHpeGh5LX8eATfj
   MIoCZEwgWuzpCoR9ncSleaegA9CPx4ZmSB6lmXvnmSKQa32oF1TJO3K/C
   rIqLVGtsqLtPQBB+x2Pnw4YMKbcswnEJMUskwwHKIoz3MnxvAzTXriyJU
   w==;
X-CSE-ConnectionGUID: G7q7bFskRdmzHAp9TkntHQ==
X-CSE-MsgGUID: PaeGmyUVSJiBbkByhQihHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26354247"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="26354247"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 05:58:34 -0700
X-CSE-ConnectionGUID: eh/IqAKTR86CmbiY8QHdcw==
X-CSE-MsgGUID: zRa19IKAQ7yh6CeKrlVFtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65430144"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Aug 2024 05:58:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgkuz-000BN0-1s;
	Wed, 21 Aug 2024 12:58:29 +0000
Date: Wed, 21 Aug 2024 20:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4503/5508]
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: mdio-gpio: $nodename:0:
 'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'
Message-ID: <202408212054.B0OvuhZr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bb1b0acdcd66e0d8eedee3570d249e076b89ab32
commit: 02404bdb811dbea6ab523675ec98d9f815cfb3b2 [4503/5508] dt-bindings: net: mdio: change nodename match pattern
config: arm-randconfig-051-20240819 (https://download.01.org/0day-ci/archive/20240821/202408212054.B0OvuhZr-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408212054.B0OvuhZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408212054.B0OvuhZr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/bus@80000000/tigerp@83fa0000: failed to match any schema with compatible: ['fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: owire@83fa4000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/w1/fsl-imx-owire.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/bus@80000000/i2c@83fc4000/amp@60: failed to match any schema with compatible: ['ti,tpa6130a2']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: audmux@83fd0000: 'aud3', 'ssi2' do not match any of the regexes: '^mux-[0-9a-z]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/imx-audmux.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/bus@80000000/m4if@83fd8000: failed to match any schema with compatible: ['fsl,imx51-m4if']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /soc/bus@80000000/nand@83fdb000: failed to match any schema with compatible: ['fsl,imx51-nand']
   arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
>> arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: mdio-gpio: $nodename:0: 'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/net/mdio-gpio.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx5-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: /soc/bus@80000000/bridge@83f00000: failed to match any schema with compatible: ['fsl,imx51-aipstz']
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: efuse@83f98000: compatible: ['fsl,imx51-iim', 'fsl,imx27-iim', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: /soc/bus@80000000/tigerp@83fa0000: failed to match any schema with compatible: ['fsl,imx51-tigerp']
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: owire@83fa4000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/w1/fsl-imx-owire.yaml#
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: /soc/bus@80000000/m4if@83fd8000: failed to match any schema with compatible: ['fsl,imx51-m4if']
   arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: /soc/bus@80000000/nand@83fdb000: failed to match any schema with compatible: ['fsl,imx51-nand']
>> arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dtb: mdio-gpio: $nodename:0: 'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/net/mdio-gpio.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: pmic@58: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: pmic@58: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: mdio-gpio: $nodename:0: 'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/net/mdio-gpio.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: switch@0: ports:port@4: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: pmic@58: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: pmic@58: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: mdio-gpio: $nodename:0: 'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/net/mdio-gpio.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: switch@0: ports:port@4: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: pmic@58: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: pmic@58: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: mdio-gpio: $nodename:0: 'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/net/mdio-gpio.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: switch@0: ports:port@4: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
