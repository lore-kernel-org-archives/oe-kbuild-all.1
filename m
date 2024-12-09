Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE549625
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719783; cv=none; b=Z6JBu6Bqx48du8ETviibKYDFX9JMSWobLwVL9/MypXQhj2K9I23NUaUPI9gwZwyD2+UPpypgdaImHRVce/s+S7GGKGoAjbV/pM9SLmMpCmSeKA3CPUPs20ftddjs3Fh/7BHD9QQhGBh1YMM67UlcUPRVY0xbdPUJ6QutTg76zYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719783; c=relaxed/simple;
	bh=T9IweMdG9rW7HFX2Od6WkOu3/mMasGW6ZgeYJKgdOgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DDLIr1IAFQE6J3r5sbeQE2Vi0/ZmCqWE7JQpizCk6tBfI8a8/ki/+uhI3IBRzRxInk74zjyp7PF/4nSd4OA1xDyNIiiyra/a2nrZiCAk/bENj3BcEarwz+koJ7+5VEzjr5F7+Eqy9/BeWR5TKT3lnWu35QkzsOWMPrszGP0dKsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRS0ITCu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRS0ITCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719781; x=1765255781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9IweMdG9rW7HFX2Od6WkOu3/mMasGW6ZgeYJKgdOgg=;
  b=FRS0ITCuMKmBodLRjrKhsqBUmaEJhNrnK54GRZK4u2qLdGLBi/Ii2CqD
   83EGjE5h8aR8XYwbbeNu4DBB96eHIWUAJPZFCt/g25l0YAOTJJ/njeI7z
   eOYG4L2AgWUo89yaTcCtK9D6UssW6KsEe+S0tB6IpvIj8LM4rwqV4INRh
   4CUYoeMAu/1oXjYFHbd2oTOIhlGNvkJ/+u9osoUKtxVxlUiUUHsDkshZn
   Y75kh7UZfPuen90H6Ykx6LE4YilBelyyKtHAd/vd4ESKS3IOMEsKNH3bE
   b8DewSyV/fUVNdNo2yCWQUJqFvQRhICMpbj2d0gWNi+BPukHAY9B+oHL3
   A==;
X-CSE-ConnectionGUID: 5myiC5bsRBqBhbWEzH/Vyg==
X-CSE-MsgGUID: fG96Ng4lTbefCW9e3Buq8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416432"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416432"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:49:41 -0800
X-CSE-ConnectionGUID: GwAMzYByTyCmL27sBANmdA==
X-CSE-MsgGUID: AEgRbWwgTcaDMlI+V0BdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95406774"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Dec 2024 20:49:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKViD-0003vX-0r;
	Mon, 09 Dec 2024 04:49:37 +0000
Date: Mon, 9 Dec 2024 12:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 51/84]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: thermal-zones: 'soc_max' does
 not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$',
 'pinctrl-[0-9]+'
Message-ID: <202412082136.o4SI9ukT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   ebfb3a7ab8a9ff5202e3d9aaf3156efc9d82d36c
commit: 89dc2b08fe62d3a00f865cb18aa4748dbb760c12 [51/84] CHROMIUM: arm64: dts: mediatek: mt8188: Add soc_max thermal zone
config: arm64-randconfig-051-20241206 (https://download.01.org/0day-ci/archive/20241208/202412082136.o4SI9ukT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412082136.o4SI9ukT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412082136.o4SI9ukT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /vtemp: failed to match any schema with compatible: ['mediatek,virtual-temp']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
