Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E80F3A9637
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518757; cv=none; b=Zm9DjY2uNp0TK+xjl+6XXSQ9Nzorivb/MEdDZJEbS8y7gthTGIPA+M82kxMtkEwHS4GNu5hVbaZ/m16UoFQhwthRKnKMgAu9PY/Ae3XwOHgf8JyYn2p21o+6PNxT9k969fN2DdMPcUmOQqWEeVc3deed3vTZhwumXoYqDmJXxJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518757; c=relaxed/simple;
	bh=2zAjt7sl5Mq4yHlBXblcVYketoJBMi1C/yZPOTGeVY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KtHbxzhbSNsfeK9/bhji+okp+cKhk5k17jjuT10y5z4nY5sF798rqIALA3BdjUiyYK2RO00wb85RPBiO02VzOnCImYc/6xntkNIYCTwP2mWX8+SLyYL6+D5bBs4nnHRE1a13Ucj1FXVUa5DWWKL3mcNvj+JIDzpsWR2GeVzwun0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUCYIh+5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUCYIh+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783518751; x=1815054751;
  h=date:from:to:cc:subject:message-id;
  bh=2zAjt7sl5Mq4yHlBXblcVYketoJBMi1C/yZPOTGeVY4=;
  b=nUCYIh+5IIyJmtX6fzctGHxOzbli2WNGjenfga4waC/F0ftD1zz2PDQ2
   nAZVC2a2zGx/E0DpiUvAV/AZyiPw1ppQsRGvYUZ/GiDHvi5mdhOUbEEuh
   7GwI6ceUmzDfxO42Ei+vVCDsspD9BoU+ghZlEl2TaPQFgc2zRi3aeRm7k
   xs8slrPzTwDRjVbB4b42Ms+GdSW3l7rURR6K6LxmV1UrCbLnm+svCZvZ2
   vgHClUnqxuNtx7TEzdTFCFmfAtWAJCkgbAIYrdffmtcydbt7qZhFO9bGE
   6dT+aC8SSycwBUDzirOhJxVxmmMm47XaUNp6YhqiUuDB7zh8zjM/qj/4u
   A==;
X-CSE-ConnectionGUID: YgHEpfhXTn+Z2kVKHGGA9Q==
X-CSE-MsgGUID: 4ttk9nyET0O1/0MzxxpEcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84153937"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84153937"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:52:25 -0700
X-CSE-ConnectionGUID: k1DFpu0aQy6dTPQQmMgYsQ==
X-CSE-MsgGUID: kPIaCQa0RgqYyX+wQWWMLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="278678269"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jul 2026 06:52:23 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whShI-000000002lJ-37AX;
	Wed, 08 Jul 2026 13:52:20 +0000
Date: Wed, 08 Jul 2026 15:52:01 +0200
From: kernel test robot <lkp@intel.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 3619/4300]
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: pmic@0 (qcom,pm2250):
 usb-vbus-regulator@1100: 'regulator-min-microvolt' is a required property
Message-ID: <202607081523.r7KN0Lt4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5c73cd9f0819c1c44e373e3dabb68318b1de1a12
commit: a58d2e5e1c0406d4375861094070c22d6137713a [3619/4300] regulator: dt-bindings: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg
config: arm64-randconfig-2055-20260707 (https://download.01.org/0day-ci/archive/20260708/202607081523.r7KN0Lt4-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081523.r7KN0Lt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081523.r7KN0Lt4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/agatti.dtsi:2086.27-2159.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100: 'regulator-min-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100: 'regulator-max-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm4125-vbus-reg', 'qcom,pm8150b-vbus-reg'] is too long
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm6150-vbus-reg', 'qcom,pm7250b-vbus-reg', 'qcom,pmi632-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-min-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-max-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm4125-vbus-reg', 'qcom,pm8150b-vbus-reg'] is too long
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm6150-vbus-reg', 'qcom,pm7250b-vbus-reg', 'qcom,pmi632-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml
--
   arch/arm64/boot/dts/qcom/agatti.dtsi:2086.27-2159.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100: 'regulator-min-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100: 'regulator-max-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm4125-vbus-reg', 'qcom,pm8150b-vbus-reg'] is too long
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm6150-vbus-reg', 'qcom,pm7250b-vbus-reg', 'qcom,pmi632-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-min-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-max-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm4125-vbus-reg', 'qcom,pm8150b-vbus-reg'] is too long
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm6150-vbus-reg', 'qcom,pm7250b-vbus-reg', 'qcom,pmi632-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml
--
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100: 'regulator-min-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100: 'regulator-max-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: pmic@0 (qcom,pm2250): usb-vbus-regulator@1100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm4125-vbus-reg', 'qcom,pm8150b-vbus-reg'] is too long
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm6150-vbus-reg', 'qcom,pm7250b-vbus-reg', 'qcom,pmi632-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-min-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-max-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm4125-vbus-reg', 'qcom,pm8150b-vbus-reg'] is too long
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm6150-vbus-reg', 'qcom,pm7250b-vbus-reg', 'qcom,pmi632-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
