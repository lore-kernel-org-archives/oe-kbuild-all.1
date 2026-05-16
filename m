Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE2F3E3159
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778944238; cv=none; b=hQgxlYHy7CH1d2/7dMhLTZp3e5PfhSkg9KWikNiqCyy500mTlLhfYrj5jZPi8O8AmXf95XoayFhgltvUhHpJ7p5Ikr7e93rpjFaQEWtPtZeKTYMNExhxDc6Ia1I+B89E0uU4snET3UpGAI39JZsPCeVYGLLvXl4nTZ02FCR9Mxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778944238; c=relaxed/simple;
	bh=5tTm+tJaVwUI2B0Elwxx5Y9IUHHOj7VrIE6hvYMl8TQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hNbV3pky3aZD+V403TG1EyHPoSM48IzAlji4T5DWax2TDfZbM4F84lUoho+amOV1uKWVZH0B25+GSU+Vto1QKVlYQ1N5JZOcrs8MoKSGFOyHOllUIsaqN7xtNuXZXm3GgmNqiLKK6dc0JnglzPRqp9T1o2NIYWJ/gl3FYN1Hffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTQZrP1r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTQZrP1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778944233; x=1810480233;
  h=date:from:to:cc:subject:message-id;
  bh=5tTm+tJaVwUI2B0Elwxx5Y9IUHHOj7VrIE6hvYMl8TQ=;
  b=FTQZrP1rnCgC1hzP8xmVFNWQurNG9uEOt2rEmZbJKbWnXdYG3kWQ29M4
   LPbZ1d0zOJeLSd5aD7e5HBvTEe0KhecyOJMTgIyW6oJgghihQLknloYeo
   vnN7mMX8xVMJgND1xU7iVXJsrG5otbi1qCVs3kYmQNw2vkrDjwtTAq0Qi
   y469yyVXPpsArdRbmc7GA6r6F+NxLiZipyjmDgAEtSS6LgQ93KsjIO+XO
   HVejIK/cJYoLB+sEsLrg0DA6ff6eCwr1sjcdhB3ZA5SWNTgRaz6Te26CD
   fNG8GmUZcTZOboUmVz+uXMOzU3G2a41wy4aCTJcHjn22c4r2vbpQvG5fw
   g==;
X-CSE-ConnectionGUID: jUFcYL/qTO+tcLOh060NVw==
X-CSE-MsgGUID: Jt2wTPEAQzy8x80U+ckWSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79902083"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79902083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 08:10:31 -0700
X-CSE-ConnectionGUID: xMHtnn9RSpOoYx1Y0HcMUQ==
X-CSE-MsgGUID: Awi7jj3WT3GYFyk31iS5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="234533176"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2026 08:10:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOGep-000000009LR-36rJ;
	Sat, 16 May 2026 15:10:27 +0000
Date: Sat, 16 May 2026 17:10:23 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 2642/4394]
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: memory-controller@70019000
 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
Message-ID: <202605161703.K4NC7zn5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: b0822a883408f32d494ce9cdc26f4266774cf3f1 [2642/4394] dt-bindings: memory: Document Tegra114 Memory Controller
config: arm-randconfig-2051-20260515 (https://download.01.org/0day-ci/archive/20260516/202605161703.K4NC7zn5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161703.K4NC7zn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161703.K4NC7zn5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/palmas_clk32kg@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: memory-controller@70019000 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /external-memory-controller@7001b000: failed to match any schema with compatible: ['nvidia,tegra114-emc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:14: 'IN1N' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps51632@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65090@48: failed to match any schema with compatible: ['ti,tps65090']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: memory-controller@70019000 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /external-memory-controller@7001b000: failed to match any schema with compatible: ['nvidia,tegra114-emc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: actmon@6000c800 (nvidia,tegra114-actmon): 'operating-points-v2' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/regulator@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: memory-controller@70019000 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /external-memory-controller@7001b000: failed to match any schema with compatible: ['nvidia,tegra114-emc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: actmon@6000c800 (nvidia,tegra114-actmon): 'interconnect-names' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: actmon@6000c800 (nvidia,tegra114-actmon): 'operating-points-v2' is a required property
   	from schema $id: http://devicetree.org/schemas/devfreq/nvidia,tegra30-actmon.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: memory-controller@70019000 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /external-memory-controller@7001b000: failed to match any schema with compatible: ['nvidia,tegra114-emc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
