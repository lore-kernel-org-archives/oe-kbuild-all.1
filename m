Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1275381E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721167225; cv=none; b=EhI5LontanothdX5t17s3pVwOL9voJv2bBYvvfMPFoL1FXtLU5rJ9Fl2fBD0ripemfCVy+gsl19ZwWuu8a7gSaAcUsIRX+rRFWocgieU0K8N3SlEwx77cHL2bHVzXtyFYCW9iypTXYwUYANI19y/ZaySCaZfdLluRrpN3af9YWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721167225; c=relaxed/simple;
	bh=qP49QUzpuhb4HCUneR55jJYuHYbNZRXU2TS7wP4W+zY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zv8lZTyCHIYyHDL8byakt4Sr5Rq/FYCvR8qd1OUVo1ZuBEkHSx3P1LL8WxDV36IPJUveBdnNsaJGjS+vTa6BKLJxnTjw4D/X/VV9yGuo20CKEW8bw/lxuzbp1cMgwtRxsbpHdlB/k7kbOKQpdbGPCcz/ZiprrtZAtgJ7LF5+i4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdhFj7Rz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdhFj7Rz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721167221; x=1752703221;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qP49QUzpuhb4HCUneR55jJYuHYbNZRXU2TS7wP4W+zY=;
  b=bdhFj7RziCAiFL/gYG3JAih0Nqja8tVY5t77c4RW3UX/ZPPDmeEyjFfs
   LsOx0Qyosv4JOPyRSqUJg9PDU/wdoX8n6+3rhrV//WHDW7/crmXtPUEZk
   33gsDEmVgz/ZSdbhepMyM6xvAoB9TvhTaFhs3QavlJtLS8qZJl+Qp844k
   jXmpzO0YyBSi7pguYhdXq6xSm1MdK7Ico8o+g/2AOzIBR1GfoYoFx571F
   VeMI8flz4uGda7PtlhzaPQMzrQrIwt403t//BOBLOdLhsogt2lBqVSKap
   EsoCy4qUael17hdvkoDcK9nVBiGCjhGYBM7sMTc/5qFhnTlvi2cRBIdIk
   g==;
X-CSE-ConnectionGUID: ak/uwnIcSViEy/OPLS25YA==
X-CSE-MsgGUID: icdMsZ+cQuO1LFmj5CEXgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29312246"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="29312246"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 15:00:20 -0700
X-CSE-ConnectionGUID: Ch/U4waxRVChxWfOBWSQJQ==
X-CSE-MsgGUID: tYzBgLG8QS+gKsyOqorCaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="50901284"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jul 2024 15:00:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTqDY-000fi4-03;
	Tue, 16 Jul 2024 22:00:16 +0000
Date: Wed, 17 Jul 2024 05:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13106/13217]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb:
 thermal-zones: 'core-cluster-thermal' does not match any of the regexes:
 '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
Message-ID: <202407170543.iUDBHXxm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4f40be61af99a67d5580c1448acd9b74c0376389
commit: ba54b3703b92d0118edd5199eab4b882b43bced9 [13106/13217] Merge branch=
 'linux-next' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux=
-pm.git
config: arm64-randconfig-051-20240716 (https://download.01.org/0day-ci/arch=
ive/20240717/202407170543.iUDBHXxm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c=
6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240717/202407170543.iUDBHXxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170543.iUDBHXxm-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: int=
errupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a requir=
ed property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: the=
rmal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-=
zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: sys=
con@1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: efu=
se@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-ds=
pi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-ds=
pi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /so=
c/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-ds=
pi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: interrupt-co=
ntroller@6000000: msi-controller@6020000: '#msi-cells' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: thermal-zone=
s: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-z=
A-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: syscon@1e600=
00: compatible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: efuse@1e8000=
0: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@210=
0000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl=
,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@210=
0000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl=
,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@211=
0000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl=
,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: interru=
pt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: thermal=
-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z=
][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: syscon@=
1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: efuse@1=
e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/sp=
i@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/sp=
i@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/sp=
i@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: interru=
pt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: thermal=
-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z=
][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: syscon@=
1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: efuse@1=
e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/sp=
i@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/sp=
i@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/sp=
i@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: interru=
pt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: thermal=
-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z=
][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: syscon@=
1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: efuse@1=
e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/sp=
i@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/sp=
i@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/sp=
i@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: in=
terrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a requi=
red property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: th=
ermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a=
-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: sy=
scon@1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: ef=
use@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: au=
dio-codec@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: au=
dio-codec@1a: 'CPVDD-supply' is a required property
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: interru=
pt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: thermal=
-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z=
][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: syscon@=
1e60000: compatible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: efuse@1=
e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/sp=
i@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/sp=
i@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/sp=
i@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi',=
 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: thermal-zones: 'core-=
cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: syscon@1e60000: compa=
tible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: efuse@1e80000: Uneval=
uated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/i2c@2000000/fpga=
@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'f=
sl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/i2c@2000000/fpga=
@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'f=
sl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-=
v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: thermal-zones: 'core-=
cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: syscon@1e60000: compa=
tible: 'anyOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: efuse@1e80000: Uneval=
uated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp=
=2Eyaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-=
v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-=
v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2110000: fai=
led to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-=
v1.0-dspi']
--
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: thermal-zones: 'core-=
cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/memory-controlle=
r@1530000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-n=
and']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/memory-controlle=
r@1530000/board-control@2,0: failed to match any schema with compatible: ['=
fsl,ls1043aqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/memory-controlle=
r@1530000/board-control@2,0: failed to match any schema with compatible: ['=
fsl,ls1043aqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdi=
o@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdi=
o@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdi=
o@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: thermal-zones: 'core-=
cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/memory-controlle=
r@1530000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-n=
and']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/memory-controlle=
r@1530000/board-control@2,0: failed to match any schema with compatible: ['=
fsl,ls1043ardb-cpld']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/mmc@1560000: fai=
led to match any schema with compatible: ['fsl,ls1043a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/mmc@1560000: fai=
led to match any schema with compatible: ['fsl,ls1043a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: memory-controller@108=
0000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/f=
sl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/qman@1880000: fa=
iled to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/bman@1890000: fa=
iled to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/bman-portals-bus=
@508000000/bman-portal@0: failed to match any schema with compatible: ['fsl=
,bman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi:17.19-31.4: Wa=
rning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary =
#address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: ther=
mal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-z=
A-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc=
/mmc@1560000: failed to match any schema with compatible: ['fsl,ls1043a-esd=
hc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc=
/mmc@1560000: failed to match any schema with compatible: ['fsl,ls1043a-esd=
hc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: memo=
ry-controller@1080000: 'big-endian' does not match any of the regexes: 'pin=
ctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/f=
sl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc=
/qman@1880000: failed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc=
/bman@1890000: failed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc=
/bman-portals-bus@508000000/bman-portal@0: failed to match any schema with =
compatible: ['fsl,bman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc=
/bman-portals-bus@508000000/bman-portal@10000: failed to match any schema w=
ith compatible: ['fsl,bman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc=
/bman-portals-bus@508000000/bman-portal@20000: failed to match any schema w=
ith compatible: ['fsl,bman-portal']
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: thermal-zones: 'core=
-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\=
-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: memory-controller@10=
80000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/f=
sl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/memory-controll=
er@1530000/nand@0,0: failed to match any schema with compatible: ['fsl,ifc-=
nand']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/mmc@1560000: fa=
iled to match any schema with compatible: ['fsl,ls1046a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/mmc@1560000: fa=
iled to match any schema with compatible: ['fsl,ls1046a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman@1880000: f=
ailed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/bman@1890000: f=
ailed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman-portals-bu=
s@500000000/qman-portal@0: failed to match any schema with compatible: ['fs=
l,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman-portals-bu=
s@500000000/qman-portal@10000: failed to match any schema with compatible: =
['fsl,qman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts:240.16-329.4: Warning =
(unit_address_vs_reg): /soc/memory-controller@1530000/board-control@2,0/mdi=
o-mux-emi1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: thermal-zones: 'core-=
cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: memory-controller@108=
0000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/f=
sl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/memory-controlle=
r@1530000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-n=
and']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/memory-controlle=
r@1530000/board-control@2,0: failed to match any schema with compatible: ['=
fsl,ls1046aqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/memory-controlle=
r@1530000/board-control@2,0: failed to match any schema with compatible: ['=
fsl,ls1046aqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@1=
:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@2=
:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: thermal-zones: 'core-=
cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: memory-controller@108=
0000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/f=
sl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/memory-controlle=
r@1530000/nand@0,0: failed to match any schema with compatible: ['fsl,ifc-n=
and']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/memory-controlle=
r@1530000/board-control@2,0: failed to match any schema with compatible: ['=
fsl,ls1046ardb-cpld']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/mmc@1560000: fai=
led to match any schema with compatible: ['fsl,ls1046a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/mmc@1560000: fai=
led to match any schema with compatible: ['fsl,ls1046a-esdhc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/qman@1880000: fa=
iled to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/bman@1890000: fa=
iled to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/qman-portals-bus=
@500000000/qman-portal@0: failed to match any schema with compatible: ['fsl=
,qman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi:17.19-31.4: Wa=
rning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary =
#address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: ther=
mal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-z=
A-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: memo=
ry-controller@1080000: 'big-endian' does not match any of the regexes: 'pin=
ctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/f=
sl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc=
/mmc@1560000: failed to match any schema with compatible: ['fsl,ls1046a-esd=
hc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc=
/mmc@1560000: failed to match any schema with compatible: ['fsl,ls1046a-esd=
hc', 'fsl,esdhc']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc=
/qman@1880000: failed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc=
/bman@1890000: failed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc=
/qman-portals-bus@500000000/qman-portal@0: failed to match any schema with =
compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc=
/qman-portals-bus@500000000/qman-portal@10000: failed to match any schema w=
ith compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc=
/qman-portals-bus@500000000/qman-portal@20000: failed to match any schema w=
ith compatible: ['fsl,qman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: thermal-zones: 'core-=
cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,ls1088a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,ls1088a-dspi', 'fsl,ls1021a-=
v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,ls1088a-dspi', 'fsl,ls1021a-=
v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/gpio@2300000: fa=
iled to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-g=
pio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/gpio@2300000: fa=
iled to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-g=
pio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/gpio@2310000: fa=
iled to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-g=
pio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/gpio@2310000: fa=
iled to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-g=
pio']
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: thermal-zones: 'core-=
cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,ls1088a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,ls1088a-dspi', 'fsl,ls1021a-=
v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,ls1088a-dspi', 'fsl,ls1021a-=
v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2300000: fa=
iled to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-g=
pio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2300000: fa=
iled to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-g=
pio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2310000: fa=
iled to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-g=
pio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2310000: fa=
iled to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-g=
pio']
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts:287.19-336.4: Warnin=
g (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #add=
ress-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts:338.16-378.4: Warnin=
g (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@1: unnecessary #add=
ress-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: interrupt-controlle=
r@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: thermal-zones: 'cor=
e-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\=
\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/syscon@1f70000=
: failed to match any schema with compatible: ['fsl,ls1088a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: interrupt-controlle=
r@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [=
2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0]=
, [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1=
, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/spi@2100000: f=
ailed to match any schema with compatible: ['fsl,ls1088a-dspi', 'fsl,ls1021=
a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/spi@2100000: f=
ailed to match any schema with compatible: ['fsl,ls1088a-dspi', 'fsl,ls1021=
a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/gpio@2300000: =
failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq=
-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/gpio@2300000: =
failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq=
-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/gpio@2310000: =
failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq=
-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/gpio@2310000: =
failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq=
-gpio']
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi:17.19-31.4: Wa=
rning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary =
#address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: inte=
rrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a require=
d property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: ther=
mal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-z=
A-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc=
/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls1088a-=
isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: inte=
rrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4,=
 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5,=
 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0,=
 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc=
/spi@2100000: failed to match any schema with compatible: ['fsl,ls1088a-dsp=
i', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc=
/spi@2100000: failed to match any schema with compatible: ['fsl,ls1088a-dsp=
i', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc=
/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1088a-gp=
io', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc=
/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1088a-gp=
io', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc=
/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1088a-gp=
io', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc=
/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1088a-gp=
io', 'fsl,qoriq-gpio']
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /syscon@1e60000: fail=
ed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: thermal-zones: 'core-=
cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-=
cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]=
{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/ptp-timer@8b9500=
0: failed to match any schema with compatible: ['fsl,dpaa2-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8b96000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8b97000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8c07000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8c0b000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8c0f000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /syscon@1e60000: fail=
ed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: thermal-zones: 'core-=
cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-=
cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]=
{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/ptp-timer@8b9500=
0: failed to match any schema with compatible: ['fsl,dpaa2-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8b96000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8b97000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8c07000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8c0b000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8c0f000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
--
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /: failed to match an=
y schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /: failed to match an=
y schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /syscon@1e60000: fail=
ed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: thermal-zones: 'core-=
cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-=
cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]=
{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/ptp-timer@8b9500=
0: failed to match any schema with compatible: ['fsl,dpaa2-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8b96000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8b97000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8c07000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8c0b000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8c0f000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: interrupt-controller=
@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /syscon@1e60000: fai=
led to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: thermal-zones: 'core=
-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core=
-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/syscon@1f70000:=
 failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: interrupt-controller=
@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2=
, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0],=
 [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1,=
 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/ptp-timer@8b950=
00: failed to match any schema with compatible: ['fsl,dpaa2-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/mdio@8b96000: f=
ailed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/mdio@8b97000: f=
ailed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/mdio@8c07000: f=
ailed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/mdio@8c0b000: f=
ailed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/mdio@8c0f000: f=
ailed to match any schema with compatible: ['fsl,fman-memac-mdio']
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /syscon@1e60000: fail=
ed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: thermal-zones: 'core-=
cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-=
cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]=
{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/ptp-timer@8b9500=
0: failed to match any schema with compatible: ['fsl,dpaa2-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8b96000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8b97000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8c07000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8c0b000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8c0f000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /syscon@1e60000: fail=
ed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: thermal-zones: 'core-=
cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-=
cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]=
{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/ptp-timer@8b9500=
0: failed to match any schema with compatible: ['fsl,dpaa2-ptp']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8b96000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8b97000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8c07000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8c0b000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8c0f000: fa=
iled to match any schema with compatible: ['fsl,fman-memac-mdio']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: interrupt-contro=
ller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: thermal-zones: '=
ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0=
-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/syscon@1f70=
000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'sysco=
n']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: interrupt-contro=
ller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0]=
, [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1,=
 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0=
, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/i2c@2000000=
/i2c-mux@77/i2c@7/i2c-mux@75/i2c@0/spi@28: failed to match any schema with =
compatible: ['nxp,sc18is602b']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: interrupt-=
controller@6000000: msi-controller@6020000: '#msi-cells' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: thermal-zo=
nes: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a=
-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/sysco=
n@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', =
'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: interrupt-=
controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0,=
 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6,=
 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4,=
 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/i2c@2=
000000/i2c-mux@77/i2c@7/i2c-mux@75/i2c@0/spi@28: failed to match any schema=
 with compatible: ['nxp,sc18is602b']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2=
100000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'f=
sl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2=
100000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'f=
sl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2=
110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'f=
sl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2=
110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'f=
sl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2=
120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'f=
sl,ls2085a-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: interrupt-con=
troller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: thermal-zones=
: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA=
-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/syscon@1=
f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'sy=
scon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: interrupt-con=
troller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1,=
 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0,=
 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10=
, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fan-temperatu=
re-ctrlr@18: '#cooling-cells', 'cooling-max-state', 'cooling-min-state' do =
not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/i2c@2000=
000/i2c-mux@77/i2c@2/regulator@5c: failed to match any schema with compatib=
le: ['lltc,ltc3882']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/spi@2100=
000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,=
ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/spi@2100=
000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,=
ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/spi@2110=
000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,=
ls2085a-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: interrupt-contr=
oller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: thermal-zones: =
'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z=
0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/syscon@1f7=
0000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'sysc=
on']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: interrupt-contr=
oller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0=
], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1=
, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, =
0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fan-temperature=
-ctrlr@18: '#cooling-cells', 'cooling-max-state', 'cooling-min-state' do no=
t match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/i2c@200000=
0/i2c-mux@77/i2c@2/regulator@5c: failed to match any schema with compatible=
: ['lltc,ltc3882']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/spi@210000=
0: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls=
2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/spi@210000=
0: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls=
2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/spi@211000=
0: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls=
2085a-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: thermal-zones: 'ddr-c=
luster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/i2c@2000000/fpga=
@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'f=
sl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/i2c@2000000/fpga=
@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'f=
sl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/spi@2110000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/spi@2110000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: thermal-zones: 'ddr-c=
luster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2110000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2110000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2120000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2120000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: interrupt-contro=
ller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: thermal-zones: '=
ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0=
-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/syscon@1f70=
000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'sysco=
n']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: interrupt-contro=
ller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0]=
, [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1,=
 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0=
, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2100000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2110000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2120000=
: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2=
085a-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: interrupt-controller@=
6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: thermal-zones: 'ddr-c=
luster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-=
]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/syscon@1f70000: =
failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: interrupt-controller@=
14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2,=
 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], =
[6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, =
0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/i2c@2000000/fpga=
@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'f=
sl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/i2c@2000000/fpga=
@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'f=
sl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/spi@2100000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/spi@2110000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/spi@2110000: fai=
led to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-=
dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi:41.18-55.4: Wa=
rning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary =
#address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (=
avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-c=
ells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: inte=
rrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a require=
d property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm=
,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: ther=
mal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-z=
A-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc=
/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-=
isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: inte=
rrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4,=
 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5,=
 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0,=
 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl=
,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc=
/spi@2100000: failed to match any schema with compatible: ['fsl,lx2160a-dsp=
i', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc=
/spi@2100000: failed to match any schema with compatible: ['fsl,lx2160a-dsp=
i', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc=
/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dsp=
i', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc=
/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dsp=
i', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc=
/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dsp=
i', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc=
/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dsp=
i', 'fsl,ls2085a-dspi']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
