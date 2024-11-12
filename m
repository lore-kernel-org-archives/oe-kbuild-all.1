Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE5A1DFE4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 04:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731384695; cv=none; b=EWwxktAhS+fNYnb8wtAmjQ7rymrlA4onc1veSZbbVYrQYUtH880yLK1E3SQKc/4NY3J3nIOn1/cpruz/cnONrIaP/O2eUJYNPbuUaQsXvdSJwnk8S52HmZCUDrGB8Jz2KVLJr+yJnLCkjqC8J2Gb5SHprmKdYbsdiTKWdb3wuQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731384695; c=relaxed/simple;
	bh=NqJ7fMNFmYBAEpJYu4oSW0bFG2hEN2K4Os3TqgdRg9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2olTrakSja5V+0Ft+U8CQTmXSns3zslRMH+thjfN5QiViT/uLOfne+wTKUjhbFVC+X8b3diIFaLwos1djZ3+4GPt+IDnrKw5SG/r2+WP8uLlyw+rYvjQLpkOEIFmRpZFXWCKLFBtOzMv96Lh5rkquGmw1GOYICkLP/RVal6628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOssMYKL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOssMYKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731384693; x=1762920693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqJ7fMNFmYBAEpJYu4oSW0bFG2hEN2K4Os3TqgdRg9k=;
  b=dOssMYKLLNZWG59/tUYfzQKeMPW4tdP0Yma+baQh7kPJANd16R1r0Fkq
   iXK5gMSy+EFaBi2WeKnIAKZQJ4Z1mVrf9WdBIEUW9iLDbOiPktOJnSFeR
   v66l8poqyXm9PMgl0FPToSjNdOxlQ8wnLnlIa6khNYbPg6mrpTLCqkjZy
   m3Rnh1Sm1aHYpGxe+v297HBspMp/NGUR/XetDtDgjl4TRmkfjAlyeEP4J
   Uva5bX4yvAHz4RcEXApu7WLTyz1bI2hRG8/jH3XeWLkODISbKBDrPFjGD
   0c1O2Gb46cqz5NFYz/t2yXfE9TkMWTWWeOeH0qVWydQ9qejcSVAt4spKZ
   A==;
X-CSE-ConnectionGUID: J/poeNzwQoWKzxF+edughg==
X-CSE-MsgGUID: oO73Qu/qRxarVtkA1cvrfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31355571"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31355571"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 20:11:33 -0800
X-CSE-ConnectionGUID: SppMgEKmTTGI9ap++EXkGg==
X-CSE-MsgGUID: sGArK+x6S4evJQBUE5aQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="92185251"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2024 20:11:31 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAiFU-0000RV-12;
	Tue, 12 Nov 2024 04:11:28 +0000
Date: Tue, 12 Nov 2024 12:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 145/180]
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb:
 /soc/thermal-sensor@1100b000: failed to match any schema with compatible:
 ['mediatek,mt8195-lvts']
Message-ID: <202411121252.LK5eWZIE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   554e1849ad7126d4287063a8fb91fae9e28fe934
commit: b0aa56480cda57f835a4db4be183b8933f40f04d [145/180] CHROMIUM: arm64: dts: mediatek: mt8195: Match DT node name with SVS driver
config: arm64-randconfig-051-20241111 (https://download.01.org/0day-ci/archive/20241112/202411121252.LK5eWZIE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121252.LK5eWZIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121252.LK5eWZIE-lkp@intel.com/

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
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8195-lvts']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/svs@1100bc00: failed to match any schema with compatible: ['mediatek,mt8195-svs']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dma-controller@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: thermal-zones: 'cam1', 'cam2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'cpu_little3', 'cpu_little4', 'gpu2', 'img', 'infra', 'soc_max', 'vdec', 'vpu1', 'vpu2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ec@0: 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8195-lvts']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/svs@1100bc00: failed to match any schema with compatible: ['mediatek,mt8195-svs']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dma-controller@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dma-controller@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: thermal-zones: 'cam1', 'cam2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'cpu_little3', 'cpu_little4', 'gpu2', 'img', 'infra', 'soc_max', 'vdec', 'vpu1', 'vpu2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ec@0: 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8195-lvts']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/svs@1100bc00: failed to match any schema with compatible: ['mediatek,mt8195-svs']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dma-controller@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dma-controller@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: thermal-zones: 'cam1', 'cam2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'cpu_little3', 'cpu_little4', 'gpu2', 'img', 'infra', 'soc_max', 'vdec', 'vpu1', 'vpu2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ec@0: 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8195-lvts']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/svs@1100bc00: failed to match any schema with compatible: ['mediatek,mt8195-svs']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dma-controller@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dma-controller@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: thermal-zones: 'cam1', 'cam2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'cpu_little3', 'cpu_little4', 'gpu2', 'img', 'infra', 'soc_max', 'vdec', 'vpu1', 'vpu2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2995.17-3053.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3070.17-3107.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8195-lvts']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/svs@1100bc00: failed to match any schema with compatible: ['mediatek,mt8195-svs']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dma-controller@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: thermal-zones: 'cam1', 'cam2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'cpu_little3', 'cpu_little4', 'gpu2', 'img', 'infra', 'soc_max', 'vdec', 'vpu1', 'vpu2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000: i2c0-pins:pins: 'mediatek,drive-strength-adv' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000: i2c1-pins:pins: 'mediatek,drive-strength-adv' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000: i2c4-pins:pins: 'mediatek,drive-strength-adv' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8195-lvts']
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: /soc/svs@1100bc00: failed to match any schema with compatible: ['mediatek,mt8195-svs']
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dma-controller@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: thermal-zones: 'cam1', 'cam2', 'cpu_big1', 'cpu_big2', 'cpu_big3', 'cpu_big4', 'cpu_little1', 'cpu_little2', 'cpu_little3', 'cpu_little4', 'gpu2', 'img', 'infra', 'soc_max', 'vdec', 'vpu1', 'vpu2' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
