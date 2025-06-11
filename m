Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05642E610F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660433; cv=none; b=JTVF4dd1A+VwrUlpVoqESu8o+GgzUtNFhfR6f/D3QsO0rRGCYOrDapa/sH2h1vLiN6SXXY9OdY0eYozz7dhuI7o4Gj1jwmAvXDpnviOrBU/ak2hRoffLDXo3acC7tW9MwVFqehamPYLuziO+d8oFP73O30iu7txE1DHSCrfpipM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660433; c=relaxed/simple;
	bh=gJ35IvL5AJxRsuT/BFEKOKb2HLq3aK1MgBAFweo0dkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgjdxwMl3CAtXiMZKbU312kVQRcSb42QPuoy/X0+iJD79o7LI3Zib0K6WQbnamraex9n6cQmDKdMLzQ5GdG9p09I3uPC3ZECtSWSD50aY31kMoIlYu29aF6I0eGCzgzDmTijocrZvyWs2nTK9fMfWeMHz5IyNUfpchslN7yBaC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzKCueqz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzKCueqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749660432; x=1781196432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJ35IvL5AJxRsuT/BFEKOKb2HLq3aK1MgBAFweo0dkM=;
  b=IzKCueqzgcRvCjvIxoN2PDZBv9/y2kSq1fJ4hMOq+Wod769d+m/fRr31
   koHg+A6ohGue+Ve9Ps+tyUHP4hMLxA5bKKome8ENBkxhmrULGc2y4wUBK
   YHGf0/oh1Yar+J20NnxXBR9Jqsph2x5F4XndSA+4GLG85rdpbfCVr0xEF
   Hy4yuuR9mqY5U1pcQ+Y8EM9ImbKCXASrgJ/mQUQLRKpQRheEn/e4MRlZd
   +BaEofoTyHZQ/ru7t9RyqgsHlp97rD+HY+LikxvGYsDUKLZh2jCwXxZto
   DEBPBAr0Sn5Mgft8VkasLbvEJsgq6Kqn8dW9hm3njxTheOcC+QfygTWIx
   g==;
X-CSE-ConnectionGUID: LzadE3O6T3SnaxX6mbBKRw==
X-CSE-MsgGUID: +vZg6u5WQcqKKVFEZxq9rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51676035"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51676035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 09:47:12 -0700
X-CSE-ConnectionGUID: f4wYKNegS0y8vOSskZLo2w==
X-CSE-MsgGUID: dzRdsBsMQDmUoZyWF8F6tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147151154"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jun 2025 09:47:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPObT-000Aic-1v;
	Wed, 11 Jun 2025 16:47:07 +0000
Date: Thu, 12 Jun 2025 00:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 1388/1841]
 arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: memory-controller@31080000
 (arm,pl175): #address-cells: 2 was expected
Message-ID: <202506120010.6OynxJRk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   19a60293b9925080d97f22f122aca3fc46dadaf9
commit: 04de50163466a0d11b24f6bb418889f3cc219dda [1388/1841] dt-bindings: memory-controllers: convert arm,pl172.txt to yaml format
config: arm-randconfig-051-20250611 (https://download.01.org/0day-ci/archive/20250612/202506120010.6OynxJRk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120010.6OynxJRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120010.6OynxJRk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: dma@31000000 (arm,pl080): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: /ahb/usb/usbd@0: failed to match any schema with compatible: ['nxp,lpc3220-udc']
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: i2c@300 (nxp,pnx-i2c): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/nxp,pnx-i2c.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: /ahb/usb/i2c@300/usb-transceiver@2d: failed to match any schema with compatible: ['nxp,isp1301']
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: /ahb/ethernet@31060000: failed to match any schema with compatible: ['nxp,lpc-eth']
>> arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: memory-controller@31080000 (arm,pl175): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/arm,pl172.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: spi@20084000 (arm,pl022): clock-names:0: 'sspclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: spi@20084000 (arm,pl022): clock-names: ['apb_pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: spi@20084000 (arm,pl022): clocks: [[2, 9]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: /ahb/apb/spi@20088000: failed to match any schema with compatible: ['nxp,lpc3220-spi']
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: spi@2008c000 (arm,pl022): clock-names:0: 'sspclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
--
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: dma@31000000 (arm,pl080): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: /ahb/usb/usbd@0: failed to match any schema with compatible: ['nxp,lpc3220-udc']
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: i2c@300 (nxp,pnx-i2c): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/nxp,pnx-i2c.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: /ahb/usb/i2c@300/usb-transceiver@2c: failed to match any schema with compatible: ['nxp,isp1301']
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: /ahb/ethernet@31060000: failed to match any schema with compatible: ['nxp,lpc-eth']
>> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: memory-controller@31080000 (arm,pl175): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/arm,pl172.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: spi@20084000 (arm,pl022): clock-names:0: 'sspclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: spi@20084000 (arm,pl022): clock-names: ['apb_pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: spi@20084000 (arm,pl022): clocks: [[2, 9]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'size' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
