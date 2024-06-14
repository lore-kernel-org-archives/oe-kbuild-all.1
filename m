Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF39184134
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718403268; cv=none; b=kPOvkEogLD3aI26d/13ISSq1FJyoLNTow0gnCvU4lZaRVkvSX1Fsn9x+Yt87nqRcvzxqnmq/SxswtyogbC7DkG4/Ml7rxmlIGS6evExgS8NR75E9dcEFKco27IOp2REZYQRUgqWpd5PN9Jg/G3P41rJ4h7Oh80MAux5Y7YD7HwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718403268; c=relaxed/simple;
	bh=2ZA1PNx8/HgYToRkcSh2FWoeY2/RimerOCLcEoJGDd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdS0bVyF6lBI3hxP60jWs23KS3zY/wHHKqJifc06qj3wIp0tOXwl7Cd6jxnZMm8sixfPI25WQwn1EU9A+uJ2uhNnc18/8RpCXSviUertz9gqqIX21MBX+3gOuLwxIcJekSsdlHO87N7tJbb98pcYAkwPc1/bUBJKolhRiDVO4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wwqg/Xwj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wwqg/Xwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718403267; x=1749939267;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2ZA1PNx8/HgYToRkcSh2FWoeY2/RimerOCLcEoJGDd0=;
  b=Wwqg/XwjSfFd3G0jDHivq3OfTaLQVWNVwlMhz1sIM+SCIDH6mikrsENE
   eJXlpLQresh4uUC+QugSw9mEeKsWlFYsKMsHrvpTwuu1u2nxRN2k5xbLr
   eyxogHZBzgSlaDUtsjHTHZ3RzBMAnanH8eGHar7Y32fIGqrVlaeN3RVlx
   QGWMwSAzOx921+WZ+48UTUj+ubyq/gC9OV9pVvAZn0v7LL36EvNRKXkCH
   F1Bq3OMQkmIUofeEp7B9ZxSpLE0Xle8DJZw5cV40iJisMAXKQdXgjIzs2
   tZ7SkC8RzWa9bKBwvtI8zeJ0OP+rF9rhnYfxB2BMcUGfYxmPwoEllQ/gC
   Q==;
X-CSE-ConnectionGUID: IXd7diSYTe+GH0oaFXXDwg==
X-CSE-MsgGUID: 7eETOnbcTbGlAQED9O4XMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15434691"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15434691"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 15:14:27 -0700
X-CSE-ConnectionGUID: LulLm7cKQ/CGec+4+x+zaQ==
X-CSE-MsgGUID: a3eFmQtgRQ2Wo6U9f0PNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="45005092"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2024 15:14:25 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIFBe-0001qT-1s;
	Fri, 14 Jun 2024 22:14:22 +0000
Date: Sat, 15 Jun 2024 06:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 6/137]
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: dss-oldi-io-ctrl@8600: compatible:
 'anyOf' conditional failed, one must be fixed:
Message-ID: <202406150616.TwPM4woh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y=
-wip
head:   8086474caf5dc2570a947669acf226d319cd0651
commit: 3ac4f7eae7cadbab878fd172b1f116ae24358275 [6/137] arm64: dts: ti: k3=
-am62p-main: Add support for DSS0
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/arch=
ive/20240615/202406150616.TwPM4woh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d=
2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240615/202406150616.TwPM4woh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150616.TwPM4woh-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:383.10-392.6: Warning (graph_chi=
ld_address): /bus@f0000/i2c@20000000/usb-power-controller@3f/connector/port=
s: graph node has single child node 'port@0', #address-cells/#size-cells ar=
e not necessary
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:656.22-666.5: Warning (graph_c=
hild_address): /bus@f0000/usb@f900000/usb@31000000: graph node has single c=
hild node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: bus@43000000: compatible: ['sys=
con', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: dss-oldi-io-ctrl@8600: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain', 'ti,am625-dss-oldi-io-ctrl', 'ti,am654-dss-oldi-=
io-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']
--
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: bus@43000000: compatible: ['sys=
con', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: dss-oldi-io-ctrl@8600: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain', 'ti,am625-dss-oldi-io-ctrl', 'ti,am654-dss-oldi-=
io-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
