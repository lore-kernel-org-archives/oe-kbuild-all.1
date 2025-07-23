Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C97F27874A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 07:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257422; cv=none; b=oXCJLBC9kzWIz3KqqLnjbkq6Lt+zSvZ3ZjClT+xBaxDxxd7IGEVFDBZbKnIPhrgqRjPz3hez0LhLxQVNh4sD5XxBIt8egHE+glgrv9GileLBSv9dQpS+XLk0ZomnDxcrjSJDDDTQbXRd2EGICg+YwY3T8r+uRcNjKjzIxecPyvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257422; c=relaxed/simple;
	bh=gKAK9PnHfKE3ql3RVAZ70WDL8mw2AqSN8FvQYTedd6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HvoGRwUFmClHU+cyH80qD1rHMGue9uzBAD3axVTiwuOE5wVlJaG5YTRZQFlTumD8DtmRvtHf4BC19rq3Jmmf7qxhILYgDajSGlX8YakWjor/gvRC/hbLXDF2GdBTBTLXLclojkJDNJD6Rlg+IBEvMOdaCt55ymMoIMeQrNrTjHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBxV9vdZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBxV9vdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753257420; x=1784793420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKAK9PnHfKE3ql3RVAZ70WDL8mw2AqSN8FvQYTedd6A=;
  b=iBxV9vdZ+5bTBLy/cqNnkpBd67Zp1HM1dYYCTHQrLJig/dt+3H3Jv3oV
   o4bqBCKSQ8ecrzDpfqFfaoAsQiioepGJX4j3djoWqDQzlB3v8LnaXNPA9
   4N6G3yMRNkmYc836xkikj/Jrp3i7nSrRMyEaj/iFflqBwd7qaFbnv8anv
   f94KrQKdReeryVlz3+8UhWCc0GsvsIDw9QY5GLTcvmzkVaiNYgEcxsnPB
   sm7g0Og04BVJo845zgkiUlidPOYimqZg2kPBlj02pCYlrwVX4lKUtGsrC
   IL+paz3XE7LVcqjBwZFqHA6b5LvxPNH9K0dHu79US5aP1I4/Dzq3HBIO2
   Q==;
X-CSE-ConnectionGUID: Un0fpNfcRPCMGAR3DjYbSQ==
X-CSE-MsgGUID: tLbYFxeKSPOJavAOouv52w==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66599596"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66599596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 00:57:00 -0700
X-CSE-ConnectionGUID: ocbrg9ydSrCnBZ9DtHvYNQ==
X-CSE-MsgGUID: ksqDZksGQjW9SbpGcCEXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159417385"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2025 00:56:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueULP-000J6T-2C;
	Wed, 23 Jul 2025 07:56:55 +0000
Date: Wed, 23 Jul 2025 15:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 18/44]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones:
 cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not
 match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
Message-ID: <202507231519.c0q8bNXc-lkp@intel.com>
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
config: arm64-randconfig-052-20250722 (https://download.01.org/0day-ci/archive/20250723/202507231519.c0q8bNXc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231519.c0q8bNXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231519.c0q8bNXc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwmgpio (pwm-gpio): 'pwm-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwmgpio (pwm-gpio): $nodename:0: 'pwmgpio' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwmgpio (pwm-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwm-fan (pwm-fan): 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwmgpio (pwm-gpio): 'pwm-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwmgpio (pwm-gpio): $nodename:0: 'pwmgpio' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwmgpio (pwm-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwm-fan (pwm-fan): 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
