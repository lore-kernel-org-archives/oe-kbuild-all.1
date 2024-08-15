Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E092BAE5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723708506; cv=none; b=pduH9z1EQxS+zPCiqpwZd1QVWd9nOBNjcA2vAYrf3Fh/9KPNDQ5iHnlZoZC9OK2/OQx09XeMvIgxEyPRs81qIv62wjCGI3RaAHtMjAEdxXkv0hRr/V8g3fRpU10zQFcfl4Pko78X1V7kve/rPZwm/fVOlmWWYk7ZeCEATsRjdgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723708506; c=relaxed/simple;
	bh=FGptCLdmd1XzAhVTB2HEPiBpmxuIBhHKC53FsV3ix+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNhmeWBnxeQ0OkHzeZYZgzzJ+vu70WkMuQOF7EtdK0i8BZysw9hTFdoNR4RfXAt3v/yb1pIsPBx4A7WPj/W+87LGe5UHC7TniSWXfB0+Z803l6f6FcnyddllTMJdMfWbSjA3Fx5r12tpaUhbFjrYIlAzd9qA/mioACRa8vIioJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNuJy1Dl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNuJy1Dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723708504; x=1755244504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FGptCLdmd1XzAhVTB2HEPiBpmxuIBhHKC53FsV3ix+8=;
  b=gNuJy1DltK4muohDPKCcSUnwLCqAnc1WWFqBk1yQxmIGzL19clX0zRSd
   CGvqvO3OLIXPKFmh9TgH5AUjtlMAF6N6HwW8zsdlElUSwMTvjp7FQWUuE
   NIfm9dwZLlqcZq4ppd+Y3iDyOxL2SyLlNBgU1FbDoEzxqr2eBRuhtiOvd
   Mw6Sb+pbgEP1+tthReu9u37mr46oVBevvuwgmhIf83BLahUr6wMOrV0Fa
   nWrFUXriTCynoGU35sT7LBPhFQOPg4UV0Nic8Alc5bGiLMmmlwNY5UPh/
   Nppa4vXur1Ds22jyjZYgtE4hpMhtGDYEnKD8Wo3gn3L1brlFdajoLViGK
   Q==;
X-CSE-ConnectionGUID: 6wTL6TOSQMeNZsW79fPGTQ==
X-CSE-MsgGUID: m/GVI7wDQk+cxV3Csq1DAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22089857"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22089857"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 00:55:04 -0700
X-CSE-ConnectionGUID: r5GUlbTrQp+q8G9Rn2dH6A==
X-CSE-MsgGUID: JcmRhvB3SD6C1quvMUcy6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="89978982"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Aug 2024 00:55:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seVJz-0003K2-1Z;
	Thu, 15 Aug 2024 07:54:59 +0000
Date: Thu, 15 Aug 2024 15:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 4175/4951]
 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb:
 interrupt-controller@40000000: 'interrupt-controller' is a required property
Message-ID: <202408151514.xNSt9K25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edd1ec2e3a9f5de7fb267a3af73e4f00e7e052b7
commit: 44ccb92bc64a6f92666e69c7c30e5713758641e2 [4175/4951] dt-bindings: interrupt-controller: convert bcm2836-l1-intc to yaml
config: arm-randconfig-052-20240815 (https://download.01.org/0day-ci/archive/20240815/202408151514.xNSt9K25-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151514.xNSt9K25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151514.xNSt9K25-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: soc: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: soc: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2711-cprman']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2711-gpio']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/spi@7e215080: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/spi@7e2150c0: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: interrupt-controller@40000000: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: interrupt-controller@40000000: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: emmc2bus: $nodename:0: 'emmc2bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: scb: $nodename:0: 'scb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: soc: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: soc: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2711-cprman']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2711-gpio']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/spi@7e215080: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/spi@7e2150c0: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: interrupt-controller@40000000: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: interrupt-controller@40000000: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: emmc2bus: $nodename:0: 'emmc2bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: scb: $nodename:0: 'scb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: soc: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: soc: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2711-cprman']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2711-gpio']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: /soc/spi@7e215080: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: /soc/spi@7e2150c0: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: interrupt-controller@40000000: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: interrupt-controller@40000000: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: firmware: gpio: 'ant1-hog', 'ant2-hog' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: /soc/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: emmc2bus: $nodename:0: 'emmc2bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: scb: $nodename:0: 'scb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
