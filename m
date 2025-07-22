Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CBB27A92E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753202537; cv=none; b=XhVAotX3ClOZkAefdjxI7d5/oq09UzbS6CvjdUtLW4ELKJ+VzN/2bJc7HmMEKv6MSn2t11UFSV+7/a5OFr3tmLVAV4myzXSJ8gzBytjOAUde2MwTqtVaGofNKDFZL6pbmPoP2y+uJyXl6So6O+njoDtl10iWQMiaDJrMnM+XUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753202537; c=relaxed/simple;
	bh=MP0OHD+YSJpnpZC5ER8guxfx4YEOGSDgmA0nKxaDcAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHYnZw7MIrd4zaKIsE4DC8iRpp023bcHjaF8o+bH2Dr6nFOc9s/nUa37TNFIr7V/SxPFQ1nCP/peTOUGRBHRbeVsMYGx20ob7GaRtmAU9lrOPlXpjQwKaisNj76Ud7qSOgdHOdcM3JWxEp80q7H/NEZZw+em1ch2JVzwmnvpuRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ei0cKr9Y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ei0cKr9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753202535; x=1784738535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MP0OHD+YSJpnpZC5ER8guxfx4YEOGSDgmA0nKxaDcAw=;
  b=ei0cKr9Ym2s9HeiWYfxC3z7mmqqP+Sn2/u09w4pf5EUPr2J/2mg7tQHa
   oUDIm7W1euV1rS4NeEOaKMFLUYX+PJUzrI1j39elj/mxCzmCC8hvPlJc5
   5KURofy5jOcTNDg5xmA+d/IaE7zsFA6iwcaI1Q1WpdL1IEKoAJocuxvzl
   np7yl/vh/T8Krrtzz0GXT5nD9iTYtGg6++0camqyqeigPJys79tNZCqEK
   CMiugj16v0tsVGCQkAookTdc3GinbRlBqCmX9cHHZ0WY5aIcaMTPXNS1s
   o1lcetTwDwlaqj4MSw/O8vehk5wwKo8Wc/FMi0wxWMaR+zolIL9isRP2m
   g==;
X-CSE-ConnectionGUID: VzdKW//4SmuY5Gx+jMp/Ig==
X-CSE-MsgGUID: /wjFK8HwSj2MqQU+3rI8ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="80908542"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="80908542"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 09:42:12 -0700
X-CSE-ConnectionGUID: JQpAKrr7T9yFs3YdOTFFOg==
X-CSE-MsgGUID: AO+hmTiUTemAgaAf/Imv5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="182906791"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jul 2025 09:42:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueG49-000IXl-0h;
	Tue, 22 Jul 2025 16:42:09 +0000
Date: Wed, 23 Jul 2025 00:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 18/44]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones:
 cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the
 regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', '^pinctrl-[0-9]+$'
Message-ID: <202507230014.dB7ISF3K-lkp@intel.com>
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
commit: 1933aeb9738c3ef10a62c3f9da64e4bd76afcf8c [18/44] ODROID-N2: arm64/dts: update device tree after v5.13
config: arm64-randconfig-051-20250722 (https://download.01.org/0day-ci/archive/20250723/202507230014.dB7ISF3K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230014.dB7ISF3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230014.dB7ISF3K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwmgpio (pwm-gpio): 'pwm-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwmgpio (pwm-gpio): $nodename:0: 'pwmgpio' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwmgpio (pwm-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwm-fan (pwm-fan): 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwmgpio (pwm-gpio): 'pwm-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwmgpio (pwm-gpio): $nodename:0: 'pwmgpio' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwmgpio (pwm-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwm-fan (pwm-fan): 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
