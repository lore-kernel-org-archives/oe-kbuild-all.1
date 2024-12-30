Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F58828
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735519468; cv=none; b=X6Hn8JhHDssQi0EYVwtlNy4OCnsHt0pWidJKET3Dn+4pq3S9VDAuWeTJIPGwXBUHV1kgP2wkwU1a1kw8GaYzVXKkhFrqwmNyPBkXxZ7wMBEA32VkxSqzAtpUGPA24nGpPQH9k+11FtSwHWDO1zjb8AqeAAqMcnQPpuKTRJXeGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735519468; c=relaxed/simple;
	bh=NUgk0y+/IYVZ0n4BLY3gpO5fGeh84hi3kcsnYJUwmLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZ/lrATCSmeOrWxx8cHWlJyrY5eIEZNih9bwmpoHRCTMfupcBB74u4umXgHN+ax+qVK9+d5EvToP2CC5zK18svRsUQMqGp5qxrCPAfX0wLiFIHtRGvm3Opwu4kBWl4BeSoUvd50JiXcw5ZzsrzFdnY0uQXKEJNjcksIj7K8vN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OexGAEgz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OexGAEgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735519466; x=1767055466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUgk0y+/IYVZ0n4BLY3gpO5fGeh84hi3kcsnYJUwmLU=;
  b=OexGAEgzIugcsYUWYb4sRq1QtosIVzJ9F8ZAz/mWmHoe6P+x0lVeDdHi
   WQuousUCvk4pA4oXsYc4L+qG6Nmv7KQ7uWzsLcVnAGeXEK8fRudiBZRrE
   eBn2jXfF4IjjMFxs0tQ/RHc8/5ao9UwJKa24+kzjLfCTGM1oSDnRoUDbX
   X2hKVqD9JIHzg0OkFhF9B/VIdN+MdhkJhDc2pSvs4h44p9jBUgDIIkz9H
   IQS6V9VSBP3vAy7mWvBEoXXm0zpMSaFv9wpebUPk8cxO1MAWJr8MVi/Mm
   G/0RRo58GOzNkQBkbjMgDFLVQSpLTsh1ILbTWsflrMJD4+UjHge/qpwfU
   w==;
X-CSE-ConnectionGUID: S8F7r61NSF6qCNtKIac4+A==
X-CSE-MsgGUID: QNCsp+KfRWGggCgTf2pF3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39743425"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="39743425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 16:44:26 -0800
X-CSE-ConnectionGUID: Jg4WJ/vjQNCTpzxMvvcvjQ==
X-CSE-MsgGUID: 60q2dMgZRjqqMFB14ZJbiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="100505497"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Dec 2024 16:44:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS3tO-0005GW-15;
	Mon, 30 Dec 2024 00:44:22 +0000
Date: Mon, 30 Dec 2024 08:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb:
 dp-bridge@5c: switches:switch@0: 'port' is a required property
Message-ID: <202412300856.7S0JyEhE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   ca8e7ba4cbf9fe4c8fe507bf6d5f91c4f6d0b173
commit: 2cb720cdfeab23b23061d0784b306c263f575bb8 [4/4] CHROMIUM: arm64: dts: mt8186: Disable typec c1 port for SKUs of Veluza
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241230/202412300856.7S0JyEhE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300856.7S0JyEhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412300856.7S0JyEhE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131074', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131074', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: touchpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: dp-bridge@5c: switches:switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: dp-bridge@5c: switches:switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: dp-bridge@5c: switches:switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: dp-bridge@5c: switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: dp-bridge@5c: Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131075', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131075', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: touchpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: dp-bridge@5c: switches:switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: dp-bridge@5c: switches:switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: dp-bridge@5c: switches:switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: dp-bridge@5c: switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: dp-bridge@5c: Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
