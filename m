Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10FB2DCC09
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748781298; cv=none; b=BXO9IdnMeIMEivtCLWQWLtusnCuUAwvmqWLXHZTsHlx8bqTZQBxh4YnFsc0c2kGGETJk4hTcOg6JDjlx/tX22+lXpadK86pJMxa+EN4ZoMYY5MAmCzIwCeD3U7qunmazNwk6b/tpr5+aE+W862A/FlBtTNZrG2UEQuuJWEJGVAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748781298; c=relaxed/simple;
	bh=OBOS3YN+piUTS+xQNDa2fRuXmawa7fZdndPMVF7chBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gllZKGh+pWqzxzQ4xSZFd7eW9f1v80J7xIKkRlYCPajOLKz48Io0LV8FOHQ+5NV5shgG6JrbXqh4Vu0CVw9SyFFU/0ZVUjW9+euJm3HtkOz+7HaTRvt3BUmZNd+yyWjiOX/Dzv3RdKYEdkUmHuK+XlqHi9XF+8D05g8wVFSPg28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cg6Gm8HA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cg6Gm8HA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748781295; x=1780317295;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OBOS3YN+piUTS+xQNDa2fRuXmawa7fZdndPMVF7chBg=;
  b=Cg6Gm8HASMx5OuKHxsiWFE5ALlbYjVGWkJQMHVKBgJeq01HHLZ2qKFG+
   yjgllc4jq9hYT9YHDpJz/plFHUjE4MGP0hAXE5jvwlNFtoEyt8zeHMXml
   LeHFmMd4Z3gEwPnGx9cvtegZjeeLsIaVgNYN36SyzOA12XlEDQqN0dtAW
   92efDnhAhH6dvglKt9jBEprXXz8qz2nWAmT7L+CERhITu4Pb6sWXSFnIo
   07yhqWIOfi6SoTjvhc15xQx5Dl+kyopljE1djySZc1C8emqodB2bF3Uis
   3qp+LasgxDNhrq0kBf8fjGp01g0/p1SBtvm8Bba7Z6AEGMaD6jcRGsad0
   w==;
X-CSE-ConnectionGUID: Dr0LKtRzRo+VhF6F3AdV9A==
X-CSE-MsgGUID: uJZibJw0RxaRmiX0jhPHZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="76202738"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="76202738"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 05:34:54 -0700
X-CSE-ConnectionGUID: Rb73fx18TpGU8H7q+jSd2g==
X-CSE-MsgGUID: mmtwxVVCRQSAykl9izKY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="181488168"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Jun 2025 05:34:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLhtq-000Yvk-2b;
	Sun, 01 Jun 2025 12:34:50 +0000
Date: Sun, 1 Jun 2025 20:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic (mediatek,mt6397):
 '#address-cells', '#size-cells', 'mt6397clock', 'mt6397regulator',
 'mt6397rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202506012022.rEyWchlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: 6e357f572638547e9c9e8d8abb7dc572c12032f3 [2/2] dt-bindings: mfd: me=
diatek: mt6397: Convert to DT schema format
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/arch=
ive/20250601/202506012022.rEyWchlp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f81=
9f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250601/202506012022.rEyWchlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506012022.rEyWchlp-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avo=
id_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-c=
ells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10001000 (=
mediatek,mt8173-infracfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10003000 (=
mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000 (mediatek,=
mt8173-pinctrl): 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2=
c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', =
'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do=
 not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic (mediatek,mt6397): '#a=
ddress-cells', '#size-cells', 'mt6397clock', 'mt6397regulator', 'mt6397rtc'=
 do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic (mediatek,mt6397): 're=
gulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('reg=
ulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regu=
lator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('=
regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('r=
egulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regu=
lator-compatible' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avo=
id_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-c=
ells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@=
10001000 (mediatek,mt8173-infracfg): '#power-domain-cells' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@=
10003000 (mediatek,mt8173-pericfg): '#power-domain-cells' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000 =
(mediatek,mt8173-pinctrl): 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', '=
i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default'=
, 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb'=
, 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pmic (mediatek,mt=
6397): '#address-cells', '#size-cells', 'mt6397clock', 'mt6397regulator', '=
mt6397rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pmic (mediatek,mt=
6397): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (=
mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not all=
owed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (=
mediatek,mt6397-regulator): buck_vpca7: Unevaluated properties are not allo=
wed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (=
mediatek,mt6397-regulator): buck_vsramca15: Unevaluated properties are not =
allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (=
mediatek,mt6397-regulator): buck_vsramca7: Unevaluated properties are not a=
llowed ('regulator-compatible' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: power-controller@10001000 (=
mediatek,mt8173-infracfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: power-controller@10003000 (=
mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000 (mediatek,=
mt8173-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'm=
mc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_idd=
ig_pull_up', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pi=
ns$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pwrap@1000d000 (mediatek,mt=
8173-pwrap): 'power-domains' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pw=
rap.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pmic (mediatek,mt6397): 'mt=
6397regulator' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pmic (mediatek,mt6397): 're=
gulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('reg=
ulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regu=
lator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('=
regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('r=
egulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt639=
7-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,m=
t6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regu=
lator-compatible' was unexpected)
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: pmic=
 (mediatek,mt6366): 'codec' does not match any of the regexes: '^pinctrl-[0=
-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dp-b=
ridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it650=
5.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: soun=
d (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: pmic (m=
ediatek,mt6366): 'codec' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: dp-brid=
ge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it650=
5.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: sound (=
mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: pmic =
(mediatek,mt6366): 'codec' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dp-br=
idge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it650=
5.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: sound=
 (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required prope=
rty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: pmi=
c (mediatek,mt6366): 'codec' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: dp-=
bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it650=
5.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: sou=
nd (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: pm=
ic (mediatek,mt6366): 'codec' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: dp=
-bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it650=
5.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: so=
und (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: pmic =
(mediatek,mt6366): 'codec' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: spmi@=
10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('i=
nterrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.y=
aml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: dp-br=
idge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it650=
5.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: sound=
 (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic (me=
diatek,mt6359): 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic (me=
diatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: syscon@1=
1210000 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of th=
e regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk',=
 'aud_dac_predis_clk', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk=
', 'aud_apll24m_clk', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_td=
m_clk', 'aud_tml_clk', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk',=
 'aud_adc_hires_tml', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3r=
d_dac_predis_clk', 'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_c=
lk', 'aud_infra_26m_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpl=
l_d4_d4', 'top_mux_aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck',=
 'top_mux_aud_eng1', 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 't=
op_i2s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_=
i2s4_m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s=
8_m_sel', 'top_i2s9_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll=
12_div2', 'top_apll12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apl=
l12_div5', 'top_apll12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_ap=
ll12_div9', 'top_mux_audio_h', 'top_clk26m_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clocks: [[56, 0], [56, 7], [56, 8], [56, 6]=
, [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10],=
 [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56,=
 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101]=
, [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], =
[22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, =
67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, =
147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]]=
 is too long

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
