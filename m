Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0F2980A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828207; cv=none; b=TMiUZVrJtgYaY1ojPfbah0CYXI1QMvpg4Wn/fyg4sIF+WPmGQBa8OsBuR+24rSVsG4KcfgbSXxqCVJxR1S59wm8Mnyne7Nxif7F0pXU6keOgufnueSGOL9b6qwsYOUSqF/HHMiph/12W9sUrCf/x1kKeFvd7NLeAFJNw5vURCvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828207; c=relaxed/simple;
	bh=7sTfXxiJV8abCwgw+WqHpNM1nM77M2dMWvjXkXnVaIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Iym1Q9KvEVkDp1uP9BSpzne+Bv0dRs2kY2HAQ73oU0WAYkXzq7qP+pLW7soHnb+QjfGlcpxkw1WmnP68YS9Pa8VcCeqWeUF/SnNhYUMaN5HNI4F3hJ1MOpVmkL4qCnVZIIdjZv7dGpBiwdTU9vyYuA9afHORwKZmNpdaV+h2M3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZdiEcEP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZdiEcEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775828206; x=1807364206;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7sTfXxiJV8abCwgw+WqHpNM1nM77M2dMWvjXkXnVaIA=;
  b=eZdiEcEPdVKYtoRldv5FZv5UTmvT7HCclW6bNP9TzMpZQ4Iig4/BuyzH
   SXzz4M8EtaVzr8yGDSxEITlfrfpdrNQUQgOdi2zrGA2BCBrs6EhdrFxlR
   gRnI82snN6rXNU5B/JHcz5m26/hvItRINHhz3l1SHi78LipfzXI1PMlIN
   URS74sNPoZZxKl3a1AkE/ZEEUUbLub0v5T4SOIT0kxZt+yE7nO6ltatSx
   MRQjp7T4oppb+BUGkuAIKvQ6Oks8NOLW2mM/iTVtEj5xmdjIqJhIon7GD
   s5WDiyMM+ebdVxaBv02u7wIZOFF1/g2+uw7XG8A8ES8yfdtzb0fJJeZ0n
   A==;
X-CSE-ConnectionGUID: RrNTue0PQ+uYAtFPKNHKSQ==
X-CSE-MsgGUID: MI9iuks9TYOWAdabMF0QpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76724621"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76724621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:36:46 -0700
X-CSE-ConnectionGUID: o7hA9f2tSWSnjzWyeeU00A==
X-CSE-MsgGUID: XWrsbe7iSMO8+AX6soyxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230811427"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 06:36:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBC1n-00000000Atx-3hBf;
	Fri, 10 Apr 2026 13:36:07 +0000
Date: Fri, 10 Apr 2026 15:35:42 +0200
From: kernel test robot <lkp@intel.com>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb:
 topmisc@11d10000 (mediatek,mt7981-topmisc): Unevaluated properties are not
 allowed ('#clock-cells' was unexpected)
Message-ID: <202604101505.FgzlQ3Ar-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: 262cb81069c65373d4d6b773413552a65b478f7e arm64: dts: mediatek: mt79=
81b: Add PCIe and USB support
date:   3 months ago
config: arm64-randconfig-2055-20260409 (https://download.01.org/0day-ci/arc=
hive/20260410/202604101505.FgzlQ3Ar-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43=
d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260410/202604101505.FgzlQ3Ar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 262cb81069c6 ("arm64: dts: mediatek: mt7981b: Add PCIe and USB sup=
port")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101505.FgzlQ3Ar-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: topmisc@11d1000=
0 (mediatek,mt7981-topmisc): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,mt7981-topmisc', 'syscon'] is too short
   	'mediatek,mt7981-topmisc' is not one of ['airoha,en7581-pbus-csr', 'al,=
alpine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'allwi=
nner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', =
'allwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'a=
md,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-boot=
rom', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,m=
eson8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,must=
ang-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb',=
 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc=
-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', =
'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', =
'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freec=
om,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wak=
eupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cp=
ucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip=
04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-s=
ysreg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon',=
 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,arma=
da-3700-avs', 'marvell,armada-3700-usb2-host-device-misc', 'marvell,armada-=
3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a=
-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscf=
g', 'mediatek,mt7988-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,m=
t8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-inf=
racfg-nao', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'micr=
ochip,mpfs-control-scb', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sf=
r', 'microchip,sama7d65-ddr3phy', 'microchip,sama7d65-sfrbu', 'microchip,sa=
ma7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,=
ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,apq8064=
-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos=
', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'ro=
ckchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3528-qos', 'rockchip=
,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk358=
8-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu=
', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-c=
trl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss=
-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,=
keystone-pllctrl']
   	'mediatek,mt7981-topmisc' is not one of ['microchip,sama7g5-sfrbu', 'mi=
crochip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'atmel,sama5d2-sfrbu' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: topmisc@11d1000=
0 (mediatek,mt7981-topmisc): Unevaluated properties are not allowed ('#cloc=
k-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: topmisc@11d10000 (=
mediatek,mt7981-topmisc): compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['mediatek,mt7981-topmisc', 'syscon'] is too short
   	'mediatek,mt7981-topmisc' is not one of ['airoha,en7581-pbus-csr', 'al,=
alpine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'allwi=
nner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', =
'allwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'a=
md,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-boot=
rom', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,m=
eson8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,must=
ang-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb',=
 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc=
-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', =
'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', =
'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freec=
om,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wak=
eupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cp=
ucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip=
04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-s=
ysreg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon',=
 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,arma=
da-3700-avs', 'marvell,armada-3700-usb2-host-device-misc', 'marvell,armada-=
3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a=
-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscf=
g', 'mediatek,mt7988-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,m=
t8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-inf=
racfg-nao', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'micr=
ochip,mpfs-control-scb', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sf=
r', 'microchip,sama7d65-ddr3phy', 'microchip,sama7d65-sfrbu', 'microchip,sa=
ma7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,=
ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,apq8064=
-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos=
', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'ro=
ckchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3528-qos', 'rockchip=
,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk358=
8-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu=
', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-c=
trl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss=
-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,=
keystone-pllctrl']
   	'mediatek,mt7981-topmisc' is not one of ['microchip,sama7g5-sfrbu', 'mi=
crochip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'atmel,sama5d2-sfrbu' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: topmisc@11d10000 (=
mediatek,mt7981-topmisc): Unevaluated properties are not allowed ('#clock-c=
ells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: topmisc@11d1000=
0 (mediatek,mt7981-topmisc): compatible: 'oneOf' conditional failed, one mu=
st be fixed:
   	['mediatek,mt7981-topmisc', 'syscon'] is too short
   	'mediatek,mt7981-topmisc' is not one of ['airoha,en7581-pbus-csr', 'al,=
alpine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'allwi=
nner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', =
'allwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'a=
md,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-boot=
rom', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,m=
eson8-pmu', 'amlogic,meson8b-pmu', 'apm,merlin-poweroff-mailbox', 'apm,must=
ang-poweroff-mailbox', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb',=
 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc=
-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', =
'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', =
'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freec=
om,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wak=
eupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cp=
ucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,hip=
04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-s=
ysreg', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon',=
 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,arma=
da-3700-avs', 'marvell,armada-3700-usb2-host-device-misc', 'marvell,armada-=
3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a=
-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscf=
g', 'mediatek,mt7988-topmisc', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,m=
t8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-inf=
racfg-nao', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'micr=
ochip,mpfs-control-scb', 'microchip,mpfs-sysreg-scb', 'microchip,sam9x60-sf=
r', 'microchip,sama7d65-ddr3phy', 'microchip,sama7d65-sfrbu', 'microchip,sa=
ma7g5-ddr3phy', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,=
ma35d1-sys', 'nuvoton,wpcm450-shm', 'qcom,apq8064-mmss-sfpb', 'qcom,apq8064=
-sps-sic', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos=
', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'ro=
ckchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3528-qos', 'rockchip=
,rk3562-qos', 'rockchip,rk3568-qos', 'rockchip,rk3576-qos', 'rockchip,rk358=
8-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu=
', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-c=
trl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss=
-oldi-io-ctrl', 'ti,j784s4-acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,=
keystone-pllctrl']
   	'mediatek,mt7981-topmisc' is not one of ['microchip,sama7g5-sfrbu', 'mi=
crochip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'atmel,sama5d2-sfrbu' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: topmisc@11d1000=
0 (mediatek,mt7981-topmisc): Unevaluated properties are not allowed ('#cloc=
k-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
