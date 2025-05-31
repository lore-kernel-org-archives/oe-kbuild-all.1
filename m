Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4D335953
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 04:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748665595; cv=none; b=HV1TiKBkDMgoeHCENGMGNeH9NNhZiqUMSZuBPaBIlr6bdiVO/Tsrotx1ttOHYIRL/bNIcGF8+2g/qMQeRD4AG3hWr9HdI5+Y8yQC+GnloYQdzlVZRM8Cov5vW8iBFMkUNNWUXsPts0V1lMRVHU2ktyeOlAWnk7MMk20j59SmJJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748665595; c=relaxed/simple;
	bh=PqjYevySfcxhFKygiYI0wIhHD+JaFYVV+dxSpYJYlW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iouhDTAfNA0in8j4iyzcx/WgtUQGKP4tL2DamCxXfNv6MUap26miDr49u6n4/sFRZO4RhRqVk7cT6dbcFhF/8HmjAUcaXrkggJ/tHRwpQAzoIctp6i3Pap1ptxlsJEEA3pw8z5N514B3vH/oAVJsBInC6ZCNmbTsrLMIjKmHNis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlwlWXWr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlwlWXWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748665594; x=1780201594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PqjYevySfcxhFKygiYI0wIhHD+JaFYVV+dxSpYJYlW0=;
  b=OlwlWXWrWKSjMsJhNFDeD6WWI4ogW0s05rU1aavPmZq3bYTq8aYJbHxp
   6Flql5MNqhgbdHIiBhTiwGgW4PCa97myKDUQM8UlZmYTd6imS9HeoRJ64
   3ug1ZtZTGVQOR0tVd9PL3EeGKfDGb1A5zPmqeuTzx2RIDyxKvvG2hnwWK
   9xa96lwc3iqMIJGkigNLf+ODXWOemWVwllJVJcGDwOV+5zid+SXbcTLrY
   +e5YtTmveWtN5IFqXklrw1KJgUDUg9a9LEfhSBf71a/zjT71O+SyeRVhD
   +pmQFyYACRBWMEF2LaAZxwbs+fbAnXRUQOjNzKAXpDCZyNOKV66liUwI8
   g==;
X-CSE-ConnectionGUID: v5I61dbYQIyrnhPUIytOLA==
X-CSE-MsgGUID: K0rbzS6MSjewuKLP4+cLHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50677834"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50677834"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 21:26:33 -0700
X-CSE-ConnectionGUID: wiaRgWcyQcCKjoMwrFPMRQ==
X-CSE-MsgGUID: 4/z3+fwFQwyex/ieahvYBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144024881"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2025 21:26:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLDnh-000YBk-03;
	Sat, 31 May 2025 04:26:29 +0000
Date: Sat, 31 May 2025 12:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Willie Thai <wthai@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Mars Yang <maryang@nvidia.com>, Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 1620/13944]
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: timer
 (arm,armv7-timer): 'clocks' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202505311248.tP7w1pA5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a628f951ed54c30a232230b5b58349d2a8dbb11
commit: ace7a9c8634dbf3103a37f197e7129afafcb11d8 [1620/13944] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC
config: arm-randconfig-053-20250529 (https://download.01.org/0day-ci/archive/20250531/202505311248.tP7w1pA5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311248.tP7w1pA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311248.tP7w1pA5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
