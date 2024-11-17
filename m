Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD671898FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731855526; cv=none; b=lhrfINB1WhF/1If/mLAhIB3noQeQow0AzGNDjsbmnK0A1NG9XcvyA9DbyY/Zn65QQF2Dko5R9ca+nOJuQKvwQL0lQYxoP9VpsvIpYuX2YQYI8bn7Trl829FeC5Xsu8HKM0Blr0XZdbL70QtZQuKQTCtnncP+W/1fj1gOZCzYj+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731855526; c=relaxed/simple;
	bh=D4+aEuu6RiGGPuQc5Ys8p4784fyyboUggnuNkIpzqmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSMCtq7uXsY3Gt6EbJBTmH/1lMJTe8XuY8juMhrewewn9Fqtj1rvW+JxDTLWVjvO1uzhZjDQLUZKc49zJKhwiiFUvuCvG9/XlH0zxlJlzMcw7JWZJadB0aGKoWgItgPZCiY1ntG0qVqIUKhikY9d4/TIdIVSZV1bO7OoTUmzm/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJNQ/vaL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJNQ/vaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731855525; x=1763391525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4+aEuu6RiGGPuQc5Ys8p4784fyyboUggnuNkIpzqmU=;
  b=DJNQ/vaL1kLGNyrSaLdGqaKg9VghgRkzczS9QUsS/tpty2OjEK1P+3bJ
   S9RlobDgY98IF01Jp1KytOXX6BW1HfDlnQZLsqMfu2tEWJSepD+shw6Xa
   qBnceSagBHUba2odf7Vmxsa9ekoT/cDSekty7h4lrVO/iyjxy47M1FCDW
   REBmPa+NXEeewpp2iZpAqErVp/MaAQ79m19Tf2jeA0O961dIR9ddVDCy8
   2haHerEe+RmHjBzy59CigVFwZoy8cBjsKzITaMxoDR+0iO9ctw6JS3loW
   03OVeh460ayJwF+0Dzp+j0ah8pd0Hdy+YxEnYVT14Vv50IWTA/rs+NCo6
   g==;
X-CSE-ConnectionGUID: CMKoc8ILSBOQLpLUCURQ0Q==
X-CSE-MsgGUID: U0wMQV7uTnawWVYt869+0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43213091"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="43213091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 06:58:44 -0800
X-CSE-ConnectionGUID: KRSz10UaTpyrIzUgzDYhJA==
X-CSE-MsgGUID: zdfsiPtJShWhCUjsKFkKgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89779146"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2024 06:58:43 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCgjY-0001oD-0k;
	Sun, 17 Nov 2024 14:58:40 +0000
Date: Sun, 17 Nov 2024 22:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 59/67]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: regulators:
 vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
Message-ID: <202411172202.stoX7cXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   e2b6daceb83c9b9ae90fca4b78fc265484ded662
commit: bd7cff1b6b296b1432627fc1148d6ce7731a2bb4 [59/67] CHROMIUM: arm64: dts: mt8186: Update Squirtle sound card configuration
config: arm64-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241117/202411172202.stoX7cXk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172202.stoX7cXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411172202.stoX7cXk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /: failed to match any schema with compatible: ['google,squirtle-sku0', 'google,squirtle-sku2147483647', 'google,squirtle', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /: failed to match any schema with compatible: ['google,squirtle-sku0', 'google,squirtle-sku2147483647', 'google,squirtle', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /: failed to match any schema with compatible: ['google,squirtle-sku0', 'google,squirtle-sku2147483647', 'google,squirtle', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: pmic@6: compatible:0: 'mediatek,mt6315-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: pmic@6: compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator'] is too long
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/spmi@10015000/pmic@6: failed to match any schema with compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator']
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: gpu@13040000: clocks: [[121, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: gpu@13040000: sram-supply: False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
