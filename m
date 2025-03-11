Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E526AE4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 04:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741669199; cv=none; b=ritRe8BEQlTPRY6nVQO3nOjIPWM7mTnjtidTTlmE5WwtO/FXI7bgkrkb/XBtP54+N+m/+lDGuFoOcPVceTJcjEoHS/j81jn3uBhWMGoo15i6JKLfTrap7DEfGlGl4m/z3qjHhaIDSRz+uvJYXtIgXOWWurRtmCvcQWnf3+f4oEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741669199; c=relaxed/simple;
	bh=T8dNBWD8AFThEgAnmGlyAM84dX2UTfVsC0TZt/Vdhbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZmTi5OhJ8AG1TmYbyFA5zrUHskDvhv578JwNMixuzw1XZpQn3pofmS2uG2vgvQM0l8nMNiJe5F/H/nBhyuL7T4zPCXxhtnEPTHgB56YQFwrC21t0mcVOnkjqtlvyo5OsDhqJu1jG90cmJX6BNIJiBhCeRKLeHXn8vF2lBoaII+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nn58INZV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nn58INZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741669198; x=1773205198;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T8dNBWD8AFThEgAnmGlyAM84dX2UTfVsC0TZt/Vdhbs=;
  b=Nn58INZVKYUaDYlkL0X2gvC7qWZCT2OdOhJAWTTiZDd9Yjdw/OJWYNG8
   QVUP1JCh+p7f6ce2ix/6swmftrhUhM99cw/K55g3oGLpwfFl3eaJmqQSj
   5CCCbiz8uPVXSz4G2XL2B9yBxNMvnh/iAP0tyH5EN0Hbs2bblpJ9fdeBQ
   Fn0wcBJLjhE3FhGb/ypDe2kzoxohE/zpT+4j3EhMJhROIh6iA0nzmQmZe
   V1qbkETLY7LMozV9svx52XdOKth563PkhRZdhu724B6inH+n7c/mJuOto
   tbaCYyX+7CDmWO7areF+XUwcmP5p9R7aFyi4oE3iAHD5OvwHustZbsUlq
   Q==;
X-CSE-ConnectionGUID: /Mv9B0JPSJSDLM5cprMiiA==
X-CSE-MsgGUID: TmsXwoyeTXyzipgfjpkFvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54066559"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="54066559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 21:59:57 -0700
X-CSE-ConnectionGUID: Zr/Z+HXXRNihh31xGmeCmg==
X-CSE-MsgGUID: odH2lZGxSg61wvsSe9j6MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="121103198"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Mar 2025 21:59:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trrib-0006MC-1C;
	Tue, 11 Mar 2025 04:59:53 +0000
Date: Tue, 11 Mar 2025 12:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 7316/9634]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503111231.JzkmowRE-lkp@intel.com>
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
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: df41b7c0ccb4239ca4644f15902b480d8f11c550 [7316/9634] ARM: dts: micr=
ochip: sama7d65: Add watchdog for sama7d65
config: arm-randconfig-052-20250304 (https://download.01.org/0day-ci/archiv=
e/20250311/202503111231.JzkmowRE-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a=
2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250311/202503111231.JzkmowRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111231.JzkmowRE-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: sfr@e0008000: c=
ompatible:0: 'microchip,sama7d65-sfrbu' is not one of ['al,alpine-sysfabric=
-service', 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-sy=
stem-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50=
i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba=
-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,m=
eson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'aml=
ogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,mustang-poweroff-mai=
lbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb',=
 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sam=
a5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset=
', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-s=
yscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-syste=
m-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', =
'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilico=
n,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip04-ppe', 'hisili=
con,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'loongso=
n,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada=
-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'm=
arvell,armada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek=
,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-p=
ctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-=
syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microc=
hip,lan966x-cpu-syscon', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sf=
r', 'microchip,sama7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pm=
sleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', '=
rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockch=
ip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3=
399-qos', 'rockchip,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qo=
s', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'ste=
ricsson,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table',=
 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-ef=
use', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784=
s4-pcie-ctrl', 'ti,keystone-pllctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: sfr@e0008000: c=
ompatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: sfr@e0008000: c=
ompatible: ['microchip,sama7d65-sfrbu', 'atmel,sama5d2-sfrbu', 'syscon'] is=
 too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/sfr@e00080=
00: failed to match any schema with compatible: ['microchip,sama7d65-sfrbu'=
, 'atmel,sama5d2-sfrbu', 'syscon']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0=
014000: failed to match any schema with compatible: ['microchip,sama7d65-pi=
nctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0=
014000: failed to match any schema with compatible: ['microchip,sama7d65-pi=
nctrl', 'microchip,sama7g5-pinctrl']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d0=
00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-wdt', 'microchip,sama7g5-wdt'] is too long
   	'microchip,sama7d65-wdt' is not one of ['atmel,sama5d4-wdt', 'microchip=
,sam9x60-wdt', 'microchip,sama7g5-wdt']
   	'microchip,sam9x7-wdt' was expected
   	'microchip,sam9x60-wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-w=
dt.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d0=
00: Unevaluated properties are not allowed ('clocks', 'compatible' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-w=
dt.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/watchdog@e=
001d000: failed to match any schema with compatible: ['microchip,sama7d65-w=
dt', 'microchip,sama7g5-wdt']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: reset-controlle=
r@e001d100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-rstc', 'microchip,sama7g5-rstc'] is too long
   	'microchip,sama7d65-rstc' is not one of ['atmel,at91sam9260-rstc', 'atm=
el,at91sam9g45-rstc', 'atmel,sama5d3-rstc', 'microchip,sam9x60-rstc', 'micr=
ochip,sama7g5-rstc']
   	'atmel,sama5d3-rstc' was expected
   	'atmel,at91sam9g45-rstc' was expected
   	from schema $id: http://devicetree.org/schemas/reset/atmel,at91sam9260-=
reset.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/reset-cont=
roller@e001d100: failed to match any schema with compatible: ['microchip,sa=
ma7d65-rstc', 'microchip,sama7g5-rstc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: poweroff@e001d2=
00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-shdwc', 'microchip,sama7g5-shdwc', 'syscon'] is to=
o long
   	'microchip,sama7g5-shdwc' was expected

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
