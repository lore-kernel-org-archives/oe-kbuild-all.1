Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3512EBE3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 04:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718340999; cv=none; b=GwqR0UKFb88cBMaVmAjIbG5tweResRUB//WMYy8RFVK5mXQWZZyay1Lg0R+qcaKA52Ukgp9apufPD7PBEHq9nAffYtBuzPuSBqgZhl5aDrUjuynd/RR3mPbIFP+2mvxDGuX0J4trDVS9dzYsB47yLXBTm71vthl/fuXy/BEywgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718340999; c=relaxed/simple;
	bh=IN00olVLzu5Rhvobf9IIrbCynlmQ6aHy8LkczeGsmkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAtmZcGkCC1i7gEcM/1aklQTZancVPR+ZbkXv5XCUDiuCmCdXA619LsvgPGhlbbOoD+t9Bf/c/4Sv/qzmApvqU48ixamFobCJE9isXkR9KpqItdrX8NTddSE3D5H9JeeTPJ6hRu7/0oiNGmi7fnMYV2+OQXxW5UQs8I8BYCaGd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bp8d7T8p; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bp8d7T8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718340998; x=1749876998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IN00olVLzu5Rhvobf9IIrbCynlmQ6aHy8LkczeGsmkg=;
  b=bp8d7T8piDx51KBYuQlozUcoppl1rt6Yw/zPRS5gG//VTTlTQrKqpwTg
   qpyytvA1ConTdyZKaeQ0hDSNoEc+p0mZhgUKvbMVq/csP52sOV368K6Kj
   fb5AY+2i32YYDA9V80sgwg5eQa/7Qc2XdiMQGdbjSUKUZnxI9hgzPx69c
   wEarUROLzjKp+UR5YbkzY4LAy5mGe8SpHqBMlKrUwmIh9Ayhc5uU/EnBA
   P8/lsqcr+dv8rQJQQZCELU+1yEyqAakQsy5nzLPZOjpaP7Q1EGj4zCPng
   ysxGSp0b5+eKuJCV7O6VoquoHwxJM/2lYLW5AddIZaVGzWwh7u1/+bBB9
   A==;
X-CSE-ConnectionGUID: uBtoSxLbTLqHiMHnQqM5bg==
X-CSE-MsgGUID: 73kjamdxR8e2FKLX/z4SDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26329100"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="26329100"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 21:56:38 -0700
X-CSE-ConnectionGUID: Of6X6C4DQiabhg0fA4iBfw==
X-CSE-MsgGUID: CzvpUti9TE2FyudtAI1thg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="44811795"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2024 21:56:36 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHyzJ-0000pw-2g;
	Fri, 14 Jun 2024 04:56:33 +0000
Date: Fri, 14 Jun 2024 12:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 28/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning
 (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202406141205.WSNvzTRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: 53e390e1de685ddefa4ec9a40a60b0a1d1795b9c [28/91] ODROID-N2: arm64/dts: update device tree after v5.13
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240614/202406141205.WSNvzTRP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141205.WSNvzTRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141205.WSNvzTRP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1731.28-2003.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property

vim +154 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi

   151	
   152	&cpu_thermal {
   153		trips {
 > 154			fan_0: trip-point@0 {
   155				temperature = <65000>;
   156				hysteresis = <5000>;
   157				type = "active";
   158			};
   159			fan_1: trip-point@1 {
   160				temperature = <75000>;
   161				hysteresis = <5000>;
   162				type = "active";
   163			};
   164		};
   165		cooling-maps {
   166			fan_cooling_map0 {
   167				trip = <&fan_0>;
   168				cooling-device = <&pwmfan THERMAL_NO_LIMIT 2>;
   169			};
   170			fan_cooling_map1 {
   171				trip = <&fan_1>;
   172				cooling-device = <&pwmfan 2 THERMAL_NO_LIMIT>;
   173			};
   174		};
   175	};
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
