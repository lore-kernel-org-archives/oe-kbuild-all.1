Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6451330321
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767906858; cv=none; b=n5hZ4hxLw8yvmy7G/ciDW2KEfWR7pDCCE6v2fHFwiIvkG6Er4uT+HLreF+MNy2pLYUKh8f5nzFx3WNKJSpXqxGhqMsjJE44XUZMDRdBekeHTz9vkXGru86A5hYaJzVbJgHK7pIxqRtj9FnNf536YVrixEUirXa5nXNUD42sZ2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767906858; c=relaxed/simple;
	bh=SfPkW+HHPtauyxCO6kFAnxSWBNtQCjNImb0OFBD2yMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ofSMQrC8wRuAB1dHbimyt1MfBDzr8XR7HXDn3vB+nAFUwMR+T5fvkjalGcgI7wguWu372+K5jZAymmFZUDmUflY27Ry7SHoc+ErjMV0cPzBkLRVI3ECYL67YsrgzUffCA8TUDLZYItA7CUKVVXGNc56KLPrqwzXT7zm+4OfsiRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGCyd+dk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGCyd+dk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767906856; x=1799442856;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SfPkW+HHPtauyxCO6kFAnxSWBNtQCjNImb0OFBD2yMQ=;
  b=AGCyd+dk96OZN57uxTrW9LOwBS2h66QaLiJ8LgucCEcS+OUPSYIZBZFM
   H0NKkpHUI+6WqeGxztRBuI29E/+wyPYNnJFq0uJZ/CKf7+q/Zf2FfpMUR
   aYGKYSXtFNbE9MGZlOHubqMKbF7Au+ZRu0zHT6qg+hnav2MXsYmQlRqkD
   IQEg+O1Go8Y3D26zHuEGDX7st9DlnKB/K6NPrn7TDPuO9/LMHPjfx2lRk
   MPZBwnF9qMsL7SfbsVXnYOFwVfvkWSHB2KJhcTf+N3bwApiTa1wVR/fOn
   uVu/1Xol8tBFTpse/LvEzG31K4hdYmwUYmEbB/pjQBMSYbNvrzXkMczeh
   w==;
X-CSE-ConnectionGUID: fDe5bVXtSvC+SichPbnWyQ==
X-CSE-MsgGUID: hl8UAxNBTsyV6n3WtqLPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73150429"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="73150429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 13:14:15 -0800
X-CSE-ConnectionGUID: E9LPwu3+TzmH2BTDFv+O2g==
X-CSE-MsgGUID: PC4qJc/iQ/OS+EaZdtYuqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="202432028"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Jan 2026 13:14:13 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdxKc-000000001rA-2Lm1;
	Thu, 08 Jan 2026 21:14:10 +0000
Date: Thu, 08 Jan 2026 22:13:47 +0100
From: kernel test robot <lkp@intel.com>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 4349/4725]
 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: pcie@11280000
 (mediatek,mt7981-pcie): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202601082213.bVj8gR2d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
commit: b82833f94f48047b5bf34077d55545ebc67b26a6 [4349/4725] arm64: dts: me=
diatek: mt7981b: Add PCIe and USB support
config: arm64-randconfig-2051-20260107 (https://download.01.org/0day-ci/arc=
hive/20260108/202601082213.bVj8gR2d-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260108/202601082213.bVj8gR2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082213.bVj8gR2d-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: pcie@11280000 (=
mediatek,mt7981-pcie): compatible: 'oneOf' conditional failed, one must be =
fixed:
   	['mediatek,mt7981-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek=
,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/pcie@11280=
000: failed to match any schema with compatible: ['mediatek,mt7981-pcie', '=
mediatek,mt8192-pcie']
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
--
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:111.10-160.4: Warni=
ng (avoid_unnecessary_addr_size): /soc/spi@11009000/flash@0: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "=
ranges" property
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: pcie@11280000 (med=
iatek,mt7981-pcie): compatible: 'oneOf' conditional failed, one must be fix=
ed:
   	['mediatek,mt7981-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek=
,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/pcie@11280000=
: failed to match any schema with compatible: ['mediatek,mt7981-pcie', 'med=
iatek,mt8192-pcie']
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
--
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: pcie@11280000 (=
mediatek,mt7981-pcie): compatible: 'oneOf' conditional failed, one must be =
fixed:
   	['mediatek,mt7981-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek=
,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/pcie@11280=
000: failed to match any schema with compatible: ['mediatek,mt7981-pcie', '=
mediatek,mt8192-pcie']
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
