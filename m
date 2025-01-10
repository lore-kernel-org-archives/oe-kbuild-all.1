Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0382561D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524894; cv=none; b=WMtLDZrLhsfsU4w4ICGiwbvnaPfr6CpU8MSKmPfHxi4gA9PUyujY2C4l5/TCu3GaYymrWYv9Ljix5kCRQMlfVeThR9+DDLcNBkLXXhos/c8xryLbn+7AhdC8URd0iVpeIfNB3AqPS0I/AQcXg3m2gc7mk9Y3AzWIBcDp0oqrR2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524894; c=relaxed/simple;
	bh=TIgIhI1L6vgaZD8V0Y3N2XMj5qKfkeyZqQO/r7vmOAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5Vy1zjbOBsnDsQCGMvjHIdhKbZKzfA9JbJi0UVttkb8ewNrkfD0uBYJeocqwZnTycIirf2JSqqmKnphP1Ux9gMyCeJljc3NKVFg3gn+jhVS8j5AV3/xZLHXQRsl7VvwAnizWk/i7qXmvdk6kmPwc2h2mhuUAO90Sktqo3wMEAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tf1OReUc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tf1OReUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736524891; x=1768060891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TIgIhI1L6vgaZD8V0Y3N2XMj5qKfkeyZqQO/r7vmOAw=;
  b=Tf1OReUc3I75mq3nEV5P4M3HIUmOIE0A7yiuV5EWELWi5/k7GHFLaX6U
   IN0jx7ymHIvVMAl+Le1ZANzQBgRwWk4rjFVYOGlvEGvKkdiQZE7PAL700
   Bdjtgpa4SUKXLDjlgY2n9Sjfk+T1OGTMDhYT8KRHBRk2ThrbeJ02hIxK1
   etRcnWOoXbAN6OZxoBWw43j0aUZmWEB8IEBwyxYk859S0uswpWqmdeBVz
   h2VbnyLTbJ6BAbOD+kpu1XzN1UisXLFG8x44fRDmuTMaKK206b63dKKr4
   Q75rc1BFZypj1VPvRqEjHmG+TyDETSQnYNCu0wQTWndL/7Uph/2386rQs
   g==;
X-CSE-ConnectionGUID: 5cMVIr7dSmK0oxfQayTcJg==
X-CSE-MsgGUID: fRkuzFZ/Q6if1TTdh7KaxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62193049"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="62193049"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 08:01:30 -0800
X-CSE-ConnectionGUID: K3XK/rouTeOnQqMMLSKyzw==
X-CSE-MsgGUID: Vpzh7jYSSPO/bMxalHlBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108403689"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jan 2025 08:01:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWHRu-000JRS-2k;
	Fri, 10 Jan 2025 16:01:26 +0000
Date: Sat, 11 Jan 2025 00:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 6316/7860]
 arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sysmgr@ffd08000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202501102323.Xnte2yhi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
commit: 456f3000f82571697d23c255c451cfcfb5c9ae75 [6316/7860] dt-bindings: soc: altera: convert socfpga-system.txt to yaml
config: arm-randconfig-052-20250108 (https://download.01.org/0day-ci/archive/20250110/202501102323.Xnte2yhi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102323.Xnte2yhi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102323.Xnte2yhi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: flash@0: Unevaluated properties are not allowed ('partition@qspi-boot', 'partition@qspi-rootfs' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: flash@0: 'partition@qspi-boot', 'partition@qspi-rootfs' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria5_socdk.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: sysmgr@ffd06000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer0@ffc02700: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer1@ffc02800: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sysmgr@ffd06000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: timer0@ffc02700: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: timer1@ffc02800: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: sysmgr@ffd06000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: timer0@ffc02700: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: timer1@ffc02800: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@qspi-boot', 'partition@qspi-rootfs' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: flash@0: 'partition@qspi-boot', 'partition@qspi-rootfs' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: sysmgr@ffd06000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: timer0@ffc02700: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: timer1@ffc02800: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: sysmgr@ffd06000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: timer0@ffc02700: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: timer1@ffc02800: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: spi@fff00000: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: spi@fff01000: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_chameleon96.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: flash@0: Unevaluated properties are not allowed ('partition@qspi-boot', 'partition@qspi-rootfs' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: flash@0: 'partition@qspi-boot', 'partition@qspi-rootfs' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sockit.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socrates.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,n25q128', 'jedec,spi-nor'] is too long
   	'micron,n25q128' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,n25q128' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/spi@ff705000/flash@0: failed to match any schema with compatible: ['micron,n25q128', 'jedec,spi-nor']
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sram@ffff0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: spi@ff705000: resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,sys-mgr', 'syscon'] is too long
   	'altr,sys-mgr-s10' was expected
   	'altr,sys-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_vt.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
