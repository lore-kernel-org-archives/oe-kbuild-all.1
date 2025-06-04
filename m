Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D681E2848
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036767; cv=none; b=uVSUIgwCNApN/pUgP+FXiyFZFn1DtcqaWWUT43Kn54ND0r3TiHq5y5fpqsWkZ2/oGlTEmcGIoqZSgPH5P5w4VurDwNGLfrijRCkR+XwIaYdkv9oJ4NYqTDhrHSAjvcCul2/Xb8nLZZpRDV2u5Z1n18TCr/hQGJ1vHgYHArUHDPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036767; c=relaxed/simple;
	bh=ObUQiLpdboBovDujcxVy8VIGTGpUQE8UNhhQo/B8YKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+4gT8MpZpUAOLPz8Qrt3y6Knnco9HjDGs5fSzvSiCx4Arv5CL6LQRcT5IbBTqFYbKNS++MG7P8MLw8nRyuBjgH2vjNcsBuoBzPaZlASF7H15w6xtijDoZL0fQtndHm+nH1/2En3YyMu5krdlEd57iQdqAbPf8dUWlPq3zqieNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1XffeDn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1XffeDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749036765; x=1780572765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ObUQiLpdboBovDujcxVy8VIGTGpUQE8UNhhQo/B8YKE=;
  b=c1XffeDnnuxeIZ6MI9cie+xPz/9GtVsM/4aM08V51DDkSExC3mNlHRBM
   OWGGboDclnzWDSEb4S2ace24Sdow73sYM2SGb50cj6sFFbwIZcF9/C3Bh
   4V0zRYNvJgG6SrAUvtk0nppIUnnsiO/WmuDUk01IMi+axS1OBflr3E8zg
   fZL2h1VCfJH+iEP9EwhG0YuVZfik1XywYZwzwPm09dUS9lNLVOmi5JUO9
   Heoml31NrddA7RCJrpIvngJ9G6e4G0FdLYORa286jkPRfx+f7eahWEdrq
   QDq89qa/cB6j/QFvz7PwsRdQCe8WjqMpN6a5ge2M4IxZFKyWsVau9ntV8
   w==;
X-CSE-ConnectionGUID: mT8dnFKNQ0WtNTGRDxi2sQ==
X-CSE-MsgGUID: DKyfBbqAS2m0arhoaFmjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11453"; a="73643100"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="73643100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 04:32:44 -0700
X-CSE-ConnectionGUID: k1PSbtqASQunr1Iur9kaQQ==
X-CSE-MsgGUID: 7o6wWCULSY+StRk2RyK9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="176113361"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2025 04:32:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMmMK-00035d-0t;
	Wed, 04 Jun 2025 11:32:40 +0000
Date: Wed, 4 Jun 2025 19:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 139/139]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/interconnect@30000000:
 failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
Message-ID: <202506041957.M0NWXm8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   825de4941cfad330168feb0b41e9235c5a9f0974
commit: c0fbad54cc02c9ce9ed398a3e4e3b10d5d6b1f56 [139/139] CHROMIUM: arm64: dts: mediatek: mt8196: add mmqos node
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250604/202506041957.M0NWXm8o-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041957.M0NWXm8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041957.M0NWXm8o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183]] is not of type 'object'
   	[163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[184, 185]] is not of type 'object'
   	[184, 185] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210]] is not of type 'object'
   	[190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[211, 212]] is not of type 'object'
   	[211, 212] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]] is not of type 'object'
   	[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[220, 221]] is not of type 'object'
   	[220, 221] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]] is not of type 'object'
   	[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[220, 221]] is not of type 'object'
   	[220, 221] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]] is not of type 'object'
   	[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[220, 221]] is not of type 'object'
   	[220, 221] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]] is not of type 'object'
   	[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[220, 221]] is not of type 'object'
   	[220, 221] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]] is not of type 'object'
   	[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[220, 221]] is not of type 'object'
   	[220, 221] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]] is not of type 'object'
   	[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[220, 221]] is not of type 'object'
   	[220, 221] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]] is not of type 'object'
   	[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[220, 221]] is not of type 'object'
   	[220, 221] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]] is not of type 'object'
   	[199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[220, 221]] is not of type 'object'
   	[220, 221] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217]] is not of type 'object'
   	[197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[218, 219]] is not of type 'object'
   	[218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217]] is not of type 'object'
   	[197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[218, 219]] is not of type 'object'
   	[218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217]] is not of type 'object'
   	[197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[218, 219]] is not of type 'object'
   	[218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: iommu@30800000 (mediatek,mt8196-mm-smmu): compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/interconnect@30000000: failed to match any schema with compatible: ['mediatek,mt8196-mmqos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,larbs-supply: 'oneOf' conditional failed, one must be fixed:
   	[[197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217]] is not of type 'object'
   	[197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: interconnect@30000000 (mediatek,mt8196-mmqos): mediatek,commons-supply: 'oneOf' conditional failed, one must be fixed:
   	[[218, 219]] is not of type 'object'
   	[218, 219] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: syscon@32000000 (mediatek,mt8196-dispsys0): 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
