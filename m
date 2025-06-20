Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55020C02D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 08:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407409; cv=none; b=KS4kHAJiE/IV6jtaLAStFBVQckmLdCvyZxA/ONgbU9Z25ar696mqUkQYtHPeTr9WkuKDDPYa34813IKAd4XwhNDXAISqyKhSBs/BKpzZYSaRxAQ0/SvKRvrhbxgEiKwIGOaTuA8ODLDGQr64/ConLeSHdGWTJqOS33N+ZIsp99k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407409; c=relaxed/simple;
	bh=EP0cb5p7PA4DCUD2plX/v1M7cwQg5V5o+3rWSPMhMhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZPERsMXz6wORzXoUnkjsOzc6CdCHmVM+EP1oQ5ZmQCMYZJ4wAGhYTw5BHlltLJAYWR5yW+JLe+AMgx29RtNDL3Hj9R6n8i8cYgjxtMr0Py6zj+C6FmlWDS/wFUCyZpEQNxiXZ8UYVtDJzVawpxAf/kMynIuq933C3Y0/nUIEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ishLd1By; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ishLd1By"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750407408; x=1781943408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EP0cb5p7PA4DCUD2plX/v1M7cwQg5V5o+3rWSPMhMhs=;
  b=ishLd1ByrRurH3eSz2S+BAmvJRII2gjDjVVTHjMSBzxyzWM1zTkRDKym
   DJlopKZ81OxO7DIbiLjbGlZ93ZmGvjAfI9O+eSIP5ZdwgZR+LCccUwO+B
   KJxYwlpt6vIGkXngws4xKbhmhQRQ3wDXtuqLRBKEPU/TUrx3G54Nriykq
   tzvQ2AAIhXmRHvwn66KwM1DJTvmIkx2wnB9CeLnc3z8YGH4/eVmzQwfE+
   fDx2Fhv203UDFBI3yUAn2D+ZGcLJcycstiyBAPoEBBQau9z+gdfYT+acR
   spHqyD4TdiMD5ihzIzutOLK9qnaO1negbDkgC7UWodz7RYNLGAdBZ4nVI
   Q==;
X-CSE-ConnectionGUID: L73/irIOQLqHmBUKAAIbhA==
X-CSE-MsgGUID: rWHPRw27TCaMUxbNzcWRZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52536822"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52536822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:16:48 -0700
X-CSE-ConnectionGUID: duvHpe6DQ0yAJIBeKfy04A==
X-CSE-MsgGUID: seYKdpp2SzuY6b1PjHtbYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="151056507"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2025 01:16:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSWvU-000LVa-1a;
	Fri, 20 Jun 2025 08:16:44 +0000
Date: Fri, 20 Jun 2025 16:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 42/42]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: dp-bridge@5c
 (ite,it6505): switches:switch@0: 'port' is a required property
Message-ID: <202506201634.f6t4bgyO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   f6966f9200cc04e9bbb539be3cceecc66c21dc21
commit: 171c3e495ce7a6c2cba213c5738772621a412031 [42/42] BACKPORT: arm64: dts: mediatek: mt8186: Add Starmie device
config: arm64-randconfig-052-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201634.f6t4bgyO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201634.f6t4bgyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201634.f6t4bgyO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:390.16-396.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:398.16-401.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:484.11-493.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:501.11-510.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: dp-bridge@5c (ite,it6505): switches:switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: dp-bridge@5c (ite,it6505): switches:switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: dp-bridge@5c (ite,it6505): switches:switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: dp-bridge@5c (ite,it6505): switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: dp-bridge@5c (ite,it6505): Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: switch@0 (typec-switch): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: switch@1 (typec-switch): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: ec@0 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: ec@0 (google,cros-ec-spi): typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: ec@0 (google,cros-ec-spi): typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: typec (google,cros-ec-typec): connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: typec (google,cros-ec-typec): connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: typec (google,cros-ec-typec): connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: connector@0 (usb-c-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: connector@0 (usb-c-connector): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: gpu@13040000 (mediatek,mt8186-mali): 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
