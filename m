Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5A21FE45D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869265; cv=none; b=WZEHnxIUVHA1lBXSDk1HNYWNLL8K9AbBAt48p+mToRci89Nl7InC1B0FJC5Y5xRMca6bu8fIQEkpGcez3Dpnnn5FLpS60ZRrymKZrHYaS8KU7Sh+idyEcVQ883h2gTnLTZS5Kn4fIEk/w4WpueuHgEPr6DZlNRhiLW2CHu2TZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869265; c=relaxed/simple;
	bh=kBFChlMsFC/ZoAVrsBwDbiS9JFpwOJ9eNMxYxBhY6Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HvESHqgK0CfWdLxWuFny++2sZy0ikbijEHQxzLcLFt7Vs5c+9BarS0shTkmjzTcG6j3TC/XuoBlMwfUm6Lk30fGWMM9nOyxBnFWtwUiA37eiUfD9YYQPJoKMRlkBYsZFocPtbHhZm3pCZRB4RNXsibgg/yPYDOKeFfyxoofnB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArhRhHBL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArhRhHBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739869262; x=1771405262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBFChlMsFC/ZoAVrsBwDbiS9JFpwOJ9eNMxYxBhY6Rg=;
  b=ArhRhHBLc6WenLKGjJTJshPqUheg32OjMYDQuk5KECbqx96CVGKKDfCx
   TQ1636F9b/3yX4I0/fMIgNljbGRV0KoqhdxCroUIlGBR23vumSd8NtWp4
   eW0xqdp1yar0LeZT96sE5mjTp8SWpAk4i3d19Qfkmo3iBcB813XUxnzCv
   EKBtYQz4RhZxChfzF2YvtiqQwiu5UBBvQ6tOxK1aSAoX4tJwE6h2TcT/K
   R2y4dDTa2sbfw9SeKnFcbOlUbTuDkVkSVRUcII7yVxBzq+II2FjmtCOjh
   Fu7DPhAth63xU1MvRlceQ08DGceUksUzdVmItQtQ5laqjvabCYvRSZluG
   Q==;
X-CSE-ConnectionGUID: Bv7r0mzLTYmDLA95KscPag==
X-CSE-MsgGUID: iX9ChFLDQQaJwU4K8MtO+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40677030"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40677030"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 01:01:01 -0800
X-CSE-ConnectionGUID: npFeS0MxQHuCR41V96uuxg==
X-CSE-MsgGUID: b3lu7rsvSf6MI/zvbbsWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="114202537"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2025 01:01:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkJTN-0000KN-0E;
	Tue, 18 Feb 2025 09:00:57 +0000
Date: Tue, 18 Feb 2025 17:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 17/17]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: speaker-codec@4d:
 reg: [[77], [79], [76], [78]] is too long
Message-ID: <202502181623.eUikmEn2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   306a7228073e418579ecb90fd82062805d87aa01
commit: f5ec66811ecf722b97aedd52b3bcff93535b4a3f [17/17] CHROMIUM: arm64: dts: mediatek: mt8196: navi: Fix i2c3 audio sub-nodes
config: arm64-randconfig-051-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181623.eUikmEn2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181623.eUikmEn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181623.eUikmEn2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: audio-codec@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: audio-codec@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: audio-codec@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: audio-codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: audio-codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: speaker-codec@4d: reg: [[77], [79], [76], [78]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: speaker-codec@4d: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: i2c@13170000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: audio-codec@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: audio-codec@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: audio-codec@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: audio-codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: audio-codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: speaker-codec@4d: reg: [[77], [79], [76], [78]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: speaker-codec@4d: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: i2c@13170000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: audio-codec@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: audio-codec@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: audio-codec@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: audio-codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: audio-codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: speaker-codec@4d: reg: [[77], [79], [76], [78]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: speaker-codec@4d: Unevaluated properties are not allowed ('reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: i2c@13170000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
