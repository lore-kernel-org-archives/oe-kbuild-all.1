Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9DDF42
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 02:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733021078; cv=none; b=MzFVkA2jRwdkrno0RQS1lhhs9iXCiaI/MgiyecLiEwloAJKmQONkS31ecItoLhmx3lVAT3Y/qRSvDcvwaplFDJ+3K++o5Nc4iqM8+c93X2QdH8eStyCS5nXJQihRW+LYUQ7EsYrhKrUbnNPsTRsF4ST5ZSUr1LE6azkj7VPNARQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733021078; c=relaxed/simple;
	bh=/IBmFOWCJjbQt+EO8ttGZskLEMueKtA7Dett++NB0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1+lVB5hESfxQ3BqyDDj+pRIbrSlflUQsW93N1yYW4tXi5Ircea2MF+omFhV/OiEjhtcU3dSAiZ7JxOqkLWd8bFxNOH/i3oMfq05zvHB7Yc23T9jUdvejdTUILCDf5zd6rUCYcucfy0GAncA6/lk86FAXs07LNLtJdOaCJzXBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X624MKHa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X624MKHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733021076; x=1764557076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/IBmFOWCJjbQt+EO8ttGZskLEMueKtA7Dett++NB0ns=;
  b=X624MKHaXq6MbbQY4U/BQTcDrRBxXE7/no6gd0ZIDFgbsht36x7WmhOl
   CIT1fH5i3C6Sjv18c34iQD2o4azZFQQLHWGMTDxmx2FFRw3pU5Y3rhmFM
   sgybV12O1GcPHqg1xCUThZW67xj8E3+9VR+fGhlwq4C4brE7+RNKD2Cuo
   661eAWHMie1lJmah9bEn0m9Kt2eOKzwqrL//0u827Iz5rTs53HbZEb2i3
   GVuOQjIAuDDmDMMPGCpmc3M2J9B4EJf9hRhOCJEGTNATSQ+bNksSCrh7o
   vHr+VDUQT9hxevjfFL058y1TXQyn+5avInUJCm8ThU6nLbu4FkB49zLH+
   g==;
X-CSE-ConnectionGUID: 5Nn2r7MNTtm0zFU65ICaOA==
X-CSE-MsgGUID: BxcJtFG+QyqiBmU9sHukEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="55694054"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="55694054"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 18:44:33 -0800
X-CSE-ConnectionGUID: 32/fVUaUQhuDDmN4EmLNqQ==
X-CSE-MsgGUID: 1ZdxBvnoTYeA0Cbm9R2Vyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92869903"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Nov 2024 18:44:31 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHZwj-0001AH-1I;
	Sun, 01 Dec 2024 02:44:29 +0000
Date: Sun, 1 Dec 2024 10:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/2]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb:
 gpu@13040000: clocks: [[45, 2], [3, 10], [3, 10], [45, 75], [126, 0]] is too
 long
Message-ID: <202412011059.6DfHpMnZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   e7a21ea2fe3e2a61b2c8aaed984064efdad3fac4
commit: 8b8cc4cb3a1195ade50cf5c71ffe3b090dabf5dd [1/2] ANDROID: dts: mt8186: provide MALI GPU mapping
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241201/202412011059.6DfHpMnZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011059.6DfHpMnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011059.6DfHpMnZ-lkp@intel.com/

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
