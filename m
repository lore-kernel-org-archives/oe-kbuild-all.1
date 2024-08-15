Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E5D7DA96
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 10:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723718958; cv=none; b=YC3Qbj+ATGeDHvBXqFjzHyNS6GoRSNyOw6/euzyI/iH3BznjeoCuFWafUppjhUxdA6i+eYyFYlSj5r5bvU97NZzy1hGPPe6G0vYRv8nDcFOftIj4lHpI89qiVs7MYhwKkE7qvWOKxAS+JedtnpFQZVmJaffUN6XwM8MAKfWtmAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723718958; c=relaxed/simple;
	bh=TkgJMSLhwNItnApNZpx6UY35Fz0JnVef48yg+fLFcSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnzrP6TJIUrojS5Oq+vWywADVxamI2rOa/KNnrQI8eYDBt6ktqpKrnYffyzqxnbTA4WigV4Gp2D5TDNn67dnJqlxGNgpJxPMBkILwjR/Sh8zQAfej7iaYYXsZRKc+7I1OJp0N+oD5YoD9nEVcZyQLiD6Dze7ZkqPKtSr0kN+obU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=le9InYDO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="le9InYDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723718956; x=1755254956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkgJMSLhwNItnApNZpx6UY35Fz0JnVef48yg+fLFcSk=;
  b=le9InYDOi18DrRbt1IydzDEejdKf5VrWVnmtuMQIad1rMojXdcvhq2EB
   NjF7aNZZwJYwz6B2tSGt/Huqr1JVmkiDT+PY5C6BH8v01mXYVJnD7klU5
   QRwF8xegaMypqhC3PeSoOfVNUA/oiY7rM9NxxnGyYrBJbQUB80Yy7TOkb
   Dht2xYZkO68LO+o8S33sYPYwlrF7vIAxGbspLlT+P9ZhymTfoHcBoWNRa
   cp+Hqfceyz/KzlhqI/S3h2s0blceDi1Nf6gONbcR//Y6zp38ZYDQhLHAy
   xMufDftOSdp4zCWEYUjkB9YqbthfUTQU0gD303CtCmwpXXtftnGwo73Ar
   g==;
X-CSE-ConnectionGUID: YGqWX4t/S9Wx+kIXNcKdpQ==
X-CSE-MsgGUID: ihaHUroJSjmmN3fEhocwmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22136818"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22136818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 03:49:15 -0700
X-CSE-ConnectionGUID: asF/yAGRTZKkDa2PLAsg7Q==
X-CSE-MsgGUID: REl06AOqQ9CbHi6QS42lfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="60077064"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Aug 2024 03:49:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seY2Y-0003Tu-3A;
	Thu, 15 Aug 2024 10:49:10 +0000
Date: Thu, 15 Aug 2024 18:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Fabio Estevam <festevam@denx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 4168/4667]
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: dma-controller@10001000:
 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202408151859.YokZhqIH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
commit: ebfaa1a900c4e5cacb553eff60bb8aa15675e3f3 [4168/4667] ARM: dts: imx1/imx27: Use dma-controller as node name
config: arm-randconfig-053-20240814 (https://download.01.org/0day-ci/archive/20240815/202408151859.YokZhqIH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151859.YokZhqIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151859.YokZhqIH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: osc26m: compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: osc26m: compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: dma-controller@10001000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000', 'partition@200000', 'partition@280000', 'partition@300000', 'partition@800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: osc26m: compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: osc26m: compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: dma-controller@10001000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: nand-controller@d8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000', 'partition@200000', 'partition@280000', 'partition@300000', 'partition@800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: osc26m: compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: osc26m: compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: dma-controller@10001000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000/spi@1000e000/ads7846@0: failed to match any schema with compatible: ['ti,ads7846']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000/i2c@10012000/codec@1a: failed to match any schema with compatible: ['ti,tlv320aic23']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000: #size-cells: 0 was expected
--
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: osc26m: compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: osc26m: compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: dma-controller@10001000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /soc/bus@10000000/spi@1000f000/mc13783@0: failed to match any schema with compatible: ['fsl,mc13783']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: nand-controller@d8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: osc26m: compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: osc26m: compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: dma-controller@10001000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /soc/bus@10000000/spi@1000e000/mc13783@0: failed to match any schema with compatible: ['fsl,mc13783']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: nand-controller@d8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: osc26m: compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: osc26m: compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: dma-controller@10001000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: nand-controller@d8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
