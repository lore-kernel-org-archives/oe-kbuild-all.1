Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F21C8FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 01:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731892959; cv=none; b=DieYtbruxLc10ZanCdzCF+pFYsdj8IGnNf9mqn1iREvQNJEqgn/RwnM5nU2adeEnNdPVqIOsy+Px2vgt7CDmH250Qhz33bAzCqmo5qPjbzoDk0S/rt3wr0fIram7ywg0YQC+YQqCtQFKNWFk7bnc6EPN5ejEYEb7u5ZjljdNMqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731892959; c=relaxed/simple;
	bh=gLmGq2rH2LmoaMtDXTCaDwf2a4p8bXhhJYmKNznYYdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=du1+zhfauJHz0mEohEpS3btcKgcVZEk61ZVeNZyFrZZx+ko2p6sQDFKnL1r70r+H1EvSpDpfJALIpKrcJY+dGSLj9UUrX8/LiZRKlKva/ShhP3gXMaAnKGEWeq6AgsyZTJ6KZuXy7qGwIzqmsGK7mmElM+n2ebqQRTQEZp/TTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/Yy+djz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/Yy+djz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731892957; x=1763428957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLmGq2rH2LmoaMtDXTCaDwf2a4p8bXhhJYmKNznYYdY=;
  b=H/Yy+djzy09hHsEdD/XKMTjhAsUARksqgdyQzxa1+5yRlhj/JQBxBghi
   jHN/mVIhJo43V9XSStiIuZsF+C9Xwy6YQgPR7WB6tppboTOSeGMDfBlSB
   Oxu8zNsnq7LlfyxH2xzKNlKPkr/ipEnSNXecAa3ytNNrqJVWDyaedkWqI
   mNaSOGiHxw9oqf93ddk9celJ4+NBoNcABKqWGkyt7PXVnMiiG+AgqdzK2
   uJ+HOuPIY0rU0KUnQ5In95ezMInZvDdZIXxigutcLEM+/yyTxY+hp5vex
   UMvpHZ0EXCjp5S6M26+bQp+NWrOwX8IQkLpSc0dhKXH0wZQ9UvSLG1uLY
   A==;
X-CSE-ConnectionGUID: ZcYpIof9QP6MSwevFQo+gA==
X-CSE-MsgGUID: 2aTiCKUmQd+pk+jxwmqtOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42354776"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42354776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:22:34 -0800
X-CSE-ConnectionGUID: JtpN0sfASyyTb40lAkpQBA==
X-CSE-MsgGUID: yCr623VsRdOk0SIusu8Sxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="112373005"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2024 17:22:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqTG-0002B7-2B;
	Mon, 18 Nov 2024 01:22:30 +0000
Date: Mon, 18 Nov 2024 09:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13313/24209]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb:
 gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names',
 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202411180930.2YNdVWiM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   e2b6daceb83c9b9ae90fca4b78fc265484ded662
commit: c95fefb518d78c3a0852393e60d9163c4c54fdd2 [13313/24209] CHROMIUM: arm64: dts: mt8186: Optimize corsola-magneton dts
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241118/202411180930.2YNdVWiM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180930.2YNdVWiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180930.2YNdVWiM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
