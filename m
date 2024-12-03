Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593973398B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228926; cv=none; b=RGpb9QVZgCnLCWEqY4jLaBrvdVZ5HwngtQd65PADh5zc5riA0djyh6LehbyzLjBjGa4251NkDkeLxvqlsnIZDpbNKSJYSY3dl4cG2OEQJcWG1OxGy+4zzljuCJhgEMhYRKxz8svW5OXCBJMciB9QCiw05lsv+YRFxxBjo4DhE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228926; c=relaxed/simple;
	bh=P1PYjUGnTFznjYvNMk4Fo6lZB8kXwy+0mll8BjMuaYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TsPNh4v71zNWCyT3asxmXAhaS/qe9uVawHhn15+u75SoykNs1Om5ySUKk3gkyD9UokJ+K6Mhu6V6PFsOjTRSbLK7GyQEP24sRbCAFYLOmI/DBt3Uap1pN43LPBkFPHxqBcGi99aW09tVoFszpKgMrcsx/CwCUHAuhk7xar4Zq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONQmDrLb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONQmDrLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733228924; x=1764764924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P1PYjUGnTFznjYvNMk4Fo6lZB8kXwy+0mll8BjMuaYQ=;
  b=ONQmDrLbz+cRofgdDowPOgVagtUVtL0t8bcw7CouJniOUCAhBRY2j/pH
   h1EquI7uNUt2PnJm4lIixIq5tW64EUH4EK8dCOx8VJfi9clttMtPZV2yX
   lTz3aey2jiOv6EgzVJTrrJZZujL/zGGbGIP0EtysnmgG9T+AnMsCmM0tP
   lGnTYzc84zCLoOY+bORVBrDJa6UnOq1Du5ijGnDV3YaOP20RnqQ6MeyAu
   PFVmMUoezpBozVUjguJOSfqtR1XUCe94RmvNUvkopuCrLDs24c71YrHnB
   oJRXCQ0CEcwCETTWUCAPG9xUWxkeh7JLn8t/ncZBDy+3+58eFFiW3P1EN
   w==;
X-CSE-ConnectionGUID: 2ehvlaliShCkqFfcEsNdyQ==
X-CSE-MsgGUID: Rf/WOCebSSShYerTMWfIUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33362230"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33362230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 04:28:43 -0800
X-CSE-ConnectionGUID: VHnzfVfVQMulJOwrOsqYuQ==
X-CSE-MsgGUID: B7mhcfqUQb6DdrVPZ80Htg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="130879496"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Dec 2024 04:28:42 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIS1A-0000eR-0r;
	Tue, 03 Dec 2024 12:28:40 +0000
Date: Tue, 3 Dec 2024 20:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-ea7682dbe6cf 114/520]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412032051.VtFNvqBo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-ea7682dbe6cf
head:   ac7a77c24fbce62cf3a673f994358d50cb59808a
commit: c93894e12a9ffd3c061054d839aa1e46a1f76f1d [114/520] UPSTREAM: arm64: dts: mt8183: Add kukui katsu board
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241203/202412032051.VtFNvqBo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412032051.VtFNvqBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412032051.VtFNvqBo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:87.27-121.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:123.33-129.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1662.18-1668.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1669.18-1672.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:146.25-179.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:87.27-121.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "10"
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:123.33-129.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1186.21-1196.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1963.28-1967.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2077.27-2081.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,katsu-sku32', 'google,katsu', 'mediatek,mt8183'] is too long
   	['google,katsu-sku32', 'google,katsu', 'mediatek,mt8183'] is too short
   	'google,katsu-sku32' is not one of ['mediatek,mt2701-evb']
   	'google,katsu-sku32' is not one of ['mediatek,mt2712-evb']
   	'google,katsu-sku32' is not one of ['mediatek,mt6580-evbp1']
   	'google,katsu-sku32' is not one of ['prestigio,pmt5008-3g']
   	'google,katsu-sku32' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,katsu-sku32' is not one of ['mediatek,mt6592-evb']
   	'google,katsu-sku32' is not one of ['mediatek,mt6755-evb']
   	'google,katsu-sku32' is not one of ['mediatek,mt6765-evb']
--
   	'mediatek,mt8365' was expected
   	'mediatek,mt8516' was expected
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,kakadu' was expected
   	'google,steelix-rev0-sku196608' was expected
   	'google,tentacruel-sku262145' was expected
   	'google,tentacruel-sku262149' was expected
   	'google,spherion-rev1' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /: failed to match any schema with compatible: ['google,katsu-sku32', 'google,katsu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /: failed to match any schema with compatible: ['google,katsu-sku32', 'google,katsu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: i2c@11009000: Unevaluated properties are not allowed ('camera_main_af', 'sensor_main' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g72-power-model']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dma-controller0@14001000: mboxes: [[127, 20, 0], [0], [127, 21, 0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dma-controller0@14001000: 'mdp3-ccorr0', 'mdp3-rsz0', 'mdp3-rsz1', 'mdp3-wdma0', 'mdp3-wrot0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: mdp3-wdma@14006000: iommus:0: [128, 8] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: mdp3-wdma@14006000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
