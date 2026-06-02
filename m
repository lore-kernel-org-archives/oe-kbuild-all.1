Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE03DB33E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400254; cv=none; b=SA8MfjvRYELpmqp6hbEwzzNO0Jk5b3qmaxx6hBP2cOS4zrTKu+bwxzacw9NZl+JB7E2x/mh9l5+2xAV/x8hM4JS92GMJIYqJ5U5l9+c7xT531hApfZPO2z0Kyoif9FfUZVAFlHJQQDQYK/LCtBLbLfyYLzf+N9qRN2GtfHjZEkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400254; c=relaxed/simple;
	bh=JAiYNOL15eaqMwDz8eVvF0SzShfqh5VXDmhM7fb/PB0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=poo94Ld1kRTVUEP7nbtz+pIM1+Xk99BxGSGajMoWl/6d5XnFvvMXZonPMFERZL/vwpB2kKyQ9/wLtiRFmjMl9BzZYU32XvIVDp0PUsRZw0IK3Qy7i2PpXlTF9hR+qCZkRfFaeYBRqdpTS7d0NSnQVakZiXhvZoreFYqWPrNAC8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5RvVFBf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5RvVFBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780400250; x=1811936250;
  h=date:from:to:cc:subject:message-id;
  bh=JAiYNOL15eaqMwDz8eVvF0SzShfqh5VXDmhM7fb/PB0=;
  b=m5RvVFBfs4eeAChEGeuaJkOZDAcDtSIQ3GCKrhah7hXGztZIzClOyh3b
   3Xp3RD6Xvyk1g6eGgf0jkCTI0bZmBThVCTENfZ981pNWPy7izyrOlSF6G
   YjjbnC1TnLOiwF83c/+SISIs4bOBjMSk4wzd9sHc4WGrcw4WvFzqd5kMj
   AxRgUOlWTtY54B/tAvMpP4BVO2JNCl+U2MGGTaY/K28lsGr0H138OGepU
   fVeVdMqRVXyU8dPdFMCqTg760XdY/XOCde6t0kb9V4Fj4GcJoB7ZHa2nK
   4CysYx5V7Xe4itzH0FulXNAwHr3b+qfHxQOVHnPXeWodf3nsJTko5RrqM
   g==;
X-CSE-ConnectionGUID: l6AL/fd+TAu29+Zptqq8JA==
X-CSE-MsgGUID: lhuH5FjeQTi6QY/rPR6ctA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106628057"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="106628057"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 04:37:30 -0700
X-CSE-ConnectionGUID: vUn6qsf2QzicO1CEe1PiNQ==
X-CSE-MsgGUID: rr1twCDRRG24moCDxnvyow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="242861680"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 02 Jun 2026 04:37:27 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUNQy-000000001nJ-3HbR;
	Tue, 02 Jun 2026 11:37:24 +0000
Date: Tue, 02 Jun 2026 13:37:12 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 8705/9733]
 arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: front-camera@48
 (aptina,mi1040): 'orientation' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202606021311.Poj3uf3S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08484c504b55a98bd100527fbe10a3caf55ff3ff
commit: 34d89435081d07b052dd522a57054132dada5400 [8705/9733] ARM: tegra: transformer: Add support for front camera
config: arm-randconfig-2052-20260531 (https://download.01.org/0day-ci/archive/20260602/202606021311.Poj3uf3S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021311.Poj3uf3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021311.Poj3uf3S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:54.22-60.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1224.15-1236.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
