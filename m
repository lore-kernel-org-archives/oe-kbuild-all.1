Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9911BD01F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444158; cv=none; b=V1fMO7Bn/Zs3xtdQ9JLzfpicbMOxAs5gNiB25dY0abC9X7jLsd6jU1MMfqCnnDd68yqKcJW5i8au2wLLfZVo+TqzJ1eAeB7HdNtPWwOVMcjfD7d1I4q6IkLGcyLhJc0nR1lFTdtbDbOkO2NHh0RBCWnIzs3qCGqzurNGq1DitLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444158; c=relaxed/simple;
	bh=gi4tf7K/EkqX7sM5BWKcrz//hjcFEaCD1tZeNB/hySk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nBOAPNmMLcREFiez1BsIa1u2SlTBwRQuplt0BiD0V20ypbut6DZ72ABGjZTec3prFmtAl7wKOXMpyztXruHKeS4Se0Nc/TBgYvnwKEHXXw3EQI4whAK+j7rk+Oi4T08MZN+6Qx6kQLmwf28/K6SmCvXSu3+QXrkkZJ8zibPG758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5y6M5ha; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5y6M5ha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745444153; x=1776980153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gi4tf7K/EkqX7sM5BWKcrz//hjcFEaCD1tZeNB/hySk=;
  b=R5y6M5haE1r27cbT0xeWwN93vWpdx8hMfTLxBHpiV78Bu4SF4+D+V3+G
   V8umEwajm9BhNfDIuXaNtTgbai0MLb9TAE2i2jiWnO4cWjWqiX07YzigF
   KMLWe/VNXnapPdeOD2MsvnwUMMIha5IvYd1k2j+ayvVaMzGfF0cMcBKcE
   ObYH/eyj9QBqtwA2RYPYoDi8vpotEGCRLKzBP0wzAHFbAANPVBpaqKCc0
   9S/9jWwBejsV1AzNcOv5S/fivTH6UjDvSGmeSWnZ5NXSGpY8jB/793Tkc
   udezp3bby3UKpIuiSP1sZFaFsJ32fGS0fWAkpcCFdzbIVyIyOQQBBWqPL
   g==;
X-CSE-ConnectionGUID: /EIbKc+QTUyketdWzW7GqA==
X-CSE-MsgGUID: 3yKD4kJsR2SgdGNXqv7GJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58049106"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="58049106"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:35:52 -0700
X-CSE-ConnectionGUID: PwODw7AvR8GpxV77TZX2nA==
X-CSE-MsgGUID: f0C0/rNUTz2EpvTOCRE8vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="163467673"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2025 14:35:50 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7hkx-0003e1-2V;
	Wed, 23 Apr 2025 21:35:47 +0000
Date: Thu, 24 Apr 2025 05:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 21/21]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@380d0000: failed to
 match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
Message-ID: <202504240548.5b4p56AS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f140971cf554cfa7c517cfb96260a3a674e9166f
commit: f140971cf554cfa7c517cfb96260a3a674e9166f [21/21] CHROMIUM: arm64: dts: mediatek: mt8196: add smmu reg base for jpeg codecs
config: arm64-randconfig-051-20250422 (https://download.01.org/0day-ci/archive/20250424/202504240548.5b4p56AS-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240548.5b4p56AS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240548.5b4p56AS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-mt6681-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-nau8825-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5650-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5650-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5650-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5650-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5650-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5650-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5682s-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5682s-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5682s-sound']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: iommu@4c000000 (mediatek,mt8196-apu-smmu): compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@380d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@388d0000: failed to match any schema with compatible: ['mediatek,mt8196-jpeg-smmu', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: mtk-apu-mem-code (mediatek, apu_mem_code): compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: mtk-apu-mem-data (mediatek, apu_mem_data): compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: mvpu (mediatek, mt8196-mvpu): compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-rt5682s-sound']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
