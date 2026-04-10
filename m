Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25F3191CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775849597; cv=none; b=EhndbsanWHSs0TOIoR8HMYWg3tuZqfRa4jM9sGHteRoC69tPAc3Yw6bBbyA4BYotDAdugxT2tnzxmMxsE78wn8p84MbMQ+dt0MUh82dde1wxM/25RQlWg4IaeDOkG+TOKoAQCId5oRAr8UM7NR9YZWJyMDXxXAyvpaR7+hWu4PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775849597; c=relaxed/simple;
	bh=QcswINlyRkFKn29RPvK0I0dOTcwYSWd+srJ4T34m+XA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hwdncLZHtyqYkVjcsqAV2PCsccH9yiSkXf9Amt19DMmct4796X6mBMBK9vEYE1g//My2Cavv8E+OA0fBzjT4GLzVsvaz0EWdDVRV5arWTDKzwpuIIwMkxV/Q4dMokV30OpuIbyTsGzDYrNmuLZKErPgYNPxR3/IPJIZaQsqXQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QE5Enk28; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QE5Enk28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775849596; x=1807385596;
  h=date:from:to:cc:subject:message-id;
  bh=QcswINlyRkFKn29RPvK0I0dOTcwYSWd+srJ4T34m+XA=;
  b=QE5Enk28kO8FKi0iiwgRb+Tno9+rtedmLs4oZB98nGWzKlbttrR3Sc0F
   nExEaq8Eqkpuyla4k71HLkaDV/tS/G5VP51YKd0w3mL3YASp5e8EbvuyN
   QC5yqynEoCmsPHraGzLFCSxfOX1CFmybJ0GXs/4mzWYtV9ngbHkjltq1v
   36PrXFJUJAU1xh2/bO1w60vgSwY1QF0fnm+57KyhLSVGhFN7TQsUvwtB4
   9G1lDor6Twuc4kDiz0LumCdb/rpgn8DwHG1LWAYEncH6MXJDVALPiowT7
   XXFTgo657w4FQ+8hwyGw/uVWAUrLot6BEqspMpp5sDGSoCkElfJbkjr3x
   g==;
X-CSE-ConnectionGUID: WWwfrWflTqKzpprPFwlfMw==
X-CSE-MsgGUID: 3A3hM5ppSbGUmmENUoNWUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80740396"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="80740396"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 12:33:13 -0700
X-CSE-ConnectionGUID: cKRfs3byTTeQGQDbvaYGhQ==
X-CSE-MsgGUID: /lHYYlefSZO5lYEiL0hIDQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 12:33:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBHbJ-00000000AwH-3frD;
	Fri, 10 Apr 2026 19:33:09 +0000
Date: Fri, 10 Apr 2026 21:32:37 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 4929/13385]
 arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8):
 port:endpoint: Unevaluated properties are not allowed ('clock-inv', 'crc'
 were unexpected)
Message-ID: <202604102138.BJfQdNK6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa7d958829eb9bc3b469ed07f11de3d2804ef71
commit: d71bd243ef4849013a9ea6ba3a6359894435aacf [4929/13385] media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
config: arm-randconfig-2052-20260409 (https://download.01.org/0day-ci/archive/20260410/202604102138.BJfQdNK6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102138.BJfQdNK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102138.BJfQdNK6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['brcm,bcm2048-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['brcm,bcm2048-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/led-controller@30: failed to match any schema with compatible: ['adi,adp1653']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/si4713@63: failed to match any schema with compatible: ['silabs,si4713']
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): port:endpoint: Unevaluated properties are not allowed ('clock-inv', 'crc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): 'reset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): Unevaluated properties are not allowed ('clock-frequency', 'clock-names', 'reset-gpio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: tsc2005@0 (ti,tsc2005): $nodename:0: 'tsc2005@0' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/spi@480ba000/wl1251@0: failed to match any schema with compatible: ['ti,wl1251']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
