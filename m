Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792401F4CBB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753335397; cv=none; b=Gce0RT6PDuuobAKxRcMpFsUlba+1uEqwm9URDhmb1yeAtNspAasGrfM0c8dpI+BOFNr7KI6wwLS26GrL9OkrormqHmj+IiDFZaXKAd1AW0x28sRyeS67n1NsHUOaHDJa+UgOHt1UA+bbgMYe99lPoXNP627ubBcdQGt/3kCjEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753335397; c=relaxed/simple;
	bh=QLNZcaKT9N7/5KbeDkuZ/X5746wd8safktQilu5hlas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tHMBlotgirQBFkd4pCg4owPTF+AszpK0qPri4DZ8zOOCpA33UbS2ryqKv/Jn3wd7o5vMB6LByfwimQIqSEc3v/RaQ/o2cg0+hQGmSoceCdBqxwuEBPtdqEAnF37gm1sseNmqfncHgOO7hQxt/NWnjISg7M3QskQ/0pgzOjl7BzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gp2V2pdw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gp2V2pdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753335396; x=1784871396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QLNZcaKT9N7/5KbeDkuZ/X5746wd8safktQilu5hlas=;
  b=Gp2V2pdwZJC2KYUrR0G7I2JKy3xk7XWivBXfoOfg5c0ltW03HX8sUDGE
   UucYRxqCfoCCPBoGPkNGM/Lnb/3mWW3O/tb66y3vCelg104tNtBdW/J0e
   Pw87OqEIFZB4vrcyX+Ejf2KsUA33xlWgn09MQaWdBlTD0aHWmDVtyqyc5
   7oWd0NNhj7IOV2Sg3tRB7KNr7BKYd6R0x9u476walYxifefqWUmP6LZbX
   XsDYC5eRzH47atMtgGuboH5asH1iJn77LeL3dgyC7lHimoWmb53ot4/Nh
   z9m4uUSYbgNWrtXgJKx0n24t6u0OKxmYJktWFYtH4NIPtulLbHOq7Np/L
   g==;
X-CSE-ConnectionGUID: tuypFZ2CTeatG0/PvU/Hqg==
X-CSE-MsgGUID: O1k9/aCDRQWqF2gAP8KU5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73211237"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="73211237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 22:36:35 -0700
X-CSE-ConnectionGUID: lKuYhx6jQ46s0uG4jA6Nig==
X-CSE-MsgGUID: 2gSndxEdQM6WwC5D5hWLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="164487777"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2025 22:36:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueod5-000K7A-2D;
	Thu, 24 Jul 2025 05:36:31 +0000
Date: Thu, 24 Jul 2025 13:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 28/44]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: thermal-zones:
 cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not
 match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
Message-ID: <202507241301.rQbagWK3-lkp@intel.com>
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
config: arm64-randconfig-052-20250722 (https://download.01.org/0day-ci/archive/20250724/202507241301.rQbagWK3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241301.rQbagWK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241301.rQbagWK3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: audio-controller@32000 (amlogic,t9015): 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,t9015.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: pwmgpio (pwm-gpio): 'pwm-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: pwmgpio (pwm-gpio): $nodename:0: 'pwmgpio' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: pwmgpio (pwm-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2l.dtb: pwm-fan (pwm-fan): 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
