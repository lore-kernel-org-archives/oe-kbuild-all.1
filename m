Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F245D184
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 02:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753238838; cv=none; b=bepk9izMStsnVc09zf6RiaHt4IxHr4s2YBTqd4FHooJwDR88Xas47HvKBLd/XxvKG+I7wMcfG6cWBiWja0nnUZ9taCHSTnRRc+F2rKi/LJhExD2ZmAlFW3xb4gIvL3rtAszKSyQd9DwG3UoU8O9bWu7lDqVwwydloNXK4cqp21c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753238838; c=relaxed/simple;
	bh=jRnsxEmENr7dUJqv4Ikj+m+16hW///1nn7zERfGJWCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RX2/AeM7yQa/+MoEddyESwq7mG+kcjwbFlARtSx5oiYsb2Xn30QjhKyfeKVJz5/TRkqZyu6l7TMebMBvo9RxvSVB0kqedgTQW9h98h/ho9cXE1cTelkmr+f2iHYEKQ6zCwte3NjqmpaU+6X7sdHTCnKra1WYZCLzwpcdLuSkGFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHD/N5mL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHD/N5mL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753238837; x=1784774837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRnsxEmENr7dUJqv4Ikj+m+16hW///1nn7zERfGJWCw=;
  b=IHD/N5mLBwd+UU6E/W/ddeKiFwPVp9WnwRbWocAhe+0vO7Jex31T3YkW
   fqbMWaHdtDh+KRnZAvaSZYkaHs+HwT5+g9ELlvNbXcJc1iyaliiOEJBJK
   S0TPvJk7fmlPUMeGdhYA76+R0bmvHyaz9h0QQdVwRH+wqkp2tXC1XXDn6
   9q15Uvphb/eYih5OswSUTs9qc8AmgM8gKRXwVLT9CiN1z80F4LU5kOxxE
   IKC9YXj8mP1o78A7ZSN/dpsg1LRRVBgV6lca+3bhyAZoVBs0uvfAZZn8s
   LpJVhYRSCkwrUeKQtQ8y1MWlVX4L02QY5oc2zlWHIQNTNhjtmFBethorc
   Q==;
X-CSE-ConnectionGUID: anWk6M8iRCeAndp1WmQiMQ==
X-CSE-MsgGUID: zcK0XzqNQ2qKgQvBbnYwtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66578116"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66578116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 19:47:16 -0700
X-CSE-ConnectionGUID: +HWKI1URRV2NL5g4SZh1wQ==
X-CSE-MsgGUID: LcG2dNpITN+hRLP9Nw+CTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="163580839"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 19:47:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uePVh-000Itn-1T;
	Wed, 23 Jul 2025 02:47:13 +0000
Date: Wed, 23 Jul 2025 10:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 28/44]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: audio-controller@32000
 (amlogic,t9015): 'AVDD-supply' is a required property
Message-ID: <202507231053.5lmG52mn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   ac46a60ec2fb958f1dc2e5871e122abb98ac0da9
commit: 38db07684035e00dc93a47baa501275ec6c905da [28/44] ODROID-N2L: arm64/dts: add 'meson64_odroidn2l.dtb' forks from 'meson-g12b-odroid-n2l.dts'
config: arm64-randconfig-051-20250722 (https://download.01.org/0day-ci/archive/20250723/202507231053.5lmG52mn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231053.5lmG52mn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231053.5lmG52mn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: audio-controller@32000 (amlogic,t9015): 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,t9015.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: pwmgpio (pwm-gpio): 'pwm-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: pwmgpio (pwm-gpio): $nodename:0: 'pwmgpio' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: pwmgpio (pwm-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: pwm-fan (pwm-fan): 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
