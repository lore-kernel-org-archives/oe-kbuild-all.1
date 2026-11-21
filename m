Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795238460;
	b=mFQhW3w+spOyIL/OiruCFYZSBBj7LL7i5+FdccecUlZWgr0v5YhEgLbnurt3mBA0K4kP
	 bG69oMRkslMkQY8TDfefhUlz8itIc5jpNH6vJ8GVx7VXE0gGaDs9s0Wjr6kMJNVyGZdn4
	 ulMo9xE35BQe2dp/4mp2vfvG3HJmDPaZA1l2jo2plXFSfW5zvIZvkVeDBbmioQx3ViEpo
	 AIQvDMofnZ7B3kuz1NYHHn3YjLrnsF6FYceWk4jCHUVbneu9nsi+KZ9E3c7K0wczJc/l6
	 iccSXZbe9MZrEoadpdLWElw0LQst4wud1nrym/uuOLIQfL07GUWzwmo7VNPq0oNnhuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795238460;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CIRChgMYzAHo24+xk4Sfg/RAUZ0Twowwn/H8c6Tvc8I=;
	b=WHiXw3A7rZBNmSyT5fEpMPsGbhpVU16E0z7VjQ0Bb2Uy3kszOl3tGPj8NKeeZTgqxzr8
	 UCk9TKoXYhvLOQ1rclI0rbZIhNJT29E98LjqlxLDKW2XNkiJgcLCvxO2PkZiUpA3ndjtl
	 2tKjCsj9+fHnCycRd09kenxY0/9OtURNKm5A4hAlWrLqNzBAP8RXn5WPbkQlKgiOx4gXC
	 CoFosLVxVAGN7slltM4kl0lcFEmCvgOy4L6IZMJRbrCyYRKNYX+APR5Yrh6Km8MDOXBiB
	 FpW1gH1bSDgnND21/5eFJkpOAnv4RxobxF+77uASlrldA5rEyq4fRTlskDM6NKAT08A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iMmBzo8A;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFD0606A693
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 05:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AFD0606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iMmBzo8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795238458; x=1826774458;
  h=date:from:to:cc:subject:message-id;
  bh=y7nkQXjm43uLQhyToh42gLU8KhffxdreXt/JfXJIcuk=;
  b=iMmBzo8AgZTqWsnoNj+Xc8H3Q0ZCAqMOncKqeR6++j0VEe9sVX3uQ3ao
   WyY0PqbOz0Ko8xyEgFvAXqnCv8h7ovDl5IneJrnxoWA7vGrQgg0jGDNOZ
   xg0gmwis4KFoAbmwQWBnAdzVFbrs82JqiRhvuaxqRHyCtkIQLax8d3BEa
   p2PKRk+T8IFPxTR5jZIxLB2voZ/udQCN+KZ1bObupCO8VdUkYCAGzAFbj
   9mwO26NlHgJwD4nUWVXjyn4weOJt3qQFQDkoZ/m7Yu83uAK6HXbJjjK/H
   rzD14JticYG65jFpR9onykATVpE4oMXH/iKFRqdBXfAK3+X7weg/NVHkQ
   Q==;
X-CSE-ConnectionGUID: uINDaqvxQ3y8ZtxxAk1bnw==
X-CSE-MsgGUID: Ts1rXALESBWcg30wLgmVtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4029114"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4029114"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 21:20:58 -0800
X-CSE-ConnectionGUID: qNNHjOPCS/q4jX711Fz62Q==
X-CSE-MsgGUID: wRZdOE4yRcaSLcaPRe9FUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10654482"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2026 21:20:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUdWu-000000004FB-4ANS;
	Sat, 21 Nov 2026 05:20:52 +0000
Date: Sat, 21 Nov 2026 06:20:02 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm/boot/dts/marvell/armada-388-helios4.dtb: bm@c8000
 (marvell,armada-380-neta-bm): internal-mem: b'\x00\x00\x00\x17' is not of
 type 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <20261121061744.Dcxj62n4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 257e65f326d6d2ef1511d4262763bd65d1f6fe5f [152/152] ARM: dts: helios4: add SATA regulator supplies
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121061744.Dcxj62n4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121061744.Dcxj62n4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121061744.Dcxj62n4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: ethernet-phy@0: marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x10\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/crypto@90000: failed to match any schema with compatible: ['marvell,armada-38x-crypto']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: crypto@90000 (marvell,armada-38x-crypto): marvell,crypto-srams: b'\x00\x00\x00\x14\x00\x00\x00\x15' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: crypto@90000 (marvell,armada-38x-crypto): marvell,crypto-sram-size: b'\x00\x00\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
>> arch/arm/boot/dts/marvell/armada-388-helios4.dtb: bm@c8000 (marvell,armada-380-neta-bm): internal-mem: b'\x00\x00\x00\x17' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
