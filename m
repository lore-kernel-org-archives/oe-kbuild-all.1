Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BB943147
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772778839; cv=none; b=a4B3HO/3zv+fOgmyDqxzpjPfM34QqjqxANfg/qL9M8DpwQVVrNvuZMQiDt1y4oBaM1r6PKvroNv70hg5DiYmK3Zqn0zZD7ydB1XjeOp9BJ2fXy8a60ZW/kGXnw0cJMGDNAFXqg5x4eL4tqFZGfxuJAc3cku348bNT++c8WQC260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772778839; c=relaxed/simple;
	bh=qhUX/z5O5xuryF70G7xYAlkqe0Av8Vph0pR9Mayrozo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UJZsFTkfUkgPaBOoN7ACPoSuNP+63J00CHrr33UH8uFr+qeBJ2qdWVOEaBRQsLnjJ+UdZdLF0y0k4rH7phj/MNUTb3430pGDknI5EXuFls4oW8uhrjAUmiOCUHiNu/nB9Q7Ug6rGEl4YRV/kBYf83x0RNfySjcbLHmh10uxMyAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gh3j2N75; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gh3j2N75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772778836; x=1804314836;
  h=date:from:to:cc:subject:message-id;
  bh=qhUX/z5O5xuryF70G7xYAlkqe0Av8Vph0pR9Mayrozo=;
  b=Gh3j2N75v71ACR/Y1B4PUsACejP2h/mfRwvNgYE3YdNSRSZbdv6Hf/da
   xO4ikWP+T5LIy9O/E8R+fGU8N43iaVJTZKp6ywxCgE5mNtIbc0/bTxsvh
   eXWY6SBoA7okleNQ0o+dnLLWp7neNXMUmfFLdjCcEFOHhMEVKozuSxUgo
   cuRKDpYZXsY60wReD0Bl3w+dEs/4622/lANfv7tmwd/CDY41Fo6EC4bKM
   HunEu4G77tmoxCPsLEH1/LYbzipMQ5BckvuG4yaSMtAikDIRC8AoL7/Jx
   NvWOEbgcLhuEGBx49uu4h7E3/C9oXU9O/b3Biph4EWzhM6rAd4bX1vm4z
   g==;
X-CSE-ConnectionGUID: prIA0RjkQ4WAljfINLichQ==
X-CSE-MsgGUID: b0jAkbWiR9C0qQ5uCVN7bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73999860"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73999860"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 22:33:55 -0800
X-CSE-ConnectionGUID: nPaN9O69RFyEXni+dzD4ew==
X-CSE-MsgGUID: fwtK+UVrQfWFEQMLWuw5Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="241936710"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2026 22:33:54 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyOky-000000002Cv-18Z6;
	Fri, 06 Mar 2026 06:33:52 +0000
Date: Fri, 06 Mar 2026 07:33:18 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910):
 'interrupt-controller' is a required property
Message-ID: <202603060729.5EUUsEGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1a049bf45613e8f798a4bf4e9cec875eeec1435e
commit: 006aa8f57f55dd5bf68c4ada1e0d3f4e59027d71 [3/3] mfd: dt-bindings: Convert TPS65910 to DT schema
config: arm-randconfig-2051-20260226 (https://download.01.org/0day-ci/archive/20260306/202603060729.5EUUsEGm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060729.5EUUsEGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060729.5EUUsEGm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/dss_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/core_l4_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
