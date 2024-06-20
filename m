Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2646B1DFE8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718892309; cv=none; b=OC2eswqimXmanJ/WvxnzkyxtuNBBJZytqDmSKpmI+ZhJxJ4x9BTK3Q1q1fmZbybyCsuHpvwF61M4yL+2cabDfFIB94IzNdP/y4BtlDfoSNVIsyQjkt8v5P+EVmexKOUlMAATmnMCnEOOyfECQDotvAxMLzysfUGrYQlxvwbXZMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718892309; c=relaxed/simple;
	bh=+5uY68owX1I7Vk7nPfY0GZUHuNM2FgxB0RZSmsuT5tI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pM65ta1G+kXholOCejlbIB1ATIa/lbRKroRNZnpiOYWA+g3KNabx7Wct95ZTXI0B8wi27dVVyGaHxyLkFRJv7emLausGLqBl4v2KrPlEAkFQFtOT4QY3FJbk6jZS2Mq+oZ04MsYRDTwxyc3PW6RlzTSvLhm4sANrJDsNQqwGoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTdd1XNJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTdd1XNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718892307; x=1750428307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+5uY68owX1I7Vk7nPfY0GZUHuNM2FgxB0RZSmsuT5tI=;
  b=UTdd1XNJtHLX+y8m9mVKoARFu/pwtSgZd9MQzgsLKk8Re2KY94wP2dWb
   fQY0/SMINUIPL44f6zijq9Jd65/GFUC4QwrlqdO9egoayEG1Qj2jR+tqP
   o+oRfSYz2UWfsNKWUHsAZXTEeILASp6EkdR5F6wb9kwuofY/jh6tse2nL
   bW9qRONOU9E6NePssbTBetddRMuiQvg746/ajya/NvS42E94/D9ZD3Zwv
   /8DjEv0vClORfAsnM0yraRuvBBWcDquPujDxqJI0j7DF5ms68tTz4HveB
   2ZQgEfiPBRb/vFVst780m8lN/5bV5D/sYqmfsNPgexBGGgg77vBJxeL7j
   Q==;
X-CSE-ConnectionGUID: /Q954z/jSleAlgcrhrxmTQ==
X-CSE-MsgGUID: p8S/9eg+TQ6c+ojBDTZ2WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15745105"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="15745105"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 07:05:07 -0700
X-CSE-ConnectionGUID: XF5Fj8iJQ7ydXpz+9c1Qww==
X-CSE-MsgGUID: X+67lgkEQiW/mdPkgDBPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46603595"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jun 2024 07:05:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKIPO-0007fC-2R;
	Thu, 20 Jun 2024 14:05:02 +0000
Date: Thu, 20 Jun 2024 22:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: Nishanth Menon <nm@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 54/92]
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@4084000:
 pinctrl-single,gpio-range: [[2, 0, 21, 327687], [2, 23, 1, 327687], [2, 32,
 2, 327687]] is too long
Message-ID: <202406202139.ySCSffer-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.=
6.y-cicd
head:   4829ca850c3e18d83236de98fdec995054cae6fc
commit: 355ccaeb1f11ad51c68b4996ae39cee508ec4c5d [54/92] arm64: dts: ti: k3=
-am62p: Add gpio-ranges properties
config: arm64-randconfig-051-20240620 (https://download.01.org/0day-ci/arch=
ive/20240620/202406202139.ySCSffer-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78e=
e473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240620/202406202139.ySCSffer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406202139.ySCSffer-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:452.10-461.6: Warning (graph_chi=
ld_address): /bus@f0000/i2c@20000000/usb-power-controller@3f/connector/port=
s: graph node has single child node 'port@0', #address-cells/#size-cells ar=
e not necessary
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:691.22-701.5: Warning (graph_c=
hild_address): /bus@f0000/usb@f900000/usb@31000000: graph node has single c=
hild node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@4084000: pinctrl-single=
,gpio-range: [[2, 0, 21, 327687], [2, 23, 1, 327687], [2, 32, 2, 327687]] i=
s too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: syscon@43000000: compatible: ['=
syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
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
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: pinctrl-single,g=
pio-range: [[28, 0, 32, 327687], [28, 33, 92, 327687], [28, 137, 5, 327687]=
, [28, 143, 3, 327687], [28, 149, 2, 327687]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: 'interrupts' doe=
s not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: Unevaluated pro=
perties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: {'compatible': =
['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interru=
pts': [[0, 178, 4]], 'power-domains': [[4, 146, 1]], 'clocks': [[3, 146, 0]=
], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'=
], 'pinctrl-0': [[29]], 'interrupts-extended': [[1, 0, 178, 4], [30, 456]],=
 'interrupt-names': ['irq', 'wakeup'], 'bootph-all': True, 'phandle': [[127=
]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['=
interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: {'compatible': =
['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interru=
pts': [[0, 178, 4]], 'power-domains': [[4, 146, 1]], 'clocks': [[3, 146, 0]=
], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'=
], 'pinctrl-0': [[29]], 'interrupts-extended': [[1, 0, 178, 4], [30, 456]],=
 'interrupt-names': ['irq', 'wakeup'], 'bootph-all': True, 'phandle': [[127=
]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['=
interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: video-codec@30210000: 'sram-siz=
e' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:1266.21-1269.5: Warning (graph=
_child_address): /bus@f0000/dss@30220000/ports: graph node has single child=
 node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@4084000: pinctrl-single=
,gpio-range: [[2, 0, 21, 327687], [2, 23, 1, 327687], [2, 32, 2, 327687]] i=
s too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: syscon@43000000: compatible: ['=
syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
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
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@f4000: pinctrl-single,g=
pio-range: [[34, 0, 32, 327687], [34, 33, 92, 327687], [34, 137, 5, 327687]=
, [34, 143, 3, 327687], [34, 149, 2, 327687]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: video-codec@30210000: 'sram-siz=
e' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: e5010@fd20000: 'clock-names' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc=
=2Eyaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
