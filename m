Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412054DA14
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719990257; cv=none; b=eqzOr53ZP0/ijsZyg2FMZXQh0ibPN62xZOlRkypGr4mKkTI6sGYj7x86BQZmjI6vkeFiwvbD/9SoHF0Sq70q79sshD4DuNSf3aZFKPJNKUAHZy+vBgtzrT424DWAltRclWdfqVPhGSRFgh99RP0xCqYrQlVJ2S6h1QgrgPYPlcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719990257; c=relaxed/simple;
	bh=KUeG/d1Ea0nJwc2BRGNgVHZGPZnDD7iUYGGlisORPVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNzXwSdYDmBUuYCTorfVLaHxx1UUVJfgeCXOXVT88wNkBj444PuF+xzdoOWdKUsXIAekAeTwSoxjhioQNBN6Xlh4es//HXYGwKTvFEar8qO5Bwx4OJp9PX8Xtkmj0BGDycP6yT5m1YFcvPrO8auxt6OR6G8fRiYRbbPC7XPuq90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+XePYPm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+XePYPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719990255; x=1751526255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUeG/d1Ea0nJwc2BRGNgVHZGPZnDD7iUYGGlisORPVY=;
  b=l+XePYPmYeIxObOKGRh9sfLKzTP6OOMkCqA1AemFSs1E3t/bL+v2K+S4
   thH5CHKzjBN00k4qQzaADO4fXWm0BDdU9dMtziqDIz8RQC0i10jkQ/RZG
   17ZB79h7fAi+RfzUeQZalZ5qhjiryUa7jw9G2dItcU7RW68OesJChVyn4
   iRc5J6dBkXkLrw36CJihtwcnhgQvqvlz5Of+XvaLl6GhqCeRdU2ltnc0f
   HKZIzF68vqD6h/7CDDgIMUSdazqVaFSvVXH4LT9sAzTIZFCqhxA5FKXQa
   H38vqmD9EppGUR/ItRWT3Bq0U8NM0QLfA2omvwKFJPovZOB/9PoP2WDBt
   A==;
X-CSE-ConnectionGUID: Xs9cbcOBShq+BOWAOA1Zbw==
X-CSE-MsgGUID: /6n3z4/aR7ylwjJ1jPpk7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17075237"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17075237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 00:04:15 -0700
X-CSE-ConnectionGUID: Va5DRe14SnCm2EwPXGNfqw==
X-CSE-MsgGUID: S+YA4HZURCOmLW+AqISIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="51336193"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2024 00:04:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOu2E-000PQ1-24;
	Wed, 03 Jul 2024 07:04:10 +0000
Date: Wed, 3 Jul 2024 15:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 88/187]
 arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@231304000: compatible:0:
 'apple,t8112-dart' is not one of ['apple,t8103-dart',
 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
Message-ID: <202407031459.2sH4cmNR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: ab1d752e387eda936613b0cae1ceec0edacef5be [88/187] arm64: dts: apple: Add devicetree for Macbook Air (15-inch, M2, 2023)
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240703/202407031459.2sH4cmNR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031459.2sH4cmNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031459.2sH4cmNR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/arm/apple.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /: failed to match any schema with compatible: ['apple,j415', 'apple,t8112', 'apple,arm-platform']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: soc: display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@231304000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@231304000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@23130c000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@23130c000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: mbox@231c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j415', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j415', 'apple,panel']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000: Unevaluated properties are not allowed ('compatible', 'efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: usb@382280000: iommus: [[122, 0], [123, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f00000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f00000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f80000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f80000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: usb@502280000: iommus: [[137, 0], [138, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f00000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f00000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f80000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f80000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any schema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any schema with compatible: ['apple,j415-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
