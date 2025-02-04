Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B687C2185B4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695105; cv=none; b=V8KriDVeW9UIjRP3mpXUGDy9GbamvEOupLexkmwL8VxuvfV6Wrrm8mQt7qfn1GdYHj++RovoR//VrBKtWcCJytq+b9FpA0gXuAI4SyEbCIJ0kjjjsZRgLc5C0FAV8UTnW+ilzqM28/TmkjVkxkisdZt6ouX+U/FI/ndSMzDxFT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695105; c=relaxed/simple;
	bh=ljC2kQVqL5JtjAElI3m3jqJFdBpyfV37sFAsB/EsEDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMZ/Zj8RFPZBHjUWfVOVJ3OKV6BA1rrvoZUZpYQy8pFwPgU29aiWO2sb+ni/7D/iAHjIEPEkAsv2boK/9hMsJvn0MbTzVLsXOU0AONO3jVNGGck60o86sfwwRoqAn2zC/sWGJPJeP9HymlysIgMKM2OhYqrWvkkiJYkNpoIPsYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwljNfbD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwljNfbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738695104; x=1770231104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljC2kQVqL5JtjAElI3m3jqJFdBpyfV37sFAsB/EsEDQ=;
  b=gwljNfbD+ik1/g46/U3fMsgY/9UUSiTl6JgB1OTwDBfD5+OJSmDPH6LQ
   fBvW9qmwSuf3RkCeUUi0SJ8H7BNzT1XEUJsOVdT2IOAot2TMtrtPdO9OD
   40bXi5S++FX9ZQdU+MYJgVx18J5H7tkWZfoIEx/wYTqMbHZfcrDmLI7rS
   XGbw7+dRs24RjEDfxvEhNyEubRFZvCuVx3f0LJ4Huni0g41FWdrtZvsl9
   HmY02p1Neah4i/zuW0+JjpXVbkor9X1QrI9vUIn0zWmQfsvSAJ+olcDWh
   eFJFvltRFzKze6ZOKOFYZhoudicEYwJcj7rjEcsovjadzQbvRU9XPyURh
   A==;
X-CSE-ConnectionGUID: kLohIYKTR5mk2hjSZp4cDQ==
X-CSE-MsgGUID: +oxziV16TSmpXN299NqLGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39344839"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39344839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:51:43 -0800
X-CSE-ConnectionGUID: OWUW2S82TN+l3dezdwfdbA==
X-CSE-MsgGUID: /S80bWqdQ7+NaLcuiXFeiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115296250"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2025 10:51:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfO1M-000ssb-07;
	Tue, 04 Feb 2025 18:51:40 +0000
Date: Wed, 5 Feb 2025 02:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mipi-tx-config@130b0000:
 failed to match any schema with compatible: ['mediatek,mt8196-mipi-tx']
Message-ID: <202502050256.f4ys8YWq-lkp@intel.com>
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
commit: 9a5b02d04139ce72808afd297980ac2b6f6a2957 [170/170] CHROMIUM: arm64: dts: mediatek: mt8196: Add dsi and mipitx node
config: arm64-randconfig-051-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050256.f4ys8YWq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050256.f4ys8YWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050256.f4ys8YWq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@120a0000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@120c0000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-e', 'mediatek,mt8196-imp_iic_wrap_e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@120c0000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-e', 'mediatek,mt8196-imp_iic_wrap_e', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mipi-tx-config@130b0000: failed to match any schema with compatible: ['mediatek,mt8196-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32400000: 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32420000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32420000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32430000: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32440000: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dsi@32490000: failed to match any schema with compatible: ['mediatek,mt8196-dsi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dvo0@324c0000: failed to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32820000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32820000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
