Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9D24718C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076324; cv=none; b=rrJwuPFVvQlYCj9WOIeD/SdTuYkm8YVhfGCjI9hu8ohpNDTqiAyrz4u0ZWzeZHAxtIe0qPSeEyC3nKIahLc3ZjK+cFY9DPPw0Ox+zfC2LDUC3gL/LrohLZPWhrC8k+BShvS136BqLb5BVurTJU4La+bKQi36F6nygkSzewG3/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076324; c=relaxed/simple;
	bh=YpLmG96tqFyW7jEmUT/zLpNmnOj1PKrqaC1BRDgfBzc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=riV0sVivLj1bxOT2YhY0ppACy6aWnho0X/RWHK0LvlGVW1YUrWba5oZ3NlDeuw7TVbImegRvdvI8ROntK0Tw/DE0ysM6jZDlf7IAZj9P+GF708MKadGFScXWJ0IejqWQnY6v58So8PScX8DgS9kvrOs0cVq6Z0BFff1ZZxT/1i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4Pbuz/s; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4Pbuz/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789076323; x=1820612323;
  h=date:from:to:cc:subject:message-id;
  bh=YpLmG96tqFyW7jEmUT/zLpNmnOj1PKrqaC1BRDgfBzc=;
  b=R4Pbuz/sin0Ezbp9FtKqxKMaU5XfUsyjGcutOASFPjrNcEO0i8WEzdqT
   2CjMvWktLPOqJO+YDiJpIWgqniUccwaaZEpp0P9saSYYWGY8d0RGltT1G
   ivKAOzucgCr5DDVte+79bIQy9WMUiGaAgweA16LcTi91QCNMVZCbAPXjh
   ZnWtxFUnPZ3mAmHmdC0S1M18tqiBhnj7+IbSOBNPTMnWm/solPatnObZx
   0W02YO2RNpHmbF3XRuTkdH7YhO85FPT05KaXs2KqJHE3/U1ocjy201A1c
   fOPcI9H/hCWWAf6tcz6OFedHSQ7qUqjjeoKqq+EFe9C+4leOp88MMA3XC
   g==;
X-CSE-ConnectionGUID: j2j1q85lQkOxPJmuUaxCtQ==
X-CSE-MsgGUID: 5h26sxVnTlS96iCnxi4Q9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115081592"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="115081592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 14:38:42 -0700
X-CSE-ConnectionGUID: xrOVRPAPSxC3eflh4miOBQ==
X-CSE-MsgGUID: WxMjGM/ATD+jXMtFdvyKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="270379519"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 14:38:41 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4mTe-000000000V9-0jT8;
	Thu, 10 Sep 2026 21:38:38 +0000
Date: Thu, 10 Sep 2026 23:37:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 2/2]
 arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c
 (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller',
 'interrupts', 'pinmux', 'regulators' do not match any of the regexes:
 '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
Message-ID: <202609102306.Cn8meS00-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   970175856dfcf73ea364900557b6ad669018a4f1
commit: f03a7f20b23c1abb1066f791806bbca406362324 [2/2] dt-bindings: gpio: Create a trivial GPIO schema
config: arm64-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260910/202609102306.Cn8meS00-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609102306.Cn8meS00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f03a7f20b23c ("dt-bindings: gpio: Create a trivial GPIO schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609102306.Cn8meS00-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pci@1,0: nvidia,num-lanes: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pci@2,0: nvidia,num-lanes: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: fps0: maxim,fps-event-source: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: fps1: maxim,fps-event-source: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: fps1: maxim,device-state-on-disabled-event: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: fps2: maxim,fps-event-source: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pci@1,0: nvidia,num-lanes: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pci@2,0: nvidia,num-lanes: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: fps0: maxim,fps-event-source: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: fps1: maxim,fps-event-source: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: fps1: maxim,device-state-on-disabled-event: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: fps2: maxim,fps-event-source: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pci@1,0: nvidia,num-lanes: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pci@2,0: nvidia,num-lanes: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: fps0: maxim,fps-event-source: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: fps1: maxim,fps-event-source: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: fps2: maxim,fps-event-source: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: gpio1: maxim,active-fps-source: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
