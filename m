Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF716DDAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 05:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757828022; cv=none; b=RsiQ/eP9pAVUIYaBvA4fcN6LTGU1ZRYr8SyPEBOalQARGqjx6Owfr0BYYEVKueYxdX32rm1GG5DIG1a5TPA5K0IDSirMpbMcZtRCQrhYU5QXKRDFBnL/0xj2SqeOSOJdVP5sijow/AWqDVJORgpEavff54JYwN1qDPHDOqIo8WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757828022; c=relaxed/simple;
	bh=zeWncE4XdOt6craCJUJ8DqCceQkBjhV5LwqHOLiUsCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfoZkj/ZjaE05Ey6SmYjE+cdC5Vz7pyxtwutnx0wkeDLDNlpIRCdoVufhGCtmOLSOl4Yi4rrGvSVPOGmwVkfhJpl6J2PMtph3flq4ElDVlz9aaMFtCc720cw8DppoovJsWsePP/tZvHz28nmwXCgxJZ3rKvn4YM2uDXgVzq83DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5ey8QNZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5ey8QNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757828020; x=1789364020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zeWncE4XdOt6craCJUJ8DqCceQkBjhV5LwqHOLiUsCw=;
  b=S5ey8QNZR6FXdLc3w3DV4K8SFj6RdZh7HrcndglNM8om6b2mrO/vs14Z
   Fep/EM+meUlyWmmT04bF2cTyvpR8R7QDBlXM1i7eNcfN/IBMsE+x5A+dE
   Pm/0toCn7i9JF07eMvjToBjEVnKtPSPLFP612nFnm7XwdJGeeupsylcmv
   04R7IAzCZW+D4UlVbBQ+9YhBlU3mTo9KAdM7LiVPjtqpCPSeg4krYnR2X
   2gHUfrWrF4zFnk/mPvIcuGdgGdeMHj14zIYWp6XD4G27fUQKvAazul3RV
   +iIVfKSTha18ivJ/D+t/2MOhz8VXpxMCMi6PAbXFicHhFksURZpsGLjPd
   w==;
X-CSE-ConnectionGUID: VmWftEhETG2ST6k9pmWuvw==
X-CSE-MsgGUID: cb3lgt37SZKL4Gpkz32jGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="71486282"
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="71486282"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 22:33:39 -0700
X-CSE-ConnectionGUID: YM7YybH4R8ef0K/oxfONhQ==
X-CSE-MsgGUID: haQ62CpDSpCRvDk0M6M3vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="173927070"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 13 Sep 2025 22:33:38 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxfMl-000000001m5-2Kcn;
	Sun, 14 Sep 2025 05:33:35 +0000
Date: Sun, 14 Sep 2025 07:33:15 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [linux-next:master 8405/8719]
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /clock@70110000: failed
 to match any schema with compatible: ['nvidia,tegra114-dfll']
Message-ID: <202509140752.zI53xvue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: 93ff9ffaf3434a236d5450d8a29af1433b48a049 [8405/8719] ARM: tegra: Add DFLL clock support for Tegra114
config: arm-randconfig-2051-20250912 (https://download.01.org/0day-ci/archive/20250914/202509140752.zI53xvue-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140752.zI53xvue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509140752.zI53xvue-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/palmas_clk32kg@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:14: 'IN1N' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:17: 'Int Mic' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:19: 'Int Mic' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
--
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65090@48: failed to match any schema with compatible: ['ti,tps65090']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra114-apbdma']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/regulator@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra114-apbdma']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
