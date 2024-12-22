Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027E28366
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734899369; cv=none; b=jXw/03OTfINuh8imtgZ0Bl4xtols0SPkMZI7fU+NibVwaSEBeoJERhY2dRvEcBykE23E4wLd/rg2n2tFcgN9Wf9Pe6LMFpbQeD3EUsxpxxEH32WkCxj5JZMOdCDrJtDvnCF3JkFC2T/Yv0wz3jLDraTa+kC9j/fEPS3kXXZZtQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734899369; c=relaxed/simple;
	bh=ubWjy3pTJPveNFFd2H/pI5n5QpZaZaVyFLQxnrtxfw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYNBsTDluEgQfjIgBnff+tVFiUWmBLqK0dmcKGAglsv9Qk+hAWbkh7fQFuYNTV+TQYKZOWtZ/s9DNXBL5R0e5uaBkwbUYFBkTsLZXTX9lUhGkNz18ex/194dyZBBn9r4zN7kKlrtB/GiTDKyZN49ITTNcutT/xJKXzsV9mUj/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lpbfpi6p; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lpbfpi6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734899367; x=1766435367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubWjy3pTJPveNFFd2H/pI5n5QpZaZaVyFLQxnrtxfw4=;
  b=Lpbfpi6prAAxYo5XgNHTYM6fTgEJWz8FCLhJGj6E8O52OQG6n4dz0YUF
   qlcHLrD5UuQc2Z1oXklukukINV/qFfPxGxm4RtnG5wOPhIw+71D506WIO
   NGZuPP5Lk8zFfpiee913D0Oao2W7EWMrSJuWJHz9oYO3vEhc64bMT0NaM
   mEbBrIbtiRIDGg8ycPMpWdkPE3okIIcf0gN9MlGO9NP48eKen4E2ucuKs
   G+m6TkYiG+RgViyA2k4rC7CrfEf/7o33PR7+1u9QmC9Jkz7KJWNHfwJzn
   SXJZmBZWjUIcViAKfuV/SZicNqCnhVeQ4VPRlE74MFecJERSniHJ5XNaw
   Q==;
X-CSE-ConnectionGUID: q1ADIUUaRv+T221ItLfGww==
X-CSE-MsgGUID: f5J4QJF4TeGEyjHSU6bR5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35513787"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35513787"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 12:29:25 -0800
X-CSE-ConnectionGUID: +hoWCb+tQQ2vAfs2Zx/LgQ==
X-CSE-MsgGUID: f5/ZAEelQKO/Mh2XrzGVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122307746"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2024 12:29:24 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPSZm-00039T-10;
	Sun, 22 Dec 2024 20:29:22 +0000
Date: Mon, 23 Dec 2024 04:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Birsan <cristian.birsan@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 4775/5236]
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000:
 Unevaluated properties are not allowed ('bus-width', 'no-1-8-v' were
 unexpected)
Message-ID: <202412230403.elx9BXlF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: a876d9a0db36c90b1b9cb060c2618d339ac52fe6 [4775/5236] ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to sdmmc0 node
config: arm-randconfig-053-20241220 (https://download.01.org/0day-ci/archive/20241223/202412230403.elx9BXlF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230403.elx9BXlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230403.elx9BXlF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names', 'phy_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
>> arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'mmc-pwrseq', 'no-1-8-v', 'non-removable', 'wifi@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
   arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
