Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509F17C96
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 02:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732587507; cv=none; b=MboHg9zLPbIf9YYxpUvemcDJX+iraPVEGxFAaRL+hMWzSgqK+xMdMg7gL4ZMXJTs2o+L6Aws4cxm7SzOw+gcMD1Hqc3cS5WIxdkuuAX0HqGVqmaZQd8dGu/aaw2trZVJbVN/pCZDTgnMn8F5lqBYcg/Y+a6e9OoaPxZtpJRoFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732587507; c=relaxed/simple;
	bh=qLmtdDfqGZyfLBEl28BfEc2FsdP3sme1WUNsDsJ50Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOEPkbPrq+k9hDXcLEeOG4HfSkuT6DDnryvdCEDU1siGkLjsNtJJOP07m+dvdX0S689kIEUM7L0tWk9B9bZnM4c5zMyebz1cJF/w4ZSDUjOdVAwiq64oyU2t2r9jA5n+xYOX6VSMSjdrvIGyU/fGQWcGX52Kqs24YKHsIzJy9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHKu0kNV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHKu0kNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732587506; x=1764123506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qLmtdDfqGZyfLBEl28BfEc2FsdP3sme1WUNsDsJ50Xg=;
  b=FHKu0kNVmygqREDjSB844zmlLS2Yg3+FCBgjbqchi5DXYfBlXFSUpFCt
   V6hxlnY0JAHTT3cEEnc1/sQ0p2/6NVJ8cpALGREUgzmR1zyhBDaXbbdRT
   Gh1bSsHRUHW27KSmjLZk6WuFGlQojPFLW4fj4kxnA9LsBE5MMVpjoZHBH
   Pog80JH6moJza9jWEhCry24bK23B2Kb634AzYqck3TJTkMT/Klpi2A+8W
   /pNu8ciyKsQPDEniTXmH7uilIeDqOLbfbhjtd1eQlgXq7FOVKUIjwdaDX
   6V/iMnYYyZ6dsTV4MV2uNB+BxiYqTR/mSOCzBDg3xVkI45eOPQhY9RnE0
   w==;
X-CSE-ConnectionGUID: AOKilA3tSu6lDIbdNhjnMw==
X-CSE-MsgGUID: FRv9y9v/Sce5WokjO2LEIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43219982"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="43219982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 18:18:24 -0800
X-CSE-ConnectionGUID: 6c8EDuOvQwGyU1c9NFNG7A==
X-CSE-MsgGUID: C/dBLRd7SNOsInZPxzoL9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="96538407"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2024 18:18:23 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFl9f-0006yl-30;
	Tue, 26 Nov 2024 02:18:19 +0000
Date: Tue, 26 Nov 2024 10:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 147/180]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /: failed
 to match any schema with compatible: ['google,steelix-sku196612',
 'google,steelix-sku196613', 'google,steelix-sku196614', 'google,steelix',
 'mediatek,mt8186']
Message-ID: <202411261059.ObTZIvXT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   55f06a23a5270285fe862a8cd7608d557ec6f230
commit: fae238b3108dd489ae1f17920da43fa28ecd0322 [147/180] CHROMIUM: arm64: dts: mt8186: Add unprovisioned SKU IDs for Rusty
config: arm64-randconfig-051-20241111 (https://download.01.org/0day-ci/archive/20241126/202411261059.ObTZIvXT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261059.ObTZIvXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261059.ObTZIvXT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,chinchou-sku3' was expected
   	'google,steelix-rev1-sku196608' was expected
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /: failed to match any schema with compatible: ['google,steelix-sku196612', 'google,steelix-sku196613', 'google,steelix-sku196614', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /: failed to match any schema with compatible: ['google,steelix-sku196612', 'google,steelix-sku196613', 'google,steelix-sku196614', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /: failed to match any schema with compatible: ['google,steelix-sku196612', 'google,steelix-sku196613', 'google,steelix-sku196614', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: mt6315@6: regulators: 'buck1', 'buck3', 'buck4' do not match any of the regexes: '^vbuck[1-4]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: jpeg-encoder@17030000: iommus: [[126, 233], [126, 234], [126, 235], [126, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196612.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
