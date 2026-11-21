Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302146;
	b=35pOP66wbIP+JB+hKfBhf8TVikQJPyMsHfamu8PB4yCmQO9xCKBGArXDMY+dsi5kojGM
	 6QXz7j3IYrj/u+mBSxJ8USjZvnEI77a9QndkGKO++b5TWzJ5+ye2fk45gQIZwVNXRIDag
	 M/VOxFZtwapVBFF7uG5XLMMtH36f1QMrQ+yUu+YHWgEg3eSu+8LjRcHh10gD0XjqboBrn
	 V0WNQIThWSXlDzxp7xAhmYJp8o5Rivt/9ZEmkhsKHJW7SLLAJOzH7ipoGLtnmv6MuTVY1
	 RazGg+BotSo+qLaE69lZfje9qwmuESwV/FlMQOFHCaqR5EVc/BkPVptEb8+Cwxoe+Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302146;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5uIX+0gRWTExMkr/UrYhaBwlxmVqMuK+dTgsV0qYpwM=;
	b=ZYKkd6QzVWaiKHZ0sBZ7VfGx+i326LNZKHUhN4O1FFwWPsXUREKj+1PzB5bbO8UZfvW9
	 92Imj/dxdlK9Qp82DwAqCoIGifCi2+EFbCe5LifXn1g2hzdL9j3XYzYvymdKE7W3QdR6z
	 zfdwMZ05Ert9hlZh2zIJWcnPSrk/c4kxL4hnnBn7hLia2Z0DPBRwZX+MsRTjNSQERob5z
	 7zNUYF2wvomLyzx8/bMGQJKrEEjM1AwYU8zhmmYhumx1qShTWXizJ1YvNBXu5aRmHf4AV
	 RmeCLlI0dOc8sn8n82VJWeg+ZuoRC2Z3Fjv35/wIwKesfB9/DhfpfHAmmyoqFoNVSfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GpiGZFvC;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7AC606A32A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 23:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7AC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GpiGZFvC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302146; x=1826838146;
  h=date:from:to:cc:subject:message-id;
  bh=HyRQkoKmUQ+EfhybbyakAoyRNlHjf+EtrcbYf3Zk2XU=;
  b=GpiGZFvCdTGtoGdAqwTdc0cZujJM3Y9okX/COGVVCFnweFcfhed+5V6+
   jIqkJylRMRi8YcV+ZGVKDCfFxOzvniXbGcEG8k92w2o8NrXlSZqkS30cJ
   IiBvKGccZPNPDq3M9P52ZC9mBbLaD3OwOa2uA9fbUPDqg8ekgXPIcE001
   dyiqycfGdXNvbaCnAN986q0/I2lMIuFGxTrHUpVe8uMyUhPfBvc8aM37A
   a2UPm100GcUZftRpguMmhFx6yap0BUFXJlLhrFLX4VO/+6U4M6VMZXUsd
   gHLnPJcFGtss+LIYbxQ1/i43lLmfq9cjvScoNOTRVeRrqebx6MqUGoNuk
   w==;
X-CSE-ConnectionGUID: nWZuU2rdRRWxHp8RZ7TChw==
X-CSE-MsgGUID: 1PJJ+IyGQRGjv5xnQlIasQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4190376"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4190376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:02:25 -0800
X-CSE-ConnectionGUID: Jc6f2hECSgeOWDmZorvtvg==
X-CSE-MsgGUID: CAZRLI9nTLCYVAnNkZWBkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11242522"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2026 15:02:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUu6A-000000004OD-15dX;
	Sat, 21 Nov 2026 23:02:22 +0000
Date: Sun, 22 Nov 2026 00:01:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm/boot/dts/marvell/armada-388-helios4.dtb: bm@c8000
 (marvell,armada-380-neta-bm): internal-mem: b'\x00\x00\x00\x17' is not of
 type 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <20261121235348.YsnpxnXq-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121235348.YsnpxnXq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121235348.YsnpxnXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121235348.YsnpxnXq-lkp@intel.com/

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
