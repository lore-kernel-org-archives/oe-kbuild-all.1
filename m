Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6DC22CBF3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733815458; cv=none; b=Vn4rcCofSFMA/GBi/L5UkLao/5wrpV0IJqel80/m1QlT+2hEJcnM8aETu+oRbVR07QTn8ovtqH4Z0XZPIHALanaFkIxIQgxLibmLBbXU1lVj8HN7aJdqCA0sYmuC4SlvmCcABmt2lq8eItVPjMgKqrNRr/xkv2t6H84ojBVJUXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733815458; c=relaxed/simple;
	bh=ojpbtXLDIjClUX6H2oeIoa0yNWPf2+2tMyfMWJPkEBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzq6rCEhfl2Vy3q7FrpbQkLMb2I6DgGN12Tj7JTRJoMXtrXkaW6iH1xf5oLy0m7CvKDkR1KvzTIjGIDuKTku700ZnODV9dEQxQE6gghwd3BDxeUe1+1Ad837X5mwZmv8CmYicRL1JV3/9V+n8N4+xxGdtrEpKVBPtDwH0bdyFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lt8glGwf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lt8glGwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733815454; x=1765351454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojpbtXLDIjClUX6H2oeIoa0yNWPf2+2tMyfMWJPkEBw=;
  b=lt8glGwfg7TtxC4ZpHI5RQsjJo68ry7EcYFzSJ0gUc7h4Cl7134otEKG
   sOC/CZpTu39zgM2Bhe/c+rhdcH611TQyB2TIMWJBEjaFMd5hze09UM6gw
   vaokO7RusqKwnHIAKHSVMUcEmX37e3Cbf8mMAZknEKN1SVepmekpsUVDl
   c/7buoXlBZWuR5xkOgR0pFbZ6vBleK1UI6EE2ZB1mStbmyLDM3VQGeJvV
   wbokCrdopRUAZAGcqMGAtS+R4b40TlvWYlJ+RbQIuyvNLskS75LSTS+Fs
   11iI4RSiAm03+o0YVxND+zDFfSqNU9wKGjr0bIlPkAgK4sqQ5Vr1XeysC
   A==;
X-CSE-ConnectionGUID: n8yhsgjPS/uFn73dx2ZUJQ==
X-CSE-MsgGUID: D7tOGX/LSCGeBQgWsJM4tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56625516"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="56625516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:24:13 -0800
X-CSE-ConnectionGUID: TW3Hnd2cQ2yp5sL8D16eQg==
X-CSE-MsgGUID: nvP3UJoATASSRP11Sg7qIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95791978"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Dec 2024 23:24:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKubI-0005Ej-2x;
	Tue, 10 Dec 2024 07:24:08 +0000
Date: Tue, 10 Dec 2024 15:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 10/13]
 arch/arm64/boot/dts/mediatek/mt8188.dtsi:2282.15-2317.5: Warning
 (simple_bus_reg): /soc/imgsys-l11b: missing or empty reg/ranges property
Message-ID: <202412101529.RnujGrCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   be3c6a5174dacb76a545d606f913219551c8b31f
commit: 3420b61367f55ad2fb7c2c66ede66d35cf819585 [10/13] CHROMIUM: arm64: dts: mt8188: remove the hcp device node
config: arm64-randconfig-003-20241209 (https://download.01.org/0day-ci/archive/20241210/202412101529.RnujGrCI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101529.RnujGrCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101529.RnujGrCI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:745.29-749.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:751.22-755.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:757.34-761.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc-max-crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-evb.dts:46.42-48.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-evb.dts:50.46-54.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1338.29-1362.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1444.35-1449.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1451.35-1456.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2276.42-2280.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2282.15-2317.5: Warning (simple_bus_reg): /soc/imgsys-l11b: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.14-2343.5: Warning (simple_bus_reg): /soc/imgsys-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3254.14-3279.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3281.15-3316.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3318.15-3353.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4005.49-4012.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4300.38-4306.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4308.38-4314.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:825.37-846.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1338.29-1362.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1444.35-1449.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1451.35-1456.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2276.42-2280.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2282.15-2317.5: Warning (simple_bus_reg): /soc/imgsys-l11b: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.14-2343.5: Warning (simple_bus_reg): /soc/imgsys-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3254.14-3279.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3281.15-3316.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3318.15-3353.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4005.49-4012.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4300.38-4306.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4308.38-4314.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:825.37-846.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1338.29-1362.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1444.35-1449.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1451.35-1456.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2276.42-2280.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2282.15-2317.5: Warning (simple_bus_reg): /soc/imgsys-l11b: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.14-2343.5: Warning (simple_bus_reg): /soc/imgsys-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3254.14-3279.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3281.15-3316.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3318.15-3353.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4005.49-4012.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4300.38-4306.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4308.38-4314.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:825.37-846.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1338.29-1362.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1444.35-1449.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1451.35-1456.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2276.42-2280.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2282.15-2317.5: Warning (simple_bus_reg): /soc/imgsys-l11b: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.14-2343.5: Warning (simple_bus_reg): /soc/imgsys-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3254.14-3279.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3281.15-3316.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3318.15-3353.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4005.49-4012.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4300.38-4306.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4308.38-4314.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:825.37-846.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1338.29-1362.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1444.35-1449.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1451.35-1456.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2276.42-2280.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2282.15-2317.5: Warning (simple_bus_reg): /soc/imgsys-l11b: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.14-2343.5: Warning (simple_bus_reg): /soc/imgsys-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3254.14-3279.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3281.15-3316.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3318.15-3353.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4005.49-4012.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4300.38-4306.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4308.38-4314.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:825.37-846.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1338.29-1362.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1444.35-1449.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1451.35-1456.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2276.42-2280.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2282.15-2317.5: Warning (simple_bus_reg): /soc/imgsys-l11b: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.14-2343.5: Warning (simple_bus_reg): /soc/imgsys-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3254.14-3279.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3281.15-3316.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3318.15-3353.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4005.49-4012.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4300.38-4306.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4308.38-4314.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:825.37-846.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:80.27-86.4: Warning (unit_address_format): /soc/i2c@11ec1000/vcm@0c: unit name should not have leading 0s
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1338.29-1362.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1444.35-1449.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1451.35-1456.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2276.42-2280.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2282.15-2317.5: Warning (simple_bus_reg): /soc/imgsys-l11b: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.14-2343.5: Warning (simple_bus_reg): /soc/imgsys-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3254.14-3279.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3281.15-3316.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3318.15-3353.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4005.49-4012.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4300.38-4306.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4308.38-4314.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:80.27-86.4: Warning (i2c_bus_reg): /soc/i2c@11ec1000/vcm@0c: I2C bus unit address format error, expected "c"

vim +2282 arch/arm64/boot/dts/mediatek/mt8188.dtsi

    18	
    19	/ {
    20		compatible = "mediatek,mt8188";
    21		interrupt-parent = <&gic>;
    22		#address-cells = <2>;
    23		#size-cells = <2>;
    24	
    25		aliases {
    26			dp-intf1 = &dp_intf1;
    27			ethdr0 = &ethdr0;
    28			gce0 = &gce0;
    29			gce1 = &gce1;
    30			merge1 = &merge1;
    31			merge2 = &merge2;
    32			merge3 = &merge3;
    33			merge4 = &merge4;
    34			merge5 = &merge5;
    35			mutex0 = &mutex0;
    36			mutex1 = &mutex1;
    37			padding0 = &padding0;
    38			padding1 = &padding1;
    39			padding2 = &padding2;
    40			padding3 = &padding3;
    41			padding4 = &padding4;
    42			padding5 = &padding5;
    43			padding6 = &padding6;
    44			padding7 = &padding7;
    45			vdo1-rdma0 = &vdo1_rdma0;
    46			vdo1-rdma1 = &vdo1_rdma1;
    47			vdo1-rdma2 = &vdo1_rdma2;
    48			vdo1-rdma3 = &vdo1_rdma3;
    49			vdo1-rdma4 = &vdo1_rdma4;
    50			vdo1-rdma5 = &vdo1_rdma5;
    51			vdo1-rdma6 = &vdo1_rdma6;
    52			vdo1-rdma7 = &vdo1_rdma7;
    53		};
    54	
    55		cpus {
    56			#address-cells = <1>;
    57			#size-cells = <0>;
    58	
    59			cpu0: cpu@0 {
    60				device_type = "cpu";
    61				compatible = "arm,cortex-a55";
    62				reg = <0x000>;
    63				enable-method = "psci";
    64				performance-domains = <&performance 0>;
    65				clock-frequency = <2000000000>;
    66				capacity-dmips-mhz = <282>;
    67				cpu-idle-states = <&cpu_off_l &cluster_off_l>;
    68				i-cache-size = <32768>;
    69				i-cache-line-size = <64>;
    70				i-cache-sets = <128>;
    71				d-cache-size = <32768>;
    72				d-cache-line-size = <64>;
    73				d-cache-sets = <128>;
    74				next-level-cache = <&l2_0>;
    75				#cooling-cells = <2>;
    76			};
    77	
    78			cpu1: cpu@100 {
    79				device_type = "cpu";
    80				compatible = "arm,cortex-a55";
    81				reg = <0x100>;
    82				enable-method = "psci";
    83				performance-domains = <&performance 0>;
    84				clock-frequency = <2000000000>;
    85				capacity-dmips-mhz = <282>;
    86				cpu-idle-states = <&cpu_off_l &cluster_off_l>;
    87				i-cache-size = <32768>;
    88				i-cache-line-size = <64>;
    89				i-cache-sets = <128>;
    90				d-cache-size = <32768>;
    91				d-cache-line-size = <64>;
    92				d-cache-sets = <128>;
    93				next-level-cache = <&l2_0>;
    94				#cooling-cells = <2>;
    95			};
    96	
    97			cpu2: cpu@200 {
    98				device_type = "cpu";
    99				compatible = "arm,cortex-a55";
   100				reg = <0x200>;
   101				enable-method = "psci";
   102				performance-domains = <&performance 0>;
   103				clock-frequency = <2000000000>;
   104				capacity-dmips-mhz = <282>;
   105				cpu-idle-states = <&cpu_off_l &cluster_off_l>;
   106				i-cache-size = <32768>;
   107				i-cache-line-size = <64>;
   108				i-cache-sets = <128>;
   109				d-cache-size = <32768>;
   110				d-cache-line-size = <64>;
   111				d-cache-sets = <128>;
   112				next-level-cache = <&l2_0>;
   113				#cooling-cells = <2>;
   114			};
   115	
   116			cpu3: cpu@300 {
   117				device_type = "cpu";
   118				compatible = "arm,cortex-a55";
   119				reg = <0x300>;
   120				enable-method = "psci";
   121				performance-domains = <&performance 0>;
   122				clock-frequency = <2000000000>;
   123				capacity-dmips-mhz = <282>;
   124				cpu-idle-states = <&cpu_off_l &cluster_off_l>;
   125				i-cache-size = <32768>;
   126				i-cache-line-size = <64>;
   127				i-cache-sets = <128>;
   128				d-cache-size = <32768>;
   129				d-cache-line-size = <64>;
   130				d-cache-sets = <128>;
   131				next-level-cache = <&l2_0>;
   132				#cooling-cells = <2>;
   133			};
   134	
   135			cpu4: cpu@400 {
   136				device_type = "cpu";
   137				compatible = "arm,cortex-a55";
   138				reg = <0x400>;
   139				enable-method = "psci";
   140				performance-domains = <&performance 0>;
   141				clock-frequency = <2000000000>;
   142				capacity-dmips-mhz = <282>;
   143				cpu-idle-states = <&cpu_off_l &cluster_off_l>;
   144				i-cache-size = <32768>;
   145				i-cache-line-size = <64>;
   146				i-cache-sets = <128>;
   147				d-cache-size = <32768>;
   148				d-cache-line-size = <64>;
   149				d-cache-sets = <128>;
   150				next-level-cache = <&l2_0>;
   151				#cooling-cells = <2>;
   152			};
   153	
   154			cpu5: cpu@500 {
   155				device_type = "cpu";
   156				compatible = "arm,cortex-a55";
   157				reg = <0x500>;
   158				enable-method = "psci";
   159				performance-domains = <&performance 0>;
   160				clock-frequency = <2000000000>;
   161				capacity-dmips-mhz = <282>;
   162				cpu-idle-states = <&cpu_off_l &cluster_off_l>;
   163				i-cache-size = <32768>;
   164				i-cache-line-size = <64>;
   165				i-cache-sets = <128>;
   166				d-cache-size = <32768>;
   167				d-cache-line-size = <64>;
   168				d-cache-sets = <128>;
   169				next-level-cache = <&l2_0>;
   170				#cooling-cells = <2>;
   171			};
   172	
   173			cpu6: cpu@600 {
   174				device_type = "cpu";
   175				compatible = "arm,cortex-a78";
   176				reg = <0x600>;
   177				enable-method = "psci";
   178				performance-domains = <&performance 1>;
   179				clock-frequency = <2600000000>;
   180				capacity-dmips-mhz = <1024>;
   181				cpu-idle-states = <&cpu_off_b &cluster_off_b>;
   182				i-cache-size = <65536>;
   183				i-cache-line-size = <64>;
   184				i-cache-sets = <256>;
   185				d-cache-size = <65536>;
   186				d-cache-line-size = <64>;
   187				d-cache-sets = <256>;
   188				next-level-cache = <&l2_1>;
   189				#cooling-cells = <2>;
   190			};
   191	
   192			cpu7: cpu@700 {
   193				device_type = "cpu";
   194				compatible = "arm,cortex-a78";
   195				reg = <0x700>;
   196				enable-method = "psci";
   197				performance-domains = <&performance 1>;
   198				clock-frequency = <2600000000>;
   199				capacity-dmips-mhz = <1024>;
   200				cpu-idle-states = <&cpu_off_b &cluster_off_b>;
   201				i-cache-size = <65536>;
   202				i-cache-line-size = <64>;
   203				i-cache-sets = <256>;
   204				d-cache-size = <65536>;
   205				d-cache-line-size = <64>;
   206				d-cache-sets = <256>;
   207				next-level-cache = <&l2_1>;
   208				#cooling-cells = <2>;
   209			};
   210	
   211			cpu-map {
   212				cluster0 {
   213					core0 {
   214						cpu = <&cpu0>;
   215					};
   216	
   217					core1 {
   218						cpu = <&cpu1>;
   219					};
   220	
   221					core2 {
   222						cpu = <&cpu2>;
   223					};
   224	
   225					core3 {
   226						cpu = <&cpu3>;
   227					};
   228	
   229					core4 {
   230						cpu = <&cpu4>;
   231					};
   232	
   233					core5 {
   234						cpu = <&cpu5>;
   235					};
   236				};
   237	
   238				cluster1 {
   239					core0 {
   240						cpu = <&cpu6>;
   241					};
   242	
   243					core1 {
   244						cpu = <&cpu7>;
   245					};
   246				};
   247			};
   248	
   249			idle-states {
   250				entry-method = "psci";
   251	
   252				cpu_off_l: cpu-off-l {
   253					compatible = "arm,idle-state";
   254					arm,psci-suspend-param = <0x00010000>;
   255					local-timer-stop;
   256					entry-latency-us = <50>;
   257					exit-latency-us = <95>;
   258					min-residency-us = <580>;
   259				};
   260	
   261				cpu_off_b: cpu-off-b {
   262					compatible = "arm,idle-state";
   263					arm,psci-suspend-param = <0x00010000>;
   264					local-timer-stop;
   265					entry-latency-us = <45>;
   266					exit-latency-us = <140>;
   267					min-residency-us = <740>;
   268				};
   269	
   270				cluster_off_l: cluster-off-l {
   271					compatible = "arm,idle-state";
   272					arm,psci-suspend-param = <0x01010010>;
   273					local-timer-stop;
   274					entry-latency-us = <55>;
   275					exit-latency-us = <155>;
   276					min-residency-us = <840>;
   277				};
   278	
   279				cluster_off_b: cluster-off-b {
   280					compatible = "arm,idle-state";
   281					arm,psci-suspend-param = <0x01010010>;
   282					local-timer-stop;
   283					entry-latency-us = <50>;
   284					exit-latency-us = <200>;
   285					min-residency-us = <1000>;
   286				};
   287	
   288				mcusys_off: mcusys-off {
   289					compatible = "arm,idle-state";
   290					arm,psci-suspend-param = <0x01010024>;
   291					local-timer-stop;
   292					entry-latency-us = <640>;
   293					exit-latency-us = <1400>;
   294					min-residency-us = <13200>;
   295				};
   296	
   297				system_mem: system-mem {
   298					compatible = "arm,idle-state";
   299					arm,psci-suspend-param = <0x01010030>;
   300					local-timer-stop;
   301					entry-latency-us = <640>;
   302					exit-latency-us = <1800>;
   303					min-residency-us = <13200>;
   304				};
   305	
   306				system_pll: system-pll {
   307					compatible = "arm,idle-state";
   308					arm,psci-suspend-param = <0x01010040>;
   309					local-timer-stop;
   310					entry-latency-us = <640>;
   311					exit-latency-us = <1850>;
   312					min-residency-us = <13200>;
   313				};
   314	
   315				system_bus: system-bus {
   316					compatible = "arm,idle-state";
   317					arm,psci-suspend-param = <0x01010050>;
   318					local-timer-stop;
   319					entry-latency-us = <640>;
   320					exit-latency-us = <2800>;
   321					min-residency-us = <13200>;
   322				};
   323	
   324				s2idle: s2idle {
   325					compatible = "arm,idle-state";
   326					arm,psci-suspend-param = <0x01011f01>;
   327					local-timer-stop;
   328					entry-latency-us = <10000>;
   329					exit-latency-us = <10000>;
   330					min-residency-us = <4294967295>;
   331				};
   332			};
   333	
   334			l2_0: l2-cache0 {
   335				compatible = "cache";
   336				cache-level = <2>;
   337				cache-size = <131072>;
   338				cache-line-size = <64>;
   339				cache-sets = <512>;
   340				next-level-cache = <&l3_0>;
   341				cache-unified;
   342			};
   343	
   344			l2_1: l2-cache1 {
   345				compatible = "cache";
   346				cache-level = <2>;
   347				cache-size = <262144>;
   348				cache-line-size = <64>;
   349				cache-sets = <512>;
   350				next-level-cache = <&l3_0>;
   351				cache-unified;
   352			};
   353	
   354			l3_0: l3-cache {
   355				compatible = "cache";
   356				cache-level = <3>;
   357				cache-size = <2097152>;
   358				cache-line-size = <64>;
   359				cache-sets = <2048>;
   360				cache-unified;
   361			};
   362		};
   363	
   364		clk13m: oscillator-13m {
   365			compatible = "fixed-clock";
   366			#clock-cells = <0>;
   367			clock-frequency = <13000000>;
   368			clock-output-names = "clk13m";
   369		};
   370	
   371		clk26m: oscillator-26m {
   372			compatible = "fixed-clock";
   373			#clock-cells = <0>;
   374			clock-frequency = <26000000>;
   375			clock-output-names = "clk26m";
   376		};
   377	
   378		clk32k: oscillator-32k {
   379			compatible = "fixed-clock";
   380			#clock-cells = <0>;
   381			clock-frequency = <32768>;
   382			clock-output-names = "clk32k";
   383		};
   384	
   385		gpu_opp_table: opp-table-gpu {
   386			compatible = "operating-points-v2", "operating-points-v2-mali";
   387			opp-shared;
   388	
   389			opp-390000000 {
   390				opp-hz = /bits/ 64 <390000000>;
   391				opp-microvolt = <575000>;
   392			};
   393	
   394			opp-431000000 {
   395				opp-hz = /bits/ 64 <431000000>;
   396				opp-microvolt = <587500>;
   397			};
   398	
   399			opp-473000000 {
   400				opp-hz = /bits/ 64 <473000000>;
   401				opp-microvolt = <600000>;
   402			};
   403	
   404			opp-515000000 {
   405				opp-hz = /bits/ 64 <515000000>;
   406				opp-microvolt = <612500>;
   407			};
   408	
   409			opp-556000000 {
   410				opp-hz = /bits/ 64 <556000000>;
   411				opp-microvolt = <625000>;
   412			};
   413	
   414			opp-598000000 {
   415				opp-hz = /bits/ 64 <598000000>;
   416				opp-microvolt = <637500>;
   417			};
   418	
   419			opp-640000000 {
   420				opp-hz = /bits/ 64 <640000000>;
   421				opp-microvolt = <650000>;
   422			};
   423	
   424			opp-670000000 {
   425				opp-hz = /bits/ 64 <670000000>;
   426				opp-microvolt = <662500>;
   427			};
   428	
   429			opp-700000000 {
   430				opp-hz = /bits/ 64 <700000000>;
   431				opp-microvolt = <675000>;
   432			};
   433	
   434			opp-730000000 {
   435				opp-hz = /bits/ 64 <730000000>;
   436				opp-microvolt = <687500>;
   437			};
   438	
   439			opp-760000000 {
   440				opp-hz = /bits/ 64 <760000000>;
   441				opp-microvolt = <700000>;
   442			};
   443	
   444			opp-790000000 {
   445				opp-hz = /bits/ 64 <790000000>;
   446				opp-microvolt = <712500>;
   447			};
   448	
   449			opp-835000000 {
   450				opp-hz = /bits/ 64 <835000000>;
   451				opp-microvolt = <731250>;
   452			};
   453	
   454			opp-880000000 {
   455				opp-hz = /bits/ 64 <880000000>;
   456				opp-microvolt = <750000>;
   457			};
   458	
   459			opp-915000000 {
   460				opp-hz = /bits/ 64 <915000000>;
   461				opp-microvolt = <775000>;
   462				opp-microvolt-bin5 = <762500>;
   463				opp-microvolt-bin6 = <750000>;
   464			};
   465	
   466			opp-950000000 {
   467				opp-hz = /bits/ 64 <950000000>;
   468				opp-microvolt = <800000>;
   469				opp-microvolt-bin5 = <775000>;
   470				opp-microvolt-bin6 = <750000>;
   471			};
   472		};
   473	
   474		img_opp_table: opp-table-img {
   475			compatible = "operating-points-v2";
   476			opp-273000000 {
   477				opp-hz = /bits/ 64 <273000000>;
   478				opp-microvolt = <550000>;
   479			};
   480			opp-364000000 {
   481				opp-hz = /bits/ 64 <364000000>;
   482				opp-microvolt = <600000>;
   483			};
   484			opp-546000000 {
   485				opp-hz = /bits/ 64 <546000000>;
   486				opp-microvolt = <650000>;
   487			};
   488			opp-660000000 {
   489				opp-hz = /bits/ 64 <660000000>;
   490				opp-microvolt = <725000>;
   491			};
   492		};
   493	
   494		ipe_opp_table: opp-table-ipe {
   495			compatible = "operating-points-v2";
   496			opp-273000000 {
   497				opp-hz = /bits/ 64 <273000000>;
   498				opp-microvolt = <550000>;
   499			};
   500			opp-364000000 {
   501				opp-hz = /bits/ 64 <364000000>;
   502				opp-microvolt = <600000>;
   503			};
   504			opp-458000000 {
   505				opp-hz = /bits/ 64 <458000000>;
   506				opp-microvolt = <650000>;
   507			};
   508			opp-546000000 {
   509				opp-hz = /bits/ 64 <546000000>;
   510				opp-microvolt = <725000>;
   511			};
   512		};
   513	
   514		pmu-a55 {
   515			compatible = "arm,cortex-a55-pmu";
   516			interrupt-parent = <&gic>;
   517			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
   518		};
   519	
   520		pmu-a78 {
   521			compatible = "arm,cortex-a78-pmu";
   522			interrupt-parent = <&gic>;
   523			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
   524		};
   525	
   526		psci {
   527			compatible = "arm,psci-1.0";
   528			method = "smc";
   529		};
   530	
   531		sound: sound {
   532			mediatek,platform = <&afe>;
   533			status = "disabled";
   534		};
   535	
   536		vtemp: vtemp {
   537			compatible = "mediatek,virtual-temp";
   538			#thermal-sensor-cells = <1>;
   539		};
   540	
   541		thermal_zones: thermal-zones {
   542			cpu_little1 {
   543				polling-delay = <0>; /* milliseconds */
   544				polling-delay-passive = <0>; /* milliseconds */
   545				thermal-sensors = <&lvtsmcu 0>;
   546	
   547				trips {
   548					cpu_little1_crit: cpu-little1-crit {
   549						temperature = <119000>;
   550						hysteresis = <2000>;
   551						type = "critical";
   552					};
   553				};
   554			};
   555	
   556			cpu_little2 {
   557				polling-delay = <0>; /* milliseconds */
   558				polling-delay-passive = <0>; /* milliseconds */
   559				thermal-sensors = <&lvtsmcu 1>;
   560	
   561				trips {
   562					cpu_little2_crit: cpu-little2-crit {
   563						temperature = <119000>;
   564						hysteresis = <2000>;
   565						type = "critical";
   566					};
   567				};
   568			};
   569	
   570			cpu_little3 {
   571				polling-delay = <0>; /* milliseconds */
   572				polling-delay-passive = <0>; /* milliseconds */
   573				thermal-sensors = <&lvtsmcu 2>;
   574	
   575				trips {
   576					cpu_little3_crit: cpu-little3-crit {
   577						temperature = <119000>;
   578						hysteresis = <2000>;
   579						type = "critical";
   580					};
   581				};
   582			};
   583	
   584			cpu_little4 {
   585				polling-delay = <0>; /* milliseconds */
   586				polling-delay-passive = <0>; /* milliseconds */
   587				thermal-sensors = <&lvtsmcu 3>;
   588	
   589				trips {
   590					cpu_little4_crit: cpu-little4-crit {
   591						temperature = <119000>;
   592						hysteresis = <2000>;
   593						type = "critical";
   594					};
   595				};
   596			};
   597	
   598			cpu_big0 {
   599				polling-delay = <0>; /* milliseconds */
   600				polling-delay-passive = <0>; /* milliseconds */
   601				thermal-sensors = <&lvtsmcu 4>;
   602	
   603				trips {
   604					cpu_big0_crit: cpu-big0-crit {
   605						temperature = <119000>;
   606						hysteresis = <2000>;
   607						type = "critical";
   608					};
   609				};
   610			};
   611	
   612			cpu_big1 {
   613				polling-delay = <0>; /* milliseconds */
   614				polling-delay-passive = <0>; /* milliseconds */
   615				thermal-sensors = <&lvtsmcu 5>;
   616	
   617				trips {
   618					cpu_big1_crit: cpu-big1-crit {
   619						temperature = <119000>;
   620						hysteresis = <2000>;
   621						type = "critical";
   622					};
   623				};
   624			};
   625	
   626			apu {
   627				polling-delay = <0>; /* milliseconds */
   628				polling-delay-passive = <0>; /* milliseconds */
   629				thermal-sensors = <&lvtsap 0>;
   630	
   631				trips {
   632					apu_crit: apu-crit {
   633						temperature = <119000>;
   634						hysteresis = <2000>;
   635						type = "critical";
   636					};
   637				};
   638			};
   639	
   640			gpu1 {
   641				polling-delay = <0>; /* milliseconds */
   642				polling-delay-passive = <0>; /* milliseconds */
   643				thermal-sensors = <&lvtsap 1>;
   644	
   645				trips {
   646					gpu1_crit: gpu1-crit {
   647						temperature = <119000>;
   648						hysteresis = <2000>;
   649						type = "critical";
   650					};
   651				};
   652			};
   653	
   654			gpu2 {
   655				polling-delay = <0>; /* milliseconds */
   656				polling-delay-passive = <0>; /* milliseconds */
   657				thermal-sensors = <&lvtsap 2>;
   658	
   659				trips {
   660					gpu2_crit: gpu2-crit {
   661						temperature = <119000>;
   662						hysteresis = <2000>;
   663						type = "critical";
   664					};
   665				};
   666			};
   667	
   668			soc1 {
   669				polling-delay = <0>; /* milliseconds */
   670				polling-delay-passive = <0>; /* milliseconds */
   671				thermal-sensors = <&lvtsap 3>;
   672	
   673				trips {
   674					soc1_crit: soc1-crit {
   675						temperature = <119000>;
   676						hysteresis = <2000>;
   677						type = "critical";
   678					};
   679				};
   680			};
   681	
   682			soc2 {
   683				polling-delay = <0>; /* milliseconds */
   684				polling-delay-passive = <0>; /* milliseconds */
   685				thermal-sensors = <&lvtsap 4>;
   686	
   687				trips {
   688					soc2_crit: soc2-crit {
   689						temperature = <119000>;
   690						hysteresis = <2000>;
   691						type = "critical";
   692					};
   693				};
   694			};
   695	
   696			soc3 {
   697				polling-delay = <0>; /* milliseconds */
   698				polling-delay-passive = <0>; /* milliseconds */
   699				thermal-sensors = <&lvtsap 5>;
   700	
   701				trips {
   702					soc3_crit: soc3-crit {
   703						temperature = <119000>;
   704						hysteresis = <2000>;
   705						type = "critical";
   706					};
   707				};
   708			};
   709	
   710			cam1 {
   711				polling-delay = <0>; /* milliseconds */
   712				polling-delay-passive = <0>; /* milliseconds */
   713				thermal-sensors = <&lvtsap 6>;
   714	
   715				trips {
   716					cam1_crit: cam1-crit {
   717						temperature = <119000>;
   718						hysteresis = <2000>;
   719						type = "critical";
   720					};
   721				};
   722			};
   723	
   724			cam2 {
   725				polling-delay = <0>; /* milliseconds */
   726				polling-delay-passive = <0>; /* milliseconds */
   727				thermal-sensors = <&lvtsap 7>;
   728	
   729				trips {
   730					cam2_crit: cam2-crit {
   731						temperature = <119000>;
   732						hysteresis = <2000>;
   733						type = "critical";
   734					};
   735				};
   736			};
   737	
   738			soc_max {
   739				polling-delay = <1000>; /* milliseconds */
   740				polling-delay-passive = <100>; /* milliseconds */
   741				thermal-sensors = <&vtemp 0>;
   742				sustainable-power = <1500>;
   743	
   744				trips {
   745					threshold: trip-point@0 {
   746						temperature = <68000>;
   747						hysteresis = <2000>;
   748						type = "passive";
   749					};
   750	
   751					target: target@1 {
   752						temperature = <85000>;
   753						hysteresis = <2000>;
   754						type = "passive";
   755					};
   756	
   757					soc_max_crit: soc-max-crit@0 {
   758						temperature = <115000>;
   759						hysteresis = <2000>;
   760						type = "critical";
   761					};
   762				};
   763	
   764				cooling_map: cooling-maps {
   765					map0 {
   766						trip = <&target>;
   767						cooling-device = <&cpu0
   768							THERMAL_NO_LIMIT
   769							THERMAL_NO_LIMIT>,
   770								<&cpu1
   771							THERMAL_NO_LIMIT
   772							THERMAL_NO_LIMIT>,
   773								<&cpu2
   774							THERMAL_NO_LIMIT
   775							THERMAL_NO_LIMIT>,
   776								<&cpu3
   777							THERMAL_NO_LIMIT
   778							THERMAL_NO_LIMIT>,
   779								<&cpu4
   780							THERMAL_NO_LIMIT
   781							THERMAL_NO_LIMIT>,
   782								<&cpu5
   783							THERMAL_NO_LIMIT
   784							THERMAL_NO_LIMIT>;
   785						contribution = <2345>;
   786					};
   787	
   788					map1 {
   789						trip = <&target>;
   790						cooling-device = <&cpu6
   791							THERMAL_NO_LIMIT
   792							THERMAL_NO_LIMIT>,
   793								<&cpu7
   794							THERMAL_NO_LIMIT
   795							THERMAL_NO_LIMIT>;
   796						contribution = <1024>;
   797					};
   798				};
   799			};
   800		};
   801	
   802		timer: timer {
   803			compatible = "arm,armv8-timer";
   804			interrupt-parent = <&gic>;
   805			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
   806				     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
   807				     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
   808				     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
   809			clock-frequency = <13000000>;
   810		};
   811	
   812		soc {
   813			#address-cells = <2>;
   814			#size-cells = <2>;
   815			compatible = "simple-bus";
   816			dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
   817			ranges;
   818	
   819			performance: performance-controller@11bc10 {
   820				compatible = "mediatek,cpufreq-hw";
   821				reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
   822				#performance-domain-cells = <1>;
   823			};
   824	
   825			gic: interrupt-controller@c000000 {
   826				compatible = "arm,gic-v3";
   827				reg = <0 0x0c000000 0 0x40000>,
   828				      <0 0x0c040000 0 0x200000>;
   829				#address-cells = <2>;
   830				#size-cells = <2>;
   831				interrupt-controller;
   832				interrupt-parent = <&gic>;
   833				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
   834				#interrupt-cells = <4>;
   835				#redistributor-regions = <1>;
   836	
   837				ppi-partitions {
   838					ppi_cluster0: interrupt-partition-0 {
   839						affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
   840					};
   841	
   842					ppi_cluster1: interrupt-partition-1 {
   843						affinity = <&cpu6 &cpu7>;
   844					};
   845				};
   846			};
   847	
   848			topckgen: syscon@10000000 {
   849				compatible = "mediatek,mt8188-topckgen", "syscon";
   850				reg = <0 0x10000000 0 0x1000>;
   851				#clock-cells = <1>;
   852			};
   853	
   854			infracfg_ao: syscon@10001000 {
   855				compatible = "mediatek,mt8188-infracfg-ao", "syscon";
   856				reg = <0 0x10001000 0 0x1000>;
   857				#clock-cells = <1>;
   858				#reset-cells = <1>;
   859			};
   860	
   861			pericfg: syscon@10003000 {
   862				compatible = "mediatek,mt8188-pericfg", "syscon";
   863				reg = <0 0x10003000 0 0x1000>;
   864				#clock-cells = <1>;
   865			};
   866	
   867			pio: pinctrl@10005000 {
   868				compatible = "mediatek,mt8188-pinctrl";
   869				reg = <0 0x10005000 0 0x1000>,
   870				      <0 0x11c00000 0 0x1000>,
   871				      <0 0x11e10000 0 0x1000>,
   872				      <0 0x11e20000 0 0x1000>,
   873				      <0 0x11ea0000 0 0x1000>,
   874				      <0 0x1000b000 0 0x1000>;
   875				reg-names = "iocfg0", "iocfg_rm", "iocfg_lt",
   876					    "iocfg_lm", "iocfg_rt", "eint";
   877				gpio-controller;
   878				gpio-ranges = <&pio 0 0 176>;
   879				#gpio-cells = <2>;
   880				interrupt-controller;
   881				interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH 0>;
   882				#interrupt-cells = <2>;
   883			};
   884	
   885			scpsys: syscon@10006000 {
   886				compatible = "syscon", "simple-mfd";
   887				reg = <0 0x10006000 0 0x1000>;
   888				#power-domain-cells = <1>;
   889	
   890				/* System Power Manager */
   891				spm: power-controller {
   892					compatible = "mediatek,mt8188-power-controller";
   893					#address-cells = <1>;
   894					#size-cells = <0>;
   895					#power-domain-cells = <1>;
   896	
   897					/* power domain of the SoC */
   898					mfg0: power-domain@MT8188_POWER_DOMAIN_MFG0 {
   899						reg = <MT8188_POWER_DOMAIN_MFG0>;
   900						#address-cells = <1>;
   901						#size-cells = <0>;
   902						#power-domain-cells = <1>;
   903	
   904						mfg1: power-domain@MT8188_POWER_DOMAIN_MFG1 {
   905							reg = <MT8188_POWER_DOMAIN_MFG1>;
   906							clocks = <&apmixedsys CLK_APMIXED_MFGPLL>,
   907								 <&topckgen CLK_TOP_MFG_CORE_TMP>;
   908							clock-names= "mfg10", "mfg11";
   909							#address-cells = <1>;
   910							#size-cells = <0>;
   911							#power-domain-cells = <1>;
   912							mediatek,infracfg = <&infracfg_ao>;
   913	
   914							power-domain@MT8188_POWER_DOMAIN_MFG2 {
   915								reg = <MT8188_POWER_DOMAIN_MFG2>;
   916								#power-domain-cells = <0>;
   917							};
   918	
   919							power-domain@MT8188_POWER_DOMAIN_MFG3 {
   920								reg = <MT8188_POWER_DOMAIN_MFG3>;
   921								#power-domain-cells = <0>;
   922							};
   923	
   924							power-domain@MT8188_POWER_DOMAIN_MFG4 {
   925								reg = <MT8188_POWER_DOMAIN_MFG4>;
   926								#power-domain-cells = <0>;
   927							};
   928						};
   929					};
   930	
   931					power-domain@MT8188_POWER_DOMAIN_VPPSYS0 {
   932						reg = <MT8188_POWER_DOMAIN_VPPSYS0>;
   933						clocks = <&topckgen CLK_TOP_VPP>,
   934							 <&topckgen CLK_TOP_CAM>,
   935							 <&topckgen CLK_TOP_CCU>,
   936							 <&topckgen CLK_TOP_IMG>,
   937							 <&topckgen CLK_TOP_VENC>,
   938							 <&topckgen CLK_TOP_VDEC>,
   939							 <&topckgen CLK_TOP_WPE_VPP>,
   940							 <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP0>,
   941							 <&topckgen CLK_TOP_CFGREG_F26M_VPP0>,
   942							 <&vppsys0 CLK_VPP0_SMI_COMMON_MMSRAM>,
   943							 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB0_MMSRAM>,
   944							 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB1_MMSRAM>,
   945							 <&vppsys0 CLK_VPP0_GALS_VENCSYS_MMSRAM>,
   946							 <&vppsys0 CLK_VPP0_GALS_VENCSYS_CORE1_MMSRAM>,
   947							 <&vppsys0 CLK_VPP0_GALS_INFRA_MMSRAM>,
   948							 <&vppsys0 CLK_VPP0_GALS_CAMSYS_MMSRAM>,
   949							 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB5_MMSRAM>,
   950							 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB6_MMSRAM>,
   951							 <&vppsys0 CLK_VPP0_SMI_REORDER_MMSRAM>,
   952							 <&vppsys0 CLK_VPP0_SMI_IOMMU>,
   953							 <&vppsys0 CLK_VPP0_GALS_IMGSYS_CAMSYS>,
   954							 <&vppsys0 CLK_VPP0_GALS_EMI0_EMI1>,
   955							 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>,
   956							 <&vppsys0 CLK_VPP0_SMI_RSI>,
   957							 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
   958							 <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
   959							 <&vppsys0 CLK_VPP0_GALS_VPP1_WPESYS>,
   960							 <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
   961						clock-names = "vppsys00", "vppsys01", "vppsys02", "vppsys03",
   962							      "vppsys04", "vppsys05", "vppsys06", "vppsys07",
   963							      "vppsys08", "vppsys0-0", "vppsys0-1", "vppsys0-2",
   964							      "vppsys0-3", "vppsys0-4", "vppsys0-5", "vppsys0-6",
   965							      "vppsys0-7", "vppsys0-8", "vppsys0-9", "vppsys0-10",
   966							      "vppsys0-11", "vppsys0-12", "vppsys0-13", "vppsys0-14",
   967							      "vppsys0-15", "vppsys0-16", "vppsys0-17", "vppsys0-18";
   968						#address-cells = <1>;
   969						#size-cells = <0>;
   970						#power-domain-cells = <1>;
   971						mediatek,infracfg = <&infracfg_ao>;
   972	
   973						power-domain@MT8188_POWER_DOMAIN_VDOSYS0 {
   974							reg = <MT8188_POWER_DOMAIN_VDOSYS0>;
   975							clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VDO0>,
   976								 <&topckgen CLK_TOP_CFGREG_F26M_VDO0>,
   977								 <&vdosys0 CLK_VDO0_SMI_GALS>,
   978								 <&vdosys0 CLK_VDO0_SMI_COMMON>,
   979								 <&vdosys0 CLK_VDO0_SMI_EMI>,
   980								 <&vdosys0 CLK_VDO0_SMI_IOMMU>,
   981								 <&vdosys0 CLK_VDO0_SMI_LARB>,
   982								 <&vdosys0 CLK_VDO0_SMI_RSI>,
   983								 <&vdosys0 CLK_VDO0_APB_BUS>;
   984							clock-names = "vdosys00", "vdosys01", "vdosys0-0",
   985								      "vdosys0-1", "vdosys0-2", "vdosys0-3",
   986								      "vdosys0-4", "vdosys0-5", "vdosys0-6";
   987							#address-cells = <1>;
   988							#size-cells = <0>;
   989							#power-domain-cells = <1>;
   990							mediatek,infracfg = <&infracfg_ao>;
   991	
   992							power-domain@MT8188_POWER_DOMAIN_VPPSYS1 {
   993								reg = <MT8188_POWER_DOMAIN_VPPSYS1>;
   994								clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP1>,
   995									 <&topckgen CLK_TOP_CFGREG_F26M_VPP1>,
   996									 <&vppsys1 CLK_VPP1_GALS5>,
   997									 <&vppsys1 CLK_VPP1_GALS6>,
   998									 <&vppsys1 CLK_VPP1_LARB5>,
   999									 <&vppsys1 CLK_VPP1_LARB6>;
  1000								clock-names = "vppsys10", "vppsys11", "vppsys1-0",
  1001									      "vppsys1-1", "vppsys1-2", "vppsys1-3";
  1002								#power-domain-cells = <0>;
  1003								mediatek,infracfg = <&infracfg_ao>;
  1004							};
  1005	
  1006							power-domain@MT8188_POWER_DOMAIN_VDEC0 {
  1007								reg = <MT8188_POWER_DOMAIN_VDEC0>;
  1008								clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
  1009								clock-names = "vdec0-0";
  1010								#address-cells = <1>;
  1011								#size-cells = <0>;
  1012								#power-domain-cells = <1>;
  1013								mediatek,infracfg = <&infracfg_ao>;
  1014	
  1015								power-domain@MT8188_POWER_DOMAIN_VDEC1 {
  1016									reg = <MT8188_POWER_DOMAIN_VDEC1>;
  1017									clocks = <&vdecsys CLK_VDEC2_LARB1>;
  1018									clock-names = "vdec1-0";
  1019									#power-domain-cells = <0>;
  1020									mediatek,infracfg = <&infracfg_ao>;
  1021								};
  1022							};
  1023	
  1024							cam_vcore: power-domain@MT8188_POWER_DOMAIN_CAM_VCORE {
  1025								reg = <MT8188_POWER_DOMAIN_CAM_VCORE>;
  1026								clocks = <&topckgen CLK_TOP_CAM>,
  1027									 <&topckgen CLK_TOP_CCU>,
  1028									 <&topckgen CLK_TOP_CCU_AHB>,
  1029									 <&topckgen CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS>;
  1030								clock-names = "cam_vcore0", "cam_vcore1",
  1031									      "cam_vcore2", "cam_vcore3";
  1032								#address-cells = <1>;
  1033								#size-cells = <0>;
  1034								#power-domain-cells = <1>;
  1035								mediatek,infracfg = <&infracfg_ao>;
  1036	
  1037								power-domain@MT8188_POWER_DOMAIN_CAM_MAIN {
  1038									reg = <MT8188_POWER_DOMAIN_CAM_MAIN>;
  1039									clocks = <&camsys CLK_CAM_MAIN_LARB13>,
  1040										 <&camsys CLK_CAM_MAIN_LARB14>,
  1041										 <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
  1042										 <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
  1043										 <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>;
  1044									clock-names= "cam_main-0", "cam_main-1",
  1045										     "cam_main-2", "cam_main-3",
  1046										     "cam_main-4";
  1047									#address-cells = <1>;
  1048									#size-cells = <0>;
  1049									#power-domain-cells = <1>;
  1050									mediatek,infracfg = <&infracfg_ao>;
  1051	
  1052									power-domain@MT8188_POWER_DOMAIN_CAM_SUBB {
  1053										reg =<MT8188_POWER_DOMAIN_CAM_SUBB>;
  1054										clocks = <&camsys CLK_CAM_MAIN_CAM_SUBB>,
  1055											 <&camsys_rawb CLK_CAM_RAWB_LARBX>,
  1056											 <&camsys_yuvb CLK_CAM_YUVB_LARBX>;
  1057										clock-names = "cam_subb-0", "cam_subb-1", "cam_subb-2";
  1058										#power-domain-cells = <0>;
  1059										mediatek,larb = <&camsys_rawb &camsys_yuvb>;
  1060										mediatek,smi = <&smi_cam0>;
  1061									};
  1062	
  1063									power-domain@MT8188_POWER_DOMAIN_CAM_SUBA {
  1064										reg =<MT8188_POWER_DOMAIN_CAM_SUBA>;
  1065										clocks = <&camsys CLK_CAM_MAIN_CAM_SUBA>,
  1066											 <&camsys_rawa CLK_CAM_RAWA_LARBX>,
  1067											 <&camsys_yuva CLK_CAM_YUVA_LARBX>;
  1068										clock-names = "cam_suba-0", "cam_suba-1", "cam_suba-2";
  1069										#power-domain-cells = <0>;
  1070										mediatek,larb = <&camsys_rawa &camsys_yuva>;
  1071										mediatek,smi = <&smi_cam1>;
  1072									};
  1073								};
  1074							};
  1075	
  1076							power-domain@MT8188_POWER_DOMAIN_VDOSYS1 {
  1077								reg = <MT8188_POWER_DOMAIN_VDOSYS1>;
  1078								clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VDO1>,
  1079									 <&topckgen CLK_TOP_CFGREG_F26M_VDO1>,
  1080									 <&vdosys1 CLK_VDO1_SMI_LARB2>,
  1081									 <&vdosys1 CLK_VDO1_SMI_LARB3>,
  1082									 <&vdosys1 CLK_VDO1_GALS>;
  1083								clock-names = "vdosys10", "vdosys11", "vdosys1-0",
  1084									      "vdosys1-1", "vdosys1-2";
  1085								#address-cells = <1>;
  1086								#size-cells = <0>;
  1087								#power-domain-cells = <1>;
  1088								mediatek,infracfg = <&infracfg_ao>;
  1089	
  1090								power-domain@MT8188_POWER_DOMAIN_HDMI_TX {
  1091									reg = <MT8188_POWER_DOMAIN_HDMI_TX>;
  1092									clocks = <&topckgen CLK_TOP_HDMI_APB>,
  1093										 <&topckgen CLK_TOP_HDCP_24M>;
  1094									clock-names = "hdmi_tx0", "hdmi_tx1";
  1095									#power-domain-cells = <0>;
  1096									mediatek,infracfg = <&infracfg_ao>;
  1097								};
  1098	
  1099								power-domain@MT8188_POWER_DOMAIN_DP_TX {
  1100									reg = <MT8188_POWER_DOMAIN_DP_TX>;
  1101									#power-domain-cells = <0>;
  1102									mediatek,infracfg = <&infracfg_ao>;
  1103								};
  1104	
  1105								power-domain@MT8188_POWER_DOMAIN_EDP_TX {
  1106									reg = <MT8188_POWER_DOMAIN_EDP_TX>;
  1107									#power-domain-cells = <0>;
  1108									mediatek,infracfg = <&infracfg_ao>;
  1109								};
  1110							};
  1111	
  1112							power-domain@MT8188_POWER_DOMAIN_VENC {
  1113								reg = <MT8188_POWER_DOMAIN_VENC>;
  1114								clocks = <&vencsys CLK_VENC1_LARB>,
  1115									 <&vencsys CLK_VENC1_VENC>,
  1116									 <&vencsys CLK_VENC1_GALS>,
  1117									 <&vencsys CLK_VENC1_GALS_SRAM>;
  1118								clock-names = "venc-0", "venc-1", "venc-2", "venc-3";
  1119								#power-domain-cells = <0>;
  1120								mediatek,infracfg = <&infracfg_ao>;
  1121							};
  1122	
  1123							power-domain@MT8188_POWER_DOMAIN_WPE {
  1124								reg = <MT8188_POWER_DOMAIN_WPE>;
  1125								clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
  1126									 <&wpesys CLK_WPE_TOP_SMI_LARB7_PCLK_EN>;
  1127								clock-names = "wpe-0", "wpe-1";
  1128								#power-domain-cells = <0>;
  1129								mediatek,infracfg = <&infracfg_ao>;
  1130							};
  1131	
  1132							img_vcore: power-domain@MT8188_POWER_DOMAIN_IMG_VCORE {
  1133								reg = <MT8188_POWER_DOMAIN_IMG_VCORE>;
  1134								clocks = <&topckgen CLK_TOP_IMG>,
  1135									 <&topckgen CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS>;
  1136								clock-names = "img_vcore0", "img_vcore1";
  1137								#address-cells = <1>;
  1138								#size-cells = <0>;
  1139								#power-domain-cells = <1>;
  1140								mediatek,infracfg = <&infracfg_ao>;
  1141	
  1142								power-domain@MT8188_POWER_DOMAIN_IMG_MAIN {
  1143									reg = <MT8188_POWER_DOMAIN_IMG_MAIN>;
  1144									clocks = <&imgsys CLK_IMGSYS_MAIN_LARB9>,
  1145										 <&imgsys CLK_IMGSYS_MAIN_VCORE_GALS>,
  1146										 <&imgsys CLK_IMGSYS_MAIN_DIP0>,
  1147										 <&imgsys CLK_IMGSYS_MAIN_GALS>;
  1148									clock-names = "img_main-0", "img_main-1",
  1149										      "img_main-2", "img_main-3";
  1150									#address-cells = <1>;
  1151									#size-cells = <0>;
  1152									#power-domain-cells = <1>;
  1153									mediatek,infracfg = <&infracfg_ao>;
  1154	
  1155									power-domain@MT8188_POWER_DOMAIN_DIP {
  1156										reg = <MT8188_POWER_DOMAIN_DIP>;
  1157										clocks = <&imgsys CLK_IMGSYS_MAIN_WPE0>,
  1158											 <&imgsys CLK_IMGSYS_MAIN_IPE>,
  1159											 <&imgsys CLK_IMGSYS_MAIN_WPE1>,
  1160											 <&imgsys CLK_IMGSYS_MAIN_WPE2>,
  1161											 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>,
  1162											 <&imgsys_wpe1 CLK_IMGSYS_WPE1_LARB11>,
  1163											 <&imgsys_wpe2 CLK_IMGSYS_WPE2_LARB11>,
  1164											 <&imgsys_wpe3 CLK_IMGSYS_WPE3_LARB11>,
  1165											 <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_LARB15>;
  1166										clock-names = "dip-0", "dip-1", "dip-2",
  1167											      "dip-3", "dip-4", "dip-5",
  1168											      "dip-6", "dip-7", "dip-8";
  1169										#power-domain-cells = <0>;
  1170										mediatek,larb = <&imgsys1_dip_top &imgsys_wpe1
  1171												 &imgsys_wpe3 &imgsys_wpe2
  1172												 &imgsys1_dip_nr>;
  1173										mediatek,smi = <&smi_img0 &smi_img1>;
  1174									};
  1175	
  1176									power-domain@MT8188_POWER_DOMAIN_IPE {
  1177										reg = <MT8188_POWER_DOMAIN_IPE>;
  1178										clocks = <&topckgen CLK_TOP_IPE>,
  1179											 <&imgsys CLK_IMGSYS_MAIN_IPE>,
  1180											 <&ipesys CLK_IPE_SMI_LARB12>;
  1181										clock-names= "ipe0", "ipe-0", "ipe-1";
  1182										#power-domain-cells = <0>;
  1183										mediatek,larb = <&ipesys>;
  1184										mediatek,smi = <&smi_img1>;
  1185									};
  1186								};
  1187							};
  1188						};
  1189					};
  1190	
  1191					power-domain@MT8188_POWER_DOMAIN_PEXTP_MAC_P0 {
  1192						reg = <MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
  1193						clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>;
  1194						clock-names = "pextp_mac_p0-0";
  1195						#power-domain-cells = <0>;
  1196						mediatek,infracfg = <&infracfg_ao>;
  1197					};
  1198	
  1199					power-domain@MT8188_POWER_DOMAIN_CSIRX_TOP {
  1200						reg = <MT8188_POWER_DOMAIN_CSIRX_TOP>;
  1201						clocks = <&topckgen CLK_TOP_SENINF>,
  1202							 <&topckgen CLK_TOP_SENINF1>;
  1203						clock-names = "csirx_top0", "csirx_top1";
  1204						#power-domain-cells = <0>;
  1205					};
  1206	
  1207					power-domain@MT8188_POWER_DOMAIN_PEXTP_PHY_TOP {
  1208						reg = <MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
  1209						#power-domain-cells = <0>;
  1210					};
  1211	
  1212					power-domain@MT8188_POWER_DOMAIN_ADSP_AO {
  1213						reg = <MT8188_POWER_DOMAIN_ADSP_AO>;
  1214						#address-cells = <1>;
  1215						#size-cells = <0>;
  1216						#power-domain-cells = <1>;
  1217						mediatek,infracfg = <&infracfg_ao>;
  1218	
  1219						power-domain@MT8188_POWER_DOMAIN_ADSP_INFRA {
  1220							reg = <MT8188_POWER_DOMAIN_ADSP_INFRA>;
  1221							clocks = <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
  1222								 <&topckgen CLK_TOP_ADSP>;
  1223							clock-names = "adsp_infra0", "adsp_infra1";
  1224							#address-cells = <1>;
  1225							#size-cells = <0>;
  1226							#power-domain-cells = <1>;
  1227							mediatek,infracfg = <&infracfg_ao>;
  1228	
  1229							power-domain@MT8188_POWER_DOMAIN_AUDIO_ASRC {
  1230								reg = <MT8188_POWER_DOMAIN_AUDIO_ASRC>;
  1231								clocks = <&topckgen CLK_TOP_ASM_H>;
  1232								clock-names = "audio_asrc0";
  1233								#power-domain-cells = <0>;
  1234								mediatek,infracfg = <&infracfg_ao>;
  1235							};
  1236	
  1237							power-domain@MT8188_POWER_DOMAIN_AUDIO {
  1238								reg = <MT8188_POWER_DOMAIN_AUDIO>;
  1239								clocks = <&topckgen CLK_TOP_A1SYS_HP>,
  1240									 <&topckgen CLK_TOP_AUD_INTBUS>,
  1241									 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>;
  1242								clock-names = "audio0", "audio1", "audio2";
  1243								#power-domain-cells = <0>;
  1244								mediatek,infracfg = <&infracfg_ao>;
  1245							};
  1246	
  1247							power-domain@MT8188_POWER_DOMAIN_ADSP {
  1248								reg = <MT8188_POWER_DOMAIN_ADSP>;
  1249								clocks = <&apmixedsys CLK_APMIXED_ADSPPLL>;
  1250								clock-names = "clk_apmixed_adsppll";
  1251								#power-domain-cells = <0>;
  1252								mediatek,infracfg = <&infracfg_ao>;
  1253							};
  1254						};
  1255					};
  1256	
  1257					power-domain@MT8188_POWER_DOMAIN_ETHER {
  1258						reg = <MT8188_POWER_DOMAIN_ETHER>;
  1259						clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
  1260						clock-names = "ether0";
  1261						#power-domain-cells = <0>;
  1262						mediatek,infracfg = <&infracfg_ao>;
  1263					};
  1264				};
  1265			};
  1266	
  1267			watchdog: watchdog@10007000 {
  1268				compatible = "mediatek,mt8188-wdt";
  1269				reg = <0 0x10007000 0 0x100>;
  1270				#reset-cells = <1>;
  1271				mediatek,disable-extrst;
  1272			};
  1273	
  1274			apmixedsys: syscon@1000c000 {
  1275				compatible = "mediatek,mt8188-apmixedsys", "syscon";
  1276				reg = <0 0x1000c000 0 0x1000>;
  1277				#clock-cells = <1>;
  1278			};
  1279	
  1280			systimer: timer@10017000 {
  1281				compatible = "mediatek,mt8188-timer", "mediatek,mt6765-timer";
  1282				reg = <0 0x10017000 0 0x1000>;
  1283				reg-names = "sys_timer_base";
  1284				clocks = <&clk13m>;
  1285				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
  1286			};
  1287	
  1288			pwrap: syscon@10024000 {
  1289				compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";
  1290				reg = <0 0x10024000 0 0x1000>;
  1291				reg-names = "pwrap";
  1292				clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
  1293					 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
  1294				clock-names = "spi", "wrap";
  1295				interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
  1296			};
  1297	
  1298			spmi: spmi@10027000 {
  1299				compatible = "mediatek,mt8188-spmi", "mediatek,mt8195-spmi";
  1300				reg = <0 0x10027000 0 0x000e00>,
  1301				      <0 0x10029000 0 0x000100>;
  1302				reg-names = "pmif", "spmimst";
  1303				assigned-clocks = <&topckgen CLK_TOP_SPMI_M_MST>;
  1304				assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
  1305				clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
  1306					 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
  1307					 <&topckgen CLK_TOP_SPMI_M_MST>;
  1308				clock-names = "pmif_sys_ck",
  1309					      "pmif_tmr_ck",
  1310					      "spmimst_clk_mux";
  1311			};
  1312	
  1313			infra_iommu: iommu@10315000 {
  1314				compatible = "mediatek,mt8188-iommu-infra";
  1315				reg = <0 0x10315000 0 0x1000>;
  1316				interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH 0>;
  1317				#iommu-cells = <1>;
  1318			};
  1319	
  1320			gce0: mailbox@10320000 {
  1321				compatible = "mediatek,mt8188-gce";
  1322				reg = <0 0x10320000 0 0x4000>;
  1323				#mbox-cells = <2>;
  1324				clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
  1325				interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
  1326				mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
  1327				mediatek,gce-events = <CMDQ_SYNC_TOKEN_SECURE_THR_EOF>;
  1328			};
  1329	
  1330			gce1: mailbox@10330000 {
  1331				compatible = "mediatek,mt8188-gce";
  1332				reg = <0 0x10330000 0 0x4000>;
  1333				#mbox-cells = <2>;
  1334				clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
  1335				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
  1336			};
  1337	
  1338			scp_cluster: scp@10500000 {
  1339				compatible = "mediatek,mt8188-scp-dual";
  1340				reg = <0 0x10720000 0 0xe0000>;
  1341				reg-names = "cfg";
  1342				#address-cells = <1>;
  1343				#size-cells = <1>;
  1344				ranges = <0 0 0x10500000 0x100000>;
  1345				status = "disabled";
  1346	
  1347				scp_c0: scp@0 {
  1348					compatible = "mediatek,scp-core";
  1349					reg = <0x0 0xd0000>;
  1350					reg-names = "sram";
  1351					interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
  1352					status = "disabled";
  1353				};
  1354	
  1355				scp_c1: scp@d0000 {
  1356					compatible = "mediatek,scp-core";
  1357					reg = <0xd0000 0x2f000>;
  1358					reg-names = "sram";
  1359					interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
  1360					status = "disabled";
  1361				};
  1362			};
  1363	
  1364			afe: audio-controller@10b10000 {
  1365				compatible = "mediatek,mt8188-afe";
  1366				reg = <0 0x10b10000 0 0x10000>;
  1367				assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
  1368				assigned-clock-parents =  <&clk26m>;
  1369				clocks = <&clk26m>,
  1370					 <&apmixedsys CLK_APMIXED_APLL1>,
  1371					 <&apmixedsys CLK_APMIXED_APLL2>,
  1372					 <&topckgen CLK_TOP_APLL12_CK_DIV0>,
  1373					 <&topckgen CLK_TOP_APLL12_CK_DIV1>,
  1374					 <&topckgen CLK_TOP_APLL12_CK_DIV2>,
  1375					 <&topckgen CLK_TOP_APLL12_CK_DIV3>,
  1376					 <&topckgen CLK_TOP_APLL12_CK_DIV9>,
  1377					 <&topckgen CLK_TOP_A1SYS_HP>,
  1378					 <&topckgen CLK_TOP_AUD_INTBUS>,
  1379					 <&topckgen CLK_TOP_AUDIO_H>,
  1380					 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
  1381					 <&topckgen CLK_TOP_DPTX>,
  1382					 <&topckgen CLK_TOP_I2SO1>,
  1383					 <&topckgen CLK_TOP_I2SO2>,
  1384					 <&topckgen CLK_TOP_I2SI1>,
  1385					 <&topckgen CLK_TOP_I2SI2>,
  1386					 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>,
  1387					 <&topckgen CLK_TOP_APLL1_D4>,
  1388					 <&topckgen CLK_TOP_APLL2_D4>,
  1389					 <&topckgen CLK_TOP_APLL12_CK_DIV4>,
  1390					 <&topckgen CLK_TOP_A2SYS>,
  1391					 <&topckgen CLK_TOP_AUD_IEC>;
  1392				clock-names = "clk26m",
  1393					      "apll1",
  1394					      "apll2",
  1395					      "apll12_div0",
  1396					      "apll12_div1",
  1397					      "apll12_div2",
  1398					      "apll12_div3",
  1399					      "apll12_div9",
  1400					      "top_a1sys_hp",
  1401					      "top_aud_intbus",
  1402					      "top_audio_h",
  1403					      "top_audio_local_bus",
  1404					      "top_dptx",
  1405					      "top_i2so1",
  1406					      "top_i2so2",
  1407					      "top_i2si1",
  1408					      "top_i2si2",
  1409					      "adsp_audio_26m",
  1410					      "apll1_d4",
  1411					      "apll2_d4",
  1412					      "apll12_div4",
  1413					      "top_a2sys",
  1414					      "top_aud_iec";
  1415				interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
  1416				power-domains = <&spm MT8188_POWER_DOMAIN_AUDIO>;
  1417				resets = <&watchdog 14>;
  1418				reset-names = "audiosys";
  1419				mediatek,infracfg = <&infracfg_ao>;
  1420				mediatek,topckgen = <&topckgen>;
  1421				status = "disabled";
  1422			};
  1423	
  1424			adsp: adsp@10b80000 {
  1425				compatible = "mediatek,mt8188-dsp";
  1426				reg = <0 0x10b80000 0 0x2000>,
  1427				      <0 0x10d00000 0 0x80000>,
  1428				      <0 0x10b8b000 0 0x100>,
  1429				      <0 0x10b8f000 0 0x1000>;
  1430				reg-names = "cfg", "sram", "sec", "bus";
  1431				assigned-clocks = <&topckgen CLK_TOP_ADSP>;
  1432				clocks = <&topckgen CLK_TOP_ADSP>,
  1433					 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>;
  1434				clock-names = "audiodsp",
  1435					      "adsp_bus";
  1436				interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH 0>;
  1437				interrupt-names = "wdt";
  1438				mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
  1439				mbox-names = "rx", "tx";
  1440				power-domains = <&spm MT8188_POWER_DOMAIN_ADSP>;
  1441				status = "disabled";
  1442			};
  1443	
  1444			adsp_mailbox0: mailbox@10b86000 {
  1445				compatible = "mediatek,mt8186-adsp-mbox";
  1446				reg = <0 0x10b86100 0 0x1000>;
  1447				interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
  1448				#mbox-cells = <0>;
  1449			};
  1450	
  1451			adsp_mailbox1: mailbox@10b87000 {
  1452				compatible = "mediatek,mt8186-adsp-mbox";
  1453				reg = <0 0x10b87100 0 0x1000>;
  1454				interrupts = <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH 0>;
  1455				#mbox-cells = <0>;
  1456			};
  1457	
  1458			adsp_audio26m: clock-controller@10b91100 {
  1459				compatible = "mediatek,mt8188-adsp-audio26m";
  1460				reg = <0 0x10b91100 0 0x100>;
  1461				#clock-cells = <1>;
  1462			};
  1463	
  1464			uart0: serial@11001100 {
  1465				compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
  1466				reg = <0 0x11001100 0 0x100>;
  1467				clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
  1468				clock-names = "baud", "bus";
  1469				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
  1470				status = "disabled";
  1471			};
  1472	
  1473			uart1: serial@11001200 {
  1474				compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
  1475				reg = <0 0x11001200 0 0x100>;
  1476				clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
  1477				clock-names = "baud", "bus";
  1478				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
  1479				status = "disabled";
  1480			};
  1481	
  1482			uart2: serial@11001300 {
  1483				compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
  1484				reg = <0 0x11001300 0 0x100>;
  1485				clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
  1486				clock-names = "baud", "bus";
  1487				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
  1488				status = "disabled";
  1489			};
  1490	
  1491			uart3: serial@11001400 {
  1492				compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
  1493				reg = <0 0x11001400 0 0x100>;
  1494				clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
  1495				clock-names = "baud", "bus";
  1496				interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
  1497				status = "disabled";
  1498			};
  1499	
  1500			auxadc: adc@11002000 {
  1501				compatible = "mediatek,mt8188-auxadc", "mediatek,mt8173-auxadc";
  1502				reg = <0 0x11002000 0 0x1000>;
  1503				clocks = <&infracfg_ao CLK_INFRA_AO_AUXADC>;
  1504				clock-names = "main";
  1505				#io-channel-cells = <1>;
  1506				status = "disabled";
  1507			};
  1508	
  1509			pericfg_ao: syscon@11003000 {
  1510				compatible = "mediatek,mt8188-pericfg-ao", "syscon";
  1511				reg = <0 0x11003000 0 0x1000>;
  1512				#clock-cells = <1>;
  1513			};
  1514	
  1515			spi0: spi@1100a000 {
  1516				compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
  1517				reg = <0 0x1100a000 0 0x1000>;
  1518				#address-cells = <1>;
  1519				#size-cells = <0>;
  1520				clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
  1521					 <&topckgen CLK_TOP_SPI>,
  1522					 <&infracfg_ao CLK_INFRA_AO_SPI0>;
  1523				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1524				interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>;
  1525				status = "disabled";
  1526			};
  1527	
  1528			svs: svs@1100b000 {
  1529				compatible = "mediatek,mt8188-svs";
  1530				reg = <0 0x1100b000 0 0x1000>;
  1531				clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
  1532				clock-names = "main";
  1533				interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH 0>;
  1534				nvmem-cells = <&efuse_svs_calib>,
  1535					      <&efuse_lvts_calib>;
  1536				nvmem-cell-names = "svs-calibration-data",
  1537						   "t-calibration-data";
  1538				resets = <&infracfg_ao MT8188_INFRA_RST3_PTP_CTRL_RST>;
  1539				reset-names = "svs_rst";
  1540			};
  1541	
  1542			lvtsap: lvts@1100b000 {
  1543				compatible = "mediatek,mt8188-lvts-ap";
  1544				reg = <0 0x1100b000 0 0x1000>;
  1545				clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
  1546				interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
  1547				nvmem-cells = <&efuse_lvts_calib>;
  1548				nvmem-cell-names = "lvts_calib_data1";
  1549				resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_CTRL_RST>;
  1550				#thermal-sensor-cells = <1>;
  1551			};
  1552	
  1553			disp_pwm0: pwm@1100e000 {
  1554				compatible = "mediatek,mt8188-disp-pwm",
  1555					     "mediatek,mt8183-disp-pwm";
  1556				reg = <0 0x1100e000 0 0x1000>;
  1557				clocks = <&topckgen CLK_TOP_DISP_PWM0>,
  1558					 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>,
  1559					 <&topckgen CLK_TOP_ULPOSC1_D4>;
  1560				clock-names = "main", "mm", "pwm_src";
  1561				interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
  1562				#pwm-cells = <2>;
  1563				status = "disabled";
  1564			};
  1565	
  1566			disp_pwm1: pwm@1100f000 {
  1567				compatible = "mediatek,mt8188-disp-pwm",
  1568					     "mediatek,mt8183-disp-pwm";
  1569				reg = <0 0x1100f000 0 0x1000>;
  1570				clocks = <&topckgen CLK_TOP_DISP_PWM1>,
  1571					 <&infracfg_ao CLK_INFRA_AO_DISP_PWM1>,
  1572					 <&topckgen CLK_TOP_ULPOSC1_D4>;
  1573				clock-names = "main", "mm", "pwm_src";
  1574				interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
  1575				#pwm-cells = <2>;
  1576				status = "disabled";
  1577			};
  1578	
  1579			spi1: spi@11010000 {
  1580				compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
  1581				reg = <0 0x11010000 0 0x1000>;
  1582				#address-cells = <1>;
  1583				#size-cells = <0>;
  1584				clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
  1585					 <&topckgen CLK_TOP_SPI>,
  1586					 <&infracfg_ao CLK_INFRA_AO_SPI1>;
  1587				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1588				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>;
  1589				status = "disabled";
  1590			};
  1591	
  1592			spi2: spi@11012000 {
  1593				compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
  1594				reg = <0 0x11012000 0 0x1000>;
  1595				#address-cells = <1>;
  1596				#size-cells = <0>;
  1597				clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
  1598					 <&topckgen CLK_TOP_SPI>,
  1599					 <&infracfg_ao CLK_INFRA_AO_SPI2>;
  1600				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1601				interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
  1602				status = "disabled";
  1603			};
  1604	
  1605			spi3: spi@11013000 {
  1606				compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
  1607				reg = <0 0x11013000 0 0x1000>;
  1608				#address-cells = <1>;
  1609				#size-cells = <0>;
  1610				clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
  1611					 <&topckgen CLK_TOP_SPI>,
  1612					 <&infracfg_ao CLK_INFRA_AO_SPI3>;
  1613				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1614				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
  1615				status = "disabled";
  1616			};
  1617	
  1618			spi4: spi@11018000 {
  1619				compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
  1620				reg = <0 0x11018000 0 0x1000>;
  1621				#address-cells = <1>;
  1622				#size-cells = <0>;
  1623				clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
  1624					 <&topckgen CLK_TOP_SPI>,
  1625					 <&infracfg_ao CLK_INFRA_AO_SPI4>;
  1626				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1627				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
  1628				status = "disabled";
  1629			};
  1630	
  1631			spi5: spi@11019000 {
  1632				compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
  1633				reg = <0 0x11019000 0 0x1000>;
  1634				#address-cells = <1>;
  1635				#size-cells = <0>;
  1636				clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
  1637					 <&topckgen CLK_TOP_SPI>,
  1638					 <&infracfg_ao CLK_INFRA_AO_SPI5>;
  1639				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1640				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
  1641				status = "disabled";
  1642			};
  1643	
  1644			xhci1: usb@11200000 {
  1645				compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
  1646				reg = <0 0x11200000 0 0x1000>,
  1647				      <0 0x11203e00 0 0x0100>;
  1648				reg-names = "mac", "ippc";
  1649				assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
  1650						  <&topckgen CLK_TOP_SSUSB_XHCI>;
  1651				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
  1652							 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
  1653				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
  1654					 <&topckgen CLK_TOP_SSUSB_TOP_REF>,
  1655					 <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
  1656				clock-names = "sys_ck", "ref_ck", "mcu_ck";
  1657				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
  1658				phys = <&u2port1 PHY_TYPE_USB2>,
  1659				       <&u3port1 PHY_TYPE_USB3>;
  1660				wakeup-source;
  1661				mediatek,syscon-wakeup = <&pericfg 0x468 2>;
  1662				status = "disabled";
  1663			};
  1664	
  1665			mmc0: mmc@11230000 {
  1666				compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
  1667				reg = <0 0x11230000 0 0x10000>,
  1668				      <0 0x11f50000 0 0x1000>;
  1669				clocks = <&topckgen CLK_TOP_MSDC50_0>,
  1670					 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
  1671					 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>,
  1672					 <&infracfg_ao CLK_INFRA_AO_RG_AES_MSDCFDE_CK_0P>;
  1673				clock-names = "source", "hclk", "source_cg", "crypto_clk";
  1674				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
  1675				status = "disabled";
  1676			};
  1677	
  1678			mmc1: mmc@11240000 {
  1679				compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
  1680				reg = <0 0x11240000 0 0x1000>,
  1681				      <0 0x11eb0000 0 0x1000>;
  1682				assigned-clocks = <&topckgen CLK_TOP_MSDC30_1>;
  1683				assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
  1684				clocks = <&topckgen CLK_TOP_MSDC30_1>,
  1685					 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
  1686					 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
  1687				clock-names = "source", "hclk", "source_cg";
  1688				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
  1689				status = "disabled";
  1690			};
  1691	
  1692			lvtsmcu: thermal-sensor@11278000 {
  1693				compatible = "mediatek,mt8188-lvts-mcu";
  1694				reg = <0 0x11278000 0 0x1000>;
  1695				clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
  1696				interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
  1697				nvmem-cells = <&efuse_lvts_calib>;
  1698				nvmem-cell-names = "lvts_calib_data1";
  1699				resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_MCU_RST>;
  1700				#thermal-sensor-cells = <1>;
  1701			};
  1702	
  1703			i2c0: i2c@11280000 {
  1704				compatible = "mediatek,mt8188-i2c";
  1705				reg = <0 0x11280000 0 0x1000>,
  1706				      <0 0x10220080 0 0x80>;
  1707				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>;
  1708				clock-div = <1>;
  1709				clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C0>,
  1710					 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
  1711				clock-names = "main", "dma";
  1712				#address-cells = <1>;
  1713				#size-cells = <0>;
  1714				status = "disabled";
  1715			};
  1716	
  1717			i2c2: i2c@11281000 {
  1718				compatible = "mediatek,mt8188-i2c";
  1719				reg = <0 0x11281000 0 0x1000>,
  1720				      <0 0x10220180 0 0x80>;
  1721				interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
  1722				clock-div = <1>;
  1723				clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C2>,
  1724					 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
  1725				clock-names = "main", "dma";
  1726				#address-cells = <1>;
  1727				#size-cells = <0>;
  1728				status = "disabled";
  1729			};
  1730	
  1731			i2c3: i2c@11282000 {
  1732				compatible = "mediatek,mt8188-i2c";
  1733				reg = <0 0x11282000 0 0x1000>,
  1734				      <0 0x10220280 0 0x80>;
  1735				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>;
  1736				clock-div = <1>;
  1737				clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C3>,
  1738					 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
  1739				clock-names = "main", "dma";
  1740				#address-cells = <1>;
  1741				#size-cells = <0>;
  1742				status = "disabled";
  1743			};
  1744	
  1745			imp_iic_wrap_c: clock-controller@11283000 {
  1746				compatible = "mediatek,mt8188-imp-iic-wrap-c";
  1747				reg = <0 0x11283000 0 0x1000>;
  1748				#clock-cells = <1>;
  1749			};
  1750	
  1751			xhci2: usb@112a0000 {
  1752				compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
  1753				reg = <0 0x112a0000 0 0x1000>,
  1754				      <0 0x112a3e00 0 0x0100>;
  1755				reg-names = "mac", "ippc";
  1756				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_3P>,
  1757						  <&topckgen CLK_TOP_USB_TOP_3P>;
  1758				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
  1759							 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
  1760				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
  1761					 <&topckgen CLK_TOP_SSUSB_TOP_P3_REF>,
  1762					 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
  1763				clock-names = "sys_ck", "ref_ck", "mcu_ck";
  1764				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
  1765				phys = <&u2port2 PHY_TYPE_USB2>;
  1766				wakeup-source;
  1767				mediatek,syscon-wakeup = <&pericfg 0x470 2>;
  1768				status = "disabled";
  1769			};
  1770	
  1771			xhci0: usb@112b0000 {
  1772				compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
  1773				reg = <0 0x112b0000 0 0x1000>,
  1774				      <0 0x112b3e00 0 0x0100>;
  1775				reg-names = "mac", "ippc";
  1776				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>,
  1777						  <&topckgen CLK_TOP_USB_TOP_2P>;
  1778				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
  1779							 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
  1780				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
  1781					 <&topckgen CLK_TOP_SSUSB_TOP_P2_REF>,
  1782					 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
  1783				clock-names = "sys_ck", "ref_ck", "mcu_ck";
  1784				interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
  1785				phys = <&u2port0 PHY_TYPE_USB2>;
  1786				wakeup-source;
  1787				mediatek,syscon-wakeup = <&pericfg 0x460 2>;
  1788				status = "disabled";
  1789			};
  1790	
  1791			pcie: pcie@112f0000 {
  1792				device_type = "pci";
  1793				compatible = "mediatek,mt8188-pcie",
  1794					     "mediatek,mt8192-pcie";
  1795				reg = <0 0x112f0000 0 0x2000>;
  1796				reg-names = "pcie-mac";
  1797				ranges = <0x82000000 0 0x20000000
  1798					  0x0 0x20000000 0 0x04000000>;
  1799				bus-range = <0x00 0xff>;
  1800				#address-cells = <3>;
  1801				#size-cells = <2>;
  1802				clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_TL_26M>,
  1803					 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
  1804					 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_32K>,
  1805					 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
  1806					 <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>,
  1807					 <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P0>;
  1808				#interrupt-cells = <1>;
  1809				interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>;
  1810				interrupt-map = <0 0 0 1 &pcie_intc 0>,
  1811						<0 0 0 2 &pcie_intc 1>,
  1812						<0 0 0 3 &pcie_intc 2>,
  1813						<0 0 0 4 &pcie_intc 3>;
  1814				interrupt-map-mask = <0 0 0 7>;
  1815				iommu-map = <0x0000 &infra_iommu IFR_IOMMU_PORT_PCIE_0
  1816					     0xFFFF>;
  1817				iommu-map-mask = <0x0>;
  1818				linux,pci-domain = <0>;
  1819				phys = <&pcieport PHY_TYPE_PCIE>;
  1820				phy-names = "pcie-phy";
  1821				power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
  1822				status = "disabled";
  1823	
  1824				pcie_intc: interrupt-controller {
  1825					interrupt-controller;
  1826					#address-cells = <0>;
  1827					#interrupt-cells = <1>;
  1828				};
  1829			};
  1830	
  1831			nor_flash: spi@1132c000 {
  1832				compatible = "mediatek,mt8188-nor", "mediatek,mt8186-nor";
  1833				reg = <0 0x1132c000 0 0x1000>;
  1834				#address-cells = <1>;
  1835				#size-cells = <0>;
  1836				assigned-clocks = <&topckgen CLK_TOP_SPINOR>;
  1837				clocks = <&topckgen CLK_TOP_SPINOR>,
  1838					 <&pericfg_ao CLK_PERI_AO_FLASHIFLASHCK>,
  1839					 <&pericfg_ao CLK_PERI_AO_FLASHIF_BUS>;
  1840				clock-names = "spi", "sf", "axi";
  1841				interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
  1842				status = "disabled";
  1843			};
  1844	
  1845			pciephy: t-phy@11c20700 {
  1846				compatible = "mediatek,generic-tphy-v2";
  1847				ranges = <0x0 0x0 0x11c20700 0x700>;
  1848				#address-cells = <1>;
  1849				#size-cells = <1>;
  1850				power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
  1851				status = "disabled";
  1852	
  1853				pcieport: pcie-phy@0 {
  1854					reg = <0 0x700>;
  1855					clocks = <&topckgen CLK_TOP_CFGREG_F_PCIE_PHY_REF>;
  1856					clock-names = "ref";
  1857					#phy-cells = <1>;
  1858				};
  1859			};
  1860	
  1861			mipi_tx_config0: phy@11c80000 {
  1862				compatible = "mediatek,mt8188-mipi-tx",
  1863					     "mediatek,mt8183-mipi-tx";
  1864				reg = <0 0x11c80000 0 0x1000>;
  1865				#clock-cells = <0>;
  1866				clocks = <&clk26m>;
  1867				clock-output-names = "mipi_tx0_pll";
  1868				#phy-cells = <0>;
  1869				status = "disabled";
  1870			};
  1871	
  1872			i2c1: i2c@11e00000 {
  1873				compatible = "mediatek,mt8188-i2c";
  1874				reg = <0 0x11e00000 0 0x1000>,
  1875				      <0 0x10220100 0 0x80>;
  1876				interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
  1877				clock-div = <1>;
  1878				clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C1>,
  1879					 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
  1880				clock-names = "main", "dma";
  1881				#address-cells = <1>;
  1882				#size-cells = <0>;
  1883				status = "disabled";
  1884			};
  1885	
  1886			i2c4: i2c@11e01000 {
  1887				compatible = "mediatek,mt8188-i2c";
  1888				reg = <0 0x11e01000 0 0x1000>,
  1889				      <0 0x10220380 0 0x80>;
  1890				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>;
  1891				clock-div = <1>;
  1892				clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C4>,
  1893					 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
  1894				clock-names = "main", "dma";
  1895				#address-cells = <1>;
  1896				#size-cells = <0>;
  1897				status = "disabled";
  1898			};
  1899	
  1900			imp_iic_wrap_w: clock-controller@11e02000 {
  1901				compatible = "mediatek,mt8188-imp-iic-wrap-w";
  1902				reg = <0 0x11e02000 0 0x1000>;
  1903				#clock-cells = <1>;
  1904			};
  1905	
  1906			u3phy0: t-phy@11e30000 {
  1907				compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
  1908				#address-cells = <1>;
  1909				#size-cells = <1>;
  1910				ranges = <0x0 0x0 0x11e30000 0x1000>;
  1911				status = "disabled";
  1912	
  1913				u2port0: usb-phy@0 {
  1914					reg = <0x0 0x700>;
  1915					clocks = <&topckgen CLK_TOP_SSUSB_PHY_P2_REF>,
  1916						 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
  1917					clock-names = "ref", "da_ref";
  1918					#phy-cells = <1>;
  1919				};
  1920			};
  1921	
  1922			u3phy1: t-phy@11e40000 {
  1923				compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
  1924				#address-cells = <1>;
  1925				#size-cells = <1>;
  1926				ranges = <0x0 0x0 0x11e40000 0x1000>;
  1927				status = "disabled";
  1928	
  1929				u2port1: usb-phy@0 {
  1930					reg = <0x0 0x700>;
  1931					clocks = <&topckgen CLK_TOP_SSUSB_PHY_REF>,
  1932						 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
  1933					clock-names = "ref", "da_ref";
  1934					#phy-cells = <1>;
  1935				};
  1936	
  1937				u3port1: usb-phy@700 {
  1938					reg = <0x700 0x700>;
  1939					clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>,
  1940						 <&clk26m>;
  1941					clock-names = "ref", "da_ref";
  1942					#phy-cells = <1>;
  1943					status = "disabled";
  1944				};
  1945			};
  1946	
  1947			u3phy2: t-phy@11e80000 {
  1948				compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
  1949				#address-cells = <1>;
  1950				#size-cells = <1>;
  1951				ranges = <0x0 0x0 0x11e80000 0x1000>;
  1952				status = "disabled";
  1953	
  1954				u2port2: usb-phy@0 {
  1955					reg = <0x0 0x700>;
  1956					clocks = <&topckgen CLK_TOP_SSUSB_PHY_P3_REF>,
  1957						 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
  1958					clock-names = "ref", "da_ref";
  1959					#phy-cells = <1>;
  1960				};
  1961			};
  1962	
  1963			i2c5: i2c@11ec0000 {
  1964				compatible = "mediatek,mt8188-i2c";
  1965				reg = <0 0x11ec0000 0 0x1000>,
  1966				      <0 0x10220480 0 0x80>;
  1967				interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>;
  1968				clock-div = <1>;
  1969				clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C5>,
  1970					 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
  1971				clock-names = "main", "dma";
  1972				#address-cells = <1>;
  1973				#size-cells = <0>;
  1974				status = "disabled";
  1975			};
  1976	
  1977			i2c6: i2c@11ec1000 {
  1978				compatible = "mediatek,mt8188-i2c";
  1979				reg = <0 0x11ec1000 0 0x1000>,
  1980				      <0 0x10220600 0 0x80>;
  1981				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
  1982				clock-div = <1>;
  1983				clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C6>,
  1984					 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
  1985				clock-names = "main", "dma";
  1986				#address-cells = <1>;
  1987				#size-cells = <0>;
  1988				status = "disabled";
  1989			};
  1990	
  1991			imp_iic_wrap_en: clock-controller@11ec2000 {
  1992				compatible = "mediatek,mt8188-imp-iic-wrap-en";
  1993				reg = <0 0x11ec2000 0 0x1000>;
  1994				#clock-cells = <1>;
  1995			};
  1996	
  1997			efuse: efuse@11f20000 {
  1998				compatible = "mediatek,mt8188-efuse",
  1999					     "mediatek,efuse";
  2000				reg = <0 0x11f20000 0 0x1000>;
  2001				#address-cells = <1>;
  2002				#size-cells = <1>;
  2003	
  2004				efuse_gpu_tbl0: efuse@40 {
  2005					reg = <0x40 0x4>;
  2006				};
  2007	
  2008				efuse_gpu_tbl1: efuse@4c {
  2009					reg = <0x4c 0x4>;
  2010				};
  2011	
  2012				efuse_hdmi_rx: efuse@50 {
  2013					reg = <0x50 0xc>;
  2014				};
  2015	
  2016				efuse_hdmi_tx: efuse@184 {
  2017					reg = <0x184 0x4>;
  2018				};
  2019	
  2020				efuse_csi0: efuse@18c {
  2021					reg = <0x18c 0x4>;
  2022				};
  2023	
  2024				efuse_csi1: efuse@190 {
  2025					reg = <0x190 0x4>;
  2026				};
  2027	
  2028				efuse_dp_calib: efuse@1a0 {
  2029					reg = <0x1a0 0x10>;
  2030				};
  2031	
  2032				efuse_lvts_calib: efuse@1ac {
  2033					reg = <0x1ac 0x40>;
  2034				};
  2035	
  2036				efuse_svs_calib: efuse@534 {
  2037					reg = <0x534 0x68>;
  2038				};
  2039	
  2040				efuse_gpu_volt_bin: efuse@581 {
  2041					reg = <0x581 0x1>;
  2042					bits = <0 3>;
  2043				};
  2044	
  2045				socinfo-data1@7a0 {
  2046					reg = <0x7a0 0x4>;
  2047				};
  2048	
  2049				socinfo-data2@7e0 {
  2050					reg = <0x7e0 0x4>;
  2051				};
  2052			};
  2053	
  2054			gpu: gpu@13000000 {
  2055				compatible = "mediatek,mt8188-mali", "arm,mali-valhall";
  2056				reg = <0 0x13000000 0 0x4000>;
  2057	
  2058				clocks = <&mfgcfg CLK_MFGCFG_BG3D>;
  2059				interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
  2060					     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
  2061					     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
  2062				interrupt-names = "JOB", "MMU", "GPU";
  2063				nvmem-cells = <&efuse_gpu_volt_bin>;
  2064				nvmem-cell-names = "volt-bin";
  2065				operating-points-v2 = <&gpu_opp_table>;
  2066				power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
  2067						<&spm MT8188_POWER_DOMAIN_MFG3>,
  2068						<&spm MT8188_POWER_DOMAIN_MFG4>;
  2069				power-domain-names = "core0", "core1", "core2";
  2070				#cooling-cells = <2>;
  2071			};
  2072	
  2073			mfgcfg: clock-controller@13fbf000 {
  2074				compatible = "mediatek,mt8188-mfgcfg";
  2075				reg = <0 0x13fbf000 0 0x1000>;
  2076				#clock-cells = <1>;
  2077			};
  2078	
  2079			vppsys0: clock-controller@14000000 {
  2080				compatible = "mediatek,mt8188-vppsys0";
  2081				reg = <0 0x14000000 0 0x1000>;
  2082				#clock-cells = <1>;
  2083			};
  2084	
  2085			vpp_smi_common: smi@14012000 {
  2086				compatible = "mediatek,mt8188-smi-common-vpp";
  2087				reg = <0 0x14012000 0 0x1000>;
  2088				clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
  2089					 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>;
  2090				clock-names = "apb", "smi";
  2091				power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
  2092			};
  2093	
  2094			larb4: smi@14013000 {
  2095				compatible = "mediatek,mt8188-smi-larb";
  2096				reg = <0 0x14013000 0 0x1000>;
  2097				clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
  2098					 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
  2099				clock-names = "apb", "smi";
  2100				power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
  2101				mediatek,larb-id = <SMI_L4_ID>;
  2102				mediatek,smi = <&vpp_smi_common>;
  2103			};
  2104	
  2105			vpp_iommu: iommu@14018000 {
  2106				compatible = "mediatek,mt8188-iommu-vpp";
  2107				reg = <0 0x14018000 0 0x5000>;
  2108				clocks = <&vppsys0 CLK_VPP0_SMI_IOMMU>;
  2109				clock-names = "bclk";
  2110				interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>,
  2111					     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH 0>,
  2112					     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH 0>,
  2113					     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
  2114					     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
  2115				#iommu-cells = <1>;
  2116				power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
  2117				mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb7
  2118						  &larb11b &larb12 &larb14 &larb15
  2119						  &larb16a &larb17a &larb23 &larb27>;
  2120			};
  2121	
  2122			wpesys: clock-controller@14e00000 {
  2123				compatible = "mediatek,mt8188-wpesys";
  2124				reg = <0 0x14e00000 0 0x1000>;
  2125				#clock-cells = <1>;
  2126			};
  2127	
  2128			wpesys_vpp0: clock-controller@14e02000 {
  2129				compatible = "mediatek,mt8188-wpesys-vpp0";
  2130				reg = <0 0x14e02000 0 0x1000>;
  2131				#clock-cells = <1>;
  2132			};
  2133	
  2134			larb7: smi@14e04000 {
  2135				compatible = "mediatek,mt8188-smi-larb";
  2136				reg = <0 0x14e04000 0 0x1000>;
  2137				clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
  2138					 <&wpesys CLK_WPE_TOP_SMI_LARB7>;
  2139				clock-names = "apb", "smi";
  2140				power-domains = <&spm MT8188_POWER_DOMAIN_WPE>;
  2141				mediatek,larb-id = <SMI_L7_ID>;
  2142				mediatek,smi = <&vpp_smi_common>;
  2143			};
  2144	
  2145			vppsys1: clock-controller@14f00000 {
  2146				compatible = "mediatek,mt8188-vppsys1";
  2147				reg = <0 0x14f00000 0 0x1000>;
  2148				#clock-cells = <1>;
  2149			};
  2150	
  2151			larb5: smi@14f02000 {
  2152				compatible = "mediatek,mt8188-smi-larb";
  2153				reg = <0 0x14f02000 0 0x1000>;
  2154				clocks = <&vppsys1 CLK_VPP1_GALS5>,
  2155					 <&vppsys1 CLK_VPP1_LARB5>;
  2156				clock-names = "apb", "smi";
  2157				power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
  2158				mediatek,larb-id = <SMI_L5_ID>;
  2159				mediatek,smi = <&vdo_smi_common>;
  2160			};
  2161	
  2162			larb6: smi@14f03000 {
  2163				compatible = "mediatek,mt8188-smi-larb";
  2164				reg = <0 0x14f03000 0 0x1000>;
  2165				clocks = <&vppsys1 CLK_VPP1_GALS6>,
  2166					 <&vppsys1 CLK_VPP1_LARB6>;
  2167				clock-names = "apb", "smi";
  2168				power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
  2169				mediatek,larb-id = <SMI_L6_ID>;
  2170				mediatek,smi = <&vpp_smi_common>;
  2171			};
  2172	
  2173			imgsys: clock-controller@15000000 {
  2174				compatible = "mediatek,mt8188-imgsys";
  2175				reg = <0 0x15000000 0 0x1000>;
  2176				#clock-cells = <1>;
  2177			};
  2178	
  2179			larb9: smi@15001000 {
  2180				compatible = "mediatek,mt8188-smi-larb";
  2181				reg = <0 0x15001000 0 0x1000>;
  2182				clocks = <&imgsys CLK_IMGSYS_MAIN_LARB9>,
  2183					 <&imgsys CLK_IMGSYS_MAIN_LARB9>;
  2184				clock-names = "apb", "smi";
  2185				power-domains = <&spm MT8188_POWER_DOMAIN_IMG_MAIN>;
  2186				mediatek,larb-id = <SMI_L9_ID>;
  2187				mediatek,smi = <&vdo_smi_common>;
  2188				mediatek,smi-sub-comm = <&smi_img0>;
  2189				mediatek,smi-sub-comm-inport = <0>;
  2190			};
  2191	
  2192			smi_img0: syscon@15002000 {
  2193				compatible = "mediatek,mt8188-smi-img0",
  2194					     "mediatek,mt8188-smi-sub-common", "syscon";
  2195				reg = <0 0x15002000 0 0x1000>;
  2196				clocks = <&vdosys0 CLK_VDO0_SMI_COMMON>,
  2197					 <&vdosys0 CLK_VDO0_SMI_GALS>;
  2198				clock-names = "apb", "smi";
  2199				power-domains = <&spm MT8188_POWER_DOMAIN_IMG_MAIN>;
  2200				mediatek,common-id = <3>;
  2201				mediatek,smi = <&vdo_smi_common>;
  2202			};
  2203	
  2204			smi_img1: syscon@15003000 {
  2205				compatible = "mediatek,mt8188-smi-img1",
  2206					     "mediatek,mt8188-smi-sub-common", "syscon";
  2207				reg = <0 0x15003000 0 0x1000>;
  2208				clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
  2209					 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
  2210				clock-names = "apb", "smi";
  2211				power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
  2212				mediatek,common-id = <4>;
  2213				mediatek,smi = <&vpp_smi_common>;
  2214			};
  2215	
  2216			imgsys1_dip_top: clock-controller@15110000 {
  2217				compatible = "mediatek,mt8188-imgsys1-dip-top";
  2218				reg = <0 0x15110000 0 0x1000>;
  2219				#clock-cells = <1>;
  2220			};
  2221	
  2222			larb10: smi@15120000 {
  2223				compatible = "mediatek,mt8188-smi-larb";
  2224				reg = <0 0x15120000 0 0x1000>;
  2225				clocks = <&imgsys CLK_IMGSYS_MAIN_DIP0>,
  2226					 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>;
  2227				clock-names = "apb", "smi";
  2228				power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
  2229				mediatek,larb-id = <SMI_L10_ID>;
  2230				mediatek,smi = <&vdo_smi_common>;
  2231				mediatek,smi-reset = <&imgsys1_dip_top MT8188_SMI_RST_LARB10>;
  2232				mediatek,smi-sub-comm = <&smi_img0>;
  2233				mediatek,smi-sub-comm-inport = <1>;
  2234			};
  2235	
  2236			imgsys1_dip_nr: clock-controller@15130000 {
  2237				compatible = "mediatek,mt8188-imgsys1-dip-nr";
  2238				reg = <0 0x15130000 0 0x1000>;
  2239				#clock-cells = <1>;
  2240			};
  2241	
  2242			larb15: smi@15140000 {
  2243				compatible = "mediatek,mt8188-smi-larb";
  2244				reg = <0 0x15140000 0 0x1000>;
  2245				clocks = <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>,
  2246					 <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_LARB15>;
  2247				clock-names = "apb", "smi";
  2248				power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
  2249				mediatek,larb-id = <SMI_L15_ID>;
  2250				mediatek,smi = <&vpp_smi_common>;
  2251				mediatek,smi-reset = <&imgsys1_dip_nr MT8188_SMI_RST_LARB15>;
  2252				mediatek,smi-sub-comm = <&smi_img1>;
  2253				mediatek,smi-sub-comm-inport = <1>;
  2254			};
  2255	
  2256			imgsys_wpe1: clock-controller@15220000 {
  2257				compatible = "mediatek,mt8188-imgsys-wpe1";
  2258				reg = <0 0x15220000 0 0x1000>;
  2259				#clock-cells = <1>;
  2260			};
  2261	
  2262			larb11a: smi@15230000 {
  2263				compatible = "mediatek,mt8188-smi-larb";
  2264				reg = <0 0x15230000 0 0x1000>;
  2265				clocks = <&imgsys CLK_IMGSYS_MAIN_WPE0>,
  2266					 <&imgsys_wpe1 CLK_IMGSYS_WPE1_LARB11>;
  2267				clock-names = "apb", "smi";
  2268				power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
  2269				mediatek,larb-id = <SMI_L11A_ID>;
  2270				mediatek,smi = <&vdo_smi_common>;
  2271				mediatek,smi-reset = <&imgsys_wpe1 MT8188_SMI_RST_LARB11A>;
  2272				mediatek,smi-sub-comm = <&smi_img0>;
  2273				mediatek,smi-sub-comm-inport = <2>;
  2274			};
  2275	
  2276			regulator_dvfs_vmm: regulator-dvfs-vmm {
  2277				regulator-name = "dvfs-vmm";
  2278				regulator-min-microvolt = <550000>;
  2279				regulator-max-microvolt = <725000>;
  2280			};
  2281	
> 2282			imgsys-l11b {
  2283				compatible = "mediatek,imgsys-larb";
  2284				#address-cells = <2>;
  2285				#size-cells = <2>;
  2286				dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
  2287				iommus = <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_0>,
  2288					 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_1>,
  2289					 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_0>,
  2290					 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_1>,
  2291					 <&vpp_iommu M4U_PORT_L11B_WPE_CQ0>,
  2292					 <&vpp_iommu M4U_PORT_L11B_WPE_CQ1>,
  2293					 <&vpp_iommu M4U_PORT_L11B_PIMGI_P1>,
  2294					 <&vpp_iommu M4U_PORT_L11B_PIMGBI_P1>,
  2295					 <&vpp_iommu M4U_PORT_L11B_PIMGCI_P1>,
  2296					 <&vpp_iommu M4U_PORT_L11B_IMGI_T1_C>,
  2297					 <&vpp_iommu M4U_PORT_L11B_IMGBI_T1_C>,
  2298					 <&vpp_iommu M4U_PORT_L11B_IMGCI_T1_C>,
  2299					 <&vpp_iommu M4U_PORT_L11B_SMTI_T1_C>,
  2300					 <&vpp_iommu M4U_PORT_L11B_SMTI_T4_C>,
  2301					 <&vpp_iommu M4U_PORT_L11B_SMTI_T6_C>,
  2302					 <&vpp_iommu M4U_PORT_L11B_YUVO_T1_C>,
  2303					 <&vpp_iommu M4U_PORT_L11B_YUVBO_T1_C>,
  2304					 <&vpp_iommu M4U_PORT_L11B_YUVCO_T1_C>,
  2305					 <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_0>,
  2306					 <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_4P_0>,
  2307					 <&vpp_iommu M4U_PORT_L11B_WROT_P1>,
  2308					 <&vpp_iommu M4U_PORT_L11B_TCCSO_P1>,
  2309					 <&vpp_iommu M4U_PORT_L11B_TCCSI_P1>,
  2310					 <&vpp_iommu M4U_PORT_L11B_TIMGO_T1_C>,
  2311					 <&vpp_iommu M4U_PORT_L11B_YUVO_T2_C>,
  2312					 <&vpp_iommu M4U_PORT_L11B_YUVO_T5_C>,
  2313					 <&vpp_iommu M4U_PORT_L11B_SMTO_T1_C>,
  2314					 <&vpp_iommu M4U_PORT_L11B_SMTO_T4_C>,
  2315					 <&vpp_iommu M4U_PORT_L11B_SMTO_T6_C>,
  2316					 <&vpp_iommu M4U_PORT_L11B_DBGO_T1_C>;
  2317			};
  2318	
> 2319			imgsys-l15 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
