Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FF25A655
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738648882; cv=none; b=nvvBpdcycgxogJSVXuCr3fEIfPmDK+LfVHkC4queazxx1IrD+nEdMKZMZSgXECGSZewmmizqPxFJxJ2KbRkwrjk28vh8d/9iB5QatQkE5wdoKeCvS1TTCwjTeMbuJtE2UoYMfR48yN7Q7PMkzw8MxU+jzkyahdWGmDUCKAUE9S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738648882; c=relaxed/simple;
	bh=sOWpMXeg1aBqRT0Iz2aMJhXeqkKY4mguHrSfiDsr4SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hg5NBJp8YSkBQRW+CViOsArnOU86ly1Zlu1iXuWZy6fyoxGFw6bHsze5INyjEyTDourPhu5hFS2UwCsuyCnVffi9hdQd1Bw9QWpbK2bWu8WGIy0RQBItEgNBCdE0pgsuBLE18Bt2J9SDpjE20wFF/vPxzcyKmWmJ/B2LYGdCbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQbYNsW8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQbYNsW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738648881; x=1770184881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sOWpMXeg1aBqRT0Iz2aMJhXeqkKY4mguHrSfiDsr4SM=;
  b=VQbYNsW8bh2OchORL1Fea8GXDcjdxKreLGI4Is8NcukBtj2YyUO1SVYX
   T4/teIdTHDMwc0r4RxnbmelucdalIgDISJ9IGqk4R7V3AeKUB4FMee5ix
   X0foerrLZ+PaAHwrwA5ZFwr4yt5l225sPAql86VueahdxWUJfZC/sPBDq
   kd88cUztNQk89ycYhgd/z2uXr/exGp2Ulkprh3R6k5Dk8gXd3WV3jTNPd
   3ye+RpbxsO8ZKahyuMcUgTjXYlIDQjmoSmf9AsaaYv/t2pLBcNiL5htTq
   /3pEfPkuu2suguaGrrIoegB+56Z1LXOwy9iAFnZRZMcfJedxTdNt96BY3
   A==;
X-CSE-ConnectionGUID: 8JPoKxWNSEqE4VQPCwFQHQ==
X-CSE-MsgGUID: CQQDDJKHRFqcPpPCloJuBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56592030"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="56592030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 22:01:20 -0800
X-CSE-ConnectionGUID: OVYdU3AcTWSPenkT5kAnmw==
X-CSE-MsgGUID: jJx4D7BbRU+BYcaLiz4sfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115495285"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2025 22:01:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfBzo-000s2s-2b;
	Tue, 04 Feb 2025 06:01:16 +0000
Date: Tue, 4 Feb 2025 14:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: interrupts:
 [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4,
 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too
 long
Message-ID: <202502041317.i6Jemgfo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: f957c1861979d10e84389c71968db5fb9a5a97a5 [35/35] CHROMIUM: arm64: dts: mt8196: update ufs setting
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250204/202502041317.i6Jemgfo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041317.i6Jemgfo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041317.i6Jemgfo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: $nodename:0: 'usb3-phy0@16773000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: compatible:0: 'mediatek,xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: compatible: ['mediatek,xsphy'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: 'power-domains', 'usb3-phy0@16773400' do not match any of the regexes: '^usb-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@167a0000: failed to match any schema with compatible: ['mediatek,mt8196-usbwkcfg-ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: clocks: [[38, 42], [38, 97], [38, 115], [38, 41], [38, 118], [38, 96], [49, 1], [49, 3], [49, 5], [49, 7], [49, 9], [49, 11], [49, 13], [49, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16910000: clock-names:4: 'ahb_apb' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16910000: Unevaluated properties are not allowed ('compatible', 'pextpcfg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/phy@16930000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
