Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE5B8480
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 21:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718660472; cv=none; b=OXSuUzsNXo/f+l4KzbYWX80TaxB2+tl4ya98/C1lDLHt6X/zx+sS4DrdVuqQKhaoxlbhz9gnU/5isuUcsF45p8hDLPBy0IyUG/Ogq2aXhtAb8tVQPg8uU2HBILj0G4dF1iElJMo8V9z2iiC77RfgG+/fGt5ZzLXYv7lrgi3iiN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718660472; c=relaxed/simple;
	bh=3Oe2tPyGmHCuCYCzWRg4oVXrWOQF0GJeXYWjicaeSSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=boCHE8j25NV6BBunMjyzDPcItr9LpfwppAtCAiTSDa5lcvCDS4w1VtuteeLAzHXDyuMig7JU7n9UeUF8C8/maShjLXyWtZamgYIHhPomV1HHULAiPS2PpOVYmwYXbelvL5zsONaClmLgB8w0lHmxcf5KY4l3w+jvDldt+OF4XX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnJ1njYL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnJ1njYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718660470; x=1750196470;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3Oe2tPyGmHCuCYCzWRg4oVXrWOQF0GJeXYWjicaeSSE=;
  b=lnJ1njYLPykCgzLgKTaamfg2ZhjGAR+qgGd3Bs43aEAbV+q57e+NbM1I
   EDAt/d35js36VRTZIl9C8adLVYM4YweA+LwXhx+jrBKcYZxS60pPgrXR7
   g2kxickPPMXnCDCZqZuB5Dtx+uHJE+qGM3KzLmvc/d1C4yAKL6Y0SQ1pG
   AUMsXiczVTERrVhL0qlmo6pedjXoxDC+CaLD5zd0jKysSSc2jt79XT8xR
   Ie6RNVFFfHMuX9V7rLlmbbFOeWkg/XgXHf0PRdwBz60w0SwTQiZyS0lMn
   zckHK/J5xQBDgQtq8LRNfAJAKOLOQyRL5fGwSZ/MX2IrvpJ3zz4mQYHOA
   Q==;
X-CSE-ConnectionGUID: zuiGSXqpQIyeg6pATFv1NQ==
X-CSE-MsgGUID: IkVyyli9RaOiscaydJw8hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19327846"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="19327846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 14:41:09 -0700
X-CSE-ConnectionGUID: qKNeq6wlS2mXl8hnQbPyoQ==
X-CSE-MsgGUID: 8yvM7NmtQNaiJMPCsD0tng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="41421053"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2024 14:41:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJK64-0004tp-2b;
	Mon, 17 Jun 2024 21:41:04 +0000
Date: Tue, 18 Jun 2024 05:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Vibhore Vardhan <vibhore@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Dhruva Gole <d-gole@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 30/137]
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202406180516.H6FGNj8Q-lkp@intel.com>
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
head:   28ca41014f923e6e0e314492899b7cda49439c39
commit: 21354a5e32c40bc97c8e602cb2174dc9ede672d3 [30/137] HACK: arm64: dts:=
 ti: Configure am62p pinctrl-single for wake-up interrupts
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/arch=
ive/20240618/202406180516.H6FGNj8Q-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d=
2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240618/202406180516.H6FGNj8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180516.H6FGNj8Q-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:669.22-679.5: Warning (graph_c=
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
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: dss-oldi-io-ctrl@8600: compatib=
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
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: compatible: 'one=
Of' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: 'interrupts' doe=
s not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']
--
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:1215.21-1218.5: Warning (graph=
_child_address): /bus@f0000/dss@30220000/ports: graph node has single child=
 node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: bus@43000000: compatible: ['sys=
con', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: dss-oldi-io-ctrl@8600: compatib=
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
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@f4000: compatible: 'one=
Of' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@f4000: 'interrupts' doe=
s not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
