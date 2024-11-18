Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A385148FE6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731951189; cv=none; b=UXKcbwLG4eIH/UaU3T8Zmms0ILGGfGgnQTDaYFKsMIQ+YpawIONb7tj113Fxn9/PbjQim66+Qj3McW+sM9TnG59OhTxAdSpmjEfpF2l4Q125YJkUz+nPqDcjGSLiCzdA6yPqjAzhuU8D0h9S7iRZ6/n+93NVwyJnFY2Vi6F7nNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731951189; c=relaxed/simple;
	bh=6064RlhiXEnb/0QQm2xxgbk7gE67MGglzlpgBC8dFUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwEDz0Zz2AqHI49aDfICVp3FsZhBFxRkqXbeWijZBEWJmFFFTyV2B4sfzKaMvagjbt102wQB+9+wpiJZvzHzokW180OW8yAAykJ6vfY5kFMXeXi1RSt7zLbxUUiQkdTiJGTxxrXJQ9g7ff/6DUWGInyUZJpIk5dBHzgVfbL+5T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEBGITiC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEBGITiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731951187; x=1763487187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6064RlhiXEnb/0QQm2xxgbk7gE67MGglzlpgBC8dFUs=;
  b=gEBGITiC00vh2jKdRnB/RuakuDH9tmLn5vi4f/Ooen6Ju9nR08TfKgME
   SZN0vfdrsekuz2b8JQD1NhQEGDdWukbH3eBxQvLIIOXXfqUQ3ZbmyMWH3
   7dxemX1wLTpOEt/96Cr4UkmITaR/dvM3KqvI8aOlveyMB4IFxdXY7V/Fk
   qd4iRzNgFhaRYLRFyiD20R0oItN5oDP8/LfUzSPG3l8PGJEW6Fbq9dlMu
   GEO+/2Pa9LRnZD/5/kh5Ztk/ATRozoVcdsYowD6sDbGpqvfVeiWc/DtKE
   mOEdu3IRRweuHp+TW4UNYVnPwYOtSpZyPXGV5f8cYYXr7WTFL5ETTCBiJ
   w==;
X-CSE-ConnectionGUID: G8D8cAyRRji4UNDFVaMMqQ==
X-CSE-MsgGUID: Zz2HPUUZQPmTfsjkw2ZekQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49457603"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="49457603"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 09:33:06 -0800
X-CSE-ConnectionGUID: vp0B/4e5SKyfSo6WdExl6g==
X-CSE-MsgGUID: WPbIrRN4TkmO0bJ6cbjuKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89441468"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2024 09:33:04 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD5cU-0002Zt-0U;
	Mon, 18 Nov 2024 17:33:02 +0000
Date: Tue, 19 Nov 2024 01:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/2]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb:
 gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [126, 0]] is too
 long
Message-ID: <202411190104.WRhj8yTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   7962b0b5563e573db1595a07464132cce0bd2870
commit: 8b8cc4cb3a1195ade50cf5c71ffe3b090dabf5dd [1/2] ANDROID: dts: mt8186: provide MALI GPU mapping
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241119/202411190104.WRhj8yTA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190104.WRhj8yTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190104.WRhj8yTA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [126, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [126, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
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
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [126, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [125, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: gpu@13040000: sram-supply: False schema does not allow [[128]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [126, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [126, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [126, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: gpu@13040000: clocks: [[46, 2], [3, 10], [3, 10], [46, 75], [128, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: gpu@13040000: sram-supply: False schema does not allow [[131]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: gpu@13040000: clocks: [[46, 2], [3, 10], [3, 10], [46, 75], [128, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: gpu@13040000: sram-supply: False schema does not allow [[131]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
--
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: cci: 'proc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: /soc/lvts@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: /soc/svs@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-svs']
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: gpu@13040000: clocks: [[43, 2], [3, 10], [3, 10], [43, 75], [75, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: vcodec_dec@16000000: 'vcodec_core@16025000' does not match any of the regexes: '^video-codec@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: jpgenc@17030000: iommus: [[80, 233], [80, 234], [80, 235], [80, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: jpgenc@17030000: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
