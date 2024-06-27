Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49506DDA6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719453937; cv=none; b=cLCdJ+peWgn6iMPOs9jFYbsc/4c68YVRd5MBR+6pW7tNRUbKNGTRJPrGuiVJyBf/c6oOtR1W0mP/aAFlcz7L7ngasvOYcWfjEXsEYvsQbgyvQLkGb0H9bC8sqTq2MLn2adoJ+zPKnn3Dtr2xiEJPNKgeW6JJPczvKouSU+YcaJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719453937; c=relaxed/simple;
	bh=KypsL9crrgT0qwPiWJqApLSqs1bl5NfVvEB19YkNjYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+sa6oUEmVsMdlqtDrJXd6F8vpet8ORsXsrpg0SH7K1U87FAAag/fvW1YCS6Duq7j4XwUI7Bi7/5+vUQ9Rtv0z1/VN5JP4T4ZTBm3U6Vhi7pdxTJ9WlVmEibzh8qtw+V/NwvKqbnYLwZcMXUAMHIJgJPdCyYnl8Oc17GOT9YDOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkLzVtB0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkLzVtB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719453935; x=1750989935;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KypsL9crrgT0qwPiWJqApLSqs1bl5NfVvEB19YkNjYE=;
  b=SkLzVtB0TT6bXK85/xfaGc2g/QmpP66pJV+pCDBGZG6u0nI5+FkiqGvR
   jYL0GXSuLgqd2f3FqIb9i3qh7lLrgRHgw/Juk0acjVPGhnoR+vuTRdxE3
   AYR8v6Vmzz81T6fc2GzWmuMoG00DA40nB3OCtDIG693BPJL0OEyupV1IL
   6IpUFVnWwFeOxmme9uGLz37U+ElNZ4rRuFSpJNSoRD9whMyL1eIVg4WZL
   +As+pNASwIEvnEE9/1NqANeTPT3YMxDgce8FJKk6Yr8AgfAmfOZa1B57p
   q1QrUI76rCvalgU7KMFw+htt5c32RzkvTKX1neZAKBwOBuvAL3ZHUBGAS
   w==;
X-CSE-ConnectionGUID: HZmY9om1TV+jVTJa09cgMA==
X-CSE-MsgGUID: bCDIlye8SpSWEMtZDBb66A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="41975952"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="41975952"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 19:05:25 -0700
X-CSE-ConnectionGUID: +AApWDWQTJ+9B9F/S3+ngw==
X-CSE-MsgGUID: DQRKATRfQCuf27qOic3BgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="48675961"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 19:05:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMeVm-000Fla-05;
	Thu, 27 Jun 2024 02:05:22 +0000
Date: Thu, 27 Jun 2024 10:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm32-for-6.11 16/22]
 arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: efuse@700000: Unevaluated
 properties are not allowed ('ranges' was unexpected)
Message-ID: <202406270911.HpFQFcSb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm32-fo=
r-6.11
head:   fed1c79fc7fe10900d99a79a36e40443f3267ef3
commit: 81fc54e62b5b391d78f741bf33c3a91f18464ffb [16/22] ARM: dts: qcom: us=
e generic node names for Adreno and QFPROM
config: arm-randconfig-051-20240626 (https://download.01.org/0day-ci/archiv=
e/20240627/202406270911.HpFQFcSb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240627/202406270911.HpFQFcSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270911.HpFQFcSb-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: syscon@1200000: compat=
ible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: timer@200a000: 'clocks=
' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: sps-sic-non-secure@121=
00000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: efuse@700000: Unevalua=
ted properties are not allowed ('ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: clock-controller@90000=
0: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.y=
aml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: clock-controller@90000=
0: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', =
'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.y=
aml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: rpm@108000: 'clock-con=
troller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctr=
l-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: /soc/phy@1b400000: fai=
led to match any schema with compatible: ['qcom,apq8064-sata-phy']
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: /soc/sata@29000000: fa=
iled to match any schema with compatible: ['qcom,apq8064-ahci', 'generic-ah=
ci']
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: syscon@5700000: compat=
ible: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: syscon@1200000: compati=
ble: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: timer@200a000: 'clocks'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: sps-sic-non-secure@1210=
0000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: efuse@700000: Unevaluat=
ed properties are not allowed ('ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: clock-controller@900000=
: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.y=
aml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: clock-controller@900000=
: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', '=
reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.y=
aml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: rpm@108000: 'clock-cont=
roller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: /soc/phy@1b400000: fail=
ed to match any schema with compatible: ['qcom,apq8064-sata-phy']
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: /soc/sata@29000000: fai=
led to match any schema with compatible: ['qcom,apq8064-ahci', 'generic-ahc=
i']
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: syscon@5700000: compati=
ble: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: syscon@1=
200000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: timer@20=
0a000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: sps-sic-=
non-secure@12100000: compatible: 'anyOf' conditional failed, one must be fi=
xed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: efuse@70=
0000: Unevaluated properties are not allowed ('ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: clock-co=
ntroller@900000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.y=
aml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: clock-co=
ntroller@900000: Unevaluated properties are not allowed ('#clock-cells', '#=
reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.y=
aml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: rpm@1080=
00: 'clock-controller' does not match any of the regexes: '^regulators(-[01=
])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: /soc/phy=
@1b400000: failed to match any schema with compatible: ['qcom,apq8064-sata-=
phy']
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: /soc/sat=
a@29000000: failed to match any schema with compatible: ['qcom,apq8064-ahci=
', 'generic-ahci']
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: syscon@5=
700000: compatible: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: syscon@1200000:=
 compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: timer@200a000: =
'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: sps-sic-non-sec=
ure@12100000: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: efuse@700000: U=
nevaluated properties are not allowed ('ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: clock-controlle=
r@900000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.y=
aml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: clock-controlle=
r@900000: Unevaluated properties are not allowed ('#clock-cells', '#reset-c=
ells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.y=
aml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: rpm@108000: 'cl=
ock-controller' does not match any of the regexes: '^regulators(-[01])?$', =
'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: /soc/phy@1b4000=
00: failed to match any schema with compatible: ['qcom,apq8064-sata-phy']
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: /soc/sata@29000=
000: failed to match any schema with compatible: ['qcom,apq8064-ahci', 'gen=
eric-ahci']
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: syscon@5700000:=
 compatible: 'anyOf' conditional failed, one must be fixed:

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
