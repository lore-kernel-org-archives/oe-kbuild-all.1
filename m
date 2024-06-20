Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF32E46BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718889064; cv=none; b=YwzupsTdzLlNJQ+IoBl6Qry77LD0lFe+SQ6J34Yt8xqD+EOHBOLFXKAjOmKNRsR+519gGgZVnqrBYJxW6hsRgtpl6dJ4TxX444Prmh3dlbNOR8baKjN/adi5RwWQkaISLs4HG2gUpCJ+1BJwc9pYkZ0kj6AD05pPcs7ZseoPxNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718889064; c=relaxed/simple;
	bh=Q5apuPXS+QRMuRiBf3NttYwoV7wPTUPb0gmHHy/Daac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ggSrSG9uHo1FuEzGd9vcHQMIq4WipiOVzqPXkyONOkX9F0r2Gl+ysaFRZ/0nj+5VddChTu6ydO9Iea0QETS+Qc3QdcCQYfTUSftPNDe/cEprd8AXJ0jwQSArrEi/nX7E4tyC7oZkE2s7US8/jsWah+YHop/rIhJA6ZYkrfPmJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CM3X9Vs2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CM3X9Vs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718889063; x=1750425063;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Q5apuPXS+QRMuRiBf3NttYwoV7wPTUPb0gmHHy/Daac=;
  b=CM3X9Vs2yfAoOgqkbUeZl00pe/91CG5UuirOs0QPDpo/zF/jPCx4vCyf
   L78K5JLXd3N3dGKZLiQd8q2fucpza0d9AriaPo39xn7M4IlTeeII0Y5Rq
   ucEcbVzzgSmbqC52kM1UXlB2rC0fu5UcOtc/LAy+P2g/Svq7y/2itFCLL
   Asycmg6w9i2ejYvqqyY0fs+dNDiLIpSuyzrGTRY1hmMPDjNJUMVF1hB1i
   oRak8TuMethSeIjDitOSAU3MsKjxh7PH289CilpqSeMTwxis8TlTSl0of
   LxkWN+sK8mVs+ViflIcdoeAWnrb+XEl2dcTrWYyp8agNJqjx/lF7Kc9QF
   g==;
X-CSE-ConnectionGUID: L7syBKMZS7yaDw/bJP3Uzg==
X-CSE-MsgGUID: LVvKK2bJRj6biFJgwbng2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15693440"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="15693440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 06:11:03 -0700
X-CSE-ConnectionGUID: PioVBX22TX+BjEbdp82idQ==
X-CSE-MsgGUID: UJMwJXHoRoKKt0UoEGdAag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="79720155"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2024 06:11:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKHZ4-0007d6-2D;
	Thu, 20 Jun 2024 13:10:58 +0000
Date: Thu, 20 Jun 2024 21:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Vibhore Vardhan <vibhore@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 31/137]
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: Unevaluated
 properties are not allowed ('interrupt-names' was unexpected)
Message-ID: <202406202112.UjvqLltM-lkp@intel.com>
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
head:   a71ffc827394d68b5d873555d67674f0b5868430
commit: 1ffd79c5e3da4e7abca4c02877d0104955801a9a [31/137] arm64: dts: ti: k=
3-am62p5-sk: enable uart as wakeup source
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/arch=
ive/20240620/202406202112.UjvqLltM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d=
2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240620/202406202112.UjvqLltM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406202112.UjvqLltM-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
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
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: compatible: 'one=
Of' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: 'interrupts' doe=
s not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: Unevaluated pro=
perties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: {'compatible': =
['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interru=
pts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]=
], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'=
], 'pinctrl-0': [[14]], 'interrupts-extended': [[1, 0, 178, 4], [15, 456]],=
 'interrupt-names': ['irq', 'wakeup'], 'bootph-all': True, 'phandle': [[116=
]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['=
interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: {'compatible': =
['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interru=
pts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]=
], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'=
], 'pinctrl-0': [[14]], 'interrupts-extended': [[1, 0, 178, 4], [15, 456]],=
 'interrupt-names': ['irq', 'wakeup'], 'bootph-all': True, 'phandle': [[116=
]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['=
interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
