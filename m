Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72D57262E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746569885; cv=none; b=VVx51WsDOsob2JfgjdJx6GKOUQgPk007MJCCQO6H6trNo9pAAdASTXrx2handqY74xOQUnQ1EC7+x8ekT3Pd1YxeRE7Y4Et90GlySi87bgfMe0KfGn7Ce4TZ6S4URB/fDINHSNXwtzJfEEYbUioK03W5ozA3AQzQlH1CjD9Hcqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746569885; c=relaxed/simple;
	bh=zLPn3q18ptbs1+DsN6+XzvoVAQaBd+M4C6sU6vpnccc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ay8Td0R/IMVyT4RTtdAF3LwS3u/PLCMrTwhviHeQNLUv/MchVrcz+OLcFe6waJ656vY0axnmdJu8lncz3l7tobNNmd8YOVFjd/O3EtHf85uu9/bxnqf60mmFcjNOeAxKdUEgLE4zjSxTeiUwSc5K/Iv6A8f4RcaPkjGPRYy2kVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qkf9EoPD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qkf9EoPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746569883; x=1778105883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zLPn3q18ptbs1+DsN6+XzvoVAQaBd+M4C6sU6vpnccc=;
  b=Qkf9EoPD2rWmxAo2VF/U5fBdJnz/mmtS53L51ouBIdc0YkyDmaldgjdj
   jCzAbFofhSHrqM9sgwbtVWKkfnXF+upX7AO1gk6htDVQZ61fT/fVE2dew
   CDfIKLwAwAnFVgOhMYF4agJtfg9w8gO0I9sP+aa5u23VGxgWPA5ujtEH2
   cgtuvU1eysDCCPTBjFhVSN+OZG0jxTTX4U80ap0rlQQyDO5Dam4/OtKQ6
   pUkldka58qY91V3S745V2+KamMC9ZVTFevnnSkL4h/XIoyQ3fijyLAEN9
   lp1u+H7Qk8LD2J/rE4A4qYuRHpNUvSWqkIVDzMIhUDWjcFqQbbJwHU/Mv
   A==;
X-CSE-ConnectionGUID: hgyxQOgEQ1elJ4cI6pz0Gg==
X-CSE-MsgGUID: xZbFcUHfR/W9ISqCr667Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48141006"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="48141006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:18:02 -0700
X-CSE-ConnectionGUID: 7PZ7afw2Q2iLLPPCEb0bwQ==
X-CSE-MsgGUID: HdiqRdwlQjOsi7/j2BRpIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="139821987"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2025 15:18:01 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCQbu-000066-1x;
	Tue, 06 May 2025 22:17:58 +0000
Date: Wed, 7 May 2025 06:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: ec@0
 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required
 property
Message-ID: <202505070617.0cHIapYI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   30abd607a3ae1471331390c09e0379cac9b65ebf
commit: b8b5f741f33c9d3a6e26c154436c18099e64a2a6 [1/1] CHROMIUM: arm64: dts: mt8186: Optimize corsola-steelix/rusty dts
config: arm64-randconfig-2051-20250505 (https://download.01.org/0day-ci/archive/20250507/202505070617.0cHIapYI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070617.0cHIapYI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070617.0cHIapYI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: rt5682s@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: rt5682s@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: rt5682s@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: /soc/spi@1100a000/spi@0: failed to match any schema with compatible: ['mediatek,spi-mt65xx-test']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: /soc/lvts@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: /soc/svs@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-svs']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: ec@0 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: ec@0 (google,cros-ec-spi): typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: typec (google,cros-ec-typec): connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: typec (google,cros-ec-typec): connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: connector@0 (usb-c-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: connector@1 (usb-c-connector): ports: 'port@0' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: usb@11280000 (mediatek,mt8186-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: usb@11280000 (mediatek,mt8186-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: efuse@11cb0000 (mediatek,mt8186-efuse): Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: gpu@13040000 (mediatek,mt8186-mali): 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: gpu@13040000 (mediatek,mt8186-mali): sram-supply: False schema does not allow [[128]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: dpi@1400a000 (mediatek,mt8186-dpi): Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: dpi@1400a000 (mediatek,mt8186-dpi): pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: dpi@1400a000 (mediatek,mt8186-dpi): pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: clock-controller@15020000 (mediatek,mt8186-imgsys1): 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dtb: vcodec_dec@16000000 (mediatek,mt8186-vcodec-dec): 'vcodec_core@16025000' does not match any of the regexes: '^video-codec@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: rt5682s@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: rt5682s@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: rt5682s@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: /soc/spi@1100a000/spi@0: failed to match any schema with compatible: ['mediatek,spi-mt65xx-test']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: /soc/lvts@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: /soc/svs@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-svs']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: ec@0 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: ec@0 (google,cros-ec-spi): typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: typec (google,cros-ec-typec): connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: typec (google,cros-ec-typec): connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: connector@0 (usb-c-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: connector@1 (usb-c-connector): ports: 'port@0' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: usb@11280000 (mediatek,mt8186-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: usb@11280000 (mediatek,mt8186-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: efuse@11cb0000 (mediatek,mt8186-efuse): Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: gpu@13040000 (mediatek,mt8186-mali): 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: gpu@13040000 (mediatek,mt8186-mali): sram-supply: False schema does not allow [[128]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: dpi@1400a000 (mediatek,mt8186-dpi): Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: dpi@1400a000 (mediatek,mt8186-dpi): pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: dpi@1400a000 (mediatek,mt8186-dpi): pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: clock-controller@15020000 (mediatek,mt8186-imgsys1): 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dtb: vcodec_dec@16000000 (mediatek,mt8186-vcodec-dec): 'vcodec_core@16025000' does not match any of the regexes: '^video-codec@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
