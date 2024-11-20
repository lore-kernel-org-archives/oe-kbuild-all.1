Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4611BC58
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065151; cv=none; b=u8slEr0UsuXH/+apnqhr5TLwWecV9YXX/rx4M/t5BmWPpOYC40WGcyMSTeBPFZ0CpJqjyJe0P22ZdCCyMW1/EG3oWsMgCFSONuoD9ahophI2ejjLc2InzIP+aFuVk/pt/nrRpgWK86aBzO0eBgllIdbcctZVoZUgNyYLceTOr6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065151; c=relaxed/simple;
	bh=/VuzkUARagv1rJa9bT04IzfifHmgVcUFZp2nS8WHC+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V88TvNdXGGQM6q3RDnwlTLj7liJh3VPEOPJYMesozD67G9BZMMUq5d83LV19Fq+7OLALOG54rozglS53sXyrshFaLZ0F2hyHlCnGBxGWvqXbf3D0hyEGJzWRiXYUxMrzQRc0NP//bGFl7fA2wZOVEBJiLZclGjHXloF3WpRM/oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFiSEN2D; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFiSEN2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065150; x=1763601150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VuzkUARagv1rJa9bT04IzfifHmgVcUFZp2nS8WHC+k=;
  b=MFiSEN2DEqvzbIUyTBQl2KmC6ih+bDYGKs230a3dXy6Ra6NMIFobs3gz
   Df9PoM8kc72wyJQDuFopPCi6dGHtZsK+GLgVLwgd4zaxhRZcGNpXYeZxp
   X5LMs0EHzTpQ0rUtRF1gNNPyHLZN182WdYY3MNhTEvC3MfMiL29ZcqjMU
   Mc+DkOfuBV3W8xMU/g74AOZP5h7ak/Aj1QnYKNJgE3Mo2ob1J5PO6612A
   QmDCSGvYOCW05bWq4UqogSDdFEHPwF9A4IA0myJ5rB5/8OVZLplN3gZiH
   Pq09Yu8owUbZVnJ3io3TQBENlN9LufZ5Z6PSm17UjoxApq75+tQUxTpUd
   Q==;
X-CSE-ConnectionGUID: TmsCPXs7R7yYwN3Zw84gsA==
X-CSE-MsgGUID: 401BTCDpRtyf0510C2BWHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35771917"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="35771917"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:12:29 -0800
X-CSE-ConnectionGUID: Chh49VvGQH6CwJ++FEVs7Q==
X-CSE-MsgGUID: vUiFXMzNTc6odqB61XP13g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="89909994"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2024 17:12:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZGc-0000Ob-1A;
	Wed, 20 Nov 2024 01:12:26 +0000
Date: Wed, 20 Nov 2024 09:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-ea7682dbe6cf 11/520]
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/lvts@1100b000:
 failed to match any schema with compatible: ['mediatek,mt8195-lvts']
Message-ID: <202411192029.qnbGmMyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-ea7682dbe6cf
head:   ac7a77c24fbce62cf3a673f994358d50cb59808a
commit: a4937eb8ac5cd5a6bacccdeaa41f29fc322a799b [11/520] UPSTREAM: arm64: mediatek: mt8195-cherry: Introduce the MT8195 Dojo Chromebook
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241119/202411192029.qnbGmMyV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411192029.qnbGmMyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411192029.qnbGmMyV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ec@0: 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/lvts@1100b000: failed to match any schema with compatible: ['mediatek,mt8195-lvts']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/svs@1100bc00: failed to match any schema with compatible: ['mediatek,mt8195-svs']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: thermal-zones: 'cam1', 'cam2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'img', 'infra', 'soc_max', 'vdec', 'vpu1', 'vpu2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
