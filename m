Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C103A25A341
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763812296; cv=none; b=bC4RZLmHjTrTLRSJ8GfyqF19JyE2lNMmPL8SQYNgFbA49zBQGcCLSv/1vieYXwbzqlj/H+p4YDzU9lTX9OIpk+e6HrgL8Alw0HtyuRbjxNxHFedc8N/me5hsUv4ejRIbKdWwsjdFgxv+XS20eZObnFjdL3jwyX09fjO6Okhaz5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763812296; c=relaxed/simple;
	bh=6K05xcZqGj+5zFYjN3U7zU+OJeMXOFSQcUyOKjZoUDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t30bEjBkR8lsLSXS2tYxk0kDbLG4PFsEzgFJ//XLIEi3GAlUkrYOe7uP9h8MRNpfpikzQ60ZiqeBMPAJjoWk5YYzZxlnahwlcYSUdEk+vCsHSuSyVuxwnYzZ0D/Orj9jowVFG5TFw+sLUra7X0r2IkWw3M0Kcfu5YGa28fOUXHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDSLjy5K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDSLjy5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763812295; x=1795348295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6K05xcZqGj+5zFYjN3U7zU+OJeMXOFSQcUyOKjZoUDE=;
  b=bDSLjy5KEiS+keVAJHBCIyXAhFxDdfnAFmKXkKh3ED/JJnfPX6dz8d4s
   5hR5Zylj2qpDeB9VZ5iD67PWQSqesm6hXejz6ueu1ovQCET4P4qvLeTbJ
   lVCEcjByeVKqTltqA5g9YAL44K7uMPDwq1uKhXLH76L4CMaBaUTBpKfbP
   VhBaHLksaG6lWuW1KD4xoFxJBjNk+U64bVJemebFmJxi1q5nnaCgEhpvR
   W3Y72fAXKFB3/+wB/983W5o1Atb8MkG/fuovN7/qfywZqLEbZyVao4a5F
   ViGSzsFYN4F7GRElc0WwfsQVr9FF/4CO3yZWBXBAg1UYT7Y/K9ELF9kv/
   w==;
X-CSE-ConnectionGUID: Runp05NmSrC59fel6v+SGA==
X-CSE-MsgGUID: 9R8LlMfWTxexNS6eJTsnTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65773610"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65773610"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 03:51:35 -0800
X-CSE-ConnectionGUID: fH9vOogfSEugRjcfG2HxTg==
X-CSE-MsgGUID: 2wRynIzuQxWZ0Psay1B9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="196389558"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 22 Nov 2025 03:51:33 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMm9K-0000000027f-2H6S;
	Sat, 22 Nov 2025 11:51:30 +0000
Date: Sat, 22 Nov 2025 12:50:44 +0100
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 8261/11041]
 arch/arm/boot/dts/st/spear300-evb.dtb: wdt@fc880000 (arm,sp805):
 $nodename:0: 'wdt@fc880000' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202511221222.FNCptVye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 017bca91639f01302382013033b685ec8759aba4 [8261/11041] dt-bindings: watchdog: Allow node names named 'pmic'
config: arm-randconfig-2052-20251118 (https://download.01.org/0day-ci/archive/20251122/202511221222.FNCptVye-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221222.FNCptVye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221222.FNCptVye-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear300-evb.dtb: dma@fc400000 (arm,pl080): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear300-evb.dtb: dma@fc400000 (arm,pl080): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear300-evb.dtb: /ahb/flash@fc000000: failed to match any schema with compatible: ['st,spear600-smi']
   arch/arm/boot/dts/st/spear300-evb.dtb: gpio@fc980000 (arm,pl061): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml
   arch/arm/boot/dts/st/spear300-evb.dtb: serial@d0000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
>> arch/arm/boot/dts/st/spear300-evb.dtb: wdt@fc880000 (arm,sp805): $nodename:0: 'wdt@fc880000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear300-evb.dtb: wdt@fc880000 (arm,sp805): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear300-evb.dtb: wdt@fc880000 (arm,sp805): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear300-evb.dtb: gpio@a9000000 (arm,pl061): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml
   arch/arm/boot/dts/st/spear300-evb.dtb: /ahb/apb/kbd@a0000000: failed to match any schema with compatible: ['st,spear300-kbd']
   arch/arm/boot/dts/st/spear300-evb.dtb: /ahb/pinmux@99000000: failed to match any schema with compatible: ['st,spear300-pinmux']
   arch/arm/boot/dts/st/spear300-evb.dtb: gpio1: st,pins: b'gpio1_4_to_7_grp\x00gpio1_0_to_3_grp\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: dma@fc400000 (arm,pl080): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: dma@fc400000 (arm,pl080): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: /ahb/flash@fc000000: failed to match any schema with compatible: ['st,spear600-smi']
   arch/arm/boot/dts/st/spear310-evb.dtb: gpio@fc980000 (arm,pl061): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: serial@d0000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
>> arch/arm/boot/dts/st/spear310-evb.dtb: wdt@fc880000 (arm,sp805): $nodename:0: 'wdt@fc880000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: wdt@fc880000 (arm,sp805): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: wdt@fc880000 (arm,sp805): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: serial@b2000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: serial@b2080000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/st/spear310-evb.dtb: serial@b2100000 (arm,pl011): pinctrl-0: True is not of type 'array'
--
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: dma@fc400000 (arm,pl080): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: dma@fc400000 (arm,pl080): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: /ahb/flash@fc000000: failed to match any schema with compatible: ['st,spear600-smi']
   arch/arm/boot/dts/st/spear320-evb.dtb: gpio@fc980000 (arm,pl061): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: serial@d0000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
>> arch/arm/boot/dts/st/spear320-evb.dtb: wdt@fc880000 (arm,sp805): $nodename:0: 'wdt@fc880000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: wdt@fc880000 (arm,sp805): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: wdt@fc880000 (arm,sp805): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: serial@a3000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: serial@a4000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/st/spear320-evb.dtb: /ahb/apb/gpio@b3000000: failed to match any schema with compatible: ['st,spear-plgpio']
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: stmpe-gpio (st,stmpe-gpio): 'gpio,norequest-mask', 'reg' do not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: stmpe-gpio (st,stmpe-gpio): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: stmpe-gpio (st,stmpe-gpio): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: /ahb/apb/i2c@d0180000/stmpe811@41/stmpe610-ts: failed to match any schema with compatible: ['stmpe,ts']
   arch/arm/boot/dts/st/spear320-hmi.dtb: serial@d0000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
>> arch/arm/boot/dts/st/spear320-hmi.dtb: wdt@fc880000 (arm,sp805): $nodename:0: 'wdt@fc880000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: wdt@fc880000 (arm,sp805): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: wdt@fc880000 (arm,sp805): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: serial@a3000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: serial@a4000000 (arm,pl011): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml
   arch/arm/boot/dts/st/spear320-hmi.dtb: /ahb/apb/gpio@b3000000: failed to match any schema with compatible: ['st,spear-plgpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
