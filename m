Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE91E0B9C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 01:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751938670; cv=none; b=fwebNEfaIjJVt3wTL5oY8PvQKjDgnBPihTF+p0khqvxidoHJi3yaBMS89n4te5sQqzHme6z3zGVBzQYAetq4lS1xGoY8genVGguAFnQjEG8Gs4k8xUUYZv0H8HHqGIOVx/MCYWZ8uBxqvu+Rqtp7tQggRDkFWrA57JAYgEOuk1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751938670; c=relaxed/simple;
	bh=EYSGFRlTUeUEbqeB0w5BVuZsKu2cDaXr0seCTbROB3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moxl0Rrc3vOolEl0nC6ASXMLe8GvIXU+1vP4qEnEWPESpbbuscKQwhTNHXWAC7ri/gSkBf7+gyclMS3SRak1ahB3HZXps40lCPKWwtpvTXPMxqpx1Bzt9QeUJbOzJs8fxGu5AO3H/UicPZ8Y7RH1DK9LjQ0/Hm9k8MqahhJ8NU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msNMIeV3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msNMIeV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751938668; x=1783474668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYSGFRlTUeUEbqeB0w5BVuZsKu2cDaXr0seCTbROB3A=;
  b=msNMIeV3+f2dqF8owLesW8IXDu3MAbj6mvOYD5iEbL46C2+l/BuucYLl
   rkEL5iWPnhXo+i/3U1TaOChdK2eL56RLZB21q0ZEeE0i5pfs3DJmaXdMw
   8vaYzRZU9FbdMFzEL9R02QIM5o/nSkwuOAEDrIsy5Ghz8NvIoUVhUaxJx
   rzm+UFvnrbUcbeyDfqcFy0c8pyy50OL+MzjnIYeRJGgo3/dxTeJ/ETN/5
   ndWhq5c3oC/b/UikcKQXEVE5l4LwbsW7jggyFcAFf7o9VLalJdx0GStS6
   mqBkzkKbaka4sMqIKQvJC1cBS6VQh6ThcATExvKjE5jv4bx9tZT7XXhz/
   A==;
X-CSE-ConnectionGUID: gFU7P4tTTjSGMu7kFe+Dng==
X-CSE-MsgGUID: OwOL6eDDTL6qJ67TRvuQOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65230909"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="65230909"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:37:48 -0700
X-CSE-ConnectionGUID: tjxChLpET7OFCpBi94hAng==
X-CSE-MsgGUID: hRB1lh02T32vLu7W6dUhJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="155850919"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 07 Jul 2025 18:37:47 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYxHE-0001jN-1X;
	Tue, 08 Jul 2025 01:37:44 +0000
Date: Tue, 8 Jul 2025 03:37:34 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 47/47]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c
 (ite,it6505): switches:switch@0: 'port' is a required property
Message-ID: <202507080315.4QftU3Ty-lkp@intel.com>
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
commit: f6966f9200cc04e9bbb539be3cceecc66c21dc21 [47/47] BACKPORT: FROMGIT: arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
config: arm64-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250708/202507080315.4QftU3Ty-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080315.4QftU3Ty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080315.4QftU3Ty-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:482.11-491.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:499.11-508.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c (ite,it6505): switches:switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c (ite,it6505): switches:switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c (ite,it6505): switches:switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c (ite,it6505): switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c (ite,it6505): Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: switch@0 (typec-switch): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: switch@1 (typec-switch): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0 (google,cros-ec-spi): typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0 (google,cros-ec-spi): typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0 (google,cros-ec-spi): typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec (google,cros-ec-typec): connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec (google,cros-ec-typec): connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec (google,cros-ec-typec): connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec (google,cros-ec-typec): connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0 (usb-c-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0 (usb-c-connector): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@1 (usb-c-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@1 (usb-c-connector): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: gpu@13040000 (mediatek,mt8186-mali): 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
