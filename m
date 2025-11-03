Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA5F34D3A5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762199406; cv=none; b=ZC7wh0r0q3APo93X7UfT8Ra3exv2WmqsdgdUFVpurO7o9SlKc+l6Sygqqno3SVKilsgymCl5ZanYbkL38gMbGn2Bzc4SR3XYk/i4EOQCt7G32dpUW5nf7pomfBSvbTLOXPZPPduTHsqlnh9NnPp2bKrGj+LtCjVkA2bC0t3kcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762199406; c=relaxed/simple;
	bh=3qH1HYp2oFVPAb2bAamOkSV+Qu29lCIUq9LGPDIKbVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K0aQTxL5o2sTwRXFK+KvO9cHAcxHfoMt9Ic9F0sG1TBNSYJAA4j+E6gMUEdpvbhc7nZ91S7bBYAU7SDaYHrkPKF/Kpr2YSwjdyGjuYkZBn4dwK1W02m6sLX6q1lq/Y10G9vrMy93BpM40qFpEp7KkHUy0NzEg6eAQjDl7UkCa4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U90V6RIl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U90V6RIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762199405; x=1793735405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qH1HYp2oFVPAb2bAamOkSV+Qu29lCIUq9LGPDIKbVE=;
  b=U90V6RIlPu4JIQu9/D0gaOe0h2TWUqIHvyZ1KYbzHkv3S0K6FoIh5DRg
   0qj0roFtN1l02O3ROxv8aQpeIWTdJuTG4/yDH6CGKXUIExNr0VtZWWkn7
   JfMKUVx2IOy9pQJtCMOAKwfhK/+X0EqBMgp3bV55zZ4EPzYM8h/qaDhVF
   /1oC1OXMV5phsP+Ki5cPJ+mS2/FEJhlR4O/tBiBJJRtoQKp/a6UDWcfSS
   Lqt3/QOSbE2LwzXIP6LmCSt0aAglqjwiLiz52h9Tp6k1G9daLQWYMtCfV
   pLk5IGQzk2IjEcGC2tqyZoIHdLlHQTRYs/QveL8WZkbZBMFWIfNIZ9Z3D
   Q==;
X-CSE-ConnectionGUID: jNsVtZ6aSh2VniWP5EGwHQ==
X-CSE-MsgGUID: E5zkoFy3TrKjCW/vmcwBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63487283"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="63487283"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 11:50:04 -0800
X-CSE-ConnectionGUID: I7ZAoI8mSdquEUEvEHxLZw==
X-CSE-MsgGUID: p5f+to0rQ8WFB1osdpR2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="186641517"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2025 11:50:03 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vG0Yy-000000001qO-1tB2;
	Mon, 03 Nov 2025 19:50:00 +0000
Date: Mon, 3 Nov 2025 20:49:16 +0100
From: kernel test robot <lkp@intel.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 4718/5674]
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /pcie@1003000: failed to
 match any schema with compatible: ['nvidia,tegra210-pcie']
Message-ID: <202511032052.B2wFAR0w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9823120909776bbca58a3c55ef1f27d49283c1f3
commit: ba97758a63b78f7e494ebdfb74ba8a8af702a33a [4718/5674] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
config: arm64-randconfig-2052-20251101 (https://download.01.org/0day-ci/archive/20251103/202511032052.B2wFAR0w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511032052.B2wFAR0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511032052.B2wFAR0w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /usb-phy@7d004000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: cpu@0 (arm,cortex-a57): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: cpu@0 (arm,cortex-a57): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: thermal-zones: mem-thermal:cooling-maps: 'dram-active', 'dram-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
