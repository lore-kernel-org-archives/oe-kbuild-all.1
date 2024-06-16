Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B6A29401
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 23:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579462; cv=none; b=WUmsB1OqqZqJTJL4VrMFDSnCxwmaP3uc1Ln8gybgC+DJkZmko18BRltoxrPVJqWvfeyKGIftWW5AoT4Np7NoTxg/bLWQ2JadJrJW1/efKLKvHlA94z0Em2OkQLdgRDX3SP2k80jw6novkK+mU7espw0NFA6++1cgfjC1edif/Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579462; c=relaxed/simple;
	bh=r+KIyh/RBhpE5QafG9FlloOv2yigHKp1EDuLsaFspTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQ3P4iewj5Al1ybw8HeNFulv6LyDAo1Z/1vx0q8Z17Ah+oxXexwIMwlIIM5z1ej89IWDoS3bgqKRXlvVV4cihny9X3uRdgLfkT4iaG5jQuvBz3AWM/Jx8D8E3skX94e79o8AUrrhTUnrGVPJy5dSb0lZ7mGZmS2mH+IzrHpXOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAEjMn6Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAEjMn6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718579460; x=1750115460;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r+KIyh/RBhpE5QafG9FlloOv2yigHKp1EDuLsaFspTk=;
  b=BAEjMn6ZaySsblGWp0GPQ7sOJV8s489FXYqV16+fvOOZXbJi61sSSih4
   0f6rPB9ZbUi5CiSrgJ9rBa0qESsZiYwPhHuYrOyJVCnYNrIUBNS2iPkst
   eyDCjSTf7xileuktblMr72Ur37YrDd6WSdtBmr7WeY/fRhBy2UOCyM0GQ
   vcF4AZ8pdccPTSwXTNLDiPh/UQFsBt08eudywlq/hpvQkNZWCCmg5kqHI
   VKeliC+9rTJBZzdKISvn3WHLiEt/csAr/pd1uQghBZnWa1yzUkBx9p8cu
   4ZHWC8Mu7WoHQqqmK8D6B0KrEgs7QCpZQkgZS+Ss0ZHwjxNUIi+EnK050
   w==;
X-CSE-ConnectionGUID: 4UXMrjHJTeyyyrpVfjkW2g==
X-CSE-MsgGUID: MMlGzUhqR8SBNVx0pqm/Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26794703"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26794703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 16:10:59 -0700
X-CSE-ConnectionGUID: HKRoRXTqRy2FU4tgqKr2vA==
X-CSE-MsgGUID: KWBEmDLbRwmbqQqjaQBeBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41747755"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jun 2024 16:10:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIz1T-0003SU-0g;
	Sun, 16 Jun 2024 23:10:55 +0000
Date: Mon, 17 Jun 2024 07:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 4/39] arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb:
 video-codec@30210000: 'sram-size' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202406170735.zJfT8GjB-lkp@intel.com>
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
6.y
head:   eeca5715c9a5b742423bd83ed587fac26268771c
commit: b76af846b8e23e7fe05cb647587843371638b7a9 [4/39] arm64: dts: ti: k3-=
am62p-main: SRAM Allocation for VPU
config: arm64-randconfig-051-20240616 (https://download.01.org/0day-ci/arch=
ive/20240617/202406170735.zJfT8GjB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240617/202406170735.zJfT8GjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170735.zJfT8GjB-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
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
pts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]=
], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'=
], 'pinctrl-0': [[18]], 'interrupts-extended': [[1, 0, 178, 4], [19, 456]],=
 'interrupt-names': ['irq', 'wakeup'], 'bootph-all': True, 'phandle': [[116=
]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['=
interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: {'compatible': =
['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interru=
pts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]=
], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'=
], 'pinctrl-0': [[18]], 'interrupts-extended': [[1, 0, 178, 4], [19, 456]],=
 'interrupt-names': ['irq', 'wakeup'], 'bootph-all': True, 'phandle': [[116=
]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['=
interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: video-codec@30210000: 'sram-siz=
e' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']
--
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
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@f4000: compatible: 'one=
Of' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@f4000: 'interrupts' doe=
s not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: video-codec@30210000: 'sram-siz=
e' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
