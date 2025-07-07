Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22861F17E8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 22:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751928211; cv=none; b=DTI9Y15ZnKU6IHntGikPpkP7SkVG9dLhjNecnIAI4BNgOr0vdxtG9VxkqcNC4WQHq3QWABT1f/XgIwMLz2oDw6yOVnRR9ta4GgEUd3QNLX1K39kjNAE0WqIWEXMKVqg2zDX2zh4d967gW8LhZ50HOYEH0R23t7QYgvHlkMR9/JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751928211; c=relaxed/simple;
	bh=A5H5h2+VxHQA/14EQqiS2plYvf2kAeNlqvwXKHaI0/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nv+oxhujkOpbGJSJ4DMkhKpNg8IJj7Ox1Ro26YLz3pQE3MyXfGmEigt+yuJh1sHQlks7BZiC57bDl4xrclJbLgSEb07NLVggXjVmebnABGHxRi8KjDb0XHN6W8nSf72fZAlG3gBetcDI42ASMcha2rZcgyn+XqhKNIM7SE6e9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYZAxBGc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYZAxBGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751928209; x=1783464209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A5H5h2+VxHQA/14EQqiS2plYvf2kAeNlqvwXKHaI0/A=;
  b=CYZAxBGcBSjRUJIiXrBgu34suOvAgTE6ZUSjZkNNSbDoQO0TREXxLdL0
   1LFNxOCM8P8FzNszmXHcbba7EvDnc8qcp0vAtWBUQ6nFeB12GxhFp7eTI
   m8mC99DrEaijDr4FHzhLLArVILRbQCS0l1ye//g6DJGbvaRFIVgUmpYoE
   M521l7FQ5Bqaei2T7RDN7djnbjZ3vK7jhkFafZ1AiQ+XVlQneeIkL8sjC
   7xsvZt/PU6F6VWXfA+4iVLUN6yc2hsQ1nu7MNsQ6pQcSnTg2QdX4Jb2Dm
   +IkitsENpqnaAF77kwb+tVjmScg3p0MZ0VH9OI7fOiSrz3sLgc5mijWtG
   w==;
X-CSE-ConnectionGUID: RPok5CXwS3OGnoNpgt1Www==
X-CSE-MsgGUID: AsmNw8HXTVijWTFXbZ+FjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57926586"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="57926586"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 15:43:29 -0700
X-CSE-ConnectionGUID: O81bNdSnQeyDzd9cDXtxOg==
X-CSE-MsgGUID: 22ZzpAeDTCKpJksm+X34Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="155459738"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 07 Jul 2025 15:43:28 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYuYW-0001iT-1A;
	Mon, 07 Jul 2025 22:43:24 +0000
Date: Tue, 8 Jul 2025 00:43:15 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 47/47]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb:
 /soc/pwrap@1000d000/pmic: failed to match any schema with compatible:
 ['mediatek,mt6366', 'mediatek,mt6358']
Message-ID: <202507080056.S68d4tty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   85b2e4c611eed9921c5b149264c10181521a66ce
commit: 87a319545efed464f22b355caec02d2e0e210e3d [47/47] BACKPORT: FROMGIT: arm64: dts: mediatek: mt8186: Merge Voltorb device trees
config: arm64-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250708/202507080056.S68d4tty-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080056.S68d4tty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080056.S68d4tty-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:390.16-396.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:398.16-401.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:482.11-491.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:499.11-508.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: dp-bridge@5c (ite,it6505): switches:switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: dp-bridge@5c (ite,it6505): switches:switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: dp-bridge@5c (ite,it6505): switches:switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: dp-bridge@5c (ite,it6505): switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: dp-bridge@5c (ite,it6505): Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: switch@0 (typec-switch): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: switch@1 (typec-switch): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0 (google,cros-ec-spi): typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0 (google,cros-ec-spi): typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: ec@0 (google,cros-ec-spi): typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec (google,cros-ec-typec): connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec (google,cros-ec-typec): connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec (google,cros-ec-typec): connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: typec (google,cros-ec-typec): connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@0 (usb-c-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@0 (usb-c-connector): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@1 (usb-c-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: connector@1 (usb-c-connector): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: gpu@13040000 (mediatek,mt8186-mali): 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
