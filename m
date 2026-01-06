Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B8430B536
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690048; cv=none; b=VFZJUbFx6HD+ZkEeugnB25XWXpVoMatHcJauF4+RVVcnEzG+JB5Wu8jERLOrYi6HkJfQlqaxCoo0PRWlth2bagUXnEEoLWvlW3HmewFBlop9AXx1OP/rLOO5gYKxao+tznDYE+Xt9cH8C1dbN6zXdSf1hQ9F6O9rYXFciI5Ypog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690048; c=relaxed/simple;
	bh=DVguPKlyGMsI3lyCRnW6F8X9OdZmWlrYQAwPxH8W/lI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QdarcPmax23dLNpCVq0dkon3QmX66405kDIuWBZ6IEdWAYaPx9mpqt/aU/faYEqhRl50sd0eMhnkntPYG3eYc5eTZfsvUYDkJxhzEEA+orbR5UN6imA5o8O+rWAZ3yYo59HeA8B5a84WdWMdh4ccK7KW8RUYkDUtrF0XrbN45tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkLxnwh7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkLxnwh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767690048; x=1799226048;
  h=date:from:to:cc:subject:message-id;
  bh=DVguPKlyGMsI3lyCRnW6F8X9OdZmWlrYQAwPxH8W/lI=;
  b=CkLxnwh7eLms8ThRB7m/9fZbvvOTJFmrVWQ4+FX00q9TA/ZrtQx3tPB6
   SA4WkVQkpY/EEQaztdTDen8axaE+FkvAtPoL1orS1B1um8nfvyoLRJe19
   GL9jlkEe5jTVNKN0q8lgvZ0XrvPaKisCOR/9YoUYg3oxZ7JmCSMo8tJ2s
   4BG1K2XD6freo44WAqahjEpX/zbxXh4D04889JndvRgOAtkZJ5mD4I861
   UEKRCDh8AwNVV8yvBZvA2HL8kZ4cXyn6ILScpvreng/cWYB897oL1XwdM
   /agV0fS+0zjaag+XAGoZrgyq+6uZ27tOE4XlMAGrbo2pV7ewG4dPcBz2V
   Q==;
X-CSE-ConnectionGUID: CAjM8qXYQC66Jg+XEAPGqw==
X-CSE-MsgGUID: taoRJH8dTHiTgbvdvh6pYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72900588"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="72900588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 01:00:47 -0800
X-CSE-ConnectionGUID: xVzdsaC+Q2CVr1jK8ByFzw==
X-CSE-MsgGUID: Z504t7pZS12OpyS/49pLxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207077097"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jan 2026 01:00:44 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd2vi-000000001I1-2VZf;
	Tue, 06 Jan 2026 09:00:42 +0000
Date: Tue, 06 Jan 2026 10:00:11 +0100
From: kernel test robot <lkp@intel.com>
To: Marc Olberding <molberding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 974/3725]
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9000
 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202601060904.mATtjisF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f8f97927abf7c12382dddc93a144fc9df7919b77
commit: f28674fab34f07fff9612c3f390d3699bfe8ed90 [974/3725] ARM: dts: aspeed: Add NVIDIA MSX4 HPM
config: arm-randconfig-2051-20260104 (https://download.01.org/0day-ci/archive/20260106/202601060904.mATtjisF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060904.mATtjisF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060904.mATtjisF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: sdram@1e6e0000 (aspeed,ast2600-sdram-edac): compatible: ['aspeed,ast2600-sdram-edac', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/edac/aspeed,ast2400-sdram-edac.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
