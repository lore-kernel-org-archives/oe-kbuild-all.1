Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E85A2D3748
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886526; cv=none; b=u2ifv6FnRksx5aYQfwM3vVAd8evzNgZjk7NX1/tLEAPUKiHZcYcZ1sIs0oKGJYXcqsxGeykXdm+kV7ju4iCX7djLK1EeWESE9ONJ3H6vQyUMmlALkX7XOOGbMvFVHJTgx6ubgEnM9E/xVoXgK+gKdgKf/hJU3NL+pWKVp+5jfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886526; c=relaxed/simple;
	bh=Gki7EnOcYkAfQ93UoN0owkR46EzK9gk41Vtcw0OXp4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IcdJVQbeg0unpz1+y8ndEHxwObMkjekldmKzdJu7WuEDGELxn/9XbgzsaggJ4Ou8nD6ZHm05hU2h6EDr4PC2/htL41RBvdnOAa6H9s9Ho+IkuwoPIcbCMY+2kALlO7bqyS3RjFZ/bBxIIPyz7jYq3TYoDvt/GQtmdsgpORqcVUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVlYlcH5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVlYlcH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756886524; x=1788422524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gki7EnOcYkAfQ93UoN0owkR46EzK9gk41Vtcw0OXp4M=;
  b=kVlYlcH5JMX1chFVdFU0DXndGX2bgxN94XKnYfUQk2rLdVQVIOVDKKnW
   y0yWK1c7r8Z2cUlTk7zRAv1dH7FKSAgJsFAD2eiEIUAg7byW80fD6+kH/
   8HygCrCqwD0QUCz+7pXIUxeygW6TNpUj9Od5XJJhPtI4jdmUSBW1tNg3g
   paj6e47ZoGuIOOhjC7tqTkW4Gayij2aVdTzqK6qpP7UdKyx7FIaJ2AI/L
   llZv4zxfqpeZT9AxpnYeRABZnWkY3EGE2u/yxS+PZSiapGGRdMcq6J4Ep
   OPni6K5QPzWTMo4ocDwrOOD+j62T/ePWvQ65+i1YWTuMmh51jqjgJE8PM
   Q==;
X-CSE-ConnectionGUID: zCseErghSjaz03TwkXyS0g==
X-CSE-MsgGUID: w0ce7bVrRJCKadR1WvHp5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59127300"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="59127300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 01:02:04 -0700
X-CSE-ConnectionGUID: En5Si4nBSDaZGByUbBjq6Q==
X-CSE-MsgGUID: mbtq2igERuKIeB+Q3Aq0bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171401027"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 03 Sep 2025 01:02:02 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utiRL-0003QN-1X;
	Wed, 03 Sep 2025 08:01:59 +0000
Date: Wed, 3 Sep 2025 10:01:36 +0200
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 2959/5641]
 arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: mmc@ab0800
 (mrvl,pxav3-mmc): pinctrl-names: ['default'] is too short
Message-ID: <202509031011.Z19DD8fL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3db46a82d467bd23d9ebc473d872a865785299d8
commit: 5a22df198bd3f515dfd9ff064a81f41567427dfc [2959/5641] dt-bindings: mmc: sdhci-pxa: add state_uhs pinctrl
config: arm-randconfig-2054-20250902 (https://download.01.org/0day-ci/archive/20250903/202509031011.Z19DD8fL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509031011.Z19DD8fL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509031011.Z19DD8fL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts:30.33-37.5: Warning (simple_bus_reg): /regulators/regulator_usb0: missing or empty reg/ranges property
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts:39.33-46.5: Warning (simple_bus_reg): /regulators/regulator_usb1: missing or empty reg/ranges property
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts:48.33-55.5: Warning (simple_bus_reg): /regulators/regulator_usb2: missing or empty reg/ranges property
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts:57.40-65.5: Warning (simple_bus_reg): /regulators/regulator_sdio1_vmmc: missing or empty reg/ranges property
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts:67.42-77.5: Warning (simple_bus_reg): /regulators/regulator_sido1_vqmmc: missing or empty reg/ranges property
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts:25.13-78.4: Warning (avoid_unnecessary_addr_size): /regulators: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: /: failed to match any schema with compatible: ['marvell,berlin2q-dmp', 'marvell,berlin2q', 'marvell,berlin']
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: /: failed to match any schema with compatible: ['marvell,berlin2q-dmp', 'marvell,berlin2q', 'marvell,berlin']
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: /: failed to match any schema with compatible: ['marvell,berlin2q-dmp', 'marvell,berlin2q', 'marvell,berlin']
>> arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: mmc@ab0800 (mrvl,pxav3-mmc): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: /soc@f7000000/ethernet@b90000: failed to match any schema with compatible: ['marvell,pxa168-eth']
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: /soc@f7000000/cpu-ctrl@dd0000: failed to match any schema with compatible: ['marvell,berlin-cpu-ctrl']
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: timer@2c14 (snps,dw-apb-timer): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: chip-control@ea0000 (simple-mfd): compatible: ['simple-mfd', 'syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dtb: chip-control@ea0000 (simple-mfd): reg: [[15335424, 1024], [14483824, 16]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
