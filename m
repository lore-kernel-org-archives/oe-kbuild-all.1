Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54632C85
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734858767; cv=none; b=f+HSqK2gDWhs6z4gIyYdDbtnZ4GgobMHvR1K/Zsw1O/W2mqpBMJqVB+3nsS2Z59vXqs8FIDqbWVVg1H/iRkncHA3Z2ZZTcGTwnlvitg3HMcVCs3C7gwPYztwIXnQFXiT3zX3KrqycDoVl/E0chC9mUhjX4CE2ZEG7POsT8ePPFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734858767; c=relaxed/simple;
	bh=kZ44rk7kRhnaySsW7H61eWhsxry24IlmoiGvL1kucD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fc2yjYIL8KH3bN71r08I956VKFEdUqaFBzpgVMkey0v40z9HangEaVPbakTNBtxRXI7XyAMtdveh2YmfglTztmnbUEu490A6vBkV49anKOkyDX+Zeqo4xOBohQf1i98abm1NIXa9UnAuU9bOUeaedwP1mkNPRcfdqAgBZrT6fco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpV3ejNb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpV3ejNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734858765; x=1766394765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kZ44rk7kRhnaySsW7H61eWhsxry24IlmoiGvL1kucD4=;
  b=ZpV3ejNbiYY4BbxisKYBwoJNTID8IBu9VitU5Et6ty3n8xl+taA971rf
   FfOFbiIjORCOckhC0nIDD3f0uJJu+IOUiwDMRvtCcthDeSG8EcX4A9ko/
   0kzWtHzewhYr8weLaTReOvgBFPeSaOkZBsE/vrdSSp9lSq9vOkXnX9RDV
   bEbxkTkAU4plYdXYGBgnm+vYlGHLDU28YR1goeCLbfpBwXjbHX8RNzZDD
   XMrHqQAQ9Ui+G5yLe55r0cgXh+3URK++lvKJkG2LYhhmzApF+z8k+cfKB
   zcOt/AqlkqvLy6JHDDbZCjK/+tvtoZ9tFP1UEsk1V+1GOclS3z/EwStQ8
   Q==;
X-CSE-ConnectionGUID: p4e6DKBjSfSnW14k6Ue6Wg==
X-CSE-MsgGUID: JreRSNzFTyKUOupR77dG1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35242780"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35242780"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 01:12:44 -0800
X-CSE-ConnectionGUID: 41GRWYOiT6W8kBRU9WrlCw==
X-CSE-MsgGUID: sQLE+jxVSJ2IHEI+CQNePw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103998165"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2024 01:12:44 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPI0v-0002ot-0r;
	Sun, 22 Dec 2024 09:12:41 +0000
Date: Sun, 22 Dec 2024 17:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 152/176]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412221705.LWDEGjgE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   cbdedad12232506c3f28f566960694f41d95acd3
commit: d12ce074f07af731469654848640ecf4b424ec81 [152/176] Reapply "CHROMIUM: arm64: dts: mt8186: Add corsola-squirtle board"
config: arm64-randconfig-053-20241214 (https://download.01.org/0day-ci/archive/20241222/202412221705.LWDEGjgE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221705.LWDEGjgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221705.LWDEGjgE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,squirtle', 'mediatek,mt8186'] is too short
   	'google,squirtle' is not one of ['mediatek,mt2701-evb']
   	'google,squirtle' is not one of ['mediatek,mt2712-evb']
   	'google,squirtle' is not one of ['mediatek,mt6580-evbp1']
   	'google,squirtle' is not one of ['prestigio,pmt5008-3g']
   	'google,squirtle' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,squirtle' is not one of ['mediatek,mt6592-evb']
   	'google,squirtle' is not one of ['mediatek,mt6755-evb']
   	'google,squirtle' is not one of ['mediatek,mt6765-evb']
   	'google,squirtle' is not one of ['mediatek,mt6779-evb']
--
   	'google,hayato-sku2' was expected
   	'google,spherion-rev2' was expected
   	'google,spherion' was expected
   	'mediatek,mt8192' was expected
   	'google,tomato' was expected
   	'google,tomato-rev3' was expected
   	'mediatek,mt8195' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8516' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /: failed to match any schema with compatible: ['google,squirtle', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: pmic@6: compatible:0: 'mediatek,mt6315-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: pmic@6: compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator'] is too long
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/spmi@10015000/pmic@6: failed to match any schema with compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: touchscreen@16: reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: trackpad@68: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/i2c@11016000/codec@1a: failed to match any schema with compatible: ['realtek,rt5650']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts-legacy']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: jpeg-encoder@17030000: iommus: [[125, 233], [125, 234], [125, 235], [125, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
